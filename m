Return-Path: <auh@yoctoproject.org>
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7F5AC6379F
	for <webhook@archiver.kernel.org>; Thu, 16 Feb 2023 00:46:44 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.10144.1676508395495620091
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Feb 2023 16:46:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=aITcIKEH;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101018657aff301-55987b6e-4075-450b-b324-1692c12af65d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1676508394;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=dv/ZeTuhaM8binKMlt1OawFOnzQ+spSQn55oqPcUhJo=;
	b=aITcIKEHn7lURJWPJD8jJtxVc0qVSh0GLIV/PS9eZDSJIAHgkAC5gs7SSgn/9G0e
	ZwZWNgIkx3FCOk5gB3kXqtHPpvAnsLDvYjBn2p3NAETNbpyvEf2DF22eOYfXUc4zrNg
	IEEVsd9dWl3ZqMA2aAmgFrYT41PfExlsxx6tm5h8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1676508394;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=dv/ZeTuhaM8binKMlt1OawFOnzQ+spSQn55oqPcUhJo=;
	b=gHPgeCcIkvnCaSOCsLLdsH6Jdp3jCrzhIBEA6p0ueGXi2nCLhI8LVlzj76jxYnEm
	OwQGQD2HeEx/ks7WIST+1zQj4Si+BrH4tKeX+xEKblVfnJA1nuGfAqTWxbCovAh3fnJ
	ytX/2ckXAB85DDRkYyMg7uqtGG/Bkl7gKRUuWGWY=
Content-Type: multipart/mixed; boundary="===============3884219113494210688=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] dbus: upgrading to 1.14.6 SUCCEEDED
Message-ID: <0101018657aff301-55987b6e-4075-450b-b324-1692c12af65d-000000@us-west-2.amazonses.com>
Date: Thu, 16 Feb 2023 00:46:34 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.02.16-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Feb 2023 00:46:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177225

--===============3884219113494210688==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *dbus* to *1.14.6* has Succeeded.

Next steps:
    - apply the patch: git am 0001-dbus-upgrade-1.14.4-1.14.6.patch
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
--===============3884219113494210688==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 895 .bb files complete (0 cached, 895 parsed). 1693 targets, 72 skipped, 0 masked, 0 errors.
Removing 1 recipes from the ppc7400 sysroot...done.
Removing 1 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-f3751bf025630bda15f4496c36874f8d0f79ac2f"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:f3751bf025630bda15f4496c36874f8d0f79ac2f"
workspace            = "master:44311c454d0b0856f58cfa6fa60669903b2ba3af"

Initialising tasks...done.
Sstate summary: Wanted 209 Local 6 Mirrors 0 Missed 203 Current 254 (2% match, 56% complete)
Removing 31 stale sstate objects for arch ppc7400...done.
Removing 29 stale sstate objects for arch qemuppc...done.
NOTE: Executing Tasks
NOTE: Running setscene task 274 of 463 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 310 of 463 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/autoconf-archive/autoconf-archive_2022.09.03.bb:do_packagedata_setscene)
NOTE: Running setscene task 315 of 463 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland-protocols_1.31.bb:do_packagedata_setscene)
NOTE: Running setscene task 459 of 463 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.37.bb:do_packagedata_setscene)
NOTE: recipe update-rc.d-0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe autoconf-archive-2022.09.03-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-protocols-1.31-r0: task do_packagedata_setscene: Started
NOTE: recipe glibc-2.37-r0: task do_packagedata_setscene: Started
NOTE: recipe update-rc.d-0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe autoconf-archive-2022.09.03-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-protocols-1.31-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 399 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_fetch)
NOTE: Running task 400 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_fetch)
NOTE: Running task 467 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_fetch)
NOTE: Running task 486 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_fetch)
NOTE: Running task 490 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.1.bb:do_fetch)
NOTE: Running task 492 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.40.1.bb:do_fetch)
NOTE: Running task 493 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_fetch)
NOTE: Running task 494 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.1.bb:do_fetch)
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Started
NOTE: recipe openssl-3.0.7-r0: task do_fetch: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_fetch: Started
NOTE: recipe libffi-3.4.4-r0: task do_fetch: Started
NOTE: recipe sqlite3-3_3.40.1-r0: task do_fetch: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_fetch: Started
NOTE: Running task 721 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_fetch)
NOTE: recipe xz-5.4.1-r0: task do_fetch: Started
NOTE: recipe openssl-3.0.7-r0: task do_fetch: Succeeded
NOTE: recipe glibc-2.37-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 737 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.3.bb:do_fetch)
NOTE: recipe libtirpc-1.3.3-r0: task do_fetch: Succeeded
NOTE: Running task 745 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_unpack)
NOTE: Setscene tasks completed
NOTE: recipe libffi-3.4.4-r0: task do_fetch: Succeeded
NOTE: recipe sqlite3-3_3.40.1-r0: task do_fetch: Succeeded
NOTE: recipe xz-5.4.1-r0: task do_fetch: Succeeded
NOTE: Running task 788 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 795 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_unpack)
NOTE: Running task 805 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_unpack)
NOTE: Running task 808 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.1.bb:do_unpack)
NOTE: Running task 809 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Succeeded
NOTE: Running task 812 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.40.1.bb:do_unpack)
NOTE: Running task 823 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_unpack)
NOTE: Running task 824 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 827 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 828 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libnsl2-2.0.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-3.11.1-r0: task do_fetch: Started
NOTE: Running task 831 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.40.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 832 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_unpack)
NOTE: Running task 845 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe expat-2.5.0-r0: task do_fetch: Started
NOTE: recipe libxml2-2.10.3-r0: task do_fetch: Started
NOTE: recipe openssl-3.0.7-r0: task do_unpack: Started
NOTE: recipe expat-2.5.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-3.11.1-r0: task do_fetch: Succeeded
NOTE: Running task 928 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_fetch)
NOTE: Running task 936 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_fetch)
NOTE: Running task 937 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_unpack)
NOTE: Running task 938 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtirpc-1.3.3-r0: task do_unpack: Started
NOTE: Running task 939 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.1.bb:do_unpack)
NOTE: Running task 940 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_fetch)
NOTE: Running task 946 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_fetch)
NOTE: Running task 949 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_fetch)
NOTE: Running task 952 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_fetch)
NOTE: Running task 964 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_fetch)
NOTE: Running task 972 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_write_config)
NOTE: Running task 973 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_write_config)
NOTE: Running task 977 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_fetch)
NOTE: Running task 978 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_write_config)
NOTE: Running task 979 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_fetch)
NOTE: Running task 980 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_fetch)
NOTE: Running task 981 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_fetch)
NOTE: Running task 982 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_fetch)
NOTE: Running task 983 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_fetch)
NOTE: Running task 987 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_fetch)
NOTE: recipe libxml2-2.10.3-r0: task do_fetch: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_unpack: Started
NOTE: recipe openssl-3.0.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xz-5.4.1-r0: task do_unpack: Started
NOTE: Running task 994 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_fetch)
NOTE: recipe libtirpc-1.3.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sqlite3-3_3.40.1-r0: task do_unpack: Started
NOTE: Running task 995 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_package)
NOTE: recipe libffi-3.4.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xz-5.4.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 996 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.3.bb:do_unpack)
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Started
NOTE: recipe bzip2-1.0.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sqlite3-3_3.40.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_unpack: Started
NOTE: Running task 999 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_fetch)
NOTE: recipe libpam-1.5.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_fetch: Started
NOTE: recipe xorgproto-2022.2-r0: task do_fetch: Started
NOTE: recipe expat-2.5.0-r0: task do_unpack: Started
NOTE: recipe libffi-3.4.4-r0: task do_unpack: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_fetch: Succeeded
NOTE: Running task 1000 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_patch)
NOTE: recipe shadow-sysroot-4.6-r3: task do_fetch: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_fetch: Started
NOTE: recipe expat-2.5.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe wayland-1.21.0-r0: task do_fetch: Started
NOTE: recipe xorgproto-2022.2-r0: task do_fetch: Succeeded
NOTE: recipe xz-5.4.1-r0: task do_unpack: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_fetch: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_fetch: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_fetch: Started
NOTE: recipe libxcb-1.15-r0: task do_fetch: Started
NOTE: recipe sqlite3-3_3.40.1-r0: task do_unpack: Succeeded
NOTE: Running task 1001 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.1.bb:do_patch)
NOTE: recipe libtirpc-1.3.3-r0: task do_unpack: Succeeded
NOTE: recipe wayland-1.21.0-r0: task do_fetch: Succeeded
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_fetch: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_fetch: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_fetch: Succeeded
NOTE: Running task 1002 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_patch)
NOTE: recipe libpcre2-10.42-r0: task do_fetch: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_fetch: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_fetch: Succeeded
NOTE: Running task 1003 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.40.1.bb:do_patch)
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_write_config: Started
NOTE: Running task 1004 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_unpack)
NOTE: Running task 1005 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_unpack)
NOTE: recipe xorgproto-2022.2-r0: task do_write_config: Started
NOTE: Running task 1006 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_unpack)
NOTE: recipe libpthread-stubs-0.4-r0: task do_fetch: Started
NOTE: Running task 1007 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_unpack)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_fetch: Started
NOTE: recipe initscripts-1.0-r155: task do_fetch: Started
NOTE: Running task 1008 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_fetch: Succeeded
NOTE: Running task 1009 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxau-1_1.0.11-r0: task do_fetch: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_fetch: Started
NOTE: Running task 1010 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_unpack)
NOTE: Running task 1011 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_unpack)
NOTE: Running task 1012 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_unpack)
NOTE: Running task 1013 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_unpack)
NOTE: recipe wayland-1.21.0-r0: task do_write_config: Started
NOTE: Running task 1023 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1030 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_fetch)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_fetch: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_fetch: Succeeded
NOTE: Running task 1031 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_fetch)
NOTE: recipe libseccomp-2.5.4-r0: task do_fetch: Succeeded
NOTE: Running task 1032 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_fetch)
NOTE: Running task 1033 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_unpack)
NOTE: recipe libxau-1_1.0.11-r0: task do_fetch: Succeeded
NOTE: Running task 1034 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_unpack)
NOTE: recipe expat-2.5.0-r0: task do_unpack: Succeeded
NOTE: Running task 1035 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_write_config: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_fetch: Succeeded
NOTE: Running task 1036 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_patch)
NOTE: Running task 1037 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_unpack)
NOTE: Running task 1038 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_unpack)
NOTE: Running task 1039 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_unpack)
NOTE: Running task 1040 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_unpack)
NOTE: recipe initscripts-1.0-r155: task do_fetch: Succeeded
NOTE: recipe python3-3.11.1-r0: task do_unpack: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_package: Started
NOTE: Running task 1044 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_252.5.bb:do_fetch)
NOTE: Running task 1045 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_unpack)
NOTE: recipe xorgproto-2022.2-r0: task do_write_config: Succeeded
NOTE: Running task 1046 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_fetch)
NOTE: recipe wayland-1.21.0-r0: task do_write_config: Succeeded
NOTE: Running task 1055 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_package)
NOTE: Running task 1056 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1057 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1059 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_fetch)
NOTE: Running task 1060 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_fetch)
NOTE: Running task 1061 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_fetch)
NOTE: recipe libtirpc-1.3.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe openssl-3.0.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe sqlite3-3_3.40.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1073 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe xz-5.4.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1074 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.33.bb:do_package)
NOTE: recipe libnsl2-2.0.0-r0: task do_unpack: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Succeeded
NOTE: recipe openssl-3.0.7-r0: task do_unpack: Succeeded
NOTE: Running task 1075 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_patch)
NOTE: recipe expat-2.5.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1076 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_patch)
NOTE: Running task 1077 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_patch)
NOTE: Running task 1078 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_configure)
NOTE: Running task 1079 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libffi-3.4.4-r0: task do_patch: Started
NOTE: recipe xkeyboard-config-2.38-r0: task do_fetch: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_patch: Started
NOTE: recipe xz-5.4.1-r0: task do_patch: Started
NOTE: recipe sqlite3-3_3.40.1-r0: task do_patch: Started
NOTE: recipe libxml2-2.10.3-r0: task do_unpack: Started
NOTE: recipe libpcre2-10.42-r0: task do_unpack: Started
NOTE: recipe xorgproto-2022.2-r0: task do_unpack: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_unpack: Started
NOTE: recipe xkeyboard-config-2.38-r0: task do_fetch: Succeeded
NOTE: recipe wayland-1.21.0-r0: task do_unpack: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_unpack: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_unpack: Started
NOTE: recipe libxcb-1.15-r0: task do_unpack: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_unpack: Started
NOTE: Running task 1097 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_unpack)
NOTE: recipe base-passwd-3.6.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_unpack: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_unpack: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_patch: Succeeded
NOTE: recipe xz-5.4.1-r0: task do_patch: Succeeded
NOTE: recipe sqlite3-3_3.40.1-r0: task do_patch: Succeeded
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_unpack: Started
NOTE: Running task 1098 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_deploy_source_date_epoch)
NOTE: recipe zstd-1.5.2-r0: task do_fetch: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_fetch: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_unpack: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_unpack: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_fetch: Succeeded
NOTE: Running task 1099 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_unpack: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_unpack: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_unpack: Succeeded
NOTE: Running task 1100 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.40.1.bb:do_deploy_source_date_epoch)
NOTE: recipe xtrans-1_1.4.0-r0: task do_unpack: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_unpack: Started
NOTE: recipe kmod-30-r0: task do_fetch: Started
NOTE: recipe initscripts-1.0-r155: task do_unpack: Started
NOTE: recipe expat-2.5.0-r0: task do_patch: Started
NOTE: Running task 1101 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_patch)
NOTE: recipe libice-1_1.1.1-r0: task do_fetch: Started
NOTE: Running task 1102 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_patch)
NOTE: Running task 1103 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_patch)
NOTE: Running task 1104 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_patch)
NOTE: Running task 1105 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_unpack)
NOTE: recipe libpthread-stubs-0.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_fetch: Started
NOTE: Running task 1131 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_write_config)
NOTE: Running task 1138 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_write_config)
NOTE: Running task 1142 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_package)
NOTE: recipe wayland-1.21.0-r0: task do_unpack: Succeeded
NOTE: recipe zstd-1.5.2-r0: task do_fetch: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_fetch: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libffi-3.4.4-r0: task do_patch: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_package: Started
NOTE: Running task 1143 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_patch)
NOTE: recipe libsm-1_1.2.4-r0: task do_fetch: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_patch: Succeeded
NOTE: recipe dbus-1.14.6-r0: task do_fetch: Started
NOTE: recipe systemd-1_252.5-r0: task do_fetch: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_fetch: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: Running task 1144 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcb-1.15-r0: task do_unpack: Succeeded
NOTE: Running task 1145 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_generate_toolchain_file)
NOTE: recipe xorgproto-2022.2-r0: task do_unpack: Succeeded
NOTE: recipe kmod-30-r0: task do_fetch: Succeeded
NOTE: recipe openssl-3.0.7-r0: task do_patch: Started
NOTE: recipe initscripts-1.0-r155: task do_prepare_recipe_sysroot: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_patch: Started
NOTE: Running task 1146 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1147 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_patch)
NOTE: Running task 1148 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_patch)
NOTE: recipe xcb-proto-1.15.2-r0: task do_unpack: Succeeded
NOTE: recipe libxcrypt-4.4.33-r0: task do_package: Started
NOTE: Running task 1149 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_patch)
NOTE: recipe dbus-1.14.6-r0: task do_fetch: Succeeded
NOTE: Running task 1150 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_unpack)
NOTE: Running task 1151 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_patch)
NOTE: Running task 1152 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_unpack)
NOTE: Running task 1153 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_unpack)
NOTE: Running task 1154 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_unpack)
NOTE: Running task 1155 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_unpack)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_unpack: Succeeded
NOTE: recipe libx11-1_1.8.4-r0: task do_fetch: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Started
NOTE: recipe libpam-1.5.2-r0: task do_configure: Started
NOTE: Running task 1156 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_patch)
NOTE: recipe libxau-1_1.0.11-r0: task do_unpack: Succeeded
NOTE: Running task 1157 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_unpack)
NOTE: recipe xkeyboard-config-2.38-r0: task do_unpack: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe sqlite3-3_3.40.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_patch: Started
NOTE: recipe initscripts-1.0-r155: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1158 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_patch)
NOTE: recipe xz-5.4.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1159 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe util-macros-1_1.19.3-r0: task do_patch: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_patch: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_patch: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_unpack: Started
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Succeeded
NOTE: recipe systemd-1_252.5-r0: task do_fetch: Succeeded
NOTE: Running task 1167 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_deploy_source_date_epoch)
NOTE: recipe xkeyboard-config-2.38-r0: task do_write_config: Started
NOTE: Running task 1174 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_252.5.bb:do_unpack)
NOTE: recipe libxkbcommon-1.5.0-r0: task do_write_config: Started
NOTE: Running task 1180 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_252.5.bb:do_warn_musl)
NOTE: Running task 1181 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_252.5.bb:do_write_config)
NOTE: Running task 1182 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package)
NOTE: recipe expat-2.5.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe initscripts-1.0-r155: task do_unpack: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_patch: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_patch: Started
NOTE: recipe wayland-1.21.0-r0: task do_patch: Started
NOTE: recipe zstd-1.5.2-r0: task do_unpack: Started
NOTE: Running task 1189 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_patch)
NOTE: recipe libice-1_1.1.1-r0: task do_unpack: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_patch: Started
NOTE: recipe expat-2.5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1190 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcb-1.15-r0: task do_patch: Started
NOTE: recipe xorgproto-2022.2-r0: task do_patch: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_unpack: Started
NOTE: recipe flex-2.6.4-r0: task do_package: Started
NOTE: Running task 1192 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_package)
NOTE: recipe kmod-30-r0: task do_unpack: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_patch: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_patch: Succeeded
NOTE: recipe libx11-1_1.8.4-r0: task do_unpack: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_patch: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_patch: Started
NOTE: recipe zstd-1.5.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1195 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_deploy_source_date_epoch)
NOTE: recipe dbus-1.14.6-r0: task do_unpack: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxkbcommon-1.5.0-r0: task do_write_config: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 1197 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_deploy_source_date_epoch)
NOTE: recipe xkeyboard-config-2.38-r0: task do_write_config: Succeeded
NOTE: Running task 1204 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_package)
NOTE: Running task 1205 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_package)
NOTE: recipe libseccomp-2.5.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_patch: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1206 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libpcre2-10.42-r0: task do_unpack: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_patch: Succeeded
NOTE: recipe xkeyboard-config-2.38-r0: task do_unpack: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_patch: Started
NOTE: Running task 1208 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_patch)
NOTE: Running task 1209 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_patch)
NOTE: Running task 1210 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_deploy_source_date_epoch)
NOTE: recipe libxkbcommon-1.5.0-r0: task do_unpack: Succeeded
NOTE: recipe sqlite3-3_3.40.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_patch: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1212 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_patch)
NOTE: recipe wayland-1.21.0-r0: task do_patch: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1213 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.40.1.bb:do_configure)
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch: Started
NOTE: recipe libice-1_1.1.1-r0: task do_unpack: Succeeded
NOTE: Running task 1214 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_deploy_source_date_epoch)
NOTE: recipe xz-5.4.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_unpack: Succeeded
NOTE: Running task 1215 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_configure)
NOTE: recipe systemd-1_252.5-r0: task do_warn_musl: Started
NOTE: recipe systemd-1_252.5-r0: task do_unpack: Started
NOTE: recipe libxcb-1.15-r0: task do_patch: Succeeded
NOTE: Running task 1216 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.1.bb:do_configure)
NOTE: recipe systemd-1_252.5-r0: task do_warn_musl: Succeeded
NOTE: recipe systemd-1_252.5-r0: task do_write_config: Started
NOTE: Running task 1217 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe util-macros-1_1.19.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1218 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_deploy_source_date_epoch)
NOTE: recipe libpthread-stubs-0.4-r0: task do_patch: Succeeded
NOTE: Running task 1219 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_patch)
NOTE: Running task 1220 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1221 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_patch)
NOTE: recipe libffi-3.4.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_unpack: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1224 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_patch)
NOTE: recipe openssl-3.0.7-r0: task do_patch: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_package: Started
NOTE: Running task 1225 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_configure)
NOTE: recipe initscripts-1.0-r155: task do_patch: Succeeded
NOTE: Running task 1226 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_deploy_source_date_epoch)
NOTE: recipe xorgproto-2022.2-r0: task do_patch: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1227 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_configure)
NOTE: recipe systemd-1_252.5-r0: task do_write_config: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1228 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libpcre2-10.42-r0: task do_patch: Started
NOTE: Running task 1229 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe xorgproto-2022.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xkeyboard-config-2.38-r0: task do_patch: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_patch: Started
NOTE: Running task 1238 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_fetch)
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_package: Started
NOTE: recipe sqlite3-3_3.40.1-r0: task do_configure: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_configure: Started
NOTE: recipe wayland-1.21.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe zstd-1.5.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe dbus-1.14.6-r0: task do_unpack: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libice-1_1.1.1-r0: task do_patch: Started
NOTE: recipe xz-5.4.1-r0: task do_configure: Started
NOTE: Running task 1250 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_configure)
NOTE: recipe libsm-1_1.2.4-r0: task do_patch: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_patch: Succeeded
NOTE: recipe xkeyboard-config-2.38-r0: task do_patch: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_package: Started
NOTE: Running task 1251 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_patch)
NOTE: recipe libnsl2-2.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1252 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_deploy_source_date_epoch)
NOTE: Running task 1253 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libcap-ng-0.8.3-r0: task do_package: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_patch: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_configure: Started
NOTE: recipe initscripts-1.0-r155: task do_deploy_source_date_epoch: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_unpack: Succeeded
NOTE: recipe openssl-3.0.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_patch: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_configure: Started
NOTE: Running task 1266 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_patch)
NOTE: recipe libice-1_1.1.1-r0: task do_patch: Succeeded
NOTE: recipe libxml2-2.10.3-r0: task do_unpack: Succeeded
NOTE: Running task 1267 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_deploy_source_date_epoch)
NOTE: recipe libsm-1_1.2.4-r0: task do_patch: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_fetch: Started
NOTE: Running task 1268 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.3.bb:do_patch)
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_unpack: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1269 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1270 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_patch)
NOTE: recipe libseccomp-2.5.4-r0: task do_patch: Succeeded
NOTE: Running task 1271 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_configure)
NOTE: Running task 1272 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1273 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_deploy_source_date_epoch)
NOTE: recipe xcb-proto-1.15.2-r0: task do_patch: Succeeded
NOTE: Running task 1275 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_deploy_source_date_epoch)
NOTE: recipe base-passwd-3.6.1-r0: task do_patch: Succeeded
NOTE: Running task 1277 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_deploy_source_date_epoch)
NOTE: recipe bzip2-1.0.8-r0: task do_configure: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe dbus-1.14.6-r0: task do_patch: Started
NOTE: recipe xkeyboard-config-2.38-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_fetch: Succeeded
NOTE: Running task 1283 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_unpack)
NOTE: recipe libx11-1_1.8.4-r0: task do_patch: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe wayland-1.21.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1292 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_package)
NOTE: recipe kmod-30-r0: task do_unpack: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libice-1_1.1.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcb-1.15-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe zstd-1.5.2-r0: task do_unpack: Succeeded
NOTE: Running task 1293 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_configure)
NOTE: recipe libseccomp-2.5.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_configure: Started
NOTE: Running task 1294 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_patch)
NOTE: Running task 1295 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 1296 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.bb:do_package)
NOTE: recipe libxml2-2.10.3-r0: task do_patch: Started
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_patch: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe initscripts-1.0-r155: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe openssl-3.0.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_unpack: Started
NOTE: Running task 1310 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe dbus-1.14.6-r0: task do_patch: Succeeded
NOTE: Running task 1311 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_configure)
NOTE: Running task 1312 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_configure)
NOTE: recipe xorgproto-2022.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libx11-1_1.8.4-r0: task do_patch: Succeeded
NOTE: Running task 1313 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 1314 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1315 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_configure)
NOTE: Running task 1316 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe libpthread-stubs-0.4-r0: task do_configure: Started
NOTE: recipe zstd-1.5.2-r0: task do_patch: Started
NOTE: recipe kmod-30-r0: task do_patch: Started
NOTE: recipe xkeyboard-config-2.38-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxkbcommon-1.5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_configure: Started
NOTE: recipe zstd-1.5.2-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe libice-1_1.1.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1331 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1333 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_package)
NOTE: recipe libpcre2-10.42-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1342 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-locale_2.37.bb:do_package)
NOTE: recipe libseccomp-2.5.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1344 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_configure)
NOTE: Running task 1345 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_populate_lic)
NOTE: recipe openssl-3.0.7-r0: task do_configure: Started
NOTE: recipe dbus-1.14.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_configure: Started
NOTE: recipe initscripts-1.0-r155: task do_configure: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1346 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_configure)
NOTE: Running task 1347 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_configure)
NOTE: recipe python3-3.11.1-r0: task do_unpack: Succeeded
NOTE: recipe zstd-1.5.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1348 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.1.bb:do_patch)
NOTE: Running task 1349 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_compile)
NOTE: recipe kmod-30-r0: task do_patch: Succeeded
NOTE: Running task 1350 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_deploy_source_date_epoch)
NOTE: recipe libxml2-2.10.3-r0: task do_patch: Succeeded
NOTE: Running task 1351 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.3.bb:do_deploy_source_date_epoch)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_package: Started
NOTE: recipe make-4.4-r0: task do_package: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe dbus-1.14.6-r0: task do_populate_lic: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_configure: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_configure: Started
NOTE: recipe initscripts-1.0-r155: task do_compile: Started
NOTE: recipe gmp-6.2.1-r0: task do_package: Started
NOTE: recipe kmod-30-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe initscripts-1.0-r155: task do_compile: Succeeded
NOTE: recipe dbus-1.14.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-3.11.1-r0: task do_patch: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1352 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_install)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_unpack: Succeeded
NOTE: recipe zstd-1.5.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxml2-2.10.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1353 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_patch)
NOTE: Running task 1354 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_configure)
NOTE: recipe glibc-locale-2.37-r0: task do_package: Started
NOTE: recipe dbus-1.14.6-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_populate_lic unihash changed to c42e125fb5e65f091cff4c5a9180972d9c08c6b0fcbec6c44d5df55dcc16450b
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_patch: Started
NOTE: recipe zstd-1.5.2-r0: task do_configure: Started
NOTE: recipe kmod-30-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxml2-2.10.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe zstd-1.5.2-r0: task do_configure: Succeeded
NOTE: Running task 1355 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_compile)
NOTE: recipe initscripts-1.0-r155: task do_install: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_patch: Succeeded
NOTE: Running task 1356 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_deploy_source_date_epoch)
NOTE: recipe zstd-1.5.2-r0: task do_compile: Started
NOTE: recipe systemd-1_252.5-r0: task do_unpack: Succeeded
NOTE: Running task 1357 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_252.5.bb:do_patch)
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_patch: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1358 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_deploy_source_date_epoch)
NOTE: recipe opkg-utils-0.5.0-r0: task do_package: Succeeded
NOTE: recipe systemd-1_252.5-r0: task do_patch: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_package unihash changed to 9bf6c7fd1164cdcc4e448a86036de589abd4d9f6333666b4440e1e06af0e7591
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata became valid
NOTE: Running setscene task 463 of 463 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1360 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_package)
NOTE: Running task 1361 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_package)
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1362 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_package)
NOTE: recipe zlib-1.2.13-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_package unihash changed to 0d86450d928472c2242f9fc7fb37a7c2d974239b5a8a1e3f4636c53b5dfb1857
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata became valid
NOTE: Running setscene task 463 of 463 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata_setscene)
NOTE: recipe ncurses-6.4-r0: task do_package: Started
NOTE: recipe sed-4.9-r0: task do_package: Started
NOTE: recipe attr-2.5.1-r0: task do_package: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcrypt-4.4.33-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.33.bb:do_package unihash changed to 2b51a6e3c4414522c15f0efb3ec0f847b15430a84ed863954dce5eeb7ab391b0
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.33.bb:do_packagedata became valid
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 460 of 463 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.33.bb:do_packagedata_setscene)
NOTE: Running task 1364 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_package)
NOTE: recipe libxcrypt-4.4.33-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.8-r0: task do_package: Started
NOTE: recipe xorgproto-2022.2-r0: task do_configure: Succeeded
NOTE: Running task 1365 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_compile)
NOTE: recipe libxcrypt-4.4.33-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe systemd-1_252.5-r0: task do_patch: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_package: Succeeded
NOTE: Running task 1367 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_252.5.bb:do_deploy_source_date_epoch)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_package unihash changed to 981896223ce1d308d7c3695460aad789e724aeef8641c53d1d25f841fe686caf
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_packagedata became valid
NOTE: recipe xorgproto-2022.2-r0: task do_compile: Started
NOTE: Running setscene task 463 of 463 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_packagedata_setscene)
NOTE: recipe libcap-ng-0.8.3-r0: task do_package: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-1_252.5-r0: task do_deploy_source_date_epoch: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_package unihash changed to 94388a6daf6bc387645c28b31b8da10d0aed7877459df500e055f6fb21fd526e
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_packagedata became valid
NOTE: Running setscene task 463 of 463 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_packagedata_setscene)
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1369 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe systemd-1_252.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe expat-2.5.0-r0: task do_configure: Succeeded
NOTE: Running task 1370 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_configure_ptest_base)
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_compile: Succeeded
NOTE: Running task 1372 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_install)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_package: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_configure_ptest_base: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_package unihash changed to 90f07edab0c2cfd4c0f7a860fe38e58f1253c9d576095c12520ffa15b227b621
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata became valid
NOTE: Running setscene task 463 of 463 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: recipe expat-2.5.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1373 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_compile)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 9c037122271d20eab942bcef627c8daf1e16fc02b8b7bbc0edd2c42912c38dbc
NOTE: recipe xorgproto-2022.2-r0: task do_install: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_compile: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe python3-3.11.1-r0: task do_patch: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1375 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.1.bb:do_deploy_source_date_epoch)
NOTE: recipe initscripts-1.0-r155: task do_install: Succeeded
NOTE: Running task 1376 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot)
NOTE: Running task 1377 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_package)
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot: Started
NOTE: recipe initscripts-1.0-r155: task do_package: Started
NOTE: recipe python3-3.11.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_configure: Succeeded
NOTE: recipe python3-3.11.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1378 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_compile)
NOTE: recipe xcb-proto-1.15.2-r0: task do_configure: Succeeded
NOTE: Running task 1379 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_compile)
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_compile: Started
NOTE: recipe xorgproto-2022.2-r0: task do_install: Succeeded
NOTE: Running task 1380 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_populate_sysroot)
NOTE: Running task 1381 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_package)
NOTE: recipe util-macros-1_1.19.3-r0: task do_compile: Succeeded
NOTE: Running task 1382 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_install)
NOTE: recipe xcb-proto-1.15.2-r0: task do_compile: Started
NOTE: recipe xorgproto-2022.2-r0: task do_populate_sysroot: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_compile: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_package: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_install: Started
NOTE: Running task 1383 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_install)
NOTE: recipe xcb-proto-1.15.2-r0: task do_install: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_install: Succeeded
NOTE: Running task 1384 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_populate_sysroot)
NOTE: Running task 1385 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_package)
NOTE: recipe make-4.4-r0: task do_package: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_package: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.bb:do_package unihash changed to 7b106a841cd30f92483afe82a599e26cf20971c6bcc6db56419bc26be80d819f
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.bb:do_packagedata became valid
NOTE: recipe util-macros-1_1.19.3-r0: task do_package: Started
NOTE: Running setscene task 463 of 463 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.bb:do_packagedata_setscene)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_package unihash changed to 3151a010502ea26238af0f08e5d1a6a37157c5b05c7750ee953e3104a6889cf1
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata became valid
NOTE: recipe xorgproto-2022.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running setscene task 459 of 463 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: recipe base-passwd-3.6.1-r0: task do_configure: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_package: Succeeded
NOTE: recipe make-4.4-r0: task do_packagedata_setscene: Started
NOTE: Running task 1386 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_compile)
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_package unihash changed to d6b9411c90a1139d3957412eeffaefa5112551d41bcf59ff071cbd91d9ba3d9c
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata became valid
NOTE: Running setscene task 463 of 463 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_package: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_compile: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package unihash changed to b62140cdba2b4ebd9affcfd9e9ee0d1659dfefe48db5dd0bc234e1451b8c64f2
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata became valid
NOTE: Running setscene task 463 of 463 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1387 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1388 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1389 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1390 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpthread-stubs-0.4-r0: task do_configure: Succeeded
NOTE: Running task 1391 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_compile)
NOTE: recipe make-4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1394 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_package)
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: Running task 1396 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.bb:do_package_write_rpm)
NOTE: recipe attr-2.5.1-r0: task do_package: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_compile: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_package unihash changed to 7587cbb1cb1289b4db0a9791d64b70c3d55ab4603c4a30dc061c6d1bd4f9df7e
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata became valid
NOTE: recipe xkeyboard-config-2.38-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running setscene task 459 of 463 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_compile: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_install: Succeeded
NOTE: Running task 1397 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_install)
NOTE: recipe make-4.4-r0: task do_package_write_rpm: Started
NOTE: Running task 1398 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_populate_sysroot)
NOTE: Running task 1399 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_package)
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_install: Started
NOTE: recipe perl-5.36.0-r0: task do_package: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_package: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1401 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_configure)
NOTE: recipe libxau-1_1.0.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1402 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_configure)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1403 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_configure)
NOTE: Setscene tasks completed
NOTE: Running task 1405 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_package)
NOTE: recipe xtrans-1_1.4.0-r0: task do_configure: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_compile: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_install: Succeeded
NOTE: Running task 1406 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_install)
NOTE: Running task 1407 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot)
NOTE: recipe libxau-1_1.0.11-r0: task do_configure: Started
NOTE: Running task 1408 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_package)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_configure: Started
NOTE: recipe acl-2.3.1-r0: task do_package: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_install: Started
NOTE: recipe xkeyboard-config-2.38-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_package: Started
NOTE: Running task 1409 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_configure)
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_package: Succeeded
NOTE: Running task 1410 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_packagedata)
NOTE: recipe xkeyboard-config-2.38-r0: task do_configure: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_install: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_packagedata: Started
NOTE: Running task 1411 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_populate_sysroot)
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_package: Succeeded
NOTE: Running task 1412 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata)
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot: Started
NOTE: recipe initscripts-1.0-r155: task do_packagedata: Started
NOTE: recipe xorgproto-2022.2-r0: task do_packagedata: Succeeded
NOTE: recipe cracklib-2.9.8-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_package unihash changed to 6431673eff839ea6cf4498d4b87b05a665854412c0669770a23d22d9de0fb33b
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_packagedata became valid
NOTE: Running setscene task 450 of 463 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_packagedata_setscene)
NOTE: recipe util-macros-1_1.19.3-r0: task do_package: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_packagedata: Succeeded
NOTE: recipe cracklib-2.9.8-r0: task do_packagedata_setscene: Started
NOTE: Running task 1413 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_packagedata)
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1414 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1415 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_package)
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_prepare_recipe_sysroot: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_package: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_package: Started
NOTE: Running task 1416 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_packagedata)
NOTE: recipe cracklib-2.9.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe shadow-sysroot-4.6-r3: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1418 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_configure)
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_configure: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_configure: Succeeded
NOTE: Running task 1419 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_compile)
NOTE: recipe bzip2-1.0.8-r0: task do_configure: Succeeded
NOTE: Running task 1420 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_configure_ptest_base)
NOTE: recipe shadow-sysroot-4.6-r3: task do_compile: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_compile: Succeeded
NOTE: Running task 1421 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_install)
NOTE: recipe bzip2-1.0.8-r0: task do_configure_ptest_base: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_install: Started
NOTE: recipe bzip2-1.0.8-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1422 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_compile)
NOTE: recipe bzip2-1.0.8-r0: task do_compile: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_package: Succeeded
NOTE: recipe sed-4.9-r0: task do_package: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_install: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_package unihash changed to 51440c4bfb5e24a55b49fe6a58d3b1c176af916f3a3635ef19a285279d3f8757
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata became valid
NOTE: Running setscene task 463 of 463 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running task 1423 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata)
NOTE: Running task 1424 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot)
NOTE: recipe xkeyboard-config-2.38-r0: task do_configure: Succeeded
NOTE: Running task 1425 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_compile)
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata: Started
NOTE: recipe make-4.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe xkeyboard-config-2.38-r0: task do_compile: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata: Succeeded
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_package: Succeeded
NOTE: recipe xkeyboard-config-2.38-r0: task do_compile: Succeeded
NOTE: Running task 1427 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_install)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_package unihash changed to d96fd64bb46b749329521ba0c1c971d95fe1af87e3d71aabeded6f4ad2aa4e80
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata became valid
NOTE: Running setscene task 447 of 463 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.40.1-r0: task do_configure: Succeeded
NOTE: Running task 1428 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.40.1.bb:do_compile)
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.38-r0: task do_install: Started
NOTE: recipe sqlite3-3_3.40.1-r0: task do_compile: Started
NOTE: recipe expat-2.5.0-r0: task do_compile: Succeeded
NOTE: Running task 1429 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_compile_ptest_base)
NOTE: recipe base-passwd-3.6.1-r0: task do_package: Succeeded
NOTE: Running task 1430 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_packagedata)
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe expat-2.5.0-r0: task do_compile_ptest_base: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata: Started
NOTE: recipe expat-2.5.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1432 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_install)
NOTE: recipe expat-2.5.0-r0: task do_install: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_compile: Succeeded
NOTE: Running task 1433 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_compile_ptest_base)
NOTE: recipe expat-2.5.0-r0: task do_install: Succeeded
NOTE: Running task 1434 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_install_ptest_base)
NOTE: recipe acl-2.3.1-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_package unihash changed to 67d8198411a54c1204224af4f02608fa6fe503ee06190f83201a5575e80cc90a
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata became valid
NOTE: Running setscene task 459 of 463 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_compile_ptest_base: Started
NOTE: recipe expat-2.5.0-r0: task do_install_ptest_base: Started
NOTE: recipe bzip2-1.0.8-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1435 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_install)
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1436 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_populate_sysroot)
NOTE: Running task 1437 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_package)
NOTE: recipe bzip2-1.0.8-r0: task do_install: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot: Started
NOTE: recipe xkeyboard-config-2.38-r0: task do_install: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_package: Started
NOTE: Running task 1439 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_populate_sysroot)
NOTE: Running task 1440 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_package)
NOTE: recipe xkeyboard-config-2.38-r0: task do_populate_sysroot: Started
NOTE: recipe xkeyboard-config-2.38-r0: task do_package: Started
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_install: Succeeded
NOTE: Running task 1441 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_install_ptest_base)
NOTE: recipe bzip2-1.0.8-r0: task do_install_ptest_base: Started
NOTE: recipe xkeyboard-config-2.38-r0: task do_populate_sysroot: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1442 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot)
NOTE: Running task 1443 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package)
NOTE: recipe libtirpc-1.3.3-r0: task do_configure: Succeeded
NOTE: Running task 1444 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_compile)
NOTE: recipe libtirpc-1.3.3-r0: task do_compile: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot: Started
NOTE: recipe bzip2-1.0.8-r0: task do_package: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1445 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpcre2-10.42-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libffi-3.4.4-r0: task do_configure: Succeeded
NOTE: Running task 1446 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_compile)
NOTE: recipe libpcre2-10.42-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1447 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_configure)
NOTE: recipe libffi-3.4.4-r0: task do_compile: Started
NOTE: recipe libpcre2-10.42-r0: task do_configure: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_compile: Succeeded
NOTE: Running task 1448 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_install)
NOTE: recipe expat-2.5.0-r0: task do_package: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_install: Started
NOTE: Running task 1449 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_packagedata)
NOTE: recipe libseccomp-2.5.4-r0: task do_configure: Succeeded
NOTE: Running task 1450 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_configure_ptest_base)
NOTE: recipe expat-2.5.0-r0: task do_packagedata: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_configure: Succeeded
NOTE: Running task 1451 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_compile)
NOTE: recipe libseccomp-2.5.4-r0: task do_configure_ptest_base: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1452 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_compile)
NOTE: recipe xtrans-1_1.4.0-r0: task do_compile: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_compile: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1453 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_install)
NOTE: recipe libseccomp-2.5.4-r0: task do_compile: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_install: Succeeded
NOTE: Running task 1454 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot)
NOTE: Running task 1455 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_package)
NOTE: recipe xtrans-1_1.4.0-r0: task do_install: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_package: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_install: Succeeded
NOTE: Running task 1456 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_populate_sysroot)
NOTE: Running task 1457 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_package)
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_package: Started
NOTE: Running task 1458 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe libffi-3.4.4-r0: task do_compile: Succeeded
NOTE: Running task 1459 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_install)
NOTE: recipe libnsl2-2.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libffi-3.4.4-r0: task do_install: Started
NOTE: recipe openssl-3.0.7-r0: task do_configure: Succeeded
NOTE: Running task 1460 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_configure_ptest_base)
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1461 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libnsl2-2.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1462 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_configure)
NOTE: recipe libnsl2-2.0.0-r0: task do_configure: Started
NOTE: recipe libice-1_1.1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe openssl-3.0.7-r0: task do_configure_ptest_base: Started
NOTE: recipe openssl-3.0.7-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1463 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_compile)
NOTE: recipe openssl-3.0.7-r0: task do_compile: Started
NOTE: recipe libice-1_1.1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1464 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_configure)
NOTE: recipe libice-1_1.1.1-r0: task do_configure: Started
NOTE: recipe libffi-3.4.4-r0: task do_install: Succeeded
NOTE: Running task 1465 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot)
NOTE: Running task 1466 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_package)
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot: Started
NOTE: recipe libffi-3.4.4-r0: task do_package: Started
NOTE: recipe xkeyboard-config-2.38-r0: task do_package: Succeeded
NOTE: Running task 1467 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_packagedata)
NOTE: recipe xkeyboard-config-2.38-r0: task do_packagedata: Started
NOTE: recipe bzip2-1.0.8-r0: task do_package: Succeeded
NOTE: Running task 1468 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata)
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata: Started
NOTE: recipe xkeyboard-config-2.38-r0: task do_packagedata: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_package: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata: Succeeded
NOTE: Running task 1469 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata)
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_package: Succeeded
NOTE: Running task 1470 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata)
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_package: Succeeded
NOTE: Running task 1471 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata)
NOTE: recipe libseccomp-2.5.4-r0: task do_compile: Succeeded
NOTE: Running task 1472 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_compile_ptest_base)
NOTE: recipe libffi-3.4.4-r0: task do_packagedata: Started
NOTE: recipe ncurses-6.4-r0: task do_package: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_compile_ptest_base: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_package unihash changed to 66cc4b1895b870f95b797e8d8f34f219006a437deab2a85857d8799235ec14aa
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata became valid
NOTE: Running setscene task 463 of 463 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1474 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_package)
NOTE: Running task 1475 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_package)
NOTE: Running task 1476 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.6.bb:do_package)
NOTE: recipe psmisc-23.6-r0: task do_package: Started
NOTE: recipe bash-5.2.15-r0: task do_package: Started
NOTE: recipe readline-8.2-r0: task do_package: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_configure: Succeeded
NOTE: Running task 1477 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_compile)
NOTE: recipe libxau-1_1.0.11-r0: task do_compile: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1478 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_install)
NOTE: recipe libseccomp-2.5.4-r0: task do_install: Started
NOTE: recipe xz-5.4.1-r0: task do_configure: Succeeded
NOTE: Running task 1479 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.1.bb:do_compile)
NOTE: recipe xz-5.4.1-r0: task do_compile: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_compile: Succeeded
NOTE: Running task 1480 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_install)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_configure: Succeeded
NOTE: Running task 1481 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_compile)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_compile: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_install: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_install: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_install: Succeeded
NOTE: Running task 1482 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_install_ptest_base)
NOTE: Running task 1483 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_populate_sysroot)
NOTE: Running task 1484 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_package)
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot: Started
NOTE: recipe readline-8.2-r0: task do_package: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_package: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_install_ptest_base: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_package unihash changed to aca0f362c02474770b00934670cee30cb06b46d0c76be4af00e024e095b7baa1
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_packagedata became valid
NOTE: Running setscene task 459 of 463 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_packagedata_setscene)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_compile: Succeeded
NOTE: Running task 1485 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_install)
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_install: Started
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot: Succeeded
NOTE: recipe psmisc-23.6-r0: task do_package: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_install: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.6.bb:do_package unihash changed to 5189882efbe3a6277ea448313e1444670e3afe97fab205623ea278063465112e
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.6.bb:do_packagedata became valid
NOTE: Running setscene task 463 of 463 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.6.bb:do_packagedata_setscene)
NOTE: Running task 1487 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_populate_sysroot)
NOTE: Running task 1488 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_package)
NOTE: recipe psmisc-23.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_package: Started
NOTE: recipe psmisc-23.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1490 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_package_write_rpm)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_package_write_rpm: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1491 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxcb-1.15-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_package: Succeeded
NOTE: Running task 1492 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_packagedata)
NOTE: recipe xz-5.4.1-r0: task do_compile: Succeeded
NOTE: recipe zstd-1.5.2-r0: task do_compile: Succeeded
NOTE: Running task 1493 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.1.bb:do_install)
NOTE: Running task 1494 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_install)
NOTE: recipe libxcb-1.15-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1495 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_configure)
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata: Started
NOTE: recipe zstd-1.5.2-r0: task do_install: Started
NOTE: recipe xz-5.4.1-r0: task do_install: Started
NOTE: recipe libxcb-1.15-r0: task do_configure: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_install_ptest_base: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 1496 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_populate_sysroot)
NOTE: Running task 1497 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_package)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_package_write_rpm unihash changed to da724a7c7e5bb3a1b377e7e9f1384f890020feb5898fe3f0d727427fd10e300e
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_populate_sysroot: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_package: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_package: Succeeded
NOTE: Running task 1498 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_packagedata)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_configure: Succeeded
NOTE: Running task 1499 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_compile)
NOTE: recipe libnsl2-2.0.0-r0: task do_compile: Started
NOTE: recipe bash-5.2.15-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_package unihash changed to 22135eee8e97c17cb7b5ee6c39433a25cdbfb8656751fdae15ca034b47b9575b
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_packagedata became valid
NOTE: Running setscene task 463 of 463 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_packagedata_setscene)
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_configure: Succeeded
NOTE: Running task 1500 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_compile)
NOTE: recipe libpam-1.5.2-r0: task do_configure: Succeeded
NOTE: Running task 1501 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_configure_ptest_base)
NOTE: recipe libpcre2-10.42-r0: task do_compile: Started
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libpam-1.5.2-r0: task do_configure_ptest_base: Started
NOTE: recipe libpam-1.5.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1503 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_compile)
NOTE: recipe libnsl2-2.0.0-r0: task do_compile: Succeeded
NOTE: Running task 1504 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_install)
NOTE: recipe libpam-1.5.2-r0: task do_compile: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_install: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_install: Succeeded
NOTE: Running task 1505 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot)
NOTE: Running task 1506 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_package)
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_package: Started
NOTE: recipe xz-5.4.1-r0: task do_install: Succeeded
NOTE: Running task 1507 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.1.bb:do_populate_sysroot)
NOTE: Running task 1508 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.1.bb:do_package)
NOTE: recipe xz-5.4.1-r0: task do_populate_sysroot: Started
NOTE: recipe xz-5.4.1-r0: task do_package: Started
NOTE: recipe libice-1_1.1.1-r0: task do_configure: Succeeded
NOTE: Running task 1509 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_compile)
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_compile: Started
NOTE: recipe xz-5.4.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_compile: Succeeded
NOTE: Running task 1510 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_install)
NOTE: recipe libice-1_1.1.1-r0: task do_install: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_package: Succeeded
NOTE: Running task 1511 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata)
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata: Started
NOTE: recipe libice-1_1.1.1-r0: task do_install: Succeeded
NOTE: Running task 1512 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_populate_sysroot)
NOTE: Running task 1513 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_package)
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot: Started
NOTE: recipe libice-1_1.1.1-r0: task do_package: Started
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1514 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsm-1_1.2.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_package: Succeeded
NOTE: Running task 1515 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_packagedata)
NOTE: recipe libseccomp-2.5.4-r0: task do_packagedata: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1516 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_configure)
NOTE: recipe libsm-1_1.2.4-r0: task do_configure: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_packagedata: Succeeded
NOTE: recipe xz-5.4.1-r0: task do_package: Succeeded
NOTE: Running task 1517 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.1.bb:do_packagedata)
NOTE: recipe libice-1_1.1.1-r0: task do_package: Succeeded
NOTE: Running task 1518 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_packagedata)
NOTE: recipe xz-5.4.1-r0: task do_packagedata: Started
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata: Started
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata: Succeeded
NOTE: recipe xz-5.4.1-r0: task do_packagedata: Succeeded
NOTE: recipe openssl-3.0.7-r0: task do_compile: Succeeded
NOTE: Running task 1519 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_compile_ptest_base)
NOTE: recipe openssl-3.0.7-r0: task do_compile_ptest_base: Started
NOTE: recipe openssl-3.0.7-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1520 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_install)
NOTE: recipe openssl-3.0.7-r0: task do_install: Started
NOTE: recipe zstd-1.5.2-r0: task do_install: Succeeded
NOTE: Running task 1521 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_populate_sysroot)
NOTE: Running task 1522 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_package)
NOTE: recipe zstd-1.5.2-r0: task do_populate_sysroot: Started
NOTE: recipe zstd-1.5.2-r0: task do_package: Started
NOTE: recipe zstd-1.5.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_configure: Succeeded
NOTE: Running task 1523 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_compile)
NOTE: recipe libxcb-1.15-r0: task do_compile: Started
NOTE: recipe zstd-1.5.2-r0: task do_package: Succeeded
NOTE: Running task 1524 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_packagedata)
NOTE: recipe zstd-1.5.2-r0: task do_packagedata: Started
NOTE: recipe zstd-1.5.2-r0: task do_packagedata: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_compile: Succeeded
NOTE: Running task 1525 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_install)
NOTE: recipe libpcre2-10.42-r0: task do_install: Started
NOTE: recipe libpcre2-10.42-r0: task do_install: Succeeded
NOTE: Running task 1526 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_populate_sysroot)
NOTE: Running task 1527 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_package)
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot: Started
NOTE: recipe libpcre2-10.42-r0: task do_package: Started
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_compile: Succeeded
NOTE: Running task 1528 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_install)
NOTE: recipe libxcb-1.15-r0: task do_install: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_configure: Succeeded
NOTE: Running task 1529 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_compile)
NOTE: recipe libsm-1_1.2.4-r0: task do_compile: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_compile: Succeeded
NOTE: Running task 1530 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_install)
NOTE: recipe libsm-1_1.2.4-r0: task do_install: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_install: Succeeded
NOTE: Running task 1531 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_populate_sysroot)
NOTE: Running task 1532 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_package)
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_package: Started
NOTE: recipe libpcre2-10.42-r0: task do_package: Succeeded
NOTE: Running task 1533 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_packagedata)
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_packagedata: Started
NOTE: recipe libpcre2-10.42-r0: task do_packagedata: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_install: Succeeded
NOTE: Running task 1534 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_populate_sysroot)
NOTE: Running task 1535 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_package)
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot: Started
NOTE: recipe libxcb-1.15-r0: task do_package: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_package: Succeeded
NOTE: Running task 1536 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_packagedata)
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata: Started
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1537 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libx11-1_1.8.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata: Succeeded
NOTE: recipe libx11-1_1.8.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1538 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_configure)
NOTE: recipe libx11-1_1.8.4-r0: task do_configure: Started
NOTE: recipe libpam-1.5.2-r0: task do_compile: Succeeded
NOTE: Running task 1539 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_compile_ptest_base)
NOTE: recipe libpam-1.5.2-r0: task do_compile_ptest_base: Started
NOTE: recipe libpam-1.5.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1540 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_install)
NOTE: recipe libpam-1.5.2-r0: task do_install: Started
NOTE: recipe libxcb-1.15-r0: task do_package: Succeeded
NOTE: Running task 1541 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_packagedata)
NOTE: recipe libxcb-1.15-r0: task do_packagedata: Started
NOTE: recipe libxcb-1.15-r0: task do_packagedata: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_install: Succeeded
NOTE: Running task 1542 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_install_ptest_base)
NOTE: recipe libpam-1.5.2-r0: task do_install_ptest_base: Started
NOTE: recipe libpam-1.5.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1543 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_populate_sysroot)
NOTE: Running task 1544 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_package)
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot: Started
NOTE: recipe libpam-1.5.2-r0: task do_package: Started
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_populate_sysroot unihash changed to 0e7e2049a61c125b0549d030dfa9e2b9f4d611a5389a62238b5db2c3dd6fee04
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.66.bb:do_populate_sysroot became valid
NOTE: Running setscene task 463 of 463 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.66.bb:do_populate_sysroot_setscene)
NOTE: Running task 1552 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_populate_sysroot)
NOTE: Running task 1557 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_populate_sysroot)
NOTE: recipe libcap-2.66-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot: Started
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot: Started
NOTE: recipe libcap-2.66-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1570 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sqlite3-3_3.40.1-r0: task do_compile: Succeeded
NOTE: Running task 1571 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.40.1.bb:do_install)
NOTE: recipe sqlite3-3_3.40.1-r0: task do_install: Started
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1572 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_configure)
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_configure: Started
NOTE: recipe sqlite3-3_3.40.1-r0: task do_install: Succeeded
NOTE: Running task 1573 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.40.1.bb:do_populate_sysroot)
NOTE: Running task 1574 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.40.1.bb:do_package)
NOTE: recipe sqlite3-3_3.40.1-r0: task do_populate_sysroot: Started
NOTE: recipe sqlite3-3_3.40.1-r0: task do_package: Started
NOTE: recipe sqlite3-3_3.40.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe sqlite3-3_3.40.1-r0: task do_package: Succeeded
NOTE: Running task 1575 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.40.1.bb:do_packagedata)
NOTE: recipe sqlite3-3_3.40.1-r0: task do_packagedata: Started
NOTE: recipe sqlite3-3_3.40.1-r0: task do_packagedata: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_package unihash changed to 8b8231668404f698cca8f26fa323f3a1204c49046e06a1e1799fbe3efe1d5ad6
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata became valid
NOTE: Running setscene task 463 of 463 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_configure: Succeeded
NOTE: Running task 1576 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_compile)
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1578 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_package)
NOTE: Running task 1579 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_package)
NOTE: recipe libx11-1_1.8.4-r0: task do_compile: Started
NOTE: Running task 1580 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.66.bb:do_package)
NOTE: recipe util-linux-2.38.1-r0: task do_package: Started
NOTE: recipe shadow-4.13-r0: task do_package: Started
NOTE: recipe libcap-2.66-r0: task do_package: Started
NOTE: recipe libcap-2.66-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.66.bb:do_package unihash changed to cae67f91e06725bcef8b1e674e330aaf5541781a7a11b9f4957f722aa7defc51
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.66.bb:do_packagedata became valid
NOTE: Running setscene task 463 of 463 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.66.bb:do_packagedata_setscene)
NOTE: recipe libcap-2.66-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.66-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1582 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_package)
NOTE: recipe coreutils-9.1-r0: task do_package: Started
NOTE: recipe shadow-4.13-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_package unihash changed to 46ec57979dceb1ccfa722c40e905acc28310c6f0ba52d8e5007d936503520a90
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_packagedata became valid
NOTE: Running setscene task 463 of 463 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1584 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_configure_ptest_base)
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_configure_ptest_base: Started
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1585 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_compile)
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_compile: Started
NOTE: recipe openssl-3.0.7-r0: task do_install: Succeeded
NOTE: Running task 1586 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_install_ptest_base)
NOTE: recipe openssl-3.0.7-r0: task do_install_ptest_base: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_compile: Succeeded
NOTE: Running task 1587 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_install)
NOTE: recipe libx11-1_1.8.4-r0: task do_install: Started
NOTE: recipe perl-5.36.0-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_package unihash changed to 96eaf20fbc4bbf8bc2136da0904f2566ad1eb636d50a4c297a721f04110df5bf
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_packagedata became valid
NOTE: Running setscene task 463 of 463 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_packagedata_setscene)
NOTE: recipe perl-5.36.0-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.0.7-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1588 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_populate_sysroot)
NOTE: Running task 1589 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_package)
NOTE: recipe openssl-3.0.7-r0: task do_populate_sysroot: Started
NOTE: recipe openssl-3.0.7-r0: task do_package: Started
NOTE: recipe openssl-3.0.7-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1590 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1591 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_prepare_recipe_sysroot)
NOTE: recipe kmod-30-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-3.11.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe kmod-30-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1592 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_configure)
NOTE: recipe python3-3.11.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1593 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.1.bb:do_configure)
NOTE: recipe kmod-30-r0: task do_configure: Started
NOTE: recipe python3-3.11.1-r0: task do_configure: Started
NOTE: recipe perl-5.36.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libx11-1_1.8.4-r0: task do_install: Succeeded
NOTE: Running task 1595 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_populate_sysroot)
NOTE: Running task 1596 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_package)
NOTE: recipe libx11-1_1.8.4-r0: task do_populate_sysroot: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_package: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_compile: Succeeded
NOTE: Running task 1597 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_compile_ptest_base)
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_compile_ptest_base: Started
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1598 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_install)
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_install: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_package: Succeeded
NOTE: Running task 1599 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_packagedata)
NOTE: recipe libx11-1_1.8.4-r0: task do_packagedata: Started
NOTE: recipe util-linux-2.38.1-r0: task do_package: Succeeded
NOTE: recipe libx11-1_1.8.4-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_package unihash changed to d60ce20cfcbfe1317869eba6980a0f5f3d6bc784a184999259e6112998a51569
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_packagedata became valid
NOTE: Running setscene task 458 of 463 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_packagedata_setscene)
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_install: Succeeded
NOTE: Running task 1600 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_install_ptest_base)
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_install_ptest_base: Started
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1601 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_populate_sysroot)
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_populate_sysroot: Started
NOTE: recipe coreutils-9.1-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_package unihash changed to 3ff0b7d171a93804d9172f2638c089f4d5923efe36301de066dfa1e9c18105d5
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_packagedata became valid
NOTE: Running setscene task 463 of 463 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_packagedata_setscene)
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1603 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_package)
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_package: Started
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe kmod-30-r0: task do_configure: Succeeded
NOTE: Running task 1605 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_compile)
NOTE: recipe kmod-30-r0: task do_compile: Started
NOTE: recipe kmod-30-r0: task do_compile: Succeeded
NOTE: Running task 1606 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_install)
NOTE: recipe kmod-30-r0: task do_install: Started
NOTE: recipe kmod-30-r0: task do_install: Succeeded
NOTE: Running task 1607 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_populate_sysroot)
NOTE: recipe kmod-30-r0: task do_populate_sysroot: Started
NOTE: recipe kmod-30-r0: task do_populate_sysroot: Succeeded
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_package: Succeeded
NOTE: Running task 1608 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_packagedata)
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_packagedata: Started
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_packagedata: Succeeded
NOTE: recipe python3-3.11.1-r0: task do_configure: Succeeded
NOTE: Running task 1609 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.1.bb:do_configure_ptest_base)
NOTE: recipe python3-3.11.1-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-3.11.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1610 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.1.bb:do_compile)
NOTE: recipe python3-3.11.1-r0: task do_compile: Started
NOTE: recipe python3-3.11.1-r0: task do_compile: Succeeded
NOTE: Running task 1611 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.1.bb:do_compile_ptest_base)
NOTE: recipe python3-3.11.1-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-3.11.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1612 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.1.bb:do_install)
NOTE: recipe python3-3.11.1-r0: task do_install: Started
NOTE: recipe openssl-3.0.7-r0: task do_package: Succeeded
NOTE: Running task 1613 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_packagedata)
NOTE: recipe openssl-3.0.7-r0: task do_packagedata: Started
NOTE: recipe openssl-3.0.7-r0: task do_packagedata: Failed
NOTE: recipe glibc-locale-2.37-r0: task do_package: Succeeded
NOTE: recipe python3-3.11.1-r0: task do_install: Succeeded
NOTE: Tasks Summary: Attempted 1613 tasks of which 1209 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 16 ERROR messages, returning a non-zero exit code.
ERROR: openssl-3.0.7-r0 do_packagedata: QA Issue: Package version for package openssl-src went backwards which would break package feeds (from 0:3.0.8-r0 to 0:3.0.7-r0) [version-going-backwards]
ERROR: openssl-3.0.7-r0 do_packagedata: QA Issue: Package version for package openssl-dbg went backwards which would break package feeds (from 0:3.0.8-r0 to 0:3.0.7-r0) [version-going-backwards]
ERROR: openssl-3.0.7-r0 do_packagedata: QA Issue: Package version for package libcrypto went backwards which would break package feeds (from 0:3.0.8-r0 to 0:3.0.7-r0) [version-going-backwards]
ERROR: openssl-3.0.7-r0 do_packagedata: QA Issue: Package version for package libssl went backwards which would break package feeds (from 0:3.0.8-r0 to 0:3.0.7-r0) [version-going-backwards]
ERROR: openssl-3.0.7-r0 do_packagedata: QA Issue: Package version for package openssl-conf went backwards which would break package feeds (from 0:3.0.8-r0 to 0:3.0.7-r0) [version-going-backwards]
ERROR: openssl-3.0.7-r0 do_packagedata: QA Issue: Package version for package openssl-engines went backwards which would break package feeds (from 0:3.0.8-r0 to 0:3.0.7-r0) [version-going-backwards]
ERROR: openssl-3.0.7-r0 do_packagedata: QA Issue: Package version for package openssl-misc went backwards which would break package feeds (from 0:3.0.8-r0 to 0:3.0.7-r0) [version-going-backwards]
ERROR: openssl-3.0.7-r0 do_packagedata: QA Issue: Package version for package openssl-ossl-module-legacy went backwards which would break package feeds (from 0:3.0.8-r0 to 0:3.0.7-r0) [version-going-backwards]
ERROR: openssl-3.0.7-r0 do_packagedata: QA Issue: Package version for package openssl-ptest went backwards which would break package feeds (from 0:3.0.8-r0 to 0:3.0.7-r0) [version-going-backwards]
ERROR: openssl-3.0.7-r0 do_packagedata: QA Issue: Package version for package openssl-staticdev went backwards which would break package feeds (from 0:3.0.8-r0 to 0:3.0.7-r0) [version-going-backwards]
ERROR: openssl-3.0.7-r0 do_packagedata: QA Issue: Package version for package openssl-dev went backwards which would break package feeds (from 0:3.0.8-r0 to 0:3.0.7-r0) [version-going-backwards]
ERROR: openssl-3.0.7-r0 do_packagedata: QA Issue: Package version for package openssl-doc went backwards which would break package feeds (from 0:3.0.8-r0 to 0:3.0.7-r0) [version-going-backwards]
ERROR: openssl-3.0.7-r0 do_packagedata: QA Issue: Package version for package openssl-locale went backwards which would break package feeds (from 0:3.0.8-r0 to 0:3.0.7-r0) [version-going-backwards]
ERROR: openssl-3.0.7-r0 do_packagedata: QA Issue: Package version for package openssl-bin went backwards which would break package feeds (from 0:3.0.8-r0 to 0:3.0.7-r0) [version-going-backwards]
ERROR: openssl-3.0.7-r0 do_packagedata: QA Issue: Package version for package openssl went backwards which would break package feeds (from 0:3.0.8-r0 to 0:3.0.7-r0) [version-going-backwards]
ERROR: openssl-3.0.7-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/openssl/3.0.7-r0/temp/log.do_packagedata.793052
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_packagedata) failed with exit code '1'

--===============3884219113494210688==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/dbus/dbus-common: PKGV changed from 1.14.4 [default] to 1.14.6 [default]
packages/core2-32-poky-linux/dbus/dbus-common: PV changed from "1.14.4" to "1.14.6"
packages/core2-32-poky-linux/dbus/dbus-dbg: PKGV changed from 1.14.4 [default] to 1.14.6 [default]
packages/core2-32-poky-linux/dbus/dbus-dbg: PV changed from "1.14.4" to "1.14.6"
packages/core2-32-poky-linux/dbus/dbus-dbg: PKGSIZE changed from 7245300 to 7374768 (+2%)
packages/core2-32-poky-linux/dbus/dbus-dbg: FILELIST: removed "/usr/lib/.debug/libdbus-1.so.3.32.1", added "/usr/libexec/installed-tests/dbus/.debug/test-counter /usr/lib/.debug/libdbus-1.so.3.32.2"
packages/core2-32-poky-linux/dbus/dbus-dev: PKGV changed from 1.14.4 [default] to 1.14.6 [default]
packages/core2-32-poky-linux/dbus/dbus-dev: PV changed from "1.14.4" to "1.14.6"
packages/core2-32-poky-linux/dbus/dbus-doc: PKGV changed from 1.14.4 [default] to 1.14.6 [default]
packages/core2-32-poky-linux/dbus/dbus-doc: PV changed from "1.14.4" to "1.14.6"
packages/core2-32-poky-linux/dbus/dbus-lib: PKGV changed from 1.14.4 [default] to 1.14.6 [default]
packages/core2-32-poky-linux/dbus/dbus-lib: PV changed from "1.14.4" to "1.14.6"
packages/core2-32-poky-linux/dbus/dbus-lib: FILELIST: removed "/usr/lib/libdbus-1.so.3.32.1", added "/usr/lib/libdbus-1.so.3.32.2"
packages/core2-32-poky-linux/dbus/dbus-locale: PKGV changed from 1.14.4 [default] to 1.14.6 [default]
packages/core2-32-poky-linux/dbus/dbus-locale: PV changed from "1.14.4" to "1.14.6"
packages/core2-32-poky-linux/dbus/dbus-ptest: PKGV changed from 1.14.4 [default] to 1.14.6 [default]
packages/core2-32-poky-linux/dbus/dbus-ptest: PV changed from "1.14.4" to "1.14.6"
packages/core2-32-poky-linux/dbus/dbus-ptest: PKGSIZE changed from 3582925 to 3654432 (+2%)
packages/core2-32-poky-linux/dbus/dbus-ptest: FILELIST: added "/usr/share/installed-tests/dbus/test-counter.test /usr/libexec/installed-tests/dbus/test-counter /usr/share/installed-tests/dbus/test-counter_with_config.test"
packages/core2-32-poky-linux/dbus/dbus-src: PKGV changed from 1.14.4 [default] to 1.14.6 [default]
packages/core2-32-poky-linux/dbus/dbus-src: PV changed from "1.14.4" to "1.14.6"
packages/core2-32-poky-linux/dbus/dbus-src: PKGSIZE changed from 4343157 to 4350796 (+0%)
packages/core2-32-poky-linux/dbus/dbus-src: FILELIST: directory renamed /usr/src/debug/dbus/1.14.4-r0/test -> /usr/src/debug/dbus/1.14.6-r0/test, directory renamed /usr/src/debug/dbus/1.14.4-r0/tools -> /usr/src/debug/dbus/1.14.6-r0/tools, directory renamed /usr/src/debug/dbus/1.14.4-r0/dbus -> /usr/src/debug/dbus/1.14.6-r0/dbus, directory renamed /usr/src/debug/dbus/1.14.4-r0/bus -> /usr/src/debug/dbus/1.14.6-r0/bus, removed "/usr/src/debug/dbus/1.14.4-r0/test/internals/misc-internals.h /usr/src/debug/dbus/1.14.4-r0/test/internals/dbus-marshal-byteswap-util.c /usr/src/debug/dbus/1.14.4-r0/test/internals/dbus-marshal-validate-util.c /usr/src/debug/dbus/1.14.4-r0/test/internals/dbus-auth-util.c /usr/src/debug/dbus/1.14.4-r0/test/internals/misc-internals.c /usr/src/debug/dbus/1.14.4-r0/test/internals/dbus-marshal-recursive-util.c /usr/src/debug/dbus/1.14.4-r0/test/internals/sysdeps.c /usr/src/debug/dbus/1.14.4-r0/test/internals/dbus-marshal-recursive-util.h /usr/src/debug/dbus/1.14.4-r
 0/test/internals/variant.c /usr/src/debug/dbus/1.14.4-r0/test/internals/dbus-sysdeps-util.c /usr/src/debug/dbus/1.14.4-r0/test/internals/address.c /usr/src/debug/dbus/1.14.4-r0/test/internals/dbus-string-util.c /usr/src/debug/dbus/1.14.4-r0/test/internals/mempool.c /usr/src/debug/dbus/1.14.4-r0/test/internals/hash.c /usr/src/debug/dbus/1.14.4-r0/test/internals/desktop-file.c /usr/src/debug/dbus/1.14.4-r0/test/internals/dbus-auth-script.h /usr/src/debug/dbus/1.14.4-r0/test/internals/server-oom.c /usr/src/debug/dbus/1.14.4-r0/test/internals/dbus-auth-script.c /usr/src/debug/dbus/1.14.4-r0/test/internals/refs.c /usr/src/debug/dbus/1.14.4-r0/test/internals/assertions.c /usr/src/debug/dbus/1.14.4-r0/test/internals/syslog.c /usr/src/debug/dbus/1.14.4-r0/test/internals/atomic.c /usr/src/debug/dbus/1.14.4-r0/test/internals/sha.c /usr/src/debug/dbus/1.14.4-r0/test/internals/printf.c /usr/src/debug/dbus/1.14.4-r0/test/internals/dbus-credentials-util.c", added "/usr/src/debug/dbus/1.14.6-r0/te
 st/internals/misc-internals.h /usr/src/debug/dbus/1.14.6-r0/test/internals/dbus-marshal-byteswap-util.c /usr/src/debug/dbus/1.14.6-r0/test/internals/dbus-marshal-validate-util.c /usr/src/debug/dbus/1.14.6-r0/test/internals/dbus-auth-util.c /usr/src/debug/dbus/1.14.6-r0/test/internals/misc-internals.c /usr/src/debug/dbus/1.14.6-r0/test/internals/dbus-marshal-recursive-util.c /usr/src/debug/dbus/1.14.6-r0/test/internals/sysdeps.c /usr/src/debug/dbus/1.14.6-r0/test/internals/dbus-marshal-recursive-util.h /usr/src/debug/dbus/1.14.6-r0/test/internals/variant.c /usr/src/debug/dbus/1.14.6-r0/test/internals/dbus-sysdeps-util.c /usr/src/debug/dbus/1.14.6-r0/test/internals/counter.c /usr/src/debug/dbus/1.14.6-r0/test/internals/address.c /usr/src/debug/dbus/1.14.6-r0/test/internals/dbus-string-util.c /usr/src/debug/dbus/1.14.6-r0/test/internals/mempool.c /usr/src/debug/dbus/1.14.6-r0/test/internals/hash.c /usr/src/debug/dbus/1.14.6-r0/test/internals/desktop-file.c /usr/src/debug/dbus/1.14.6-r0
 /test/internals/dbus-auth-script.h /usr/src/debug/dbus/1.14.6-r0/test/internals/server-oom.c /usr/src/debug/dbus/1.14.6-r0/test/internals/dbus-auth-script.c /usr/src/debug/dbus/1.14.6-r0/test/internals/refs.c /usr/src/debug/dbus/1.14.6-r0/test/internals/assertions.c /usr/src/debug/dbus/1.14.6-r0/test/internals/syslog.c /usr/src/debug/dbus/1.14.6-r0/test/internals/atomic.c /usr/src/debug/dbus/1.14.6-r0/test/internals/sha.c /usr/src/debug/dbus/1.14.6-r0/test/internals/printf.c /usr/src/debug/dbus/1.14.6-r0/test/internals/dbus-credentials-util.c"
packages/core2-32-poky-linux/dbus/dbus-staticdev: PKGV changed from 1.14.4 [default] to 1.14.6 [default]
packages/core2-32-poky-linux/dbus/dbus-staticdev: PV changed from "1.14.4" to "1.14.6"
packages/core2-32-poky-linux/dbus/dbus-tools: PKGV changed from 1.14.4 [default] to 1.14.6 [default]
packages/core2-32-poky-linux/dbus/dbus-tools: PV changed from "1.14.4" to "1.14.6"
packages/core2-32-poky-linux/dbus/dbus: PKGV changed from 1.14.4 [default] to 1.14.6 [default]
packages/core2-32-poky-linux/dbus/dbus: PV changed from "1.14.4" to "1.14.6"
packages/core2-32-poky-linux/dbus: PKGV changed from 1.14.4 [default] to 1.14.6 [default]
packages/core2-32-poky-linux/dbus: SRC_URI changed from "https://dbus.freedesktop.org/releases/dbus/dbus-1.14.4.tar.xz file://run-ptest file://tmpdir.patch file://0001-Define-_DBUS_ALIGNOF-using-_Alignof-when-using-C11-o.patch file://dbus-1.init" to "https://dbus.freedesktop.org/releases/dbus/dbus-1.14.6.tar.xz file://run-ptest file://tmpdir.patch file://dbus-1.init"
packages/core2-32-poky-linux/dbus: PV changed from "1.14.4" to "1.14.6"
Changes to packages/core2-32-poky-linux/dbus (sysroot):
  /usr/lib/libdbus-1.so.3 changed symlink target from libdbus-1.so.3.32.1 to libdbus-1.so.3.32.2
  /usr/lib/libdbus-1.so changed symlink target from libdbus-1.so.3.32.1 to libdbus-1.so.3.32.2
  /usr/lib/libdbus-1.so.3.32.1 moved to /usr/lib/libdbus-1.so.3.32.2

--===============3884219113494210688==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1695 entries from dependency cache.
Parsing recipes...done.
Parsing of 895 .bb files complete (894 cached, 1 parsed). 1693 targets, 37 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-f3751bf025630bda15f4496c36874f8d0f79ac2f"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:f3751bf025630bda15f4496c36874f8d0f79ac2f"
workspace            = "master:44311c454d0b0856f58cfa6fa60669903b2ba3af"

Initialising tasks...done.
Sstate summary: Wanted 207 Local 4 Mirrors 0 Missed 203 Current 256 (1% match, 56% complete)
Removing 28 stale sstate objects for arch qemux86_64...done.
Removing 30 stale sstate objects for arch core2-64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 276 of 463 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 312 of 463 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/autoconf-archive/autoconf-archive_2022.09.03.bb:do_packagedata_setscene)
NOTE: Running setscene task 317 of 463 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland-protocols_1.31.bb:do_packagedata_setscene)
NOTE: recipe update-rc.d-0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-protocols-1.31-r0: task do_packagedata_setscene: Started
NOTE: recipe autoconf-archive-2022.09.03-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-protocols-1.31-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe autoconf-archive-2022.09.03-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe update-rc.d-0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 426 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_fetch)
NOTE: Running task 427 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_fetch)
NOTE: Running task 507 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_fetch)
NOTE: Running task 532 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_fetch)
NOTE: Running task 536 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.1.bb:do_fetch)
NOTE: Running task 537 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_fetch)
NOTE: Running task 538 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.40.1.bb:do_fetch)
NOTE: Running task 540 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.1.bb:do_fetch)
NOTE: Running task 726 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Started
NOTE: recipe openssl-3.0.7-r0: task do_fetch: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_fetch: Started
NOTE: recipe libffi-3.4.4-r0: task do_fetch: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_fetch: Started
NOTE: recipe sqlite3-3_3.40.1-r0: task do_fetch: Started
NOTE: Running task 803 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_fetch)
NOTE: recipe openssl-3.0.7-r0: task do_fetch: Succeeded
NOTE: recipe xz-5.4.1-r0: task do_fetch: Started
NOTE: Running task 819 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.3.bb:do_fetch)
NOTE: Running task 820 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_unpack)
NOTE: Running task 821 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtirpc-1.3.3-r0: task do_fetch: Succeeded
NOTE: Running task 831 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_unpack)
NOTE: Running task 832 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe sqlite3-3_3.40.1-r0: task do_fetch: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_fetch: Succeeded
NOTE: recipe xz-5.4.1-r0: task do_fetch: Succeeded
NOTE: Running task 841 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_unpack)
NOTE: Running task 842 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.1.bb:do_unpack)
NOTE: Running task 843 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.40.1.bb:do_unpack)
NOTE: Running task 844 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 845 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 846 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.40.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Succeeded
NOTE: Running task 862 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_unpack)
NOTE: Running task 863 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe libnsl2-2.0.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-3.11.1-r0: task do_fetch: Started
NOTE: Running task 914 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_unpack)
NOTE: Running task 928 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_fetch)
NOTE: Running task 936 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_fetch)
NOTE: Running task 937 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_fetch)
NOTE: Running task 943 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_fetch)
NOTE: Running task 946 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_fetch)
NOTE: Running task 949 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_fetch)
NOTE: Running task 961 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_fetch)
NOTE: recipe libpam-1.5.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 969 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_write_config)
NOTE: Running task 970 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_write_config)
NOTE: Running task 974 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_fetch)
NOTE: Running task 975 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_write_config)
NOTE: Running task 976 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_fetch)
NOTE: Running task 977 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_fetch)
NOTE: Running task 978 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_fetch)
NOTE: Running task 979 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_fetch)
NOTE: Running task 980 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_fetch)
NOTE: Running task 985 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_fetch)
NOTE: Running task 991 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_fetch)
NOTE: Running task 992 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_package)
NOTE: recipe expat-2.5.0-r0: task do_fetch: Started
NOTE: recipe openssl-3.0.7-r0: task do_unpack: Started
NOTE: recipe libxml2-2.10.3-r0: task do_fetch: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_unpack: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 995 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_fetch)
NOTE: recipe openssl-3.0.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe expat-2.5.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-3.11.1-r0: task do_fetch: Succeeded
NOTE: recipe sqlite3-3_3.40.1-r0: task do_unpack: Started
NOTE: recipe libffi-3.4.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 996 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_unpack)
NOTE: recipe xz-5.4.1-r0: task do_unpack: Started
NOTE: Running task 997 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.1.bb:do_unpack)
NOTE: recipe libffi-3.4.4-r0: task do_unpack: Started
NOTE: recipe xz-5.4.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sqlite3-3_3.40.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 998 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxml2-2.10.3-r0: task do_fetch: Succeeded
NOTE: Running task 1005 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.3.bb:do_unpack)
NOTE: recipe libnsl2-2.0.0-r0: task do_unpack: Started
NOTE: recipe xorgproto-2022.2-r0: task do_fetch: Started
NOTE: recipe wayland-1.21.0-r0: task do_fetch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Started
NOTE: recipe xorgproto-2022.2-r0: task do_fetch: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_fetch: Started
NOTE: Running task 1013 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_unpack)
NOTE: recipe wayland-1.21.0-r0: task do_write_config: Started
NOTE: Running task 1014 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1017 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_fetch)
NOTE: Running task 1018 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_fetch)
NOTE: Running task 1019 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_fetch)
NOTE: recipe wayland-1.21.0-r0: task do_fetch: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_fetch: Started
NOTE: Running task 1023 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_252.5.bb:do_fetch)
NOTE: Running task 1024 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_fetch)
NOTE: recipe xz-5.4.1-r0: task do_unpack: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_fetch: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_fetch: Started
NOTE: Running task 1033 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_package)
NOTE: recipe sqlite3-3_3.40.1-r0: task do_unpack: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_write_config: Started
NOTE: Running task 1034 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.1.bb:do_patch)
NOTE: recipe libpcre2-10.42-r0: task do_fetch: Started
NOTE: recipe initscripts-1.0-r155: task do_fetch: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_fetch: Started
NOTE: recipe libffi-3.4.4-r0: task do_unpack: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_fetch: Started
NOTE: Running task 1035 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.40.1.bb:do_patch)
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_write_config: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_fetch: Succeeded
NOTE: Running task 1036 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_unpack)
NOTE: recipe libtirpc-1.3.3-r0: task do_unpack: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_fetch: Succeeded
NOTE: Running task 1038 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_patch)
NOTE: Running task 1039 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_fetch)
NOTE: Running task 1040 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_unpack)
NOTE: Running task 1041 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_fetch)
NOTE: Running task 1042 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_fetch)
NOTE: Running task 1048 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_patch)
NOTE: Running task 1049 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_unpack)
NOTE: recipe libxcb-1.15-r0: task do_fetch: Started
NOTE: Running task 1050 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe xcb-proto-1.15.2-r0: task do_fetch: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_fetch: Succeeded
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_fetch: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_package: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_fetch: Started
NOTE: Running task 1057 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 1058 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.33.bb:do_package)
NOTE: recipe xtrans-1_1.4.0-r0: task do_fetch: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_fetch: Started
NOTE: recipe libpcre2-10.42-r0: task do_fetch: Succeeded
NOTE: Running task 1059 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_unpack)
NOTE: recipe base-passwd-3.6.1-r0: task do_fetch: Succeeded
NOTE: Running task 1060 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_unpack)
NOTE: Running task 1061 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_unpack)
NOTE: recipe wayland-1.21.0-r0: task do_write_config: Succeeded
NOTE: Running task 1070 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_unpack)
NOTE: recipe initscripts-1.0-r155: task do_fetch: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_fetch: Succeeded
NOTE: Running task 1071 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe xcb-proto-1.15.2-r0: task do_fetch: Succeeded
NOTE: Running task 1072 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_unpack)
NOTE: Running task 1073 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_unpack)
NOTE: recipe libpthread-stubs-0.4-r0: task do_fetch: Succeeded
NOTE: Running task 1074 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_unpack)
NOTE: Running task 1075 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_fetch: Succeeded
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_fetch: Succeeded
NOTE: Running task 1076 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_unpack)
NOTE: Running task 1077 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_unpack)
NOTE: recipe xorgproto-2022.2-r0: task do_write_config: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_fetch: Succeeded
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_write_config: Succeeded
NOTE: Running task 1078 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_unpack)
NOTE: Running task 1079 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpam-1.5.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe sqlite3-3_3.40.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe openssl-3.0.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xz-5.4.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1080 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_configure)
NOTE: recipe libnsl2-2.0.0-r0: task do_unpack: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe openssl-3.0.7-r0: task do_unpack: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Succeeded
NOTE: Running task 1081 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_patch)
NOTE: Running task 1082 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_patch)
NOTE: Running task 1083 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_patch)
NOTE: recipe xkeyboard-config-2.38-r0: task do_fetch: Started
NOTE: recipe expat-2.5.0-r0: task do_unpack: Started
NOTE: recipe expat-2.5.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1084 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_unpack)
NOTE: recipe xkeyboard-config-2.38-r0: task do_fetch: Succeeded
NOTE: recipe libxml2-2.10.3-r0: task do_unpack: Started
NOTE: recipe zstd-1.5.2-r0: task do_fetch: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_fetch: Started
NOTE: recipe xorgproto-2022.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1085 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_unpack)
NOTE: recipe xorgproto-2022.2-r0: task do_unpack: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_unpack: Started
NOTE: Running task 1086 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe xz-5.4.1-r0: task do_patch: Started
NOTE: recipe sqlite3-3_3.40.1-r0: task do_patch: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_fetch: Started
NOTE: recipe libffi-3.4.4-r0: task do_patch: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_fetch: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_fetch: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_unpack: Succeeded
NOTE: recipe wayland-1.21.0-r0: task do_unpack: Started
NOTE: recipe zlib-1.2.13-r0: task do_package: Started
NOTE: Running task 1087 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe kmod-30-r0: task do_fetch: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_fetch: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_unpack: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_fetch: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_patch: Started
NOTE: recipe python3-3.11.1-r0: task do_unpack: Started
NOTE: Running task 1088 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_patch)
NOTE: recipe libice-1_1.1.1-r0: task do_fetch: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_unpack: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_unpack: Succeeded
NOTE: Running task 1089 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_unpack)
NOTE: recipe xz-5.4.1-r0: task do_patch: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_fetch: Succeeded
NOTE: recipe zstd-1.5.2-r0: task do_fetch: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_unpack: Started
NOTE: recipe dbus-1.14.6-r0: task do_fetch: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sqlite3-3_3.40.1-r0: task do_patch: Succeeded
NOTE: Running task 1090 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1091 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.40.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1092 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_patch)
NOTE: Running task 1093 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_unpack)
NOTE: Running task 1103 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_unpack)
NOTE: recipe systemd-1_252.5-r0: task do_fetch: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe expat-2.5.0-r0: task do_unpack: Succeeded
NOTE: recipe dbus-1.14.6-r0: task do_fetch: Succeeded
NOTE: Running task 1118 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_unpack)
NOTE: recipe libtirpc-1.3.3-r0: task do_patch: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_unpack: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe initscripts-1.0-r155: task do_unpack: Started
NOTE: Running task 1119 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_unpack)
NOTE: recipe kmod-30-r0: task do_fetch: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_unpack: Started
NOTE: recipe libxcrypt-4.4.33-r0: task do_package: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1128 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_deploy_source_date_epoch)
NOTE: recipe xcb-proto-1.15.2-r0: task do_unpack: Started
NOTE: Running task 1129 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_patch)
NOTE: Running task 1130 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_unpack)
NOTE: Running task 1131 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_unpack)
NOTE: Running task 1135 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_write_config)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_unpack: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_unpack: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_unpack: Started
NOTE: Running task 1142 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_write_config)
NOTE: recipe libseccomp-2.5.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1143 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libnsl2-2.0.0-r0: task do_patch: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_unpack: Started
NOTE: recipe libpam-1.5.2-r0: task do_configure: Started
NOTE: Running task 1144 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_patch)
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_unpack: Started
NOTE: recipe openssl-3.0.7-r0: task do_patch: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_patch: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe wayland-1.21.0-r0: task do_unpack: Succeeded
NOTE: Running task 1148 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_package)
NOTE: recipe libpthread-stubs-0.4-r0: task do_unpack: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1149 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_patch)
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Started
NOTE: recipe systemd-1_252.5-r0: task do_fetch: Succeeded
NOTE: Running task 1150 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_patch)
NOTE: recipe xkeyboard-config-2.38-r0: task do_unpack: Started
NOTE: recipe xorgproto-2022.2-r0: task do_unpack: Succeeded
NOTE: Running task 1153 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_252.5.bb:do_unpack)
NOTE: recipe zstd-1.5.2-r0: task do_unpack: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_unpack: Started
NOTE: Running task 1170 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_252.5.bb:do_warn_musl)
NOTE: Running task 1171 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_252.5.bb:do_write_config)
NOTE: Running task 1172 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package)
NOTE: recipe libffi-3.4.4-r0: task do_patch: Succeeded
NOTE: recipe xz-5.4.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe sqlite3-3_3.40.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe initscripts-1.0-r155: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_unpack: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_patch: Started
NOTE: Running task 1173 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1174 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_patch)
NOTE: recipe libtirpc-1.3.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_unpack: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_unpack: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_unpack: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_unpack: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Succeeded
NOTE: Running task 1180 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_deploy_source_date_epoch)
NOTE: recipe xcb-proto-1.15.2-r0: task do_unpack: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_patch: Succeeded
NOTE: Running task 1181 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_patch)
NOTE: Running task 1182 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_patch)
NOTE: recipe expat-2.5.0-r0: task do_patch: Started
NOTE: recipe xkeyboard-config-2.38-r0: task do_write_config: Started
NOTE: Running task 1183 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_deploy_source_date_epoch)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_unpack: Succeeded
NOTE: recipe kmod-30-r0: task do_unpack: Started
NOTE: recipe zstd-1.5.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1184 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_patch)
NOTE: recipe libxcb-1.15-r0: task do_unpack: Succeeded
NOTE: recipe dbus-1.14.6-r0: task do_unpack: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_write_config: Started
NOTE: Running task 1185 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_patch)
NOTE: Running task 1186 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_patch)
NOTE: recipe xtrans-1_1.4.0-r0: task do_patch: Started
NOTE: Running task 1189 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_package)
NOTE: recipe shadow-sysroot-4.6-r3: task do_patch: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_patch: Started
NOTE: Running task 1190 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_deploy_source_date_epoch)
NOTE: recipe wayland-1.21.0-r0: task do_patch: Started
NOTE: recipe initscripts-1.0-r155: task do_unpack: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1196 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_patch)
NOTE: recipe libice-1_1.1.1-r0: task do_unpack: Succeeded
NOTE: recipe xkeyboard-config-2.38-r0: task do_write_config: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_patch: Started
NOTE: Running task 1199 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_patch)
NOTE: Running task 1202 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_package)
NOTE: recipe libxkbcommon-1.5.0-r0: task do_unpack: Succeeded
NOTE: recipe libxkbcommon-1.5.0-r0: task do_write_config: Succeeded
NOTE: recipe systemd-1_252.5-r0: task do_unpack: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_patch: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_unpack: Succeeded
NOTE: Running task 1203 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_patch)
NOTE: recipe expat-2.5.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe systemd-1_252.5-r0: task do_write_config: Started
NOTE: Running task 1204 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_package)
NOTE: recipe systemd-1_252.5-r0: task do_warn_musl: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_patch: Started
NOTE: recipe xkeyboard-config-2.38-r0: task do_unpack: Succeeded
NOTE: Running task 1205 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_patch)
NOTE: recipe flex-2.6.4-r0: task do_package: Started
NOTE: recipe bash-completion-2.11-r0: task do_package: Started
NOTE: Running task 1218 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_fetch)
NOTE: Running task 1257 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_package)
NOTE: Running task 1258 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.bb:do_package)
NOTE: recipe xcb-proto-1.15.2-r0: task do_patch: Started
NOTE: recipe systemd-1_252.5-r0: task do_warn_musl: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_patch: Succeeded
NOTE: Running task 1259 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_patch)
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_patch: Started
NOTE: recipe libxcb-1.15-r0: task do_patch: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_fetch: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_package: Started
NOTE: recipe gdbm-1.23-r0: task do_package: Started
NOTE: Running task 1261 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_generate_toolchain_file)
NOTE: Running task 1262 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_deploy_source_date_epoch)
NOTE: recipe initscripts-1.0-r155: task do_patch: Started
NOTE: recipe libice-1_1.1.1-r0: task do_patch: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_patch: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_patch: Started
NOTE: recipe xz-5.4.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe sqlite3-3_3.40.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_patch: Succeeded
NOTE: Running task 1263 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_configure)
NOTE: recipe util-macros-1_1.19.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1264 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.1.bb:do_configure)
NOTE: recipe libpcre2-10.42-r0: task do_unpack: Succeeded
NOTE: recipe wayland-1.21.0-r0: task do_patch: Succeeded
NOTE: recipe systemd-1_252.5-r0: task do_write_config: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_patch: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_patch: Succeeded
NOTE: Running task 1265 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.40.1.bb:do_configure)
NOTE: Running task 1266 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_patch)
NOTE: recipe libice-1_1.1.1-r0: task do_patch: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_patch: Succeeded
NOTE: recipe libxkbcommon-1.5.0-r0: task do_patch: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_patch: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_fetch: Succeeded
NOTE: Running task 1267 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1268 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1269 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1270 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_deploy_source_date_epoch)
NOTE: Running task 1271 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1272 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1273 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libseccomp-2.5.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1274 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1275 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_unpack)
NOTE: recipe zstd-1.5.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xkeyboard-config-2.38-r0: task do_patch: Started
NOTE: recipe initscripts-1.0-r155: task do_patch: Succeeded
NOTE: recipe dbus-1.14.6-r0: task do_unpack: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_patch: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_patch: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe openssl-3.0.7-r0: task do_patch: Succeeded
NOTE: Running task 1280 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1281 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_deploy_source_date_epoch)
NOTE: Running task 1282 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_configure)
NOTE: Running task 1283 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libx11-1_1.8.4-r0: task do_unpack: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_configure: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_unpack: Succeeded
NOTE: Running task 1284 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_deploy_source_date_epoch)
NOTE: Running task 1285 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_patch)
NOTE: Running task 1286 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_patch)
NOTE: recipe xorgproto-2022.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_patch: Succeeded
NOTE: Running task 1287 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_patch)
NOTE: recipe make-4.4-r0: task do_package: Started
NOTE: Running task 1288 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_deploy_source_date_epoch)
NOTE: recipe xkeyboard-config-2.38-r0: task do_patch: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_package: Started
NOTE: recipe xz-5.4.1-r0: task do_configure: Started
NOTE: Running task 1291 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_deploy_source_date_epoch)
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe sqlite3-3_3.40.1-r0: task do_configure: Started
NOTE: recipe libpcre2-10.42-r0: task do_patch: Started
NOTE: Running task 1296 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_configure)
NOTE: recipe libcap-ng-0.8.3-r0: task do_package: Started
NOTE: recipe wayland-1.21.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libice-1_1.1.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe initscripts-1.0-r155: task do_deploy_source_date_epoch: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_unpack: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxml2-2.10.3-r0: task do_unpack: Succeeded
NOTE: recipe libxkbcommon-1.5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1307 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.3.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 1315 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_package)
NOTE: recipe libffi-3.4.4-r0: task do_configure: Started
NOTE: recipe zstd-1.5.2-r0: task do_unpack: Succeeded
NOTE: Running task 1317 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_patch)
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe openssl-3.0.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcb-1.15-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_patch: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_patch: Started
NOTE: recipe libpcre2-10.42-r0: task do_patch: Succeeded
NOTE: Running task 1325 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-locale_2.37.bb:do_package)
NOTE: recipe xcb-proto-1.15.2-r0: task do_patch: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe dbus-1.14.6-r0: task do_patch: Started
NOTE: Running task 1326 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_deploy_source_date_epoch)
NOTE: Running task 1327 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1329 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 1330 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe kmod-30-r0: task do_unpack: Succeeded
NOTE: recipe xkeyboard-config-2.38-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_patch: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_configure: Started
NOTE: recipe expat-2.5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1331 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_patch)
NOTE: Running task 1332 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1333 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_configure)
NOTE: recipe zstd-1.5.2-r0: task do_patch: Started
NOTE: recipe libxml2-2.10.3-r0: task do_patch: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_unpack: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1334 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_patch)
NOTE: recipe wayland-1.21.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1335 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_configure)
NOTE: recipe initscripts-1.0-r155: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libx11-1_1.8.4-r0: task do_patch: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_patch: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe zstd-1.5.2-r0: task do_patch: Succeeded
NOTE: recipe dbus-1.14.6-r0: task do_patch: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1336 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libice-1_1.1.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1337 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_configure)
NOTE: Running task 1338 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1339 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1340 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_deploy_source_date_epoch)
NOTE: recipe libxkbcommon-1.5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1341 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_populate_lic)
NOTE: recipe kmod-30-r0: task do_patch: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe openssl-3.0.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_configure: Started
NOTE: recipe libxcb-1.15-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1342 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_configure)
NOTE: Running task 1343 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_configure)
NOTE: recipe xorgproto-2022.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1344 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_configure)
NOTE: recipe xkeyboard-config-2.38-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_configure: Started
NOTE: recipe zstd-1.5.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe initscripts-1.0-r155: task do_configure: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_patch: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe dbus-1.14.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe kmod-30-r0: task do_patch: Succeeded
NOTE: recipe dbus-1.14.6-r0: task do_populate_lic: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_unpack: Succeeded
NOTE: Running task 1345 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_deploy_source_date_epoch)
NOTE: recipe libpthread-stubs-0.4-r0: task do_configure: Started
NOTE: Running task 1346 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_patch)
NOTE: recipe openssl-3.0.7-r0: task do_configure: Started
NOTE: recipe xorgproto-2022.2-r0: task do_configure: Started
NOTE: recipe libpcre2-10.42-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_configure: Succeeded
NOTE: recipe libxml2-2.10.3-r0: task do_patch: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1347 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1348 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_configure)
NOTE: Running task 1349 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_configure)
NOTE: Running task 1350 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_compile)
NOTE: recipe gmp-6.2.1-r0: task do_package: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe zstd-1.5.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe kmod-30-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe dbus-1.14.6-r0: task do_populate_lic: Succeeded
NOTE: Running task 1351 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_configure)
NOTE: recipe libx11-1_1.8.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_populate_lic unihash changed to c42e125fb5e65f091cff4c5a9180972d9c08c6b0fcbec6c44d5df55dcc16450b
NOTE: Running task 1352 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_configure)
NOTE: recipe initscripts-1.0-r155: task do_compile: Started
NOTE: recipe dbus-1.14.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxml2-2.10.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: recipe glibc-locale-2.37-r0: task do_package: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_configure: Started
NOTE: recipe initscripts-1.0-r155: task do_compile: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_configure: Started
NOTE: Running task 1353 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_install)
NOTE: recipe zstd-1.5.2-r0: task do_configure: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_patch: Succeeded
NOTE: Running task 1354 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_deploy_source_date_epoch)
NOTE: recipe base-passwd-3.6.1-r0: task do_configure: Started
NOTE: recipe kmod-30-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe zstd-1.5.2-r0: task do_configure: Succeeded
NOTE: Running task 1355 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_compile)
NOTE: recipe libxml2-2.10.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe initscripts-1.0-r155: task do_install: Started
NOTE: recipe systemd-1_252.5-r0: task do_unpack: Succeeded
NOTE: Running task 1356 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_252.5.bb:do_patch)
NOTE: recipe zstd-1.5.2-r0: task do_compile: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe systemd-1_252.5-r0: task do_patch: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_package unihash changed to ab86d7541778f33882a1d4cf050c35a9d608e9af19e349a8dbf07c7cb6518efb
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata became valid
NOTE: Running setscene task 463 of 463 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: recipe python3-3.11.1-r0: task do_unpack: Succeeded
NOTE: Running task 1357 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.1.bb:do_patch)
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_patch: Succeeded
NOTE: Running task 1358 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_deploy_source_date_epoch)
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.1-r0: task do_patch: Started
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcrypt-4.4.33-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.33.bb:do_package unihash changed to 2a58af1219ffe5fe005e20194cd6707a992ca443b464721e0d74d5e61971b94d
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.33.bb:do_packagedata became valid
NOTE: recipe zlib-1.2.13-r0: task do_package: Succeeded
NOTE: Running setscene task 460 of 463 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.33.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_package unihash changed to 88564ad46317953b4fffc88fef495a48b28bf56b352ed326f77471b98079df9c
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata became valid
NOTE: Running setscene task 463 of 463 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata_setscene)
NOTE: Running task 1360 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_package)
NOTE: Running task 1361 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_package)
NOTE: Running task 1362 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_package)
NOTE: recipe libxcrypt-4.4.33-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_package: Started
NOTE: recipe sed-4.9-r0: task do_package: Started
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_package: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1364 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_package)
NOTE: recipe libxcrypt-4.4.33-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_package unihash changed to 5c44ab803c798b41eedc46b399cffc1cf0bd6da3a4879556bb91097682a6bfbd
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata became valid
NOTE: Running setscene task 463 of 463 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: recipe cracklib-2.9.8-r0: task do_package: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-1_252.5-r0: task do_patch: Succeeded
NOTE: Running task 1366 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_252.5.bb:do_deploy_source_date_epoch)
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_package unihash changed to 9df3845a07b9813879f153fc2e794d13e085f34eca4004a6f4af9e0dcd618cb6
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_packagedata became valid
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_configure: Succeeded
NOTE: Running setscene task 463 of 463 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_packagedata_setscene)
NOTE: Running task 1367 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_compile)
NOTE: recipe systemd-1_252.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2022.2-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 1369 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe libcap-ng-0.8.3-r0: task do_package: Succeeded
NOTE: recipe systemd-1_252.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_package unihash changed to 557517b3a2d9fa75cb95cd53dd466fbac8c0e00bcf4edcc5ac0a0f74fb442801
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_packagedata became valid
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 463 of 463 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2022.2-r0: task do_compile: Succeeded
NOTE: Running task 1371 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_install)
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 3263d406b861519abafcb566ea589932eb9a2e7bc2c259532ce6d560ec9d798e
NOTE: Setscene tasks completed
NOTE: recipe xorgproto-2022.2-r0: task do_install: Started
NOTE: recipe expat-2.5.0-r0: task do_configure: Succeeded
NOTE: Running task 1373 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_configure_ptest_base)
NOTE: recipe expat-2.5.0-r0: task do_configure_ptest_base: Started
NOTE: recipe expat-2.5.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1374 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_compile)
NOTE: recipe initscripts-1.0-r155: task do_install: Succeeded
NOTE: Running task 1375 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot)
NOTE: Running task 1376 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_package)
NOTE: recipe expat-2.5.0-r0: task do_compile: Started
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot: Started
NOTE: recipe initscripts-1.0-r155: task do_package: Started
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_configure: Succeeded
NOTE: Running task 1377 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_compile)
NOTE: recipe xorgproto-2022.2-r0: task do_install: Succeeded
NOTE: Running task 1378 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_populate_sysroot)
NOTE: Running task 1379 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_package)
NOTE: recipe make-4.4-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.bb:do_package unihash changed to e6c04464d6435e3381ece1672cc6476b5174b6c0c51c6fae74625a7e8e31139c
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.bb:do_packagedata became valid
NOTE: recipe gmp-6.2.1-r0: task do_package: Succeeded
NOTE: Running setscene task 463 of 463 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.bb:do_packagedata_setscene)
NOTE: recipe util-macros-1_1.19.3-r0: task do_compile: Started
NOTE: recipe python3-3.11.1-r0: task do_patch: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_populate_sysroot: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_package unihash changed to e4c1c07cee732baa52c32266068c2707e8e8716bd87b7506652528f0f66f8b62
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata became valid
NOTE: Running setscene task 463 of 463 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: Running task 1380 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.1.bb:do_deploy_source_date_epoch)
NOTE: recipe util-macros-1_1.19.3-r0: task do_compile: Succeeded
NOTE: Running task 1381 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_install)
NOTE: recipe xorgproto-2022.2-r0: task do_package: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_configure: Succeeded
NOTE: recipe make-4.4-r0: task do_packagedata_setscene: Started
NOTE: Running task 1382 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_compile)
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_install: Started
NOTE: recipe python3-3.11.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_compile: Started
NOTE: recipe gdbm-1.23-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_package unihash changed to a2d9cb522f92e1d4f93390759440cbc06a242a7d85ce1fd65c846f3ed98e078a
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata became valid
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 459 of 463 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: recipe xcb-proto-1.15.2-r0: task do_compile: Succeeded
NOTE: Running task 1384 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_install)
NOTE: recipe python3-3.11.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_install: Succeeded
NOTE: recipe make-4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1385 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_populate_sysroot)
NOTE: Running task 1386 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_package)
NOTE: Running task 1388 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.bb:do_package_write_rpm)
NOTE: recipe xcb-proto-1.15.2-r0: task do_install: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_package: Started
NOTE: recipe make-4.4-r0: task do_package_write_rpm: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1390 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_package)
NOTE: recipe attr-2.5.1-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_package unihash changed to d25b8755420f13d306cbe1b7d6bb55c22e17772eb2be3f06b75e2d7110e27d15
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata became valid
NOTE: recipe base-passwd-3.6.1-r0: task do_configure: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_package: Succeeded
NOTE: Running setscene task 459 of 463 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: Running task 1391 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_compile)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package unihash changed to c075c3f6fea61ed8cfae55666e1b9ad86f12c9e897ae7d535bf8a4ea8fe63f08
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata became valid
NOTE: Running setscene task 463 of 463 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: recipe base-passwd-3.6.1-r0: task do_compile: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe perl-5.36.0-r0: task do_package: Started
NOTE: Running task 1392 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1393 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1394 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1395 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_prepare_recipe_sysroot)
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_configure: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1396 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_compile)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xkeyboard-config-2.38-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1398 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_package)
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libpthread-stubs-0.4-r0: task do_compile: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_install: Succeeded
NOTE: Running task 1400 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_populate_sysroot)
NOTE: Running task 1401 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_package)
NOTE: recipe libpthread-stubs-0.4-r0: task do_compile: Succeeded
NOTE: Running task 1402 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_install)
NOTE: recipe xtrans-1_1.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_package: Started
NOTE: Running task 1403 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_configure)
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_package: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1404 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_configure)
NOTE: recipe libpthread-stubs-0.4-r0: task do_install: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_configure: Started
NOTE: Running task 1405 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_configure)
NOTE: recipe base-passwd-3.6.1-r0: task do_compile: Succeeded
NOTE: Running task 1406 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_install)
NOTE: recipe libxau-1_1.0.11-r0: task do_configure: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_configure: Started
NOTE: recipe xorgproto-2022.2-r0: task do_package: Succeeded
NOTE: recipe xkeyboard-config-2.38-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1407 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_configure)
NOTE: recipe libpthread-stubs-0.4-r0: task do_install: Succeeded
NOTE: Running task 1408 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_packagedata)
NOTE: Running task 1409 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot)
NOTE: Running task 1410 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_package)
NOTE: recipe base-passwd-3.6.1-r0: task do_install: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot: Started
NOTE: recipe xorgproto-2022.2-r0: task do_packagedata: Started
NOTE: recipe cracklib-2.9.8-r0: task do_package: Succeeded
NOTE: recipe xkeyboard-config-2.38-r0: task do_configure: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_package: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_package unihash changed to afb0838a67403f6e8f6da647c3180e8ce84d479dd730af824a8938626252d9b6
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_packagedata became valid
NOTE: Running setscene task 450 of 463 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_packagedata_setscene)
NOTE: recipe initscripts-1.0-r155: task do_package: Succeeded
NOTE: Running task 1411 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata)
NOTE: recipe cracklib-2.9.8-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_install: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_packagedata: Started
NOTE: Running task 1412 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_populate_sysroot)
NOTE: recipe xorgproto-2022.2-r0: task do_packagedata: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_packagedata: Succeeded
NOTE: recipe cracklib-2.9.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe util-macros-1_1.19.3-r0: task do_package: Succeeded
NOTE: Running task 1414 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_packagedata)
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1415 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata: Started
NOTE: Running task 1416 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_package)
NOTE: recipe xcb-proto-1.15.2-r0: task do_package: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1417 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_packagedata)
NOTE: recipe base-passwd-3.6.1-r0: task do_package: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1418 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_configure)
NOTE: recipe shadow-sysroot-4.6-r3: task do_configure: Started
NOTE: recipe bzip2-1.0.8-r0: task do_configure: Succeeded
NOTE: Running task 1419 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_configure_ptest_base)
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_configure: Succeeded
NOTE: Running task 1420 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_compile)
NOTE: recipe bzip2-1.0.8-r0: task do_configure_ptest_base: Started
NOTE: recipe xkeyboard-config-2.38-r0: task do_configure: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_compile: Started
NOTE: Running task 1421 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_compile)
NOTE: recipe bzip2-1.0.8-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1422 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_compile)
NOTE: recipe shadow-sysroot-4.6-r3: task do_compile: Succeeded
NOTE: Running task 1423 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_install)
NOTE: recipe sed-4.9-r0: task do_package: Succeeded
NOTE: recipe xkeyboard-config-2.38-r0: task do_compile: Started
NOTE: recipe make-4.4-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_package unihash changed to efd8fc98e1b87544474b81b4742108c7f44795fb1c1ea1d8522c9e2ac1cccd5e
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata became valid
NOTE: Running setscene task 463 of 463 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_compile: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_install: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_package: Succeeded
NOTE: Running task 1424 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata)
NOTE: recipe shadow-sysroot-4.6-r3: task do_install: Succeeded
NOTE: Running task 1425 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot)
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot: Started
NOTE: recipe expat-2.5.0-r0: task do_compile: Succeeded
NOTE: Running task 1426 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_compile_ptest_base)
NOTE: recipe flex-2.6.4-r0: task do_package: Succeeded
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_package unihash changed to ecdf5db158202932e3f0e71d99c8d6d7a9906af8e0682ddce2f19549e10eaba8
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata became valid
NOTE: Running setscene task 447 of 463 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: recipe expat-2.5.0-r0: task do_compile_ptest_base: Started
NOTE: recipe xkeyboard-config-2.38-r0: task do_compile: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata: Succeeded
NOTE: Running task 1428 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_install)
NOTE: recipe expat-2.5.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1429 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_install)
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.38-r0: task do_install: Started
NOTE: recipe sqlite3-3_3.40.1-r0: task do_configure: Succeeded
NOTE: Running task 1430 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.40.1.bb:do_compile)
NOTE: recipe expat-2.5.0-r0: task do_install: Started
NOTE: recipe sqlite3-3_3.40.1-r0: task do_compile: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe expat-2.5.0-r0: task do_install: Succeeded
NOTE: Running task 1432 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_install_ptest_base)
NOTE: recipe expat-2.5.0-r0: task do_install_ptest_base: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_package: Succeeded
NOTE: Running task 1433 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_packagedata)
NOTE: recipe acl-2.3.1-r0: task do_package: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1434 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_populate_sysroot)
NOTE: Running task 1435 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_package)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_package unihash changed to 45309f3e454b6639c4c7ad3824949bd566cf2e2281e6cde5f7ccaab09a90b87a
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata became valid
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata: Started
NOTE: Running setscene task 459 of 463 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot: Started
NOTE: recipe expat-2.5.0-r0: task do_package: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xkeyboard-config-2.38-r0: task do_install: Succeeded
NOTE: Running task 1437 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_populate_sysroot)
NOTE: Running task 1438 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_package)
NOTE: recipe bzip2-1.0.8-r0: task do_compile: Succeeded
NOTE: recipe xkeyboard-config-2.38-r0: task do_populate_sysroot: Started
NOTE: Running task 1439 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_compile_ptest_base)
NOTE: recipe xkeyboard-config-2.38-r0: task do_package: Started
NOTE: recipe bzip2-1.0.8-r0: task do_compile_ptest_base: Started
NOTE: recipe bzip2-1.0.8-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1440 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_install)
NOTE: recipe bzip2-1.0.8-r0: task do_install: Started
NOTE: recipe xkeyboard-config-2.38-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_configure: Succeeded
NOTE: Running task 1441 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_compile)
NOTE: recipe bzip2-1.0.8-r0: task do_install: Succeeded
NOTE: Running task 1442 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_install_ptest_base)
NOTE: recipe libtirpc-1.3.3-r0: task do_compile: Started
NOTE: recipe bzip2-1.0.8-r0: task do_install_ptest_base: Started
NOTE: recipe expat-2.5.0-r0: task do_package: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1443 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_packagedata)
NOTE: Running task 1444 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot)
NOTE: Running task 1445 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package)
NOTE: recipe expat-2.5.0-r0: task do_packagedata: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot: Started
NOTE: recipe bzip2-1.0.8-r0: task do_package: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_configure: Succeeded
NOTE: Running task 1446 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_configure_ptest_base)
NOTE: recipe libseccomp-2.5.4-r0: task do_configure_ptest_base: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1447 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_compile)
NOTE: recipe libtirpc-1.3.3-r0: task do_compile: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1448 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_install)
NOTE: Running task 1449 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_prepare_recipe_sysroot)
NOTE: recipe libseccomp-2.5.4-r0: task do_compile: Started
NOTE: recipe libpcre2-10.42-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_install: Started
NOTE: recipe libpcre2-10.42-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1450 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_configure)
NOTE: recipe xtrans-1_1.4.0-r0: task do_configure: Succeeded
NOTE: Running task 1451 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_compile)
NOTE: recipe libpcre2-10.42-r0: task do_configure: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_compile: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_compile: Succeeded
NOTE: Running task 1452 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_install)
NOTE: recipe libtirpc-1.3.3-r0: task do_install: Succeeded
NOTE: Running task 1453 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot)
NOTE: Running task 1454 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_package)
NOTE: recipe xtrans-1_1.4.0-r0: task do_install: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot: Started
NOTE: recipe libffi-3.4.4-r0: task do_configure: Succeeded
NOTE: Running task 1455 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_compile)
NOTE: recipe libtirpc-1.3.3-r0: task do_package: Started
NOTE: recipe libffi-3.4.4-r0: task do_compile: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_install: Succeeded
NOTE: Running task 1456 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_populate_sysroot)
NOTE: Running task 1457 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_package)
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_package: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1458 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe libnsl2-2.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1459 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_configure)
NOTE: recipe openssl-3.0.7-r0: task do_configure: Succeeded
NOTE: Running task 1460 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_configure_ptest_base)
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1461 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libnsl2-2.0.0-r0: task do_configure: Started
NOTE: recipe openssl-3.0.7-r0: task do_configure_ptest_base: Started
NOTE: recipe libice-1_1.1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe openssl-3.0.7-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1462 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_compile)
NOTE: recipe openssl-3.0.7-r0: task do_compile: Started
NOTE: recipe libice-1_1.1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1463 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_configure)
NOTE: recipe libffi-3.4.4-r0: task do_compile: Succeeded
NOTE: Running task 1464 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_install)
NOTE: recipe libice-1_1.1.1-r0: task do_configure: Started
NOTE: recipe libffi-3.4.4-r0: task do_install: Started
NOTE: recipe xkeyboard-config-2.38-r0: task do_package: Succeeded
NOTE: Running task 1465 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_packagedata)
NOTE: recipe xkeyboard-config-2.38-r0: task do_packagedata: Started
NOTE: recipe xkeyboard-config-2.38-r0: task do_packagedata: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_package: Succeeded
NOTE: Running task 1466 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata)
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata: Started
NOTE: recipe libffi-3.4.4-r0: task do_install: Succeeded
NOTE: Running task 1467 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot)
NOTE: Running task 1468 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_package)
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot: Started
NOTE: recipe libffi-3.4.4-r0: task do_package: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_package: Succeeded
NOTE: Running task 1469 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata)
NOTE: recipe libtirpc-1.3.3-r0: task do_package: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata: Started
NOTE: Running task 1470 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata)
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_compile: Succeeded
NOTE: Running task 1471 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_compile_ptest_base)
NOTE: recipe libseccomp-2.5.4-r0: task do_compile_ptest_base: Started
NOTE: recipe ncurses-6.4-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_package unihash changed to 7fb4b968341224377058a53cb30cec2cda85e90839f0b675d14b7677b16425d6
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata became valid
NOTE: Running setscene task 463 of 463 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1473 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_package)
NOTE: Running task 1474 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_package)
NOTE: Running task 1475 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.6.bb:do_package)
NOTE: recipe psmisc-23.6-r0: task do_package: Started
NOTE: recipe readline-8.2-r0: task do_package: Started
NOTE: recipe bash-5.2.15-r0: task do_package: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1476 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_install)
NOTE: recipe libffi-3.4.4-r0: task do_package: Succeeded
NOTE: Running task 1477 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata)
NOTE: recipe libseccomp-2.5.4-r0: task do_install: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata: Succeeded
NOTE: recipe zstd-1.5.2-r0: task do_compile: Succeeded
NOTE: Running task 1478 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_install)
NOTE: recipe libseccomp-2.5.4-r0: task do_install: Succeeded
NOTE: Running task 1479 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_install_ptest_base)
NOTE: recipe zstd-1.5.2-r0: task do_install: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_install_ptest_base: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_configure: Succeeded
NOTE: Running task 1480 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_compile)
NOTE: recipe libxau-1_1.0.11-r0: task do_compile: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_configure: Succeeded
NOTE: Running task 1481 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_compile)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_compile: Started
NOTE: recipe readline-8.2-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_package unihash changed to 2e930a292ede62050315b60e3abec83e2871449a062baa6469f2b9c1ad0c69b0
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_packagedata became valid
NOTE: Running setscene task 459 of 463 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_packagedata_setscene)
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_compile: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_compile: Succeeded
NOTE: Running task 1483 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_install)
NOTE: Running task 1484 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_install)
NOTE: recipe libxau-1_1.0.11-r0: task do_install: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_install: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_install: Succeeded
NOTE: Running task 1485 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_populate_sysroot)
NOTE: Running task 1486 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_package)
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_package: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_install: Succeeded
NOTE: Running task 1487 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_populate_sysroot)
NOTE: Running task 1488 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_package)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot: Started
NOTE: recipe xz-5.4.1-r0: task do_configure: Succeeded
NOTE: Running task 1489 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.1.bb:do_compile)
NOTE: recipe libseccomp-2.5.4-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1490 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_populate_sysroot)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_package: Started
NOTE: Running task 1491 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_package)
NOTE: recipe xz-5.4.1-r0: task do_compile: Started
NOTE: recipe psmisc-23.6-r0: task do_package: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_populate_sysroot: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.6.bb:do_package unihash changed to 46f325064f6d18567508bc3ec2e42cb10b4a5e0742da6f6ecf5c7f2c64ba087f
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.6.bb:do_packagedata became valid
NOTE: Running setscene task 463 of 463 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.6.bb:do_packagedata_setscene)
NOTE: recipe libseccomp-2.5.4-r0: task do_package: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot: Succeeded
NOTE: recipe psmisc-23.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1492 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxcb-1.15-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe psmisc-23.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1494 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_package_write_rpm)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_package_write_rpm: Started
NOTE: recipe libxcb-1.15-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1495 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_configure)
NOTE: recipe libxcb-1.15-r0: task do_configure: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_package_write_rpm unihash changed to 3a0efb82e9d2bf346b713abb6c90ab33631f9f60516c4619b4d397cb6f2dc73b
NOTE: recipe libxau-1_1.0.11-r0: task do_package: Succeeded
NOTE: Running task 1496 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_packagedata)
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_package: Succeeded
NOTE: Running task 1497 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_packagedata)
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_configure: Succeeded
NOTE: Running task 1498 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_compile)
NOTE: recipe libnsl2-2.0.0-r0: task do_compile: Started
NOTE: recipe xz-5.4.1-r0: task do_compile: Succeeded
NOTE: Running task 1499 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.1.bb:do_install)
NOTE: recipe libpcre2-10.42-r0: task do_configure: Succeeded
NOTE: Running task 1500 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_compile)
NOTE: recipe xz-5.4.1-r0: task do_install: Started
NOTE: recipe libpcre2-10.42-r0: task do_compile: Started
NOTE: recipe bash-5.2.15-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_package unihash changed to 6f26f39ff9833c7f01ae0c90dd72daa5b035e6786969a821d3968b1e008bca00
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_packagedata became valid
NOTE: Running setscene task 463 of 463 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_packagedata_setscene)
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_compile: Succeeded
NOTE: Running task 1501 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_install)
NOTE: recipe libnsl2-2.0.0-r0: task do_install: Started
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libpam-1.5.2-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1503 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_configure_ptest_base)
NOTE: recipe libpam-1.5.2-r0: task do_configure_ptest_base: Started
NOTE: recipe libpam-1.5.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1504 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_compile)
NOTE: recipe libnsl2-2.0.0-r0: task do_install: Succeeded
NOTE: Running task 1505 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot)
NOTE: Running task 1506 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_package)
NOTE: recipe libpam-1.5.2-r0: task do_compile: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_package: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_configure: Succeeded
NOTE: Running task 1507 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_compile)
NOTE: recipe libice-1_1.1.1-r0: task do_compile: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_package: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_compile: Succeeded
NOTE: Running task 1508 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata)
NOTE: Running task 1509 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_install)
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata: Started
NOTE: recipe libice-1_1.1.1-r0: task do_install: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_package: Succeeded
NOTE: Running task 1510 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_packagedata)
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_packagedata: Started
NOTE: recipe libice-1_1.1.1-r0: task do_install: Succeeded
NOTE: Running task 1511 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_populate_sysroot)
NOTE: Running task 1512 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_package)
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot: Started
NOTE: recipe libice-1_1.1.1-r0: task do_package: Started
NOTE: recipe xz-5.4.1-r0: task do_install: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_packagedata: Succeeded
NOTE: Running task 1513 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.1.bb:do_populate_sysroot)
NOTE: Running task 1514 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.1.bb:do_package)
NOTE: recipe xz-5.4.1-r0: task do_populate_sysroot: Started
NOTE: recipe xz-5.4.1-r0: task do_package: Started
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1515 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsm-1_1.2.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xz-5.4.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1516 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_configure)
NOTE: recipe libsm-1_1.2.4-r0: task do_configure: Started
NOTE: recipe zstd-1.5.2-r0: task do_install: Succeeded
NOTE: Running task 1517 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_populate_sysroot)
NOTE: Running task 1518 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_package)
NOTE: recipe zstd-1.5.2-r0: task do_populate_sysroot: Started
NOTE: recipe zstd-1.5.2-r0: task do_package: Started
NOTE: recipe zstd-1.5.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_package: Succeeded
NOTE: Running task 1519 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_packagedata)
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata: Started
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata: Succeeded
NOTE: recipe openssl-3.0.7-r0: task do_compile: Succeeded
NOTE: Running task 1520 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_compile_ptest_base)
NOTE: recipe openssl-3.0.7-r0: task do_compile_ptest_base: Started
NOTE: recipe openssl-3.0.7-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1521 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_install)
NOTE: recipe openssl-3.0.7-r0: task do_install: Started
NOTE: recipe zstd-1.5.2-r0: task do_package: Succeeded
NOTE: recipe xz-5.4.1-r0: task do_package: Succeeded
NOTE: Running task 1522 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_packagedata)
NOTE: Running task 1523 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.1.bb:do_packagedata)
NOTE: recipe zstd-1.5.2-r0: task do_packagedata: Started
NOTE: recipe xz-5.4.1-r0: task do_packagedata: Started
NOTE: recipe zstd-1.5.2-r0: task do_packagedata: Succeeded
NOTE: recipe xz-5.4.1-r0: task do_packagedata: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_compile: Succeeded
NOTE: Running task 1524 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_install)
NOTE: recipe libpcre2-10.42-r0: task do_install: Started
NOTE: recipe libpcre2-10.42-r0: task do_install: Succeeded
NOTE: Running task 1525 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_populate_sysroot)
NOTE: Running task 1526 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_package)
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot: Started
NOTE: recipe libpcre2-10.42-r0: task do_package: Started
NOTE: recipe libxcb-1.15-r0: task do_configure: Succeeded
NOTE: Running task 1527 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_compile)
NOTE: recipe libxcb-1.15-r0: task do_compile: Started
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_package: Succeeded
NOTE: Running task 1528 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_packagedata)
NOTE: recipe libpcre2-10.42-r0: task do_packagedata: Started
NOTE: recipe libpcre2-10.42-r0: task do_packagedata: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_compile: Succeeded
NOTE: Running task 1529 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_install)
NOTE: recipe libxcb-1.15-r0: task do_install: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_configure: Succeeded
NOTE: Running task 1530 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_compile)
NOTE: recipe libsm-1_1.2.4-r0: task do_compile: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_compile: Succeeded
NOTE: Running task 1531 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_install)
NOTE: recipe libsm-1_1.2.4-r0: task do_install: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_install: Succeeded
NOTE: Running task 1532 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_populate_sysroot)
NOTE: Running task 1533 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_package)
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_package: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_install: Succeeded
NOTE: Running task 1534 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_populate_sysroot)
NOTE: Running task 1535 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_package)
NOTE: recipe libsm-1_1.2.4-r0: task do_package: Succeeded
NOTE: Running task 1536 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_packagedata)
NOTE: recipe libxcb-1.15-r0: task do_package: Started
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1537 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libx11-1_1.8.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1538 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_configure)
NOTE: recipe libx11-1_1.8.4-r0: task do_configure: Started
NOTE: recipe libpam-1.5.2-r0: task do_compile: Succeeded
NOTE: Running task 1539 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_compile_ptest_base)
NOTE: recipe libpam-1.5.2-r0: task do_compile_ptest_base: Started
NOTE: recipe libpam-1.5.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1540 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_install)
NOTE: recipe libpam-1.5.2-r0: task do_install: Started
NOTE: recipe libxcb-1.15-r0: task do_package: Succeeded
NOTE: Running task 1541 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_packagedata)
NOTE: recipe libxcb-1.15-r0: task do_packagedata: Started
NOTE: recipe libxcb-1.15-r0: task do_packagedata: Succeeded
NOTE: recipe sqlite3-3_3.40.1-r0: task do_compile: Succeeded
NOTE: Running task 1542 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.40.1.bb:do_install)
NOTE: recipe sqlite3-3_3.40.1-r0: task do_install: Started
NOTE: recipe sqlite3-3_3.40.1-r0: task do_install: Succeeded
NOTE: Running task 1543 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.40.1.bb:do_populate_sysroot)
NOTE: Running task 1544 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.40.1.bb:do_package)
NOTE: recipe libpam-1.5.2-r0: task do_install: Succeeded
NOTE: Running task 1545 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_install_ptest_base)
NOTE: recipe sqlite3-3_3.40.1-r0: task do_populate_sysroot: Started
NOTE: recipe sqlite3-3_3.40.1-r0: task do_package: Started
NOTE: recipe libpam-1.5.2-r0: task do_install_ptest_base: Started
NOTE: recipe libpam-1.5.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1546 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_populate_sysroot)
NOTE: Running task 1547 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_package)
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot: Started
NOTE: recipe libpam-1.5.2-r0: task do_package: Started
NOTE: recipe sqlite3-3_3.40.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_populate_sysroot unihash changed to 4acf267fb1aceb37aad31ccaa7b4cc7734aab65c7910315cfef62ac552d86ced
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.66.bb:do_populate_sysroot became valid
NOTE: Running setscene task 463 of 463 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.66.bb:do_populate_sysroot_setscene)
NOTE: Running task 1555 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_populate_sysroot)
NOTE: Running task 1560 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_populate_sysroot)
NOTE: recipe libcap-2.66-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot: Started
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot: Started
NOTE: recipe libcap-2.66-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1573 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sqlite3-3_3.40.1-r0: task do_package: Succeeded
NOTE: Running task 1574 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.40.1.bb:do_packagedata)
NOTE: recipe sqlite3-3_3.40.1-r0: task do_packagedata: Started
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1575 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_configure)
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_configure: Started
NOTE: recipe sqlite3-3_3.40.1-r0: task do_packagedata: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_package unihash changed to 4e06187703cb9f456068d954ad9ab26bad88dac3803dc1eab1cba91e1f0de62e
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata became valid
NOTE: Running setscene task 463 of 463 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1577 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_package)
NOTE: Running task 1578 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_package)
NOTE: Running task 1579 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.66.bb:do_package)
NOTE: recipe libcap-2.66-r0: task do_package: Started
NOTE: recipe shadow-4.13-r0: task do_package: Started
NOTE: recipe util-linux-2.38.1-r0: task do_package: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_configure: Succeeded
NOTE: Running task 1580 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_compile)
NOTE: recipe libx11-1_1.8.4-r0: task do_compile: Started
NOTE: recipe libcap-2.66-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.66.bb:do_package unihash changed to 389cdf73f3094ab94060334089249f4c2d82f2700488c38d085c06b40b7a035f
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.66.bb:do_packagedata became valid
NOTE: Running setscene task 463 of 463 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.66.bb:do_packagedata_setscene)
NOTE: recipe libcap-2.66-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.66-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1582 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_package)
NOTE: recipe coreutils-9.1-r0: task do_package: Started
NOTE: recipe shadow-4.13-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_package unihash changed to 6c10db8a2bb880fdbf73cb19d8b77a626ff095b84cc226dc67fe9f4db257f752
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_packagedata became valid
NOTE: Running setscene task 463 of 463 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libx11-1_1.8.4-r0: task do_compile: Succeeded
NOTE: Running task 1584 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_install)
NOTE: recipe openssl-3.0.7-r0: task do_install: Succeeded
NOTE: Running task 1585 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_install_ptest_base)
NOTE: recipe libx11-1_1.8.4-r0: task do_install: Started
NOTE: recipe openssl-3.0.7-r0: task do_install_ptest_base: Started
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1586 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_configure_ptest_base)
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_configure_ptest_base: Started
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1587 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_compile)
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_compile: Started
NOTE: recipe perl-5.36.0-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_package unihash changed to c13165d6f71ac0950845ca48dade6106fa9319aace5f78997528a1d3e33db0b7
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_packagedata became valid
NOTE: Running setscene task 463 of 463 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_packagedata_setscene)
NOTE: recipe perl-5.36.0-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.0.7-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1588 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_populate_sysroot)
NOTE: Running task 1589 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_package)
NOTE: recipe openssl-3.0.7-r0: task do_populate_sysroot: Started
NOTE: recipe openssl-3.0.7-r0: task do_package: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_install: Succeeded
NOTE: Running task 1590 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_populate_sysroot)
NOTE: Running task 1591 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_package)
NOTE: recipe libx11-1_1.8.4-r0: task do_populate_sysroot: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_package: Started
NOTE: recipe openssl-3.0.7-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1592 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1593 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_prepare_recipe_sysroot)
NOTE: recipe kmod-30-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-3.11.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe kmod-30-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1594 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_configure)
NOTE: recipe python3-3.11.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1595 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.1.bb:do_configure)
NOTE: recipe kmod-30-r0: task do_configure: Started
NOTE: recipe python3-3.11.1-r0: task do_configure: Started
NOTE: recipe perl-5.36.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libx11-1_1.8.4-r0: task do_package: Succeeded
NOTE: Running task 1597 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_packagedata)
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_compile: Succeeded
NOTE: Running task 1598 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_compile_ptest_base)
NOTE: recipe libx11-1_1.8.4-r0: task do_packagedata: Started
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_compile_ptest_base: Started
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1599 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_install)
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_install: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_packagedata: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_package unihash changed to d619fb19ea09b148d27cf72cbd3461352a18f91f760597c34d218f3bd65fbbea
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_packagedata became valid
NOTE: Running setscene task 458 of 463 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_packagedata_setscene)
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_install: Succeeded
NOTE: Running task 1600 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_install_ptest_base)
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_install_ptest_base: Started
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1602 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_populate_sysroot)
NOTE: Running task 1603 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_package)
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_populate_sysroot: Started
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_package: Started
NOTE: recipe coreutils-9.1-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_package unihash changed to 1ba221bfd09a5f64cb5837731e7078ed2d387215172446eeee5f86a8087f907b
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_packagedata became valid
NOTE: Running setscene task 463 of 463 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_packagedata_setscene)
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe kmod-30-r0: task do_configure: Succeeded
NOTE: Running task 1605 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_compile)
NOTE: recipe kmod-30-r0: task do_compile: Started
NOTE: recipe kmod-30-r0: task do_compile: Succeeded
NOTE: Running task 1606 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_install)
NOTE: recipe kmod-30-r0: task do_install: Started
NOTE: recipe kmod-30-r0: task do_install: Succeeded
NOTE: Running task 1607 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_populate_sysroot)
NOTE: recipe kmod-30-r0: task do_populate_sysroot: Started
NOTE: recipe kmod-30-r0: task do_populate_sysroot: Succeeded
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_package: Succeeded
NOTE: Running task 1608 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_packagedata)
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_packagedata: Started
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_packagedata: Succeeded
NOTE: recipe python3-3.11.1-r0: task do_configure: Succeeded
NOTE: Running task 1609 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.1.bb:do_configure_ptest_base)
NOTE: recipe python3-3.11.1-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-3.11.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1610 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.1.bb:do_compile)
NOTE: recipe python3-3.11.1-r0: task do_compile: Started
NOTE: recipe openssl-3.0.7-r0: task do_package: Succeeded
NOTE: Running task 1611 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_packagedata)
NOTE: recipe openssl-3.0.7-r0: task do_packagedata: Started
NOTE: recipe openssl-3.0.7-r0: task do_packagedata: Failed
NOTE: recipe python3-3.11.1-r0: task do_compile: Succeeded
NOTE: recipe glibc-locale-2.37-r0: task do_package: Succeeded
NOTE: Tasks Summary: Attempted 1611 tasks of which 1209 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 16 ERROR messages, returning a non-zero exit code.
ERROR: openssl-3.0.7-r0 do_packagedata: QA Issue: Package version for package openssl-src went backwards which would break package feeds (from 0:3.0.8-r0 to 0:3.0.7-r0) [version-going-backwards]
ERROR: openssl-3.0.7-r0 do_packagedata: QA Issue: Package version for package openssl-dbg went backwards which would break package feeds (from 0:3.0.8-r0 to 0:3.0.7-r0) [version-going-backwards]
ERROR: openssl-3.0.7-r0 do_packagedata: QA Issue: Package version for package libcrypto went backwards which would break package feeds (from 0:3.0.8-r0 to 0:3.0.7-r0) [version-going-backwards]
ERROR: openssl-3.0.7-r0 do_packagedata: QA Issue: Package version for package libssl went backwards which would break package feeds (from 0:3.0.8-r0 to 0:3.0.7-r0) [version-going-backwards]
ERROR: openssl-3.0.7-r0 do_packagedata: QA Issue: Package version for package openssl-conf went backwards which would break package feeds (from 0:3.0.8-r0 to 0:3.0.7-r0) [version-going-backwards]
ERROR: openssl-3.0.7-r0 do_packagedata: QA Issue: Package version for package openssl-engines went backwards which would break package feeds (from 0:3.0.8-r0 to 0:3.0.7-r0) [version-going-backwards]
ERROR: openssl-3.0.7-r0 do_packagedata: QA Issue: Package version for package openssl-misc went backwards which would break package feeds (from 0:3.0.8-r0 to 0:3.0.7-r0) [version-going-backwards]
ERROR: openssl-3.0.7-r0 do_packagedata: QA Issue: Package version for package openssl-ossl-module-legacy went backwards which would break package feeds (from 0:3.0.8-r0 to 0:3.0.7-r0) [version-going-backwards]
ERROR: openssl-3.0.7-r0 do_packagedata: QA Issue: Package version for package openssl-ptest went backwards which would break package feeds (from 0:3.0.8-r0 to 0:3.0.7-r0) [version-going-backwards]
ERROR: openssl-3.0.7-r0 do_packagedata: QA Issue: Package version for package openssl-staticdev went backwards which would break package feeds (from 0:3.0.8-r0 to 0:3.0.7-r0) [version-going-backwards]
ERROR: openssl-3.0.7-r0 do_packagedata: QA Issue: Package version for package openssl-dev went backwards which would break package feeds (from 0:3.0.8-r0 to 0:3.0.7-r0) [version-going-backwards]
ERROR: openssl-3.0.7-r0 do_packagedata: QA Issue: Package version for package openssl-doc went backwards which would break package feeds (from 0:3.0.8-r0 to 0:3.0.7-r0) [version-going-backwards]
ERROR: openssl-3.0.7-r0 do_packagedata: QA Issue: Package version for package openssl-locale went backwards which would break package feeds (from 0:3.0.8-r0 to 0:3.0.7-r0) [version-going-backwards]
ERROR: openssl-3.0.7-r0 do_packagedata: QA Issue: Package version for package openssl-bin went backwards which would break package feeds (from 0:3.0.8-r0 to 0:3.0.7-r0) [version-going-backwards]
ERROR: openssl-3.0.7-r0 do_packagedata: QA Issue: Package version for package openssl went backwards which would break package feeds (from 0:3.0.8-r0 to 0:3.0.7-r0) [version-going-backwards]
ERROR: openssl-3.0.7-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/openssl/3.0.7-r0/temp/log.do_packagedata.3447412
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_packagedata) failed with exit code '1'

--===============3884219113494210688==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/dbus/dbus-lib: FILELIST: removed "/usr/lib/libdbus-1.so.3.32.1", added "/usr/lib/libdbus-1.so.3.32.2"
packages/core2-32-poky-linux/dbus/dbus-ptest: FILELIST: added "/usr/share/installed-tests/dbus/test-counter.test /usr/libexec/installed-tests/dbus/test-counter /usr/share/installed-tests/dbus/test-counter_with_config.test"
Changes to packages/core2-32-poky-linux/dbus (sysroot):
  /usr/lib/libdbus-1.so.3 changed symlink target from libdbus-1.so.3.32.1 to libdbus-1.so.3.32.2
  /usr/lib/libdbus-1.so changed symlink target from libdbus-1.so.3.32.1 to libdbus-1.so.3.32.2
  /usr/lib/libdbus-1.so.3.32.1 moved to /usr/lib/libdbus-1.so.3.32.2

--===============3884219113494210688==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 895 .bb files complete (0 cached, 895 parsed). 1693 targets, 55 skipped, 0 masked, 0 errors.
Removing 1 recipes from the cortexa15t2hf-neon sysroot...done.
Removing 1 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-f3751bf025630bda15f4496c36874f8d0f79ac2f"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:f3751bf025630bda15f4496c36874f8d0f79ac2f"
workspace            = "master:44311c454d0b0856f58cfa6fa60669903b2ba3af"

Initialising tasks...done.
Sstate summary: Wanted 209 Local 6 Mirrors 0 Missed 203 Current 254 (2% match, 56% complete)
Removing 29 stale sstate objects for arch qemuarm...done.
Removing 31 stale sstate objects for arch cortexa15t2hf-neon...done.
NOTE: Executing Tasks
NOTE: Running setscene task 274 of 463 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 310 of 463 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/autoconf-archive/autoconf-archive_2022.09.03.bb:do_packagedata_setscene)
NOTE: Running setscene task 315 of 463 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland-protocols_1.31.bb:do_packagedata_setscene)
NOTE: Running setscene task 459 of 463 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.37.bb:do_packagedata_setscene)
NOTE: recipe update-rc.d-0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe autoconf-archive-2022.09.03-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-protocols-1.31-r0: task do_packagedata_setscene: Started
NOTE: recipe glibc-2.37-r0: task do_packagedata_setscene: Started
NOTE: Running task 399 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_fetch)
NOTE: Running task 400 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_fetch)
NOTE: recipe wayland-protocols-1.31-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe autoconf-archive-2022.09.03-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe update-rc.d-0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 467 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_fetch)
NOTE: Running task 486 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_fetch)
NOTE: Running task 490 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.1.bb:do_fetch)
NOTE: Running task 492 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.40.1.bb:do_fetch)
NOTE: Running task 493 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_fetch)
NOTE: Running task 494 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.1.bb:do_fetch)
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Started
NOTE: recipe openssl-3.0.7-r0: task do_fetch: Started
NOTE: Running task 721 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_fetch)
NOTE: Running task 737 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.3.bb:do_fetch)
NOTE: recipe libtirpc-1.3.3-r0: task do_fetch: Started
NOTE: recipe libffi-3.4.4-r0: task do_fetch: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_fetch: Started
NOTE: recipe sqlite3-3_3.40.1-r0: task do_fetch: Started
NOTE: recipe xz-5.4.1-r0: task do_fetch: Started
NOTE: recipe openssl-3.0.7-r0: task do_fetch: Succeeded
NOTE: Running task 802 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_unpack)
NOTE: recipe libtirpc-1.3.3-r0: task do_fetch: Succeeded
NOTE: Running task 816 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_unpack)
NOTE: Running task 819 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_fetch)
NOTE: Running task 827 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_fetch)
NOTE: Running task 828 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_fetch)
NOTE: Running task 830 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_fetch)
NOTE: Running task 831 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_fetch)
NOTE: Running task 834 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_fetch)
NOTE: recipe libffi-3.4.4-r0: task do_fetch: Succeeded
NOTE: recipe sqlite3-3_3.40.1-r0: task do_fetch: Succeeded
NOTE: Running task 844 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_fetch)
NOTE: recipe xz-5.4.1-r0: task do_fetch: Succeeded
NOTE: Running task 852 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_write_config)
NOTE: Running task 853 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_write_config)
NOTE: Running task 855 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_unpack)
NOTE: Running task 856 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.1.bb:do_unpack)
NOTE: Running task 857 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.40.1.bb:do_unpack)
NOTE: Running task 858 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_fetch)
NOTE: Running task 859 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_write_config)
NOTE: Running task 860 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_fetch)
NOTE: Running task 861 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_fetch)
NOTE: Running task 862 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_fetch)
NOTE: Running task 863 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_fetch)
NOTE: Running task 864 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_fetch)
NOTE: Running task 868 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_fetch)
NOTE: Running task 873 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_fetch)
NOTE: Running task 875 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_fetch)
NOTE: recipe glibc-2.37-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Succeeded
NOTE: recipe python3-3.11.1-r0: task do_fetch: Started
NOTE: Running task 921 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_unpack)
NOTE: Running task 924 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe libnsl2-2.0.0-r0: task do_fetch: Succeeded
NOTE: Running task 925 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 943 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxml2-2.10.3-r0: task do_fetch: Started
NOTE: recipe expat-2.5.0-r0: task do_fetch: Started
NOTE: Running task 946 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_unpack)
NOTE: Running task 959 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe util-macros-1_1.19.3-r0: task do_fetch: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_unpack: Started
NOTE: recipe python3-3.11.1-r0: task do_fetch: Succeeded
NOTE: Running task 960 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe expat-2.5.0-r0: task do_fetch: Succeeded
NOTE: recipe openssl-3.0.7-r0: task do_unpack: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_fetch: Started
NOTE: recipe libpcre2-10.42-r0: task do_fetch: Started
NOTE: Running task 961 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.1.bb:do_unpack)
NOTE: recipe xorgproto-2022.2-r0: task do_write_config: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_fetch: Started
NOTE: recipe libxml2-2.10.3-r0: task do_fetch: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_fetch: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_fetch: Started
NOTE: recipe sqlite3-3_3.40.1-r0: task do_unpack: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_fetch: Started
NOTE: Running task 964 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.40.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe xz-5.4.1-r0: task do_unpack: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_fetch: Started
NOTE: recipe wayland-1.21.0-r0: task do_fetch: Started
NOTE: recipe wayland-1.21.0-r0: task do_write_config: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_fetch: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_fetch: Started
NOTE: recipe libpcre2-10.42-r0: task do_fetch: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_fetch: Succeeded
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_fetch: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_fetch: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_fetch: Started
NOTE: recipe xorgproto-2022.2-r0: task do_fetch: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_fetch: Succeeded
NOTE: recipe xkeyboard-config-2.38-r0: task do_fetch: Started
NOTE: recipe libffi-3.4.4-r0: task do_unpack: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_fetch: Succeeded
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_write_config: Started
NOTE: recipe wayland-1.21.0-r0: task do_fetch: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_fetch: Succeeded
NOTE: Running task 977 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe xcb-proto-1.15.2-r0: task do_fetch: Succeeded
NOTE: Running task 978 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_unpack)
NOTE: Running task 979 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.3.bb:do_unpack)
NOTE: Running task 982 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe initscripts-1.0-r155: task do_fetch: Started
NOTE: recipe xkeyboard-config-2.38-r0: task do_fetch: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_fetch: Succeeded
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_fetch: Succeeded
NOTE: Running task 1003 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_unpack)
NOTE: Running task 1004 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_unpack)
NOTE: Running task 1005 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_unpack)
NOTE: Running task 1006 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_unpack)
NOTE: recipe libseccomp-2.5.4-r0: task do_fetch: Succeeded
NOTE: Running task 1007 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_unpack)
NOTE: Running task 1009 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe base-passwd-3.6.1-r0: task do_fetch: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_fetch: Started
NOTE: recipe xorgproto-2022.2-r0: task do_write_config: Succeeded
NOTE: recipe wayland-1.21.0-r0: task do_write_config: Succeeded
NOTE: Running task 1010 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_unpack)
NOTE: Running task 1012 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe xz-5.4.1-r0: task do_unpack: Succeeded
NOTE: Running task 1015 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_write_config: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_unpack: Succeeded
NOTE: Running task 1016 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.1.bb:do_patch)
NOTE: Running task 1017 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_unpack)
NOTE: Running task 1018 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_unpack)
NOTE: Running task 1021 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_unpack)
NOTE: Running task 1022 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_unpack)
NOTE: Running task 1023 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_unpack)
NOTE: recipe sqlite3-3_3.40.1-r0: task do_unpack: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_fetch: Succeeded
NOTE: Running task 1024 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_unpack)
NOTE: Running task 1025 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_patch)
NOTE: recipe libffi-3.4.4-r0: task do_unpack: Succeeded
NOTE: recipe openssl-3.0.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xz-5.4.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1026 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.40.1.bb:do_patch)
NOTE: Running task 1027 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_package)
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Started
NOTE: recipe initscripts-1.0-r155: task do_fetch: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sqlite3-3_3.40.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libffi-3.4.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1028 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_patch)
NOTE: recipe libtirpc-1.3.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_unpack: Started
NOTE: recipe expat-2.5.0-r0: task do_unpack: Started
NOTE: Running task 1029 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_unpack)
NOTE: recipe python3-3.11.1-r0: task do_unpack: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_unpack: Started
NOTE: recipe libpcre2-10.42-r0: task do_unpack: Started
NOTE: recipe libxml2-2.10.3-r0: task do_unpack: Started
NOTE: recipe libpam-1.5.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xorgproto-2022.2-r0: task do_unpack: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe wayland-1.21.0-r0: task do_unpack: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_unpack: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_unpack: Succeeded
NOTE: Running task 1030 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_unpack)
NOTE: recipe xz-5.4.1-r0: task do_patch: Started
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_unpack: Started
NOTE: recipe expat-2.5.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_unpack: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1031 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_patch)
NOTE: Running task 1032 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe xorgproto-2022.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_unpack: Started
NOTE: Running task 1038 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_fetch)
NOTE: recipe sqlite3-3_3.40.1-r0: task do_patch: Started
NOTE: Running task 1039 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_fetch)
NOTE: Running task 1040 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_fetch)
NOTE: Running task 1041 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_unpack)
NOTE: Running task 1045 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_252.5.bb:do_fetch)
NOTE: Running task 1046 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_fetch)
NOTE: recipe libpthread-stubs-0.4-r0: task do_unpack: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_unpack: Started
NOTE: Running task 1049 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_unpack)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_unpack: Started
NOTE: Running task 1056 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_package)
NOTE: recipe libtirpc-1.3.3-r0: task do_patch: Started
NOTE: recipe expat-2.5.0-r0: task do_unpack: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_unpack: Started
NOTE: Running task 1057 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1058 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_patch)
NOTE: Running task 1059 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1061 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_fetch)
NOTE: Running task 1062 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_fetch)
NOTE: Running task 1063 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_fetch)
NOTE: recipe libpthread-stubs-0.4-r0: task do_unpack: Succeeded
NOTE: Running task 1075 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 1076 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_patch)
NOTE: Running task 1077 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.33.bb:do_package)
NOTE: Running task 1078 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe wayland-1.21.0-r0: task do_unpack: Succeeded
NOTE: Running task 1085 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_patch)
NOTE: recipe xtrans-1_1.4.0-r0: task do_unpack: Succeeded
NOTE: Running task 1096 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_patch)
NOTE: recipe xorgproto-2022.2-r0: task do_unpack: Succeeded
NOTE: Running task 1107 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_patch)
NOTE: recipe base-passwd-3.6.1-r0: task do_unpack: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_package: Started
NOTE: Running task 1117 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_patch)
NOTE: Running task 1122 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_write_config)
NOTE: Running task 1132 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_write_config)
NOTE: Running task 1136 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_package)
NOTE: recipe xcb-proto-1.15.2-r0: task do_unpack: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_unpack: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_unpack: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_unpack: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_unpack: Succeeded
NOTE: recipe openssl-3.0.7-r0: task do_unpack: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Succeeded
NOTE: Running task 1137 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_patch)
NOTE: recipe openssl-3.0.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_unpack: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe sqlite3-3_3.40.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe sqlite3-3_3.40.1-r0: task do_patch: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1138 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_patch)
NOTE: recipe xz-5.4.1-r0: task do_patch: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_patch: Succeeded
NOTE: recipe xz-5.4.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1139 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_deploy_source_date_epoch)
NOTE: recipe xorgproto-2022.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_unpack: Succeeded
NOTE: recipe libxml2-2.10.3-r0: task do_unpack: Succeeded
NOTE: Running task 1140 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_patch)
NOTE: Running task 1141 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1142 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.40.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1143 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_configure)
NOTE: recipe initscripts-1.0-r155: task do_unpack: Started
NOTE: recipe libffi-3.4.4-r0: task do_patch: Started
NOTE: recipe libxcb-1.15-r0: task do_unpack: Started
NOTE: Running task 1144 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.3.bb:do_patch)
NOTE: Running task 1145 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_patch)
NOTE: recipe shadow-sysroot-4.6-r3: task do_unpack: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_patch: Started
NOTE: Running task 1146 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_patch)
NOTE: recipe base-passwd-3.6.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_unpack: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_fetch: Started
NOTE: Running task 1147 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_patch)
NOTE: recipe zstd-1.5.2-r0: task do_fetch: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_fetch: Started
NOTE: Running task 1148 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_patch)
NOTE: recipe kmod-30-r0: task do_fetch: Started
NOTE: recipe xkeyboard-config-2.38-r0: task do_unpack: Started
NOTE: Running task 1149 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_patch)
NOTE: recipe util-macros-1_1.19.3-r0: task do_patch: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_fetch: Succeeded
NOTE: recipe libxkbcommon-1.5.0-r0: task do_fetch: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe zlib-1.2.13-r0: task do_package: Started
NOTE: Running task 1150 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libpthread-stubs-0.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe expat-2.5.0-r0: task do_patch: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_fetch: Started
NOTE: Running task 1151 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_patch)
NOTE: recipe systemd-1_252.5-r0: task do_fetch: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_patch: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_fetch: Started
NOTE: recipe dbus-1.14.6-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: Running task 1152 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_patch)
NOTE: recipe libx11-1_1.8.4-r0: task do_fetch: Succeeded
NOTE: Running task 1153 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_unpack)
NOTE: Running task 1154 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_unpack)
NOTE: Running task 1155 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_unpack)
NOTE: recipe initscripts-1.0-r155: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_fetch: Succeeded
NOTE: recipe dbus-1.14.6-r0: task do_fetch: Succeeded
NOTE: recipe zstd-1.5.2-r0: task do_fetch: Succeeded
NOTE: Running task 1174 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_252.5.bb:do_warn_musl)
NOTE: Running task 1175 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_252.5.bb:do_write_config)
NOTE: Running task 1176 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package)
NOTE: recipe kmod-30-r0: task do_fetch: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_patch: Succeeded
NOTE: recipe wayland-1.21.0-r0: task do_patch: Started
NOTE: Running task 1177 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_generate_toolchain_file)
NOTE: recipe xkeyboard-config-2.38-r0: task do_write_config: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_patch: Started
NOTE: Running task 1178 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1179 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_unpack)
NOTE: Running task 1180 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_unpack)
NOTE: Running task 1181 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_unpack)
NOTE: recipe libxcb-1.15-r0: task do_unpack: Succeeded
NOTE: recipe libxcrypt-4.4.33-r0: task do_package: Started
NOTE: Running task 1182 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_unpack)
NOTE: Running task 1183 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_patch)
NOTE: Running task 1184 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe initscripts-1.0-r155: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_patch: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_patch: Started
NOTE: recipe systemd-1_252.5-r0: task do_fetch: Succeeded
NOTE: recipe sqlite3-3_3.40.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1192 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_package)
NOTE: recipe libpthread-stubs-0.4-r0: task do_patch: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_patch: Succeeded
NOTE: recipe libxkbcommon-1.5.0-r0: task do_write_config: Started
NOTE: Running task 1193 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_deploy_source_date_epoch)
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_patch: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe openssl-3.0.7-r0: task do_patch: Started
NOTE: Running task 1194 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libpcre2-10.42-r0: task do_patch: Started
NOTE: recipe xkeyboard-config-2.38-r0: task do_unpack: Succeeded
NOTE: Running task 1195 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_252.5.bb:do_unpack)
NOTE: recipe initscripts-1.0-r155: task do_unpack: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_patch: Started
NOTE: recipe flex-2.6.4-r0: task do_package: Started
NOTE: Running task 1197 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_patch)
NOTE: recipe xkeyboard-config-2.38-r0: task do_write_config: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_patch: Started
NOTE: recipe xz-5.4.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1198 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_patch)
NOTE: recipe xorgproto-2022.2-r0: task do_patch: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpam-1.5.2-r0: task do_configure: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_patch: Started
NOTE: Running task 1207 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_package)
NOTE: recipe libseccomp-2.5.4-r0: task do_patch: Started
NOTE: recipe libxml2-2.10.3-r0: task do_patch: Started
NOTE: Running task 1208 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1209 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_package)
NOTE: recipe libxau-1_1.0.11-r0: task do_patch: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_unpack: Started
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_patch: Started
NOTE: recipe libice-1_1.1.1-r0: task do_unpack: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_unpack: Started
NOTE: recipe wayland-1.21.0-r0: task do_patch: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Succeeded
NOTE: Running task 1212 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxkbcommon-1.5.0-r0: task do_write_config: Succeeded
NOTE: Running task 1214 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_deploy_source_date_epoch)
NOTE: recipe expat-2.5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe zstd-1.5.2-r0: task do_unpack: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_patch: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_patch: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1218 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libxcb-1.15-r0: task do_patch: Started
NOTE: recipe expat-2.5.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_unpack: Started
NOTE: Running task 1219 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libnsl2-2.0.0-r0: task do_patch: Succeeded
NOTE: recipe zstd-1.5.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpcre2-10.42-r0: task do_patch: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_patch: Succeeded
NOTE: Running task 1223 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_deploy_source_date_epoch)
NOTE: recipe kmod-30-r0: task do_unpack: Started
NOTE: Running task 1224 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_deploy_source_date_epoch)
NOTE: recipe dbus-1.14.6-r0: task do_unpack: Started
NOTE: Running task 1225 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_deploy_source_date_epoch)
NOTE: recipe xtrans-1_1.4.0-r0: task do_patch: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_patch: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libffi-3.4.4-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1227 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe systemd-1_252.5-r0: task do_warn_musl: Started
NOTE: recipe systemd-1_252.5-r0: task do_write_config: Started
NOTE: Running task 1228 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_deploy_source_date_epoch)
NOTE: recipe initscripts-1.0-r155: task do_patch: Started
NOTE: recipe systemd-1_252.5-r0: task do_warn_musl: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_package: Started
NOTE: Running task 1231 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_fetch)
NOTE: recipe xkeyboard-config-2.38-r0: task do_patch: Started
NOTE: recipe expat-2.5.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_unpack: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_package: Started
NOTE: Running task 1247 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_patch)
NOTE: recipe libxkbcommon-1.5.0-r0: task do_unpack: Succeeded
NOTE: recipe systemd-1_252.5-r0: task do_unpack: Started
NOTE: recipe sqlite3-3_3.40.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xkeyboard-config-2.38-r0: task do_patch: Succeeded
NOTE: Running task 1253 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_patch)
NOTE: recipe libsm-1_1.2.4-r0: task do_unpack: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_patch: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe wayland-1.21.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1255 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_deploy_source_date_epoch)
NOTE: recipe systemd-1_252.5-r0: task do_write_config: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1256 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.40.1.bb:do_configure)
NOTE: recipe libtirpc-1.3.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1257 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_patch)
NOTE: recipe util-macros-1_1.19.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch: Started
NOTE: Running task 1259 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_configure)
NOTE: recipe xz-5.4.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe initscripts-1.0-r155: task do_patch: Succeeded
NOTE: Running task 1260 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_configure)
NOTE: recipe libpcre2-10.42-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1261 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.1.bb:do_configure)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_fetch: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1262 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe gdbm-1.23-r0: task do_package: Started
NOTE: Running task 1263 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_deploy_source_date_epoch)
NOTE: recipe expat-2.5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe openssl-3.0.7-r0: task do_patch: Succeeded
NOTE: Running task 1268 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_configure)
NOTE: Running task 1269 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_deploy_source_date_epoch)
NOTE: recipe zstd-1.5.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_patch: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_package: Started
NOTE: Running task 1274 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_configure)
NOTE: recipe libxml2-2.10.3-r0: task do_patch: Succeeded
NOTE: Running task 1278 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxkbcommon-1.5.0-r0: task do_patch: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_fetch: Succeeded
NOTE: recipe libx11-1_1.8.4-r0: task do_unpack: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe dbus-1.14.6-r0: task do_unpack: Succeeded
NOTE: Running task 1281 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_unpack)
NOTE: Running task 1282 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_configure)
NOTE: recipe libice-1_1.1.1-r0: task do_patch: Succeeded
NOTE: recipe sqlite3-3_3.40.1-r0: task do_configure: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_configure: Started
NOTE: Running task 1283 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_patch)
NOTE: recipe libsm-1_1.2.4-r0: task do_patch: Started
NOTE: Running task 1284 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_patch)
NOTE: Running task 1285 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_deploy_source_date_epoch)
NOTE: recipe util-macros-1_1.19.3-r0: task do_configure: Started
NOTE: recipe xz-5.4.1-r0: task do_configure: Started
NOTE: Running task 1289 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_package)
NOTE: recipe initscripts-1.0-r155: task do_deploy_source_date_epoch: Started
NOTE: recipe xorgproto-2022.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1290 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.bb:do_package)
NOTE: recipe libxkbcommon-1.5.0-r0: task do_patch: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_patch: Succeeded
NOTE: Running task 1291 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1292 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_configure)
NOTE: recipe xkeyboard-config-2.38-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe wayland-1.21.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1293 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libsm-1_1.2.4-r0: task do_patch: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_configure: Started
NOTE: Running task 1295 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_deploy_source_date_epoch)
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1298 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_configure)
NOTE: recipe base-passwd-3.6.1-r0: task do_patch: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_configure: Started
NOTE: Running task 1299 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1300 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_configure)
NOTE: recipe libxau-1_1.0.11-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe openssl-3.0.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-3.11.1-r0: task do_unpack: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_unpack: Started
NOTE: recipe libxml2-2.10.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1305 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.1.bb:do_patch)
NOTE: recipe libpcre2-10.42-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_configure: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe dbus-1.14.6-r0: task do_patch: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_patch: Started
NOTE: recipe zstd-1.5.2-r0: task do_unpack: Succeeded
NOTE: Running task 1327 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_package)
NOTE: recipe xcb-proto-1.15.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcb-1.15-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 1328 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_patch)
NOTE: recipe xorgproto-2022.2-r0: task do_configure: Started
NOTE: Running task 1337 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-locale_2.37.bb:do_package)
NOTE: recipe kmod-30-r0: task do_unpack: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1339 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_patch)
NOTE: recipe bzip2-1.0.8-r0: task do_configure: Started
NOTE: recipe initscripts-1.0-r155: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1340 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 1341 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe libseccomp-2.5.4-r0: task do_configure: Started
NOTE: Running task 1342 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_configure)
NOTE: recipe dbus-1.14.6-r0: task do_patch: Succeeded
NOTE: recipe xkeyboard-config-2.38-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libx11-1_1.8.4-r0: task do_patch: Succeeded
NOTE: Running task 1343 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 1344 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_populate_lic)
NOTE: Running task 1345 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_deploy_source_date_epoch)
NOTE: recipe zstd-1.5.2-r0: task do_patch: Started
NOTE: recipe openssl-3.0.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1346 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_configure)
NOTE: recipe python3-3.11.1-r0: task do_patch: Started
NOTE: recipe kmod-30-r0: task do_patch: Started
NOTE: recipe zstd-1.5.2-r0: task do_patch: Succeeded
NOTE: recipe libxml2-2.10.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1347 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_deploy_source_date_epoch)
NOTE: recipe initscripts-1.0-r155: task do_configure: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: Running task 1348 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_configure)
NOTE: recipe libxkbcommon-1.5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libx11-1_1.8.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_patch: Succeeded
NOTE: Running task 1349 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_deploy_source_date_epoch)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_package: Started
NOTE: recipe make-4.4-r0: task do_package: Started
NOTE: recipe dbus-1.14.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe initscripts-1.0-r155: task do_configure: Succeeded
NOTE: recipe dbus-1.14.6-r0: task do_populate_lic: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1350 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_compile)
NOTE: recipe zstd-1.5.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1351 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_configure)
NOTE: recipe gmp-6.2.1-r0: task do_package: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe kmod-30-r0: task do_patch: Succeeded
NOTE: Running task 1352 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_patch)
NOTE: recipe openssl-3.0.7-r0: task do_configure: Started
NOTE: Running task 1353 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_deploy_source_date_epoch)
NOTE: recipe xcb-proto-1.15.2-r0: task do_configure: Started
NOTE: recipe glibc-locale-2.37-r0: task do_package: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_configure: Started
NOTE: recipe initscripts-1.0-r155: task do_compile: Started
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe dbus-1.14.6-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_populate_lic unihash changed to c42e125fb5e65f091cff4c5a9180972d9c08c6b0fcbec6c44d5df55dcc16450b
NOTE: recipe libx11-1_1.8.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_patch: Started
NOTE: recipe initscripts-1.0-r155: task do_compile: Succeeded
NOTE: recipe zstd-1.5.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1354 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_install)
NOTE: recipe kmod-30-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1355 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_configure)
NOTE: recipe dbus-1.14.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_patch: Succeeded
NOTE: Running task 1356 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_deploy_source_date_epoch)
NOTE: recipe zstd-1.5.2-r0: task do_configure: Started
NOTE: recipe initscripts-1.0-r155: task do_install: Started
NOTE: recipe kmod-30-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe systemd-1_252.5-r0: task do_unpack: Succeeded
NOTE: Running task 1357 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_252.5.bb:do_patch)
NOTE: recipe zstd-1.5.2-r0: task do_configure: Succeeded
NOTE: Running task 1358 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_compile)
NOTE: recipe zstd-1.5.2-r0: task do_compile: Started
NOTE: recipe systemd-1_252.5-r0: task do_patch: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_package unihash changed to b0ea0ffe3a9eb079b984b1dfba71aac2984b9764df022283741a275c1847490c
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata became valid
NOTE: Running setscene task 463 of 463 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_package: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1360 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_package)
NOTE: Running task 1361 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_package)
NOTE: Running task 1362 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_package)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_package unihash changed to b241c1e1e46bf690a8a0215bcf0cae09884dc3d5717e45d4cb4a58a568afc5e0
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata became valid
NOTE: recipe libxcrypt-4.4.33-r0: task do_package: Succeeded
NOTE: Running setscene task 463 of 463 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata_setscene)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.33.bb:do_package unihash changed to 1eb5f2445cc57a3344ec0233d039f5cabbfe551fea9e1df71fdd10e969ebaf45
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.33.bb:do_packagedata became valid
NOTE: Running setscene task 460 of 463 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.33.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcrypt-4.4.33-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_package: Started
NOTE: recipe ncurses-6.4-r0: task do_package: Started
NOTE: recipe sed-4.9-r0: task do_package: Started
NOTE: recipe systemd-1_252.5-r0: task do_patch: Succeeded
NOTE: Running task 1363 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_252.5.bb:do_deploy_source_date_epoch)
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_package: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_configure: Succeeded
NOTE: Running task 1364 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_compile)
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_package unihash changed to 8aad150782fcf70c689aec3f4ca98c0e5a72df9f751dc6fd31f389c8a7c5fb1a
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_packagedata became valid
NOTE: recipe libxcrypt-4.4.33-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.11.1-r0: task do_patch: Succeeded
NOTE: recipe systemd-1_252.5-r0: task do_deploy_source_date_epoch: Started
NOTE: Running setscene task 463 of 463 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_packagedata_setscene)
NOTE: Running task 1365 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1368 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_package)
NOTE: recipe xorgproto-2022.2-r0: task do_compile: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.8-r0: task do_package: Started
NOTE: recipe python3-3.11.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_package unihash changed to 0d8c97438b681a84210742a6fbc9d4712ba0a4017919f598b6e10125c5e1e3c9
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_packagedata became valid
NOTE: Running setscene task 463 of 463 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_packagedata_setscene)
NOTE: recipe systemd-1_252.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_compile: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_package: Succeeded
NOTE: Running task 1370 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_install)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_package unihash changed to 0b372df768e386ab95a5af82eea9d9f4f6619ab568bd24c179d22ecd55486ccf
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata became valid
NOTE: Running setscene task 463 of 463 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: recipe python3-3.11.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Started
NOTE: Running task 1371 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe xorgproto-2022.2-r0: task do_install: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe expat-2.5.0-r0: task do_configure: Succeeded
NOTE: Running task 1374 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_configure_ptest_base)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to e9c1144ea2419bed6d0fc635780029749c392f66d9ede00d45690172e50f2dbd
NOTE: recipe expat-2.5.0-r0: task do_configure_ptest_base: Started
NOTE: recipe expat-2.5.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1375 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_compile)
NOTE: recipe initscripts-1.0-r155: task do_install: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_compile: Started
NOTE: Running task 1376 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot)
NOTE: Running task 1377 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_package)
NOTE: recipe xorgproto-2022.2-r0: task do_install: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot: Started
NOTE: Running task 1378 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_populate_sysroot)
NOTE: Running task 1379 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_package)
NOTE: recipe initscripts-1.0-r155: task do_package: Started
NOTE: recipe xorgproto-2022.2-r0: task do_populate_sysroot: Started
NOTE: recipe xorgproto-2022.2-r0: task do_package: Started
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_configure: Succeeded
NOTE: Running task 1380 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_compile)
NOTE: recipe xcb-proto-1.15.2-r0: task do_configure: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_compile: Started
NOTE: Running task 1381 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_compile)
NOTE: recipe util-macros-1_1.19.3-r0: task do_compile: Succeeded
NOTE: Running task 1382 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_install)
NOTE: recipe gdbm-1.23-r0: task do_package: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_package: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_compile: Started
NOTE: recipe make-4.4-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_package unihash changed to b590520ad44674cf80f3f55e4b1f36b41854d9d539a7bf0c31ef01d1586e3560
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata became valid
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_package unihash changed to dd205f7a88387dc4854181d4c86cdd180a1ef3a563c794dd05197a28f76ce278
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata became valid
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.bb:do_package unihash changed to c5c20e237ae863fe5a9d35ddd76572c7f421ec030badb35343b7506c314c7b04
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.bb:do_packagedata became valid
NOTE: Running setscene task 450 of 463 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 458 of 463 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 459 of 463 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: recipe xcb-proto-1.15.2-r0: task do_compile: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_install: Started
NOTE: Running task 1383 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_install)
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe make-4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_install: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_install: Succeeded
NOTE: Running task 1384 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_populate_sysroot)
NOTE: Running task 1385 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_package)
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot: Started
NOTE: Running task 1388 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_package)
NOTE: recipe util-macros-1_1.19.3-r0: task do_package: Started
NOTE: recipe bash-completion-2.11-r0: task do_package: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_package: Succeeded
NOTE: recipe make-4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1390 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.bb:do_package_write_rpm)
NOTE: recipe base-passwd-3.6.1-r0: task do_configure: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package unihash changed to fe7ff6eee24d9ba1a73a41f209cc9586a418dfcd7368387fe059fb60d328340b
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata became valid
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_package unihash changed to 16c80846fcaf321f2a6fe95d640b51a89531cf32514a7085cbeeb96e902ea878
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata became valid
NOTE: Running setscene task 454 of 463 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 463 of 463 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running task 1391 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_compile)
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_compile: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2022.2-r0: task do_package: Succeeded
NOTE: recipe make-4.4-r0: task do_package_write_rpm: Started
NOTE: recipe perl-5.36.0-r0: task do_package: Started
NOTE: Running task 1392 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_packagedata)
NOTE: recipe libpthread-stubs-0.4-r0: task do_configure: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1393 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_compile)
NOTE: Running task 1394 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1395 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1396 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_prepare_recipe_sysroot)
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1397 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_prepare_recipe_sysroot)
NOTE: recipe xorgproto-2022.2-r0: task do_packagedata: Started
NOTE: Setscene tasks completed
NOTE: Running task 1400 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_package)
NOTE: recipe libpthread-stubs-0.4-r0: task do_compile: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_install: Succeeded
NOTE: Running task 1401 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_populate_sysroot)
NOTE: Running task 1402 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_package)
NOTE: recipe libpthread-stubs-0.4-r0: task do_compile: Succeeded
NOTE: Running task 1403 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_install)
NOTE: recipe libxau-1_1.0.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xkeyboard-config-2.38-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe acl-2.3.1-r0: task do_package: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot: Started
NOTE: recipe xorgproto-2022.2-r0: task do_packagedata: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_package: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_install: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1404 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_configure)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1405 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_configure)
NOTE: recipe initscripts-1.0-r155: task do_package: Succeeded
NOTE: recipe cracklib-2.9.8-r0: task do_package: Succeeded
NOTE: Running task 1406 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata)
NOTE: recipe base-passwd-3.6.1-r0: task do_compile: Succeeded
NOTE: Running task 1407 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_install)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_package unihash changed to d103947637fef55f08e37ab1b8c031a893f8c16b88cd4bce289fbcccb9d2b4ba
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_packagedata became valid
NOTE: Running setscene task 450 of 463 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_packagedata_setscene)
NOTE: recipe xtrans-1_1.4.0-r0: task do_configure: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1408 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_configure)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_configure: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_install: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_packagedata: Started
NOTE: Running task 1409 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot)
NOTE: Running task 1410 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_package)
NOTE: recipe base-passwd-3.6.1-r0: task do_install: Started
NOTE: recipe cracklib-2.9.8-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xkeyboard-config-2.38-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1411 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_configure)
NOTE: recipe libxau-1_1.0.11-r0: task do_configure: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_package: Started
NOTE: recipe xkeyboard-config-2.38-r0: task do_configure: Started
NOTE: recipe initscripts-1.0-r155: task do_packagedata: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_install: Succeeded
NOTE: Running task 1412 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_populate_sysroot)
NOTE: recipe cracklib-2.9.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_package: Succeeded
NOTE: Running task 1414 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_packagedata)
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1415 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1416 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_package)
NOTE: recipe xcb-proto-1.15.2-r0: task do_package: Succeeded
NOTE: Running task 1417 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_packagedata)
NOTE: recipe shadow-sysroot-4.6-r3: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_package: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata: Succeeded
NOTE: recipe sed-4.9-r0: task do_package: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1418 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_configure)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_package unihash changed to 3e7028f024ffc2f5028ab7c13322918b836c7afbed4b7bbe994ef67b7c387ea5
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata became valid
NOTE: recipe bzip2-1.0.8-r0: task do_configure: Succeeded
NOTE: Running setscene task 463 of 463 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running task 1419 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_configure_ptest_base)
NOTE: recipe shadow-sysroot-4.6-r3: task do_configure: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_package: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_configure_ptest_base: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_package unihash changed to 202bbf6512a63de4c4aa8dd7a105330b9abbffb2307c130d27139886c4edc637
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata became valid
NOTE: recipe shadow-sysroot-4.6-r3: task do_configure: Succeeded
NOTE: Running setscene task 447 of 463 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: Running task 1420 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_compile)
NOTE: recipe bzip2-1.0.8-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1421 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_compile)
NOTE: recipe xkeyboard-config-2.38-r0: task do_configure: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_compile: Started
NOTE: Running task 1422 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_compile)
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_compile: Succeeded
NOTE: Running task 1423 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_install)
NOTE: recipe bzip2-1.0.8-r0: task do_compile: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_package: Succeeded
NOTE: Running task 1424 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata)
NOTE: recipe xkeyboard-config-2.38-r0: task do_compile: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe make-4.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_install: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe shadow-sysroot-4.6-r3: task do_install: Succeeded
NOTE: Running task 1427 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot)
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata: Succeeded
NOTE: recipe sqlite3-3_3.40.1-r0: task do_configure: Succeeded
NOTE: Running task 1428 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.40.1.bb:do_compile)
NOTE: recipe xkeyboard-config-2.38-r0: task do_compile: Succeeded
NOTE: Running task 1429 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_install)
NOTE: recipe sqlite3-3_3.40.1-r0: task do_compile: Started
NOTE: recipe xkeyboard-config-2.38-r0: task do_install: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_compile: Succeeded
NOTE: Running task 1430 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_compile_ptest_base)
NOTE: recipe acl-2.3.1-r0: task do_package: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_compile_ptest_base: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_package unihash changed to d30e4a9f70a743fab14cbf8bc491dfca4b4fe7cdfc88fc75a1601e2a1fc36911
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata became valid
NOTE: Running setscene task 459 of 463 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: recipe expat-2.5.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1431 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_install)
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_install: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_package: Succeeded
NOTE: Running task 1432 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_packagedata)
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata: Started
NOTE: recipe expat-2.5.0-r0: task do_install: Succeeded
NOTE: Running task 1434 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_install_ptest_base)
NOTE: recipe expat-2.5.0-r0: task do_install_ptest_base: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_install_ptest_base: Succeeded
NOTE: recipe xkeyboard-config-2.38-r0: task do_install: Succeeded
NOTE: Running task 1435 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_populate_sysroot)
NOTE: Running task 1436 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_package)
NOTE: Running task 1437 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_populate_sysroot)
NOTE: Running task 1438 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_package)
NOTE: recipe bzip2-1.0.8-r0: task do_compile: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_package: Started
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot: Started
NOTE: Running task 1439 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_compile_ptest_base)
NOTE: recipe xkeyboard-config-2.38-r0: task do_populate_sysroot: Started
NOTE: recipe xkeyboard-config-2.38-r0: task do_package: Started
NOTE: recipe bzip2-1.0.8-r0: task do_compile_ptest_base: Started
NOTE: recipe bzip2-1.0.8-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1440 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_install)
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_install: Started
NOTE: recipe xkeyboard-config-2.38-r0: task do_populate_sysroot: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_install: Succeeded
NOTE: Running task 1441 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_install_ptest_base)
NOTE: recipe libtirpc-1.3.3-r0: task do_configure: Succeeded
NOTE: Running task 1442 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_compile)
NOTE: recipe bzip2-1.0.8-r0: task do_install_ptest_base: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_compile: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_configure: Succeeded
NOTE: Running task 1443 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_configure_ptest_base)
NOTE: recipe libseccomp-2.5.4-r0: task do_configure_ptest_base: Started
NOTE: recipe bzip2-1.0.8-r0: task do_install_ptest_base: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1444 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_compile)
NOTE: Running task 1445 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot)
NOTE: Running task 1446 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package)
NOTE: recipe libseccomp-2.5.4-r0: task do_compile: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot: Started
NOTE: recipe bzip2-1.0.8-r0: task do_package: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1447 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtirpc-1.3.3-r0: task do_compile: Succeeded
NOTE: Running task 1448 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_install)
NOTE: recipe libpcre2-10.42-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_install: Started
NOTE: recipe libffi-3.4.4-r0: task do_configure: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_package: Succeeded
NOTE: Running task 1449 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_compile)
NOTE: Running task 1450 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_packagedata)
NOTE: recipe libffi-3.4.4-r0: task do_compile: Started
NOTE: recipe libpcre2-10.42-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1451 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_configure)
NOTE: recipe expat-2.5.0-r0: task do_packagedata: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_configure: Succeeded
NOTE: Running task 1452 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_compile)
NOTE: recipe libpcre2-10.42-r0: task do_configure: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_compile: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_compile: Succeeded
NOTE: Running task 1453 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_install)
NOTE: recipe libtirpc-1.3.3-r0: task do_install: Succeeded
NOTE: Running task 1454 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot)
NOTE: Running task 1455 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_package)
NOTE: recipe expat-2.5.0-r0: task do_packagedata: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_install: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_package: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_install: Succeeded
NOTE: Running task 1456 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_populate_sysroot)
NOTE: Running task 1457 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_package)
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1458 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_package: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe openssl-3.0.7-r0: task do_configure: Succeeded
NOTE: Running task 1459 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_configure_ptest_base)
NOTE: recipe libffi-3.4.4-r0: task do_compile: Succeeded
NOTE: Running task 1460 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_install)
NOTE: recipe openssl-3.0.7-r0: task do_configure_ptest_base: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1461 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_configure)
NOTE: recipe openssl-3.0.7-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1462 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_compile)
NOTE: recipe libffi-3.4.4-r0: task do_install: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1463 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libnsl2-2.0.0-r0: task do_configure: Started
NOTE: recipe openssl-3.0.7-r0: task do_compile: Started
NOTE: recipe libice-1_1.1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libice-1_1.1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1464 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_configure)
NOTE: recipe libice-1_1.1.1-r0: task do_configure: Started
NOTE: recipe xkeyboard-config-2.38-r0: task do_package: Succeeded
NOTE: Running task 1465 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_packagedata)
NOTE: recipe xkeyboard-config-2.38-r0: task do_packagedata: Started
NOTE: recipe libffi-3.4.4-r0: task do_install: Succeeded
NOTE: Running task 1466 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot)
NOTE: Running task 1467 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_package)
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot: Started
NOTE: recipe libffi-3.4.4-r0: task do_package: Started
NOTE: recipe xkeyboard-config-2.38-r0: task do_packagedata: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_package: Succeeded
NOTE: Running task 1468 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata)
NOTE: recipe bzip2-1.0.8-r0: task do_package: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata: Started
NOTE: Running task 1469 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata)
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_package: Succeeded
NOTE: Running task 1470 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata)
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_package: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_compile: Succeeded
NOTE: Running task 1471 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_compile_ptest_base)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_package unihash changed to ea74773465acc629fcac3debe857a1c5e62bf0d610de0319ae3f5b6d9a8a7a09
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata became valid
NOTE: Running setscene task 463 of 463 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_compile_ptest_base: Started
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1473 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_package)
NOTE: Running task 1474 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_package)
NOTE: Running task 1475 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.6.bb:do_package)
NOTE: recipe psmisc-23.6-r0: task do_package: Started
NOTE: recipe readline-8.2-r0: task do_package: Started
NOTE: recipe bash-5.2.15-r0: task do_package: Started
NOTE: recipe libffi-3.4.4-r0: task do_package: Succeeded
NOTE: Running task 1476 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata)
NOTE: recipe libffi-3.4.4-r0: task do_packagedata: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1477 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_install)
NOTE: recipe libseccomp-2.5.4-r0: task do_install: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_configure: Succeeded
NOTE: Running task 1478 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_compile)
NOTE: recipe readline-8.2-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_package unihash changed to 5f50ed4cb7ccb3e46dcce3dd4a7ebc3b0654e5c4a3bd2dc912909fceae368e9f
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_packagedata became valid
NOTE: Running setscene task 459 of 463 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_packagedata_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_configure: Succeeded
NOTE: Running task 1479 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_compile)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_compile: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_compile: Started
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe zstd-1.5.2-r0: task do_compile: Succeeded
NOTE: Running task 1481 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_install)
NOTE: recipe zstd-1.5.2-r0: task do_install: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_install: Succeeded
NOTE: Running task 1482 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_install_ptest_base)
NOTE: recipe libseccomp-2.5.4-r0: task do_install_ptest_base: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_compile: Succeeded
NOTE: Running task 1483 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_install)
NOTE: recipe libxau-1_1.0.11-r0: task do_compile: Succeeded
NOTE: Running task 1484 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_install)
NOTE: recipe xz-5.4.1-r0: task do_configure: Succeeded
NOTE: Running task 1485 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.1.bb:do_compile)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_install: Started
NOTE: recipe xz-5.4.1-r0: task do_compile: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_install: Started
NOTE: recipe psmisc-23.6-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.6.bb:do_package unihash changed to 6968fad42cc197e6254ea983b0b1ab0c12d188e9198d56598f98408ff48ba4b6
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.6.bb:do_packagedata became valid
NOTE: Running setscene task 463 of 463 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.6.bb:do_packagedata_setscene)
NOTE: recipe psmisc-23.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_install: Succeeded
NOTE: Running task 1486 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_populate_sysroot)
NOTE: Running task 1487 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_package)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_package: Started
NOTE: recipe psmisc-23.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1489 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_package_write_rpm)
NOTE: recipe libxau-1_1.0.11-r0: task do_install: Succeeded
NOTE: Running task 1490 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_populate_sysroot)
NOTE: Running task 1491 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_package)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_package_write_rpm: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_package: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1492 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxcb-1.15-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1493 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_populate_sysroot)
NOTE: Running task 1494 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_package)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_populate_sysroot: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_package: Started
NOTE: recipe libxcb-1.15-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_package_write_rpm unihash changed to c8f57ab830ff282b26f6c6d12ecce526cbc0f9f5073369895ba63737ef9a4931
NOTE: Running task 1495 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_configure)
NOTE: recipe libxcb-1.15-r0: task do_configure: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_package: Succeeded
NOTE: Running task 1496 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_packagedata)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_package: Succeeded
NOTE: Running task 1497 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_packagedata)
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata: Succeeded
NOTE: recipe xz-5.4.1-r0: task do_compile: Succeeded
NOTE: Running task 1498 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.1.bb:do_install)
NOTE: recipe xz-5.4.1-r0: task do_install: Started
NOTE: recipe bash-5.2.15-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_package unihash changed to b31feeb33e825d52ba32ad69238dae21d71f84eb4408e8ba71b621417abbc722
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_packagedata became valid
NOTE: recipe libnsl2-2.0.0-r0: task do_configure: Succeeded
NOTE: Running setscene task 463 of 463 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_packagedata_setscene)
NOTE: Running task 1499 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_compile)
NOTE: recipe libnsl2-2.0.0-r0: task do_compile: Started
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libnsl2-2.0.0-r0: task do_compile: Succeeded
NOTE: Running task 1501 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_install)
NOTE: recipe libpam-1.5.2-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1502 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_configure_ptest_base)
NOTE: recipe libnsl2-2.0.0-r0: task do_install: Started
NOTE: recipe libpam-1.5.2-r0: task do_configure_ptest_base: Started
NOTE: recipe libpam-1.5.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1503 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_compile)
NOTE: recipe libpcre2-10.42-r0: task do_configure: Succeeded
NOTE: Running task 1504 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_compile)
NOTE: recipe libpam-1.5.2-r0: task do_compile: Started
NOTE: recipe libpcre2-10.42-r0: task do_compile: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_install: Succeeded
NOTE: Running task 1505 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot)
NOTE: Running task 1506 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_package)
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_package: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_configure: Succeeded
NOTE: Running task 1507 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_compile)
NOTE: recipe libice-1_1.1.1-r0: task do_compile: Started
NOTE: recipe xz-5.4.1-r0: task do_install: Succeeded
NOTE: Running task 1508 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.1.bb:do_populate_sysroot)
NOTE: Running task 1509 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.1.bb:do_package)
NOTE: recipe xz-5.4.1-r0: task do_populate_sysroot: Started
NOTE: recipe xz-5.4.1-r0: task do_package: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_package: Succeeded
NOTE: Running task 1510 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata)
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata: Started
NOTE: recipe libice-1_1.1.1-r0: task do_compile: Succeeded
NOTE: Running task 1511 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_install)
NOTE: recipe xz-5.4.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_install: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_package: Succeeded
NOTE: Running task 1512 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_packagedata)
NOTE: recipe libseccomp-2.5.4-r0: task do_packagedata: Started
NOTE: recipe libice-1_1.1.1-r0: task do_install: Succeeded
NOTE: Running task 1513 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_populate_sysroot)
NOTE: Running task 1514 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_package)
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot: Started
NOTE: recipe libice-1_1.1.1-r0: task do_package: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_packagedata: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1515 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsm-1_1.2.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1516 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_configure)
NOTE: recipe libsm-1_1.2.4-r0: task do_configure: Started
NOTE: recipe zstd-1.5.2-r0: task do_install: Succeeded
NOTE: Running task 1517 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_populate_sysroot)
NOTE: Running task 1518 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_package)
NOTE: recipe zstd-1.5.2-r0: task do_populate_sysroot: Started
NOTE: recipe zstd-1.5.2-r0: task do_package: Started
NOTE: recipe zstd-1.5.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_package: Succeeded
NOTE: Running task 1519 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_packagedata)
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata: Started
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata: Succeeded
NOTE: recipe xz-5.4.1-r0: task do_package: Succeeded
NOTE: Running task 1520 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.1.bb:do_packagedata)
NOTE: recipe xz-5.4.1-r0: task do_packagedata: Started
NOTE: recipe openssl-3.0.7-r0: task do_compile: Succeeded
NOTE: Running task 1521 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_compile_ptest_base)
NOTE: recipe openssl-3.0.7-r0: task do_compile_ptest_base: Started
NOTE: recipe xz-5.4.1-r0: task do_packagedata: Succeeded
NOTE: recipe openssl-3.0.7-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1522 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_install)
NOTE: recipe openssl-3.0.7-r0: task do_install: Started
NOTE: recipe zstd-1.5.2-r0: task do_package: Succeeded
NOTE: Running task 1523 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_packagedata)
NOTE: recipe zstd-1.5.2-r0: task do_packagedata: Started
NOTE: recipe zstd-1.5.2-r0: task do_packagedata: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_configure: Succeeded
NOTE: Running task 1524 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_compile)
NOTE: recipe libxcb-1.15-r0: task do_compile: Started
NOTE: recipe libpcre2-10.42-r0: task do_compile: Succeeded
NOTE: Running task 1525 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_install)
NOTE: recipe libpcre2-10.42-r0: task do_install: Started
NOTE: recipe libpcre2-10.42-r0: task do_install: Succeeded
NOTE: Running task 1526 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_populate_sysroot)
NOTE: Running task 1527 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_package)
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot: Started
NOTE: recipe libpcre2-10.42-r0: task do_package: Started
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_compile: Succeeded
NOTE: Running task 1528 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_install)
NOTE: recipe libxcb-1.15-r0: task do_install: Started
NOTE: recipe libpcre2-10.42-r0: task do_package: Succeeded
NOTE: Running task 1529 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_packagedata)
NOTE: recipe libpcre2-10.42-r0: task do_packagedata: Started
NOTE: recipe libpcre2-10.42-r0: task do_packagedata: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_configure: Succeeded
NOTE: Running task 1530 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_compile)
NOTE: recipe libsm-1_1.2.4-r0: task do_compile: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_compile: Succeeded
NOTE: Running task 1531 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_install)
NOTE: recipe libsm-1_1.2.4-r0: task do_install: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_install: Succeeded
NOTE: Running task 1532 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_populate_sysroot)
NOTE: Running task 1533 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_package)
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_package: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_install: Succeeded
NOTE: Running task 1534 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_populate_sysroot)
NOTE: Running task 1535 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_package)
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot: Started
NOTE: recipe libxcb-1.15-r0: task do_package: Started
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1536 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libx11-1_1.8.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1537 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_configure)
NOTE: recipe libsm-1_1.2.4-r0: task do_package: Succeeded
NOTE: recipe libx11-1_1.8.4-r0: task do_configure: Started
NOTE: Running task 1538 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_packagedata)
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_compile: Succeeded
NOTE: Running task 1539 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_compile_ptest_base)
NOTE: recipe libpam-1.5.2-r0: task do_compile_ptest_base: Started
NOTE: recipe libpam-1.5.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1540 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_install)
NOTE: recipe libpam-1.5.2-r0: task do_install: Started
NOTE: recipe libxcb-1.15-r0: task do_package: Succeeded
NOTE: Running task 1541 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_packagedata)
NOTE: recipe libxcb-1.15-r0: task do_packagedata: Started
NOTE: recipe libxcb-1.15-r0: task do_packagedata: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_install: Succeeded
NOTE: Running task 1542 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_install_ptest_base)
NOTE: recipe libpam-1.5.2-r0: task do_install_ptest_base: Started
NOTE: recipe libpam-1.5.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1543 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_populate_sysroot)
NOTE: Running task 1544 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_package)
NOTE: recipe libpam-1.5.2-r0: task do_package: Started
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot: Started
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_populate_sysroot unihash changed to 801f00139ad767afcff9ff2e68e442c7680b5813772bcd43bf743fbcbce17058
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.66.bb:do_populate_sysroot became valid
NOTE: Running setscene task 463 of 463 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.66.bb:do_populate_sysroot_setscene)
NOTE: Running task 1552 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_populate_sysroot)
NOTE: Running task 1557 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_populate_sysroot)
NOTE: recipe libcap-2.66-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot: Started
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot: Started
NOTE: recipe libcap-2.66-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe sqlite3-3_3.40.1-r0: task do_compile: Succeeded
NOTE: Running task 1570 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.40.1.bb:do_install)
NOTE: recipe sqlite3-3_3.40.1-r0: task do_install: Started
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1571 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sqlite3-3_3.40.1-r0: task do_install: Succeeded
NOTE: Running task 1572 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.40.1.bb:do_populate_sysroot)
NOTE: Running task 1573 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.40.1.bb:do_package)
NOTE: recipe sqlite3-3_3.40.1-r0: task do_populate_sysroot: Started
NOTE: recipe sqlite3-3_3.40.1-r0: task do_package: Started
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1574 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_configure)
NOTE: recipe sqlite3-3_3.40.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_configure: Started
NOTE: recipe sqlite3-3_3.40.1-r0: task do_package: Succeeded
NOTE: Running task 1575 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.40.1.bb:do_packagedata)
NOTE: recipe sqlite3-3_3.40.1-r0: task do_packagedata: Started
NOTE: recipe sqlite3-3_3.40.1-r0: task do_packagedata: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_package unihash changed to b4a528a7514de8eb9e16ce816f83d0efe0f49c84b883a6778e9284ba980b2ba4
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata became valid
NOTE: Running setscene task 463 of 463 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1577 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_package)
NOTE: Running task 1578 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_package)
NOTE: Running task 1579 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.66.bb:do_package)
NOTE: recipe libcap-2.66-r0: task do_package: Started
NOTE: recipe shadow-4.13-r0: task do_package: Started
NOTE: recipe util-linux-2.38.1-r0: task do_package: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_configure: Succeeded
NOTE: Running task 1580 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_compile)
NOTE: recipe libx11-1_1.8.4-r0: task do_compile: Started
NOTE: recipe libcap-2.66-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.66.bb:do_package unihash changed to e2bf94cced7389a9fa5402df315727073e230dbffa6afa18de78996588f2f0d0
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.66.bb:do_packagedata became valid
NOTE: Running setscene task 463 of 463 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.66.bb:do_packagedata_setscene)
NOTE: recipe libcap-2.66-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.66-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1582 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_package)
NOTE: recipe coreutils-9.1-r0: task do_package: Started
NOTE: recipe shadow-4.13-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_package unihash changed to db736dc20656be0046015f3d4ed967c5fa2dfb2cecef7f6d2f7ca3cf16162aca
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_packagedata became valid
NOTE: Running setscene task 463 of 463 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe openssl-3.0.7-r0: task do_install: Succeeded
NOTE: Running task 1584 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_install_ptest_base)
NOTE: recipe perl-5.36.0-r0: task do_package: Succeeded
NOTE: recipe openssl-3.0.7-r0: task do_install_ptest_base: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_package unihash changed to 86a3c3c4f45ec78af785b5886c93eb35b484654c78fd938b2a9cb28e7c862e4e
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_packagedata became valid
NOTE: Running setscene task 463 of 463 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_packagedata_setscene)
NOTE: recipe perl-5.36.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_compile: Succeeded
NOTE: Running task 1585 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_install)
NOTE: recipe libx11-1_1.8.4-r0: task do_install: Started
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_configure: Succeeded
NOTE: Running task 1586 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_configure_ptest_base)
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_configure_ptest_base: Started
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1587 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_compile)
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_compile: Started
NOTE: recipe openssl-3.0.7-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1588 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_populate_sysroot)
NOTE: Running task 1589 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_package)
NOTE: recipe openssl-3.0.7-r0: task do_populate_sysroot: Started
NOTE: recipe openssl-3.0.7-r0: task do_package: Started
NOTE: recipe openssl-3.0.7-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1590 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1591 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_prepare_recipe_sysroot)
NOTE: recipe kmod-30-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-3.11.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe kmod-30-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1592 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_configure)
NOTE: recipe python3-3.11.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1593 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.1.bb:do_configure)
NOTE: recipe kmod-30-r0: task do_configure: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_install: Succeeded
NOTE: recipe python3-3.11.1-r0: task do_configure: Started
NOTE: Running task 1594 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_populate_sysroot)
NOTE: Running task 1595 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_package)
NOTE: recipe libx11-1_1.8.4-r0: task do_populate_sysroot: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_package: Started
NOTE: recipe perl-5.36.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libx11-1_1.8.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libx11-1_1.8.4-r0: task do_package: Succeeded
NOTE: Running task 1597 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_packagedata)
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_compile: Succeeded
NOTE: Running task 1598 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_compile_ptest_base)
NOTE: recipe libx11-1_1.8.4-r0: task do_packagedata: Started
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_compile_ptest_base: Started
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1599 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_install)
NOTE: recipe libx11-1_1.8.4-r0: task do_packagedata: Succeeded
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_install: Started
NOTE: recipe util-linux-2.38.1-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_package unihash changed to c9da803abcf3c7f730a8cc8c8a6788cfcfb9342b401d5069ba61a0f8d233074a
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_packagedata became valid
NOTE: Running setscene task 458 of 463 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_packagedata_setscene)
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.1-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_package unihash changed to 62754e53fd9e9ccb19fdbaeacee087f4c203306c312ff98bfbd7a45ee9852730
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_packagedata became valid
NOTE: Running setscene task 463 of 463 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_packagedata_setscene)
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_install: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1602 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_install_ptest_base)
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_install_ptest_base: Started
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1603 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_populate_sysroot)
NOTE: Running task 1604 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_package)
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_populate_sysroot: Started
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_package: Started
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe kmod-30-r0: task do_configure: Succeeded
NOTE: Running task 1605 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_compile)
NOTE: recipe kmod-30-r0: task do_compile: Started
NOTE: recipe kmod-30-r0: task do_compile: Succeeded
NOTE: Running task 1606 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_install)
NOTE: recipe kmod-30-r0: task do_install: Started
NOTE: recipe kmod-30-r0: task do_install: Succeeded
NOTE: Running task 1607 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_populate_sysroot)
NOTE: recipe kmod-30-r0: task do_populate_sysroot: Started
NOTE: recipe kmod-30-r0: task do_populate_sysroot: Succeeded
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_package: Succeeded
NOTE: Running task 1608 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_packagedata)
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_packagedata: Started
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_packagedata: Succeeded
NOTE: recipe python3-3.11.1-r0: task do_configure: Succeeded
NOTE: Running task 1609 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.1.bb:do_configure_ptest_base)
NOTE: recipe python3-3.11.1-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-3.11.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1610 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.1.bb:do_compile)
NOTE: recipe python3-3.11.1-r0: task do_compile: Started
NOTE: recipe openssl-3.0.7-r0: task do_package: Succeeded
NOTE: Running task 1611 of 1675 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_packagedata)
NOTE: recipe openssl-3.0.7-r0: task do_packagedata: Started
NOTE: recipe openssl-3.0.7-r0: task do_packagedata: Failed
NOTE: recipe glibc-locale-2.37-r0: task do_package: Succeeded
NOTE: recipe python3-3.11.1-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1611 tasks of which 1209 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 16 ERROR messages, returning a non-zero exit code.
ERROR: openssl-3.0.7-r0 do_packagedata: QA Issue: Package version for package openssl-src went backwards which would break package feeds (from 0:3.0.8-r0 to 0:3.0.7-r0) [version-going-backwards]
ERROR: openssl-3.0.7-r0 do_packagedata: QA Issue: Package version for package openssl-dbg went backwards which would break package feeds (from 0:3.0.8-r0 to 0:3.0.7-r0) [version-going-backwards]
ERROR: openssl-3.0.7-r0 do_packagedata: QA Issue: Package version for package libcrypto went backwards which would break package feeds (from 0:3.0.8-r0 to 0:3.0.7-r0) [version-going-backwards]
ERROR: openssl-3.0.7-r0 do_packagedata: QA Issue: Package version for package libssl went backwards which would break package feeds (from 0:3.0.8-r0 to 0:3.0.7-r0) [version-going-backwards]
ERROR: openssl-3.0.7-r0 do_packagedata: QA Issue: Package version for package openssl-conf went backwards which would break package feeds (from 0:3.0.8-r0 to 0:3.0.7-r0) [version-going-backwards]
ERROR: openssl-3.0.7-r0 do_packagedata: QA Issue: Package version for package openssl-engines went backwards which would break package feeds (from 0:3.0.8-r0 to 0:3.0.7-r0) [version-going-backwards]
ERROR: openssl-3.0.7-r0 do_packagedata: QA Issue: Package version for package openssl-misc went backwards which would break package feeds (from 0:3.0.8-r0 to 0:3.0.7-r0) [version-going-backwards]
ERROR: openssl-3.0.7-r0 do_packagedata: QA Issue: Package version for package openssl-ossl-module-legacy went backwards which would break package feeds (from 0:3.0.8-r0 to 0:3.0.7-r0) [version-going-backwards]
ERROR: openssl-3.0.7-r0 do_packagedata: QA Issue: Package version for package openssl-ptest went backwards which would break package feeds (from 0:3.0.8-r0 to 0:3.0.7-r0) [version-going-backwards]
ERROR: openssl-3.0.7-r0 do_packagedata: QA Issue: Package version for package openssl-staticdev went backwards which would break package feeds (from 0:3.0.8-r0 to 0:3.0.7-r0) [version-going-backwards]
ERROR: openssl-3.0.7-r0 do_packagedata: QA Issue: Package version for package openssl-dev went backwards which would break package feeds (from 0:3.0.8-r0 to 0:3.0.7-r0) [version-going-backwards]
ERROR: openssl-3.0.7-r0 do_packagedata: QA Issue: Package version for package openssl-doc went backwards which would break package feeds (from 0:3.0.8-r0 to 0:3.0.7-r0) [version-going-backwards]
ERROR: openssl-3.0.7-r0 do_packagedata: QA Issue: Package version for package openssl-locale went backwards which would break package feeds (from 0:3.0.8-r0 to 0:3.0.7-r0) [version-going-backwards]
ERROR: openssl-3.0.7-r0 do_packagedata: QA Issue: Package version for package openssl-bin went backwards which would break package feeds (from 0:3.0.8-r0 to 0:3.0.7-r0) [version-going-backwards]
ERROR: openssl-3.0.7-r0 do_packagedata: QA Issue: Package version for package openssl went backwards which would break package feeds (from 0:3.0.8-r0 to 0:3.0.7-r0) [version-going-backwards]
ERROR: openssl-3.0.7-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/openssl/3.0.7-r0/temp/log.do_packagedata.3963840
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_packagedata) failed with exit code '1'

--===============3884219113494210688==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 895 .bb files complete (0 cached, 895 parsed). 1693 targets, 65 skipped, 0 masked, 0 errors.
Removing 1 recipes from the mips32r2 sysroot...done.
Removing 1 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-f3751bf025630bda15f4496c36874f8d0f79ac2f"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:f3751bf025630bda15f4496c36874f8d0f79ac2f"
workspace            = "master:44311c454d0b0856f58cfa6fa60669903b2ba3af"

Initialising tasks...done.
Sstate summary: Wanted 205 Local 6 Mirrors 0 Missed 199 Current 254 (2% match, 56% complete)
Removing 29 stale sstate objects for arch qemumips...done.
Removing 31 stale sstate objects for arch mips32r2...done.
NOTE: Executing Tasks
NOTE: Running setscene task 274 of 459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 310 of 459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/autoconf-archive/autoconf-archive_2022.09.03.bb:do_packagedata_setscene)
NOTE: Running setscene task 315 of 459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland-protocols_1.31.bb:do_packagedata_setscene)
NOTE: Running setscene task 455 of 459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.37.bb:do_packagedata_setscene)
NOTE: recipe update-rc.d-0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe autoconf-archive-2022.09.03-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-protocols-1.31-r0: task do_packagedata_setscene: Started
NOTE: recipe glibc-2.37-r0: task do_packagedata_setscene: Started
NOTE: Running task 399 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_fetch)
NOTE: Running task 400 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_fetch)
NOTE: recipe wayland-protocols-1.31-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe autoconf-archive-2022.09.03-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe update-rc.d-0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 467 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_fetch)
NOTE: Running task 486 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_fetch)
NOTE: Running task 490 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.1.bb:do_fetch)
NOTE: Running task 491 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.40.1.bb:do_fetch)
NOTE: Running task 492 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_fetch)
NOTE: Running task 494 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.1.bb:do_fetch)
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Started
NOTE: recipe openssl-3.0.7-r0: task do_fetch: Started
NOTE: Running task 721 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_fetch)
NOTE: Running task 737 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.3.bb:do_fetch)
NOTE: recipe libtirpc-1.3.3-r0: task do_fetch: Started
NOTE: recipe libffi-3.4.4-r0: task do_fetch: Started
NOTE: recipe sqlite3-3_3.40.1-r0: task do_fetch: Started
NOTE: recipe xz-5.4.1-r0: task do_fetch: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_fetch: Started
NOTE: recipe openssl-3.0.7-r0: task do_fetch: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_fetch: Succeeded
NOTE: Running task 816 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_unpack)
NOTE: Running task 817 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_unpack)
NOTE: Running task 819 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_fetch)
NOTE: Running task 827 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_fetch)
NOTE: Running task 828 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_fetch)
NOTE: Running task 830 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_fetch)
NOTE: Running task 833 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_fetch)
NOTE: recipe libffi-3.4.4-r0: task do_fetch: Succeeded
NOTE: recipe xz-5.4.1-r0: task do_fetch: Succeeded
NOTE: Running task 843 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_fetch)
NOTE: Running task 851 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_write_config)
NOTE: recipe sqlite3-3_3.40.1-r0: task do_fetch: Succeeded
NOTE: Running task 852 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_write_config)
NOTE: Running task 853 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_unpack)
NOTE: Running task 854 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.1.bb:do_unpack)
NOTE: Running task 855 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.40.1.bb:do_unpack)
NOTE: Running task 857 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_fetch)
NOTE: Running task 858 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_write_config)
NOTE: Running task 859 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_fetch)
NOTE: Running task 860 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_fetch)
NOTE: Running task 861 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_fetch)
NOTE: Running task 862 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_fetch)
NOTE: Running task 863 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_fetch)
NOTE: Running task 868 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_fetch)
NOTE: Running task 872 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_fetch)
NOTE: Running task 874 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_fetch)
NOTE: Running task 891 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_fetch)
NOTE: Running task 892 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_fetch)
NOTE: Running task 893 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_fetch)
NOTE: Running task 897 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_252.5.bb:do_fetch)
NOTE: Running task 898 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_fetch)
NOTE: Running task 906 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_fetch)
NOTE: Running task 907 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_fetch)
NOTE: Running task 908 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_fetch)
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Succeeded
NOTE: Running task 920 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libnsl2-2.0.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-3.11.1-r0: task do_fetch: Started
NOTE: Running task 922 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_unpack)
NOTE: recipe glibc-2.37-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 923 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_unpack)
NOTE: recipe libxml2-2.10.3-r0: task do_fetch: Started
NOTE: recipe expat-2.5.0-r0: task do_fetch: Started
NOTE: Setscene tasks completed
NOTE: recipe util-macros-1_1.19.3-r0: task do_fetch: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_unpack: Started
NOTE: recipe xorgproto-2022.2-r0: task do_fetch: Started
NOTE: recipe libpcre2-10.42-r0: task do_fetch: Started
NOTE: recipe libffi-3.4.4-r0: task do_unpack: Started
NOTE: recipe python3-3.11.1-r0: task do_fetch: Succeeded
NOTE: recipe libxml2-2.10.3-r0: task do_fetch: Succeeded
NOTE: recipe sqlite3-3_3.40.1-r0: task do_unpack: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_fetch: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_write_config: Started
NOTE: recipe xz-5.4.1-r0: task do_unpack: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_fetch: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_fetch: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_fetch: Started
NOTE: recipe xorgproto-2022.2-r0: task do_fetch: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_fetch: Succeeded
NOTE: recipe wayland-1.21.0-r0: task do_write_config: Started
NOTE: recipe expat-2.5.0-r0: task do_fetch: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_fetch: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_fetch: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_fetch: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_fetch: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_fetch: Started
NOTE: recipe libxcb-1.15-r0: task do_fetch: Started
NOTE: recipe openssl-3.0.7-r0: task do_unpack: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_fetch: Succeeded
NOTE: recipe wayland-1.21.0-r0: task do_fetch: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_fetch: Started
NOTE: recipe initscripts-1.0-r155: task do_fetch: Started
NOTE: recipe xorgproto-2022.2-r0: task do_write_config: Succeeded
NOTE: recipe libx11-1_1.8.4-r0: task do_fetch: Started
NOTE: recipe zstd-1.5.2-r0: task do_fetch: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_fetch: Started
NOTE: recipe wayland-1.21.0-r0: task do_write_config: Succeeded
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_fetch: Started
NOTE: recipe libffi-3.4.4-r0: task do_unpack: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_fetch: Started
NOTE: recipe libxcb-1.15-r0: task do_fetch: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_fetch: Started
NOTE: recipe xkeyboard-config-2.38-r0: task do_fetch: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_fetch: Succeeded
NOTE: recipe xz-5.4.1-r0: task do_unpack: Succeeded
NOTE: recipe libxkbcommon-1.5.0-r0: task do_fetch: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_fetch: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_fetch: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_fetch: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_fetch: Succeeded
NOTE: recipe sqlite3-3_3.40.1-r0: task do_unpack: Succeeded
NOTE: recipe wayland-1.21.0-r0: task do_fetch: Succeeded
NOTE: recipe xkeyboard-config-2.38-r0: task do_fetch: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_unpack: Succeeded
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_write_config: Started
NOTE: recipe dbus-1.14.6-r0: task do_fetch: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_fetch: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_fetch: Succeeded
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_fetch: Succeeded
NOTE: recipe kmod-30-r0: task do_fetch: Started
NOTE: recipe initscripts-1.0-r155: task do_fetch: Succeeded
NOTE: recipe dbus-1.14.6-r0: task do_fetch: Succeeded
NOTE: recipe zstd-1.5.2-r0: task do_fetch: Succeeded
NOTE: recipe systemd-1_252.5-r0: task do_fetch: Started
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_write_config: Succeeded
NOTE: recipe kmod-30-r0: task do_fetch: Succeeded
NOTE: recipe systemd-1_252.5-r0: task do_fetch: Succeeded
NOTE: Running task 960 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 961 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 968 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_patch)
NOTE: Running task 978 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_patch)
NOTE: Running task 981 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.1.bb:do_patch)
NOTE: Running task 982 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 985 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.40.1.bb:do_patch)
NOTE: Running task 986 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.1.bb:do_unpack)
NOTE: Running task 999 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1000 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1002 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.40.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1016 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libnsl2-2.0.0-r0: task do_unpack: Started
NOTE: Running task 1017 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_unpack)
NOTE: Running task 1018 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.3.bb:do_unpack)
NOTE: Running task 1021 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Started
NOTE: Running task 1042 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_unpack)
NOTE: Running task 1043 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_unpack)
NOTE: Running task 1044 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_unpack)
NOTE: Running task 1045 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_unpack)
NOTE: Running task 1046 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_unpack)
NOTE: Running task 1048 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1050 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1053 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_unpack)
NOTE: Running task 1054 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_unpack)
NOTE: Running task 1057 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_unpack)
NOTE: Running task 1058 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_unpack)
NOTE: Running task 1059 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_unpack)
NOTE: Running task 1060 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_unpack)
NOTE: Running task 1061 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_package)
NOTE: recipe bzip2-1.0.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe openssl-3.0.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libffi-3.4.4-r0: task do_patch: Started
NOTE: Running task 1062 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_unpack)
NOTE: recipe xz-5.4.1-r0: task do_patch: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_patch: Started
NOTE: recipe sqlite3-3_3.40.1-r0: task do_patch: Started
NOTE: recipe xz-5.4.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sqlite3-3_3.40.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libffi-3.4.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1063 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_unpack)
NOTE: recipe libpam-1.5.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe expat-2.5.0-r0: task do_unpack: Started
NOTE: recipe expat-2.5.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_unpack: Started
NOTE: recipe libxml2-2.10.3-r0: task do_unpack: Started
NOTE: recipe xorgproto-2022.2-r0: task do_unpack: Started
NOTE: recipe python3-3.11.1-r0: task do_unpack: Started
NOTE: recipe libpcre2-10.42-r0: task do_unpack: Started
NOTE: recipe wayland-1.21.0-r0: task do_unpack: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_unpack: Succeeded
NOTE: Running task 1064 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe base-passwd-3.6.1-r0: task do_unpack: Started
NOTE: recipe xz-5.4.1-r0: task do_patch: Succeeded
NOTE: Running task 1065 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_patch)
NOTE: recipe xorgproto-2022.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_unpack: Started
NOTE: recipe sqlite3-3_3.40.1-r0: task do_patch: Succeeded
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_unpack: Started
NOTE: Running task 1066 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_unpack)
NOTE: Running task 1067 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1068 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.40.1.bb:do_deploy_source_date_epoch)
NOTE: recipe xtrans-1_1.4.0-r0: task do_unpack: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_unpack: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_unpack: Started
NOTE: Running task 1069 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_unpack)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_unpack: Started
NOTE: Running task 1072 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_package)
NOTE: Running task 1073 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpthread-stubs-0.4-r0: task do_unpack: Succeeded
NOTE: Running task 1074 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1075 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_patch)
NOTE: Running task 1076 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_unpack)
NOTE: Running task 1077 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_unpack)
NOTE: Running task 1078 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_unpack)
NOTE: Running task 1079 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.33.bb:do_package)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: Running task 1081 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe openssl-3.0.7-r0: task do_unpack: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_package: Started
NOTE: recipe expat-2.5.0-r0: task do_unpack: Succeeded
NOTE: Running task 1090 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_patch)
NOTE: recipe xtrans-1_1.4.0-r0: task do_unpack: Succeeded
NOTE: Running task 1091 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_patch)
NOTE: Running task 1092 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_patch)
NOTE: Running task 1100 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_252.5.bb:do_unpack)
NOTE: Running task 1101 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_unpack)
NOTE: Running task 1116 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_unpack)
NOTE: Running task 1117 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_unpack)
NOTE: Running task 1120 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_unpack)
NOTE: Running task 1127 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_write_config)
NOTE: Running task 1137 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libffi-3.4.4-r0: task do_patch: Succeeded
NOTE: Running task 1138 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_write_config)
NOTE: Running task 1141 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_deploy_source_date_epoch)
NOTE: recipe wayland-1.21.0-r0: task do_unpack: Succeeded
NOTE: Running task 1143 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_patch)
NOTE: recipe base-passwd-3.6.1-r0: task do_unpack: Succeeded
NOTE: Running task 1144 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_package)
NOTE: recipe xcb-proto-1.15.2-r0: task do_unpack: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_unpack: Succeeded
NOTE: Running task 1145 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_patch)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_unpack: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_unpack: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_unpack: Succeeded
NOTE: Running task 1146 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_patch)
NOTE: recipe initscripts-1.0-r155: task do_unpack: Started
NOTE: recipe zlib-1.2.13-r0: task do_package: Started
NOTE: Running task 1147 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_patch)
NOTE: recipe libpam-1.5.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_unpack: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_unpack: Started
NOTE: recipe libpcre2-10.42-r0: task do_unpack: Succeeded
NOTE: recipe sqlite3-3_3.40.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1148 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_configure)
NOTE: recipe openssl-3.0.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_patch: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xz-5.4.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_patch: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_unpack: Succeeded
NOTE: Running task 1149 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_deploy_source_date_epoch)
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Succeeded
NOTE: recipe xz-5.4.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe expat-2.5.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe sqlite3-3_3.40.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcrypt-4.4.33-r0: task do_package: Started
NOTE: Running task 1150 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_patch)
NOTE: recipe xkeyboard-config-2.38-r0: task do_unpack: Started
NOTE: Running task 1151 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_patch)
NOTE: recipe util-macros-1_1.19.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_patch: Succeeded
NOTE: Running task 1152 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_patch)
NOTE: recipe libpthread-stubs-0.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe zstd-1.5.2-r0: task do_unpack: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_unpack: Started
NOTE: Running task 1153 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_deploy_source_date_epoch)
NOTE: recipe initscripts-1.0-r155: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_patch: Started
NOTE: Running task 1154 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_patch)
NOTE: recipe libxcb-1.15-r0: task do_unpack: Succeeded
NOTE: recipe kmod-30-r0: task do_unpack: Started
NOTE: recipe openssl-3.0.7-r0: task do_patch: Started
NOTE: recipe libice-1_1.1.1-r0: task do_unpack: Started
NOTE: Running task 1155 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_patch)
NOTE: recipe expat-2.5.0-r0: task do_patch: Started
NOTE: recipe initscripts-1.0-r155: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_unpack: Started
NOTE: recipe xkeyboard-config-2.38-r0: task do_write_config: Started
NOTE: Running task 1156 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_patch)
NOTE: recipe initscripts-1.0-r155: task do_unpack: Succeeded
NOTE: recipe zstd-1.5.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xorgproto-2022.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_patch: Started
NOTE: Running task 1157 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_patch)
NOTE: recipe libx11-1_1.8.4-r0: task do_unpack: Started
NOTE: recipe expat-2.5.0-r0: task do_patch: Succeeded
NOTE: Running task 1158 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_patch)
NOTE: Running task 1159 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_generate_toolchain_file)
NOTE: recipe wayland-1.21.0-r0: task do_patch: Started
NOTE: Running task 1160 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_deploy_source_date_epoch)
NOTE: recipe xkeyboard-config-2.38-r0: task do_unpack: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_patch: Started
NOTE: recipe libffi-3.4.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_write_config: Started
NOTE: recipe dbus-1.14.6-r0: task do_unpack: Started
NOTE: Running task 1162 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_patch)
NOTE: recipe xorgproto-2022.2-r0: task do_patch: Started
NOTE: recipe sqlite3-3_3.40.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xkeyboard-config-2.38-r0: task do_write_config: Succeeded
NOTE: recipe systemd-1_252.5-r0: task do_unpack: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_patch: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_unpack: Succeeded
NOTE: recipe xz-5.4.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1176 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.40.1.bb:do_configure)
NOTE: recipe libice-1_1.1.1-r0: task do_unpack: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_package: Started
NOTE: Running task 1177 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_patch)
NOTE: recipe libpam-1.5.2-r0: task do_configure: Started
NOTE: Running task 1178 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.1.bb:do_configure)
NOTE: recipe libtirpc-1.3.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1179 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_patch)
NOTE: recipe libsm-1_1.2.4-r0: task do_unpack: Succeeded
NOTE: Running task 1182 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_patch)
NOTE: recipe xorgproto-2022.2-r0: task do_patch: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpcre2-10.42-r0: task do_patch: Started
NOTE: Running task 1184 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libxkbcommon-1.5.0-r0: task do_write_config: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_patch: Started
NOTE: recipe initscripts-1.0-r155: task do_patch: Started
NOTE: Running task 1186 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_252.5.bb:do_warn_musl)
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_patch: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_patch: Succeeded
NOTE: Running task 1187 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_252.5.bb:do_write_config)
NOTE: recipe libxcb-1.15-r0: task do_patch: Started
NOTE: Running task 1188 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package)
NOTE: recipe libxau-1_1.0.11-r0: task do_patch: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_patch: Started
NOTE: Running task 1189 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_deploy_source_date_epoch)
NOTE: recipe libxml2-2.10.3-r0: task do_unpack: Succeeded
NOTE: recipe wayland-1.21.0-r0: task do_patch: Succeeded
NOTE: Running task 1191 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.3.bb:do_patch)
NOTE: recipe expat-2.5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1192 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_deploy_source_date_epoch)
NOTE: recipe xkeyboard-config-2.38-r0: task do_patch: Started
NOTE: recipe expat-2.5.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_patch: Succeeded
NOTE: Running task 1195 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_patch: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_patch: Succeeded
NOTE: recipe sqlite3-3_3.40.1-r0: task do_configure: Started
NOTE: Running task 1197 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_deploy_source_date_epoch)
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_unpack: Succeeded
NOTE: Running task 1198 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_deploy_source_date_epoch)
NOTE: Running task 1199 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1200 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_patch)
NOTE: recipe libpcre2-10.42-r0: task do_patch: Succeeded
NOTE: Running task 1204 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_package)
NOTE: recipe xz-5.4.1-r0: task do_configure: Started
NOTE: recipe libice-1_1.1.1-r0: task do_patch: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_patch: Started
NOTE: Running task 1206 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_deploy_source_date_epoch)
NOTE: recipe xkeyboard-config-2.38-r0: task do_patch: Succeeded
NOTE: recipe libxkbcommon-1.5.0-r0: task do_patch: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_patch: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_patch: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1207 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_deploy_source_date_epoch)
NOTE: recipe openssl-3.0.7-r0: task do_patch: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_patch: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_patch: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe zstd-1.5.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1208 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_deploy_source_date_epoch)
NOTE: Running task 1209 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1210 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_configure)
NOTE: recipe dbus-1.14.6-r0: task do_unpack: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1211 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_deploy_source_date_epoch)
NOTE: recipe libsm-1_1.2.4-r0: task do_patch: Succeeded
NOTE: Running task 1212 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libice-1_1.1.1-r0: task do_patch: Succeeded
NOTE: recipe libxkbcommon-1.5.0-r0: task do_patch: Succeeded
NOTE: Running task 1213 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_patch)
NOTE: recipe util-macros-1_1.19.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1214 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_deploy_source_date_epoch)
NOTE: recipe libxml2-2.10.3-r0: task do_patch: Started
NOTE: Running task 1215 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_deploy_source_date_epoch)
NOTE: recipe systemd-1_252.5-r0: task do_warn_musl: Started
NOTE: recipe systemd-1_252.5-r0: task do_write_config: Started
NOTE: Running task 1216 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_configure)
NOTE: recipe systemd-1_252.5-r0: task do_warn_musl: Succeeded
NOTE: recipe libx11-1_1.8.4-r0: task do_unpack: Succeeded
NOTE: Running task 1217 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_configure)
NOTE: recipe wayland-1.21.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1218 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_patch)
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1219 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libxau-1_1.0.11-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1220 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1226 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_configure)
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe systemd-1_252.5-r0: task do_write_config: Succeeded
NOTE: Running task 1227 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe zstd-1.5.2-r0: task do_unpack: Succeeded
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_patch: Started
NOTE: Running task 1230 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_patch)
NOTE: recipe libffi-3.4.4-r0: task do_configure: Started
NOTE: recipe libxcb-1.15-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bash-completion-2.11-r0: task do_package: Started
NOTE: Running task 1232 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_package)
NOTE: recipe libpcre2-10.42-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe kmod-30-r0: task do_unpack: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_patch: Succeeded
NOTE: recipe openssl-3.0.7-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1233 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_package)
NOTE: recipe initscripts-1.0-r155: task do_deploy_source_date_epoch: Started
NOTE: Running task 1234 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1235 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_patch)
NOTE: recipe libxkbcommon-1.5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_configure: Started
NOTE: recipe xorgproto-2022.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xkeyboard-config-2.38-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1242 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe libx11-1_1.8.4-r0: task do_patch: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_patch: Succeeded
NOTE: Running task 1243 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_configure)
NOTE: recipe util-macros-1_1.19.3-r0: task do_configure: Started
NOTE: recipe dbus-1.14.6-r0: task do_patch: Started
NOTE: Running task 1244 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libnsl2-2.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_package: Started
NOTE: Running task 1251 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_fetch)
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe zstd-1.5.2-r0: task do_patch: Started
NOTE: recipe expat-2.5.0-r0: task do_configure: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe wayland-1.21.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_patch: Succeeded
NOTE: Running task 1268 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_configure)
NOTE: recipe zstd-1.5.2-r0: task do_patch: Succeeded
NOTE: recipe dbus-1.14.6-r0: task do_patch: Succeeded
NOTE: recipe libxml2-2.10.3-r0: task do_patch: Succeeded
NOTE: Running task 1269 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_configure)
NOTE: recipe kmod-30-r0: task do_patch: Started
NOTE: recipe libxcb-1.15-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1270 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1271 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_deploy_source_date_epoch)
NOTE: recipe base-passwd-3.6.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpcre2-10.42-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_package: Started
NOTE: Running task 1272 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libcap-ng-0.8.3-r0: task do_package: Started
NOTE: Running task 1273 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe openssl-3.0.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_configure: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_fetch: Started
NOTE: recipe initscripts-1.0-r155: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1279 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_configure)
NOTE: recipe xkeyboard-config-2.38-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1281 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_configure)
NOTE: recipe libxkbcommon-1.5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1298 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_package)
NOTE: Running task 1299 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.bb:do_package)
NOTE: recipe libice-1_1.1.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_fetch: Succeeded
NOTE: Running task 1319 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_unpack)
NOTE: recipe zstd-1.5.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1329 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_package)
NOTE: Running task 1338 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-locale_2.37.bb:do_package)
NOTE: recipe bzip2-1.0.8-r0: task do_configure: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1340 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_populate_lic)
NOTE: recipe kmod-30-r0: task do_patch: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_configure: Started
NOTE: Running task 1341 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_deploy_source_date_epoch)
NOTE: recipe openssl-3.0.7-r0: task do_configure: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_configure: Started
NOTE: recipe libxml2-2.10.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1342 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_configure)
NOTE: recipe dbus-1.14.6-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1343 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_configure)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_unpack: Started
NOTE: recipe initscripts-1.0-r155: task do_configure: Succeeded
NOTE: Running task 1344 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_compile)
NOTE: recipe kmod-30-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: recipe dbus-1.14.6-r0: task do_populate_lic: Started
NOTE: recipe gmp-6.2.1-r0: task do_package: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_package: Started
NOTE: recipe make-4.4-r0: task do_package: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_configure: Started
NOTE: recipe glibc-locale-2.37-r0: task do_package: Started
NOTE: recipe zstd-1.5.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libx11-1_1.8.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1345 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_configure)
NOTE: recipe base-passwd-3.6.1-r0: task do_configure: Started
NOTE: recipe libxml2-2.10.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_compile: Started
NOTE: recipe dbus-1.14.6-r0: task do_populate_lic: Succeeded
NOTE: recipe dbus-1.14.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_populate_lic unihash changed to c42e125fb5e65f091cff4c5a9180972d9c08c6b0fcbec6c44d5df55dcc16450b
NOTE: recipe initscripts-1.0-r155: task do_compile: Succeeded
NOTE: Running task 1346 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_install)
NOTE: recipe kmod-30-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe zstd-1.5.2-r0: task do_configure: Started
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_patch: Succeeded
NOTE: Running task 1347 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_deploy_source_date_epoch)
NOTE: recipe systemd-1_252.5-r0: task do_unpack: Succeeded
NOTE: Running task 1348 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_252.5.bb:do_patch)
NOTE: recipe python3-3.11.1-r0: task do_unpack: Succeeded
NOTE: Running task 1349 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.1.bb:do_patch)
NOTE: recipe zstd-1.5.2-r0: task do_configure: Succeeded
NOTE: Running task 1350 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_compile)
NOTE: recipe initscripts-1.0-r155: task do_install: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_unpack: Succeeded
NOTE: Running task 1351 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_patch)
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe zstd-1.5.2-r0: task do_compile: Started
NOTE: recipe python3-3.11.1-r0: task do_patch: Started
NOTE: recipe systemd-1_252.5-r0: task do_patch: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_patch: Started
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_package unihash changed to 8d738f8307e68b708e7333feed19ba7857ec8a018f5214172dae52c89a52d8bf
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata became valid
NOTE: Running setscene task 459 of 459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_patch: Succeeded
NOTE: Running task 1352 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_deploy_source_date_epoch)
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1354 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_package)
NOTE: Running task 1355 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_package)
NOTE: Running task 1356 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_package)
NOTE: recipe zlib-1.2.13-r0: task do_package: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_package: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_package unihash changed to e1ffb6efe6f934b07430191dd3981d5c925d4d500d516caecbf5d5e4809d37e9
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata became valid
NOTE: recipe sed-4.9-r0: task do_package: Started
NOTE: recipe libxcrypt-4.4.33-r0: task do_package: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_package: Started
NOTE: Running setscene task 459 of 459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata_setscene)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.33.bb:do_package unihash changed to 9d07653fc3094e07f04ac5206b921dd2bd835613ffd0aa3a044f3f8961ccce1c
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.33.bb:do_packagedata became valid
NOTE: recipe systemd-1_252.5-r0: task do_patch: Succeeded
NOTE: Running setscene task 456 of 459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxcrypt/libxcrypt_4.4.33.bb:do_packagedata_setscene)
NOTE: Running task 1357 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_252.5.bb:do_deploy_source_date_epoch)
NOTE: recipe systemd-1_252.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcrypt-4.4.33-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2022.2-r0: task do_configure: Succeeded
NOTE: Running task 1358 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_compile)
NOTE: recipe libxcrypt-4.4.33-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1361 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_package)
NOTE: recipe xorgproto-2022.2-r0: task do_compile: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_package: Succeeded
NOTE: recipe systemd-1_252.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_package unihash changed to ff85b3f31a3ecf4287c87e32a603cf0b2bda3d460063dc59c81da1a0c1194896
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_packagedata became valid
NOTE: Running setscene task 459 of 459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_packagedata_setscene)
NOTE: recipe cracklib-2.9.8-r0: task do_package: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 1362 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe xorgproto-2022.2-r0: task do_compile: Succeeded
NOTE: Running task 1363 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_install)
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_install: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_package: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 046205aa66778148b3471ca4f7fc14af418b4fb272b1d1f1c69cf6355dc24e4e
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_package unihash changed to 45bd7e8477f264b30a795fbb306ef0570178eb574491f26203c80a55ebc07800
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata became valid
NOTE: Running setscene task 459 of 459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: recipe libcap-ng-0.8.3-r0: task do_package: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_configure: Succeeded
NOTE: Running task 1365 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_configure_ptest_base)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_package unihash changed to e745becd8c7a11f13a17accd9c4adbaca4a02098b5b18588f515a4aecdc37cf9
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_packagedata became valid
NOTE: Running setscene task 459 of 459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_packagedata_setscene)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_install: Succeeded
NOTE: Running task 1366 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot)
NOTE: Running task 1367 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_package)
NOTE: recipe expat-2.5.0-r0: task do_configure_ptest_base: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1368 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_compile)
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot: Started
NOTE: recipe initscripts-1.0-r155: task do_package: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_compile: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_configure: Succeeded
NOTE: Running task 1371 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_compile)
NOTE: recipe xorgproto-2022.2-r0: task do_install: Succeeded
NOTE: recipe python3-3.11.1-r0: task do_patch: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1372 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1373 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_populate_sysroot)
NOTE: Running task 1374 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_package)
NOTE: recipe util-macros-1_1.19.3-r0: task do_compile: Started
NOTE: recipe xorgproto-2022.2-r0: task do_populate_sysroot: Started
NOTE: recipe xorgproto-2022.2-r0: task do_package: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_compile: Succeeded
NOTE: Running task 1375 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_install)
NOTE: recipe python3-3.11.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_install: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_configure: Succeeded
NOTE: Running task 1376 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_compile)
NOTE: recipe python3-3.11.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_compile: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_install: Succeeded
NOTE: recipe make-4.4-r0: task do_package: Succeeded
NOTE: Running task 1377 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_populate_sysroot)
NOTE: Running task 1378 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_package)
NOTE: recipe xorgproto-2022.2-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.bb:do_package unihash changed to 6a5bc0767b003f3188651c5800dd2d6f5959e3f2443d887cdf5ec0b85edf5584
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.bb:do_packagedata became valid
NOTE: Running setscene task 459 of 459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.bb:do_packagedata_setscene)
NOTE: recipe gmp-6.2.1-r0: task do_package: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_compile: Succeeded
NOTE: Running task 1379 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_install)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_package unihash changed to ead81f75f697a0383cb4dc933d99fbf168a7fb930ca9649df4ace6cfb62ec155
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata became valid
NOTE: Running setscene task 459 of 459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot: Started
NOTE: recipe gdbm-1.23-r0: task do_package: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_package: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_package unihash changed to 08bdc66dc08e3fc1f73dd53d08843d70068ec06cb858391313b07ba85630fe59
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata became valid
NOTE: recipe make-4.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 455 of 459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: recipe xcb-proto-1.15.2-r0: task do_install: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_configure: Succeeded
NOTE: Running task 1380 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_compile)
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_compile: Started
NOTE: recipe bash-completion-2.11-r0: task do_package: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_configure: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_package: Succeeded
NOTE: Running task 1382 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_compile)
NOTE: Running task 1383 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1384 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_prepare_recipe_sysroot)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package unihash changed to 37f82228a7d8d3d05f82a1837a7d72fd764651e0bcc6f24384e7943c16ba62fb
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata became valid
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_package unihash changed to 24da5a37fbcadb9642640637258227a61b63df6e243436f8846a0319ddb0b897
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata became valid
NOTE: Running setscene task 450 of 459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 459 of 459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running task 1385 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1386 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_prepare_recipe_sysroot)
NOTE: recipe xtrans-1_1.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_compile: Started
NOTE: recipe make-4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1388 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.bb:do_package_write_rpm)
NOTE: recipe libxau-1_1.0.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_compile: Succeeded
NOTE: Running task 1390 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_package)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1391 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_install)
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.38-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe make-4.4-r0: task do_package_write_rpm: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1392 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_configure)
NOTE: recipe libpthread-stubs-0.4-r0: task do_install: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe perl-5.36.0-r0: task do_package: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_install: Succeeded
NOTE: Running task 1394 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_populate_sysroot)
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_configure: Started
NOTE: Running task 1395 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_package)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1397 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_configure)
NOTE: Running task 1398 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_package)
NOTE: recipe libxau-1_1.0.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1399 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_configure)
NOTE: recipe libpthread-stubs-0.4-r0: task do_install: Succeeded
NOTE: Running task 1400 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot)
NOTE: Running task 1401 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_package)
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_configure: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_package: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_compile: Succeeded
NOTE: Running task 1402 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_install)
NOTE: recipe xorgproto-2022.2-r0: task do_package: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_configure: Started
NOTE: recipe xkeyboard-config-2.38-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_package: Started
NOTE: Running task 1403 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_configure)
NOTE: Running task 1404 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_packagedata)
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_package: Started
NOTE: recipe initscripts-1.0-r155: task do_package: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_install: Started
NOTE: Running task 1405 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata)
NOTE: recipe xkeyboard-config-2.38-r0: task do_configure: Started
NOTE: recipe xorgproto-2022.2-r0: task do_packagedata: Started
NOTE: recipe initscripts-1.0-r155: task do_packagedata: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_install: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1406 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_populate_sysroot)
NOTE: recipe xorgproto-2022.2-r0: task do_packagedata: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_packagedata: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot: Started
NOTE: recipe cracklib-2.9.8-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_package unihash changed to 446a1964ae9ac6c2337e346b2228935a720a1baf3f8c11a04eab5b913f910470
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_packagedata became valid
NOTE: Running setscene task 446 of 459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_packagedata_setscene)
NOTE: recipe util-macros-1_1.19.3-r0: task do_package: Succeeded
NOTE: Running task 1407 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_packagedata)
NOTE: recipe cracklib-2.9.8-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1408 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1409 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_package)
NOTE: recipe shadow-sysroot-4.6-r3: task do_prepare_recipe_sysroot: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_package: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_package: Succeeded
NOTE: Running task 1410 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_packagedata)
NOTE: recipe shadow-sysroot-4.6-r3: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1411 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_configure)
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_configure: Started
NOTE: recipe bzip2-1.0.8-r0: task do_configure: Succeeded
NOTE: Running task 1412 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_configure_ptest_base)
NOTE: recipe cracklib-2.9.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe shadow-sysroot-4.6-r3: task do_configure: Succeeded
NOTE: recipe xkeyboard-config-2.38-r0: task do_configure: Succeeded
NOTE: Running task 1414 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_compile)
NOTE: Running task 1415 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_compile)
NOTE: recipe bzip2-1.0.8-r0: task do_configure_ptest_base: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_compile: Started
NOTE: Running task 1416 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_compile)
NOTE: recipe libpthread-stubs-0.4-r0: task do_package: Succeeded
NOTE: recipe xkeyboard-config-2.38-r0: task do_compile: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_compile: Succeeded
NOTE: Running task 1417 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_install)
NOTE: Running task 1418 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata)
NOTE: recipe bzip2-1.0.8-r0: task do_compile: Started
NOTE: recipe sed-4.9-r0: task do_package: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_install: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_package unihash changed to 7c1ddf4e728f34f09ee83b871e04a2f7ef196647d3ff49765624295ea17f2ac5
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata became valid
NOTE: Running setscene task 459 of 459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: recipe make-4.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_install: Succeeded
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: Running task 1419 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot)
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata: Succeeded
NOTE: recipe xkeyboard-config-2.38-r0: task do_compile: Succeeded
NOTE: Running task 1420 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_install)
NOTE: recipe flex-2.6.4-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_package unihash changed to 8876e1c372a989164d5f23ac60f5760a01be293d79e20aab944d18bdf07f472c
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata became valid
NOTE: Running setscene task 443 of 459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.40.1-r0: task do_configure: Succeeded
NOTE: Running task 1421 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.40.1.bb:do_compile)
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot: Succeeded
NOTE: recipe xkeyboard-config-2.38-r0: task do_install: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.40.1-r0: task do_compile: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe base-passwd-3.6.1-r0: task do_package: Succeeded
NOTE: Running task 1424 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_packagedata)
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_package unihash changed to baa9e5ef50da7ae2996197a5ba42b5e1f2dde75a223985c5ae25947fa5591f55
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata became valid
NOTE: Running setscene task 455 of 459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.38-r0: task do_install: Succeeded
NOTE: Running task 1425 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_populate_sysroot)
NOTE: Running task 1426 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_package)
NOTE: recipe bzip2-1.0.8-r0: task do_compile: Succeeded
NOTE: Running task 1427 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_compile_ptest_base)
NOTE: recipe xkeyboard-config-2.38-r0: task do_populate_sysroot: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe xkeyboard-config-2.38-r0: task do_package: Started
NOTE: recipe bzip2-1.0.8-r0: task do_compile_ptest_base: Started
NOTE: recipe bzip2-1.0.8-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1429 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_install)
NOTE: recipe bzip2-1.0.8-r0: task do_install: Started
NOTE: recipe xkeyboard-config-2.38-r0: task do_populate_sysroot: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_compile: Succeeded
NOTE: Running task 1430 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_compile_ptest_base)
NOTE: recipe expat-2.5.0-r0: task do_compile_ptest_base: Started
NOTE: recipe expat-2.5.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1431 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_install)
NOTE: recipe bzip2-1.0.8-r0: task do_install: Succeeded
NOTE: Running task 1432 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_install_ptest_base)
NOTE: recipe expat-2.5.0-r0: task do_install: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_configure: Succeeded
NOTE: Running task 1433 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_compile)
NOTE: recipe bzip2-1.0.8-r0: task do_install_ptest_base: Started
NOTE: recipe expat-2.5.0-r0: task do_install: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_compile: Started
NOTE: Running task 1434 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_install_ptest_base)
NOTE: recipe bzip2-1.0.8-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1435 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot)
NOTE: Running task 1436 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package)
NOTE: recipe expat-2.5.0-r0: task do_install_ptest_base: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot: Started
NOTE: recipe expat-2.5.0-r0: task do_install_ptest_base: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_package: Started
NOTE: Running task 1437 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_populate_sysroot)
NOTE: Running task 1438 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_package)
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot: Started
NOTE: recipe expat-2.5.0-r0: task do_package: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1439 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpcre2-10.42-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_compile: Succeeded
NOTE: Running task 1440 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_install)
NOTE: recipe libpcre2-10.42-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1441 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_configure)
NOTE: recipe libtirpc-1.3.3-r0: task do_install: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_configure: Succeeded
NOTE: Running task 1442 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_compile)
NOTE: recipe libpcre2-10.42-r0: task do_configure: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_compile: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_compile: Succeeded
NOTE: Running task 1443 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_install)
NOTE: recipe xtrans-1_1.4.0-r0: task do_install: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_install: Succeeded
NOTE: Running task 1444 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot)
NOTE: Running task 1445 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_package)
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_package: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_install: Succeeded
NOTE: Running task 1446 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_populate_sysroot)
NOTE: Running task 1447 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_package)
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_package: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1448 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe libnsl2-2.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_package: Succeeded
NOTE: Running task 1449 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1450 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_packagedata)
NOTE: recipe openssl-3.0.7-r0: task do_configure: Succeeded
NOTE: Running task 1451 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_configure_ptest_base)
NOTE: recipe libice-1_1.1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe expat-2.5.0-r0: task do_packagedata: Started
NOTE: recipe libffi-3.4.4-r0: task do_configure: Succeeded
NOTE: Running task 1452 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_compile)
NOTE: recipe libnsl2-2.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1453 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_configure)
NOTE: recipe openssl-3.0.7-r0: task do_configure_ptest_base: Started
NOTE: recipe openssl-3.0.7-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_compile: Started
NOTE: Running task 1454 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_compile)
NOTE: recipe libnsl2-2.0.0-r0: task do_configure: Started
NOTE: recipe libice-1_1.1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1455 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_configure)
NOTE: recipe openssl-3.0.7-r0: task do_compile: Started
NOTE: recipe libice-1_1.1.1-r0: task do_configure: Started
NOTE: recipe expat-2.5.0-r0: task do_packagedata: Succeeded
NOTE: recipe xkeyboard-config-2.38-r0: task do_package: Succeeded
NOTE: Running task 1456 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_packagedata)
NOTE: recipe xkeyboard-config-2.38-r0: task do_packagedata: Started
NOTE: recipe xkeyboard-config-2.38-r0: task do_packagedata: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_package: Succeeded
NOTE: Running task 1457 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata)
NOTE: recipe libffi-3.4.4-r0: task do_compile: Succeeded
NOTE: Running task 1458 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_install)
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata: Started
NOTE: recipe libffi-3.4.4-r0: task do_install: Started
NOTE: recipe bzip2-1.0.8-r0: task do_package: Succeeded
NOTE: Running task 1459 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_package: Succeeded
NOTE: Running task 1460 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata)
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_install: Succeeded
NOTE: Running task 1461 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot)
NOTE: Running task 1462 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_package)
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot: Started
NOTE: recipe libffi-3.4.4-r0: task do_package: Started
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_package unihash changed to 49d7add3986c37e5537b0d359d18a3bf695f4b5f7033b2099be7b5c99c8e53d8
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata became valid
NOTE: Running setscene task 459 of 459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1464 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_package)
NOTE: Running task 1465 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_package)
NOTE: Running task 1466 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.6.bb:do_package)
NOTE: recipe readline-8.2-r0: task do_package: Started
NOTE: recipe bash-5.2.15-r0: task do_package: Started
NOTE: recipe psmisc-23.6-r0: task do_package: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_configure: Succeeded
NOTE: Running task 1467 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_compile)
NOTE: recipe libxau-1_1.0.11-r0: task do_compile: Started
NOTE: recipe libffi-3.4.4-r0: task do_package: Succeeded
NOTE: Running task 1468 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata)
NOTE: recipe libffi-3.4.4-r0: task do_packagedata: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_configure: Succeeded
NOTE: Running task 1469 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_compile)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_compile: Started
NOTE: recipe zstd-1.5.2-r0: task do_compile: Succeeded
NOTE: Running task 1470 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_install)
NOTE: recipe readline-8.2-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_package unihash changed to 6f4b745c813b978db5a6c8f761e087ca0dd77a28b3174d0f043905ae7edaa021
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_packagedata became valid
NOTE: Running setscene task 455 of 459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_packagedata_setscene)
NOTE: recipe zstd-1.5.2-r0: task do_install: Started
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe xz-5.4.1-r0: task do_configure: Succeeded
NOTE: Running task 1472 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.1.bb:do_compile)
NOTE: recipe libxau-1_1.0.11-r0: task do_compile: Succeeded
NOTE: recipe xz-5.4.1-r0: task do_compile: Started
NOTE: Running task 1473 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_install)
NOTE: recipe libxau-1_1.0.11-r0: task do_install: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_compile: Succeeded
NOTE: Running task 1474 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_install)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_install: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_install: Succeeded
NOTE: Running task 1475 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_populate_sysroot)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_install: Succeeded
NOTE: Running task 1476 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_package)
NOTE: Running task 1477 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_populate_sysroot)
NOTE: Running task 1478 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_package)
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_package: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_package: Started
NOTE: recipe psmisc-23.6-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.6.bb:do_package unihash changed to 3858865d8904f8f44a09feea06fbafcb2c4f8ac030a06338045cab2f72dcaa82
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.6.bb:do_packagedata became valid
NOTE: Running setscene task 459 of 459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.6.bb:do_packagedata_setscene)
NOTE: recipe psmisc-23.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1479 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxcb-1.15-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe psmisc-23.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1481 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_package_write_rpm)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_package_write_rpm: Started
NOTE: recipe libxcb-1.15-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1482 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_configure)
NOTE: recipe libxcb-1.15-r0: task do_configure: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_package_write_rpm unihash changed to 7d78e3de4c0e1bd2633d7a052abf83638b3260aa3e970495ac7f3658e8119ae6
NOTE: recipe libxau-1_1.0.11-r0: task do_package: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_package: Succeeded
NOTE: Running task 1483 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_packagedata)
NOTE: Running task 1484 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_packagedata)
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata: Started
NOTE: recipe xz-5.4.1-r0: task do_compile: Succeeded
NOTE: Running task 1485 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.1.bb:do_install)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata: Succeeded
NOTE: recipe xz-5.4.1-r0: task do_install: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_configure: Succeeded
NOTE: Running task 1486 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_compile)
NOTE: recipe libnsl2-2.0.0-r0: task do_compile: Started
NOTE: recipe libpcre2-10.42-r0: task do_configure: Succeeded
NOTE: Running task 1487 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_compile)
NOTE: recipe libpcre2-10.42-r0: task do_compile: Started
NOTE: recipe libpam-1.5.2-r0: task do_configure: Succeeded
NOTE: Running task 1488 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_configure_ptest_base)
NOTE: recipe bash-5.2.15-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_package unihash changed to 972e6b172ce3ac1d8d8851ddb1c26d407534db9e4e1850864f5ce22e1ab3b5b5
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_packagedata became valid
NOTE: Running setscene task 459 of 459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_packagedata_setscene)
NOTE: recipe libpam-1.5.2-r0: task do_configure_ptest_base: Started
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1489 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_compile)
NOTE: recipe libpam-1.5.2-r0: task do_compile: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_compile: Succeeded
NOTE: Running task 1490 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_install)
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libnsl2-2.0.0-r0: task do_install: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_install: Succeeded
NOTE: Running task 1492 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot)
NOTE: Running task 1493 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_package)
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_package: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_configure: Succeeded
NOTE: Running task 1494 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_compile)
NOTE: recipe libice-1_1.1.1-r0: task do_compile: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_package: Succeeded
NOTE: Running task 1495 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata)
NOTE: recipe libice-1_1.1.1-r0: task do_compile: Succeeded
NOTE: Running task 1496 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_install)
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata: Started
NOTE: recipe xz-5.4.1-r0: task do_install: Succeeded
NOTE: Running task 1497 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.1.bb:do_populate_sysroot)
NOTE: Running task 1498 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.1.bb:do_package)
NOTE: recipe libice-1_1.1.1-r0: task do_install: Started
NOTE: recipe xz-5.4.1-r0: task do_populate_sysroot: Started
NOTE: recipe xz-5.4.1-r0: task do_package: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata: Succeeded
NOTE: recipe xz-5.4.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_install: Succeeded
NOTE: Running task 1499 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_populate_sysroot)
NOTE: Running task 1500 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_package)
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot: Started
NOTE: recipe libice-1_1.1.1-r0: task do_package: Started
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1501 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsm-1_1.2.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1502 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_configure)
NOTE: recipe libsm-1_1.2.4-r0: task do_configure: Started
NOTE: recipe libice-1_1.1.1-r0: task do_package: Succeeded
NOTE: Running task 1503 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_packagedata)
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata: Started
NOTE: recipe zstd-1.5.2-r0: task do_install: Succeeded
NOTE: Running task 1504 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_populate_sysroot)
NOTE: Running task 1505 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_package)
NOTE: recipe zstd-1.5.2-r0: task do_populate_sysroot: Started
NOTE: recipe zstd-1.5.2-r0: task do_package: Started
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata: Succeeded
NOTE: recipe zstd-1.5.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xz-5.4.1-r0: task do_package: Succeeded
NOTE: Running task 1506 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.1.bb:do_packagedata)
NOTE: recipe xz-5.4.1-r0: task do_packagedata: Started
NOTE: recipe xz-5.4.1-r0: task do_packagedata: Succeeded
NOTE: recipe openssl-3.0.7-r0: task do_compile: Succeeded
NOTE: Running task 1507 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_compile_ptest_base)
NOTE: recipe openssl-3.0.7-r0: task do_compile_ptest_base: Started
NOTE: recipe zstd-1.5.2-r0: task do_package: Succeeded
NOTE: Running task 1508 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_packagedata)
NOTE: recipe openssl-3.0.7-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1509 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_install)
NOTE: recipe zstd-1.5.2-r0: task do_packagedata: Started
NOTE: recipe openssl-3.0.7-r0: task do_install: Started
NOTE: recipe zstd-1.5.2-r0: task do_packagedata: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_configure: Succeeded
NOTE: Running task 1510 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_compile)
NOTE: recipe libxcb-1.15-r0: task do_compile: Started
NOTE: recipe libpcre2-10.42-r0: task do_compile: Succeeded
NOTE: Running task 1511 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_install)
NOTE: recipe libpcre2-10.42-r0: task do_install: Started
NOTE: recipe libpcre2-10.42-r0: task do_install: Succeeded
NOTE: Running task 1512 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_populate_sysroot)
NOTE: Running task 1513 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_package)
NOTE: recipe libpcre2-10.42-r0: task do_package: Started
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot: Started
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_compile: Succeeded
NOTE: Running task 1514 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_install)
NOTE: recipe libxcb-1.15-r0: task do_install: Started
NOTE: recipe libpcre2-10.42-r0: task do_package: Succeeded
NOTE: Running task 1515 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_packagedata)
NOTE: recipe libsm-1_1.2.4-r0: task do_configure: Succeeded
NOTE: Running task 1516 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_compile)
NOTE: recipe libpcre2-10.42-r0: task do_packagedata: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_compile: Started
NOTE: recipe libpcre2-10.42-r0: task do_packagedata: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_compile: Succeeded
NOTE: Running task 1517 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_install)
NOTE: recipe libsm-1_1.2.4-r0: task do_install: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_install: Succeeded
NOTE: Running task 1518 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_populate_sysroot)
NOTE: Running task 1519 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_package)
NOTE: recipe libsm-1_1.2.4-r0: task do_package: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot: Started
NOTE: recipe libxcb-1.15-r0: task do_install: Succeeded
NOTE: Running task 1520 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_populate_sysroot)
NOTE: Running task 1521 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_package)
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot: Started
NOTE: recipe libxcb-1.15-r0: task do_package: Started
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1522 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libx11-1_1.8.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1523 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_configure)
NOTE: recipe libx11-1_1.8.4-r0: task do_configure: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_package: Succeeded
NOTE: Running task 1524 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_packagedata)
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_compile: Succeeded
NOTE: Running task 1525 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_compile_ptest_base)
NOTE: recipe libpam-1.5.2-r0: task do_compile_ptest_base: Started
NOTE: recipe libpam-1.5.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1526 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_install)
NOTE: recipe libpam-1.5.2-r0: task do_install: Started
NOTE: recipe libxcb-1.15-r0: task do_package: Succeeded
NOTE: Running task 1527 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_packagedata)
NOTE: recipe libxcb-1.15-r0: task do_packagedata: Started
NOTE: recipe libxcb-1.15-r0: task do_packagedata: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_install: Succeeded
NOTE: Running task 1528 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_install_ptest_base)
NOTE: recipe libpam-1.5.2-r0: task do_install_ptest_base: Started
NOTE: recipe libpam-1.5.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1529 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_populate_sysroot)
NOTE: Running task 1530 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_package)
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot: Started
NOTE: recipe libpam-1.5.2-r0: task do_package: Started
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_populate_sysroot unihash changed to b18a33df249157769138f58f0f774eadb060d700601b2dbf0c7e039d2c6ef9f2
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.66.bb:do_populate_sysroot became valid
NOTE: Running setscene task 459 of 459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.66.bb:do_populate_sysroot_setscene)
NOTE: Running task 1538 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_populate_sysroot)
NOTE: Running task 1543 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_populate_sysroot)
NOTE: recipe libcap-2.66-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot: Started
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot: Started
NOTE: recipe libcap-2.66-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1556 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1557 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_configure)
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_configure: Started
NOTE: recipe libpam-1.5.2-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_package unihash changed to 1ef6559e4fd37300d6875f69cc3e6a1b96ea9214ef21df562ac0b17b1b83e4b3
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata became valid
NOTE: Running setscene task 459 of 459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_configure: Succeeded
NOTE: Running task 1558 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_compile)
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1560 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_package)
NOTE: Running task 1561 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_package)
NOTE: Running task 1562 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.66.bb:do_package)
NOTE: recipe libx11-1_1.8.4-r0: task do_compile: Started
NOTE: recipe libcap-2.66-r0: task do_package: Started
NOTE: recipe shadow-4.13-r0: task do_package: Started
NOTE: recipe util-linux-2.38.1-r0: task do_package: Started
NOTE: recipe libcap-2.66-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.66.bb:do_package unihash changed to 6e86ae40db90868bd9d1c867d15009ef64b6c21930f45d88a9df19516bf537a4
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.66.bb:do_packagedata became valid
NOTE: Running setscene task 459 of 459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.66.bb:do_packagedata_setscene)
NOTE: recipe libcap-2.66-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.66-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1564 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_package)
NOTE: recipe coreutils-9.1-r0: task do_package: Started
NOTE: recipe sqlite3-3_3.40.1-r0: task do_compile: Succeeded
NOTE: Running task 1565 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.40.1.bb:do_install)
NOTE: recipe sqlite3-3_3.40.1-r0: task do_install: Started
NOTE: recipe sqlite3-3_3.40.1-r0: task do_install: Succeeded
NOTE: Running task 1566 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.40.1.bb:do_populate_sysroot)
NOTE: Running task 1567 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.40.1.bb:do_package)
NOTE: recipe sqlite3-3_3.40.1-r0: task do_populate_sysroot: Started
NOTE: recipe sqlite3-3_3.40.1-r0: task do_package: Started
NOTE: recipe sqlite3-3_3.40.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe shadow-4.13-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_package unihash changed to 51a2a7f96fe8d6af90cd6349604c63febab618f6bac31aeb7bd76118dcb9e336
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_packagedata became valid
NOTE: Running setscene task 459 of 459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe sqlite3-3_3.40.1-r0: task do_package: Succeeded
NOTE: Running task 1569 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.40.1.bb:do_packagedata)
NOTE: recipe sqlite3-3_3.40.1-r0: task do_packagedata: Started
NOTE: recipe sqlite3-3_3.40.1-r0: task do_packagedata: Succeeded
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1570 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_configure_ptest_base)
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_configure_ptest_base: Started
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1571 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_compile)
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_compile: Started
NOTE: recipe perl-5.36.0-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_package unihash changed to 48f6da34ee37988fd68fa6293f1f1ef4bb9f93cf18f519581cc7aa5433087e2a
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_packagedata became valid
NOTE: Running setscene task 459 of 459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_packagedata_setscene)
NOTE: recipe perl-5.36.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_compile: Succeeded
NOTE: Running task 1572 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_install)
NOTE: recipe libx11-1_1.8.4-r0: task do_install: Started
NOTE: recipe openssl-3.0.7-r0: task do_install: Succeeded
NOTE: Running task 1573 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_install_ptest_base)
NOTE: recipe openssl-3.0.7-r0: task do_install_ptest_base: Started
NOTE: recipe openssl-3.0.7-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1574 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_populate_sysroot)
NOTE: Running task 1575 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_package)
NOTE: recipe openssl-3.0.7-r0: task do_populate_sysroot: Started
NOTE: recipe openssl-3.0.7-r0: task do_package: Started
NOTE: recipe openssl-3.0.7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libx11-1_1.8.4-r0: task do_install: Succeeded
NOTE: Running task 1576 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1577 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1578 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_populate_sysroot)
NOTE: Running task 1579 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_package)
NOTE: recipe kmod-30-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_populate_sysroot: Started
NOTE: recipe python3-3.11.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_package: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe kmod-30-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-3.11.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1580 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_configure)
NOTE: Running task 1581 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.1.bb:do_configure)
NOTE: recipe perl-5.36.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe kmod-30-r0: task do_configure: Started
NOTE: recipe python3-3.11.1-r0: task do_configure: Started
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_compile: Succeeded
NOTE: Running task 1583 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_compile_ptest_base)
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_compile_ptest_base: Started
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1584 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_install)
NOTE: recipe util-linux-2.38.1-r0: task do_package: Succeeded
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_install: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_package unihash changed to c50fe9c9f867294ffa52e24eca8c375fafc3d33caeb749e20234dd91734881f5
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_packagedata became valid
NOTE: Running setscene task 454 of 459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_packagedata_setscene)
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_package: Succeeded
NOTE: Running task 1585 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_packagedata)
NOTE: recipe libx11-1_1.8.4-r0: task do_packagedata: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_packagedata: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_install: Succeeded
NOTE: Running task 1587 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_install_ptest_base)
NOTE: recipe coreutils-9.1-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_package unihash changed to 8b394233060706081420d6c9a5b1f6e1a60be01015e09a27baf45519367c216e
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_packagedata became valid
NOTE: Running setscene task 459 of 459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_packagedata_setscene)
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_install_ptest_base: Started
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1588 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_populate_sysroot)
NOTE: Running task 1589 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_package)
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_populate_sysroot: Started
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_package: Started
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe kmod-30-r0: task do_configure: Succeeded
NOTE: Running task 1591 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_compile)
NOTE: recipe kmod-30-r0: task do_compile: Started
NOTE: recipe kmod-30-r0: task do_compile: Succeeded
NOTE: Running task 1592 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_install)
NOTE: recipe kmod-30-r0: task do_install: Started
NOTE: recipe kmod-30-r0: task do_install: Succeeded
NOTE: Running task 1593 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_populate_sysroot)
NOTE: recipe kmod-30-r0: task do_populate_sysroot: Started
NOTE: recipe kmod-30-r0: task do_populate_sysroot: Succeeded
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_package: Succeeded
NOTE: Running task 1594 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.5.bb:do_packagedata)
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_packagedata: Started
NOTE: recipe glib-2.0-1_2.74.5-r0: task do_packagedata: Succeeded
NOTE: recipe python3-3.11.1-r0: task do_configure: Succeeded
NOTE: Running task 1595 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.1.bb:do_configure_ptest_base)
NOTE: recipe python3-3.11.1-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-3.11.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1596 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.1.bb:do_compile)
NOTE: recipe python3-3.11.1-r0: task do_compile: Started
NOTE: recipe openssl-3.0.7-r0: task do_package: Succeeded
NOTE: Running task 1597 of 1661 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_packagedata)
NOTE: recipe openssl-3.0.7-r0: task do_packagedata: Started
NOTE: recipe glibc-locale-2.37-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-locale_2.37.bb:do_package unihash changed to d7e9d7167911cacb77d7d4d61f35fe27856e15babf676d4d9ad537cba110d262
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-locale_2.37.bb:do_packagedata became valid
NOTE: Running setscene task 459 of 459 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-locale_2.37.bb:do_packagedata_setscene)
NOTE: recipe glibc-locale-2.37-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.0.7-r0: task do_packagedata: Failed
NOTE: recipe python3-3.11.1-r0: task do_compile: Succeeded
NOTE: recipe glibc-locale-2.37-r0: task do_packagedata_setscene: Succeeded
NOTE: Tasks Summary: Attempted 1597 tasks of which 1209 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 16 ERROR messages, returning a non-zero exit code.
ERROR: openssl-3.0.7-r0 do_packagedata: QA Issue: Package version for package openssl-src went backwards which would break package feeds (from 0:3.0.8-r0 to 0:3.0.7-r0) [version-going-backwards]
ERROR: openssl-3.0.7-r0 do_packagedata: QA Issue: Package version for package openssl-dbg went backwards which would break package feeds (from 0:3.0.8-r0 to 0:3.0.7-r0) [version-going-backwards]
ERROR: openssl-3.0.7-r0 do_packagedata: QA Issue: Package version for package libcrypto went backwards which would break package feeds (from 0:3.0.8-r0 to 0:3.0.7-r0) [version-going-backwards]
ERROR: openssl-3.0.7-r0 do_packagedata: QA Issue: Package version for package libssl went backwards which would break package feeds (from 0:3.0.8-r0 to 0:3.0.7-r0) [version-going-backwards]
ERROR: openssl-3.0.7-r0 do_packagedata: QA Issue: Package version for package openssl-conf went backwards which would break package feeds (from 0:3.0.8-r0 to 0:3.0.7-r0) [version-going-backwards]
ERROR: openssl-3.0.7-r0 do_packagedata: QA Issue: Package version for package openssl-engines went backwards which would break package feeds (from 0:3.0.8-r0 to 0:3.0.7-r0) [version-going-backwards]
ERROR: openssl-3.0.7-r0 do_packagedata: QA Issue: Package version for package openssl-misc went backwards which would break package feeds (from 0:3.0.8-r0 to 0:3.0.7-r0) [version-going-backwards]
ERROR: openssl-3.0.7-r0 do_packagedata: QA Issue: Package version for package openssl-ossl-module-legacy went backwards which would break package feeds (from 0:3.0.8-r0 to 0:3.0.7-r0) [version-going-backwards]
ERROR: openssl-3.0.7-r0 do_packagedata: QA Issue: Package version for package openssl-ptest went backwards which would break package feeds (from 0:3.0.8-r0 to 0:3.0.7-r0) [version-going-backwards]
ERROR: openssl-3.0.7-r0 do_packagedata: QA Issue: Package version for package openssl-staticdev went backwards which would break package feeds (from 0:3.0.8-r0 to 0:3.0.7-r0) [version-going-backwards]
ERROR: openssl-3.0.7-r0 do_packagedata: QA Issue: Package version for package openssl-dev went backwards which would break package feeds (from 0:3.0.8-r0 to 0:3.0.7-r0) [version-going-backwards]
ERROR: openssl-3.0.7-r0 do_packagedata: QA Issue: Package version for package openssl-doc went backwards which would break package feeds (from 0:3.0.8-r0 to 0:3.0.7-r0) [version-going-backwards]
ERROR: openssl-3.0.7-r0 do_packagedata: QA Issue: Package version for package openssl-locale went backwards which would break package feeds (from 0:3.0.8-r0 to 0:3.0.7-r0) [version-going-backwards]
ERROR: openssl-3.0.7-r0 do_packagedata: QA Issue: Package version for package openssl-bin went backwards which would break package feeds (from 0:3.0.8-r0 to 0:3.0.7-r0) [version-going-backwards]
ERROR: openssl-3.0.7-r0 do_packagedata: QA Issue: Package version for package openssl went backwards which would break package feeds (from 0:3.0.8-r0 to 0:3.0.7-r0) [version-going-backwards]
ERROR: openssl-3.0.7-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/openssl/3.0.7-r0/temp/log.do_packagedata.275599
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_packagedata) failed with exit code '1'

--===============3884219113494210688==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-dbus-upgrade-1.14.4-1.14.6.patch"

RnJvbSBmN2E2ZTQ1NWUwMGJlNTZjNWI3ZWJkZDUwNjdmMDhlZmU2NDY5MjhiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgRmViIDIwMjMgMTM6NTM6MzYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBk
YnVzOiB1cGdyYWRlIDEuMTQuNCAtPiAxLjE0LjYKCi0tLQogLi4uR05PRi11c2luZy1fQWxpZ25v
Zi13aGVuLXVzaW5nLUMxMS1vLnBhdGNoIHwgNDIgLS0tLS0tLS0tLS0tLS0tLS0tLQogLi4uL2Ri
dXMve2RidXNfMS4xNC40LmJiID0+IGRidXNfMS4xNC42LmJifSAgIHwgIDUgKy0tCiAyIGZpbGVz
IGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgNDUgZGVsZXRpb25zKC0pCiBkZWxldGUgbW9kZSAx
MDA2NDQgbWV0YS9yZWNpcGVzLWNvcmUvZGJ1cy9kYnVzLzAwMDEtRGVmaW5lLV9EQlVTX0FMSUdO
T0YtdXNpbmctX0FsaWdub2Ytd2hlbi11c2luZy1DMTEtby5wYXRjaAogcmVuYW1lIG1ldGEvcmVj
aXBlcy1jb3JlL2RidXMve2RidXNfMS4xNC40LmJiID0+IGRidXNfMS4xNC42LmJifSAoOTclKQoK
ZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL2RidXMvZGJ1cy8wMDAxLURlZmluZS1fREJV
U19BTElHTk9GLXVzaW5nLV9BbGlnbm9mLXdoZW4tdXNpbmctQzExLW8ucGF0Y2ggYi9tZXRhL3Jl
Y2lwZXMtY29yZS9kYnVzL2RidXMvMDAwMS1EZWZpbmUtX0RCVVNfQUxJR05PRi11c2luZy1fQWxp
Z25vZi13aGVuLXVzaW5nLUMxMS1vLnBhdGNoCmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRl
eCA3YjRlMjZmOTllLi4wMDAwMDAwMDAwCi0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL2RidXMvZGJ1
cy8wMDAxLURlZmluZS1fREJVU19BTElHTk9GLXVzaW5nLV9BbGlnbm9mLXdoZW4tdXNpbmctQzEx
LW8ucGF0Y2gKKysrIC9kZXYvbnVsbApAQCAtMSw0MiArMCwwIEBACi1Gcm9tIGMzZTJjODczZmZh
OGU4OWI1ZjgzZGNjYzRlNGUzNWRmY2VhNjMzY2IgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCi1G
cm9tOiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgotRGF0ZTogU2F0LCAxNCBKYW4gMjAy
MyAxMjozOTo0MyAtMDgwMAotU3ViamVjdDogW1BBVENIXSBEZWZpbmUgX0RCVVNfQUxJR05PRiB1
c2luZyBfQWxpZ25vZiB3aGVuIHVzaW5nIEMxMSBvciBuZXdlcgotCi1XRzE0IE4yMzUwIG1hZGUg
dmVyeSBjbGVhciB0aGF0IGl0IGlzIGFuIFVCIGhhdmluZyB0eXBlIGRlZmluaXRpb25zCi13aXRo
aW4gIm9mZnNldG9mIiBbMV0uIFRoaXMgcGF0Y2ggY2hhbmdlcyB0aGUgaW1wbGVtZW50YXRpb24g
b2YgbWFjcm8KLV9EQlVTX0FMSUdOT0YgdG8gYnVpbHRpbiAiX0FsaWdub2YiIHRvIGF2b2lkIHVu
ZGVmaW5lZCBiZWhhdmlvci4KLQotY2xhbmcgMTYrIGhhcyBzdGFydGVkIHRvIGRpYWdub3NlIHRo
aXMgWzJdCi0KLUZpeGVzIGJ1aWxkIHdoZW4gdXNpbmcgLXN0ZCA+PSBnbnUxMSBhbmQgdXNpbmcg
Y2xhbmcxNisKLQotWzFdIGh0dHBzOi8vd3d3Lm9wZW4tc3RkLm9yZy9qdGMxL3NjMjIvd2cxNC93
d3cvZG9jcy9uMjM1MC5odG0KLVsyXSBodHRwczovL3Jldmlld3MubGx2bS5vcmcvRDEzMzU3NAot
Ci1VcHN0cmVhbS1TdGF0dXM6IFN1Ym1pdHRlZCBbaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Au
b3JnL2RidXMvZGJ1cy8tL21lcmdlX3JlcXVlc3RzLzM4OV0KLVNpZ25lZC1vZmYtYnk6IEtoZW0g
UmFqIDxyYWoua2hlbUBnbWFpbC5jb20+Ci0tLS0KLSBkYnVzL2RidXMtaW50ZXJuYWxzLmggfCA0
ICsrKysKLSAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCi0KLWRpZmYgLS1naXQgYS9k
YnVzL2RidXMtaW50ZXJuYWxzLmggYi9kYnVzL2RidXMtaW50ZXJuYWxzLmgKLWluZGV4IGNjOThj
OTJhLi4yMzg3NzUyZCAxMDA2NDQKLS0tLSBhL2RidXMvZGJ1cy1pbnRlcm5hbHMuaAotKysrIGIv
ZGJ1cy9kYnVzLWludGVybmFscy5oCi1AQCAtMjAxLDggKzIwMSwxMiBAQCB2b2lkIF9kYnVzX3Jl
YWxfYXNzZXJ0X25vdF9yZWFjaGVkIChjb25zdCBjaGFyICpleHBsYW5hdGlvbiwKLSAgICAgKChp
bnRwdHJfdCkgKCh1bnNpZ25lZCBjaGFyKikgJigoc3RydWN0X3R5cGUqKSAwKS0+bWVtYmVyKSkK
LSAjZW5kaWYKLSAKLSsjaWYgZGVmaW5lZChfX1NURENfVkVSU0lPTl9fKSAmJiBfX1NURENfVkVS
U0lPTl9fID49IDIwMTExMkwgJiYgIWRlZmluZWQoX19jcGx1c3BsdXMpCi0rI2RlZmluZSBfREJV
U19BTElHTk9GKHR5cGUpIF9BbGlnbm9mKHR5cGUpCi0rI2Vsc2UKLSAjZGVmaW5lIF9EQlVTX0FM
SUdOT0YodHlwZSkgXAotICAgICAoX0RCVVNfU1RSVUNUX09GRlNFVCAoc3RydWN0IHsgY2hhciBf
MTsgdHlwZSBfMjsgfSwgXzIpKQotKyNlbmRpZgotIAotICNpZiBkZWZpbmVkKERCVVNfRElTQUJM
RV9DSEVDS1MpIHx8IGRlZmluZWQoREJVU19ESVNBQkxFX0FTU0VSVCkKLSAvKiB0aGlzIGlzIGFu
IGFzc2VydCBhbmQgbm90IGFuIGVycm9yLCBidXQgaW4gdGhlIHR5cGljYWwgLS1kaXNhYmxlLWNo
ZWNrcyBjYXNlICh5b3UncmUgdHJ5aW5nCi0tLSAKLTIuMzkuMAotCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtY29yZS9kYnVzL2RidXNfMS4xNC40LmJiIGIvbWV0YS9yZWNpcGVzLWNvcmUvZGJ1
cy9kYnVzXzEuMTQuNi5iYgpzaW1pbGFyaXR5IGluZGV4IDk3JQpyZW5hbWUgZnJvbSBtZXRhL3Jl
Y2lwZXMtY29yZS9kYnVzL2RidXNfMS4xNC40LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtY29y
ZS9kYnVzL2RidXNfMS4xNC42LmJiCmluZGV4IGVlMDU0OTYyMDMuLmE2ZTE4YTkyY2IgMTAwNjQ0
Ci0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL2RidXMvZGJ1c18xLjE0LjQuYmIKKysrIGIvbWV0YS9y
ZWNpcGVzLWNvcmUvZGJ1cy9kYnVzXzEuMTQuNi5iYgpAQCAtMTMsMTEgKzEzLDEwIEBAIExJQ19G
SUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1PTY0MjNkY2Q3NGQ3YmU5NzE1YjBkYjI0
N2ZkODg5ZGEzIFwKIFNSQ19VUkkgPSAiaHR0cHM6Ly9kYnVzLmZyZWVkZXNrdG9wLm9yZy9yZWxl
YXNlcy9kYnVzL2RidXMtJHtQVn0udGFyLnh6IFwKICAgICAgICAgICAgZmlsZTovL3J1bi1wdGVz
dCBcCiAgICAgICAgICAgIGZpbGU6Ly90bXBkaXIucGF0Y2ggXAotICAgICAgICAgICBmaWxlOi8v
MDAwMS1EZWZpbmUtX0RCVVNfQUxJR05PRi11c2luZy1fQWxpZ25vZi13aGVuLXVzaW5nLUMxMS1v
LnBhdGNoIFwKICAgICAgICAgICAgZmlsZTovL2RidXMtMS5pbml0IFwKLSIKKyAgICAgICAgICAg
IgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiN2MwZjliOGU1ZWMwZmYyNDc5MzgzZTYyYzAwODRh
M2EyOWFmOTllZGYxNTE0ZTlmNjU5YjgxYjMwZDRlMzUzZSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9
ICJmZDJiZGYxYmI4OWRjMzY1YTQ2NTMxYmZmNjMxNTM2ZjIyYjBkMWM2ZDVjZTJjNWM1ZTU5YjU1
MjY1YjNkNjZiIgogCiBFWFRSQV9PRUNPTkYgPSAiLS1kaXNhYmxlLXhtbC1kb2NzIFwKICAgICAg
ICAgICAgICAgICAtLWRpc2FibGUtZG94eWdlbi1kb2NzIFwKLS0gCjIuMzcuMwoK

--===============3884219113494210688==--

