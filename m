Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web08.16339.1623585061971835768
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Jun 2021 04:51:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from [172.29.10.111] (unknown [172.29.10.111])
	by mail.yoctoproject.org (Postfix) with ESMTP id A6B0838C140D
	for <openembedded-core@lists.openembedded.org>; Sun, 13 Jun 2021 11:51:01 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Armin Kuster <akuster808@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libxi: upgrading to 1.7.99.2 SUCCEEDED
Message-ID: <MADEUP.168822030D6E6F9A.6241@lists.openembedded.org>
X-Groupsio-MsgNum: 152909
Content-Type: multipart/mixed; boundary="===============2541978223779550285=="

--===============2541978223779550285==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libxi* to *1.7.99.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libxi-upgrade-1.7.10-1.7.99.2.patch
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

--===============2541978223779550285==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-libxi-upgrade-1.7.10-1.7.99.2.patch"

From 6957113c8472180c6a3c2a86a9b133a5cfdbeb93 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sun, 13 Jun 2021 10:38:41 +0000
Subject: [PATCH] libxi: upgrade 1.7.10 -> 1.7.99.2

---
 .../xorg-lib/{libxi_1.7.10.bb => libxi_1.7.99.2.bb}            | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxi_1.7.10.bb => libxi_1.7.99.2.bb} (82%)

diff --git a/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb b/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb
similarity index 82%
rename from meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb
rename to meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb
index 5a08e07362..8afa9aa527 100644
--- a/meta/recipes-graphics/xorg-lib/libxi_1.7.10.bb
+++ b/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb
@@ -17,7 +17,6 @@ PE = "1"
 
 XORG_PN = "libXi"
 
-SRC_URI[md5sum] = "62c4af0839072024b4b1c8cbe84216c7"
-SRC_URI[sha256sum] = "36a30d8f6383a72e7ce060298b4b181fd298bc3a135c8e201b7ca847f5f81061"
+SRC_URI[sha256sum] = "2ce90ebcb7fa0c3ed671924f1268b8f4c500fff62e1284699fc413e182a7896b"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1


--===============2541978223779550285==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 817 .bb files complete (0 cached, 817 parsed). 1454 targets, 41 skipped, 0 masked, 0 errors.
Removing 17 recipes from the core2-32 sysroot...done.
Removing 16 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.51.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "3.3+snapshot-cc837ba202a5cb632c5d72a899276ba1c192654c"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:cc837ba202a5cb632c5d72a899276ba1c192654c"
workspace            = "master:29c42cf24da05abb499936556dad1902e110c5a7"

Initialising tasks...done.
Sstate summary: Wanted 101 Local 94 Network 0 Missed 7 Current 106 (93% match, 96% complete)
Removing 4 stale sstate objects for arch x86_64_i686...done.
NOTE: Executing Tasks
NOTE: Running setscene task 107 of 207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 108 of 207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 109 of 207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 110 of 207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_11.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 111 of 207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_11.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 112 of 207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 113 of 207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 114 of 207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 115 of 207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 116 of 207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 117 of 207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 118 of 207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 125 of 207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 126 of 207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 128 of 207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 129 of 207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 130 of 207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 131 of 207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 132 of 207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_package_write_rpm_setscene)
NOTE: Running task 479 of 735 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_fetch)
NOTE: recipe bsd-headers-1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libx11-1_1.7.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libgcc-11.1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-11.1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xorgproto-2021.4.99.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_fetch: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_fetch: Succeeded
NOTE: Running task 480 of 735 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_unpack)
NOTE: recipe bsd-headers-1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 133 of 207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_packagedata_setscene)
NOTE: recipe libxext-1_1.3.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libx11-1_1.7.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libgcc-11.1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 134 of 207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_packagedata_setscene)
NOTE: recipe xorgproto-2021.4.99.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxi-1_1.7.99.2-r0: task do_unpack: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gcc-runtime-11.1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_unpack: Succeeded
NOTE: Running task 481 of 735 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_patch)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxi-1_1.7.99.2-r0: task do_patch: Started
NOTE: Running setscene task 136 of 207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 138 of 207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 139 of 207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 140 of 207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libx11-1_1.7.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_patch: Succeeded
NOTE: Running task 482 of 735 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 483 of 735 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_populate_lic)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
ERROR: libx11-1_1.7.1-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-src went backwards which would break package feeds (from 1:1.7.2-r0 to 1:1.7.1-r0) [version-going-backwards]
ERROR: libx11-1_1.7.1-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-dbg went backwards which would break package feeds (from 1:1.7.2-r0 to 1:1.7.1-r0) [version-going-backwards]
ERROR: libx11-1_1.7.1-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-xcb went backwards which would break package feeds (from 1:1.7.2-r0 to 1:1.7.1-r0) [version-going-backwards]
ERROR: libx11-1_1.7.1-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-staticdev went backwards which would break package feeds (from 1:1.7.2-r0 to 1:1.7.1-r0) [version-going-backwards]
ERROR: libx11-1_1.7.1-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-dev went backwards which would break package feeds (from 1:1.7.2-r0 to 1:1.7.1-r0) [version-going-backwards]
ERROR: libx11-1_1.7.1-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-doc went backwards which would break package feeds (from 1:1.7.2-r0 to 1:1.7.1-r0) [version-going-backwards]
ERROR: libx11-1_1.7.1-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-locale went backwards which would break package feeds (from 1:1.7.2-r0 to 1:1.7.1-r0) [version-going-backwards]
ERROR: libx11-1_1.7.1-r0 do_packagedata_setscene: QA Issue: Package version for package libx11 went backwards which would break package feeds (from 1:1.7.2-r0 to 1:1.7.1-r0) [version-going-backwards]
NOTE: recipe libxi-1_1.7.99.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_populate_lic: Started
NOTE: recipe libx11-1_1.7.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libx11-1_1.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 142 of 207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 143 of 207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 144 of 207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 145 of 207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 146 of 207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxi-1_1.7.99.2-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_populate_lic unihash changed to 8ffd0924315df5cba7ada852191ab2643f9fe7ebb44bd3fc409594d458a2a1d0
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libx11-1_1.7.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.7.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 148 of 207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 150 of 207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 151 of 207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 152 of 207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 153 of 207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 154 of 207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 155 of 207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 156 of 207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 157 of 207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 158 of 207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_populate_sysroot_setscene)
NOTE: recipe xtrans-1_1.4.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 160 of 207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 162 of 207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 163 of 207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 164 of 207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 165 of 207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 166 of 207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 168 of 207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 170 of 207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xorgproto-2021.4.99.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2021.4.99.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2021.4.99.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2021.4.99.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 172 of 207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.4.99.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 174 of 207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_11.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 175 of 207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 176 of 207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libtool-cross-2.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2021.4.99.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-runtime-11.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2021.4.99.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 177 of 207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_11.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 178 of 207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libtool-cross-2.4.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-runtime-11.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-11.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 180 of 207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_11.1.bb:do_packagedata_setscene)
NOTE: recipe libtool-cross-2.4.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcc-11.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-11.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 182 of 207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-11.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 183 of 207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_11.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 184 of 207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_11.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-11.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-11.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 186 of 207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 187 of 207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 188 of 207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-11.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-11.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 189 of 207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 190 of 207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_11.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-11.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-11.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 194 of 207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 195 of 207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 196 of 207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+aad50fcd79-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 199 of 207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 200 of 207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 201 of 207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_11.1.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-cross-i686-11.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-cross-i686-11.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 203 of 207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_11.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 204 of 207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-11.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-cross-i686-11.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 205 of 207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.36.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 206 of 207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe binutils-cross-i686-2.36.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe binutils-cross-i686-2.36.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 207 of 207 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.36.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe binutils-cross-i686-2.36.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-cross-i686-2.36.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 709 of 735 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxi-1_1.7.99.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 727 of 735 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_configure)
NOTE: recipe libxi-1_1.7.99.2-r0: task do_configure: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_configure: Succeeded
NOTE: Running task 728 of 735 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_compile)
NOTE: recipe libxi-1_1.7.99.2-r0: task do_compile: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_compile: Succeeded
NOTE: Running task 729 of 735 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_install)
NOTE: recipe libxi-1_1.7.99.2-r0: task do_install: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_install: Succeeded
NOTE: Running task 730 of 735 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_package)
NOTE: Running task 731 of 735 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_populate_sysroot)
NOTE: recipe libxi-1_1.7.99.2-r0: task do_package: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_populate_sysroot: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxi-1_1.7.99.2-r0: task do_package: Succeeded
NOTE: Running task 732 of 735 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_packagedata)
NOTE: recipe libxi-1_1.7.99.2-r0: task do_packagedata: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_packagedata: Succeeded
NOTE: Running task 733 of 735 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_package_write_rpm)
NOTE: Running task 734 of 735 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_package_qa)
NOTE: recipe libxi-1_1.7.99.2-r0: task do_package_write_rpm: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_package_qa: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_package_qa: Succeeded
NOTE: recipe libxi-1_1.7.99.2-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 735 of 735 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_build)
NOTE: Tasks Summary: Attempted 735 tasks of which 720 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 8 ERROR messages shown, returning a non-zero exit code.

--===============2541978223779550285==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libxi: PKGV changed from 1.7.10 [default] to 1.7.99.2 [default]
packages/core2-32-poky-linux/libxi: PV changed from "1.7.10" to "1.7.99.2"
packages/core2-32-poky-linux/libxi: SRC_URI changed from "https://www.x.org/releases//individual/lib/libXi-1.7.10.tar.bz2" to "https://www.x.org/releases//individual/lib/libXi-1.7.99.2.tar.bz2"
packages/core2-32-poky-linux/libxi/libxi-dbg: PKGV changed from 1.7.10 [default] to 1.7.99.2 [default]
packages/core2-32-poky-linux/libxi/libxi-dbg: PV changed from "1.7.10" to "1.7.99.2"
packages/core2-32-poky-linux/libxi/libxi-dbg: PKGSIZE changed from 1459860 to 1466456 (+0%)
packages/core2-32-poky-linux/libxi/libxi-dev: PKGV changed from 1.7.10 [default] to 1.7.99.2 [default]
packages/core2-32-poky-linux/libxi/libxi-dev: PV changed from "1.7.10" to "1.7.99.2"
packages/core2-32-poky-linux/libxi/libxi-dev: PKGSIZE changed from 55052 to 58235 (+6%)
packages/core2-32-poky-linux/libxi/libxi-doc: PKGV changed from 1.7.10 [default] to 1.7.99.2 [default]
packages/core2-32-poky-linux/libxi/libxi-doc: PV changed from "1.7.10" to "1.7.99.2"
packages/core2-32-poky-linux/libxi/libxi-doc: PKGSIZE changed from 236309 to 239280 (+1%)
packages/core2-32-poky-linux/libxi/libxi-locale: PKGV changed from 1.7.10 [default] to 1.7.99.2 [default]
packages/core2-32-poky-linux/libxi/libxi-locale: PV changed from "1.7.10" to "1.7.99.2"
packages/core2-32-poky-linux/libxi/libxi-src: PKGV changed from 1.7.10 [default] to 1.7.99.2 [default]
packages/core2-32-poky-linux/libxi/libxi-src: PV changed from "1.7.10" to "1.7.99.2"
packages/core2-32-poky-linux/libxi/libxi-src: PKGSIZE changed from 370810 to 382447 (+3%)
packages/core2-32-poky-linux/libxi/libxi-staticdev: PKGV changed from 1.7.10 [default] to 1.7.99.2 [default]
packages/core2-32-poky-linux/libxi/libxi-staticdev: PV changed from "1.7.10" to "1.7.99.2"
packages/core2-32-poky-linux/libxi/libxi: PKGV changed from 1.7.10 [default] to 1.7.99.2 [default]
packages/core2-32-poky-linux/libxi/libxi: PV changed from "1.7.10" to "1.7.99.2"
packages/core2-32-poky-linux/libxi/libxi: PKGSIZE changed from 75170 to 79266 (+5%)
Changes to packages/x86_64-linux/gcc-cross-i686 (sysroot):
  /sysroot-providers/virtual_i686-poky-linux-g++ was added
  /sysroot-providers/virtual_i686-poky-linux-gcc was added
  /usr/bin/i686-poky-linux was added
  /usr/bin/i686-poky-linux/i686-poky-linux-c++ was added
  /usr/bin/i686-poky-linux/i686-poky-linux-cpp was added
  /usr/bin/i686-poky-linux/i686-poky-linux-g++ was added
  /usr/bin/i686-poky-linux/i686-poky-linux-gcc was added
  /usr/bin/i686-poky-linux/i686-poky-linux-gcc-11.1.1 was added
  /usr/bin/i686-poky-linux/i686-poky-linux-gcc-ar was added
  /usr/bin/i686-poky-linux/i686-poky-linux-gcc-nm was added
  /usr/bin/i686-poky-linux/i686-poky-linux-gcc-ranlib was added
  /usr/bin/i686-poky-linux/i686-poky-linux-gcov was added
  /usr/bin/i686-poky-linux/i686-poky-linux-gcov-dump was added
  /usr/bin/i686-poky-linux/i686-poky-linux-gcov-tool was added
  /usr/bin/i686-poky-linux/i686-poky-linux-lto-dump was added
  /usr/libexec/i686-poky-linux was added
  /usr/libexec/i686-poky-linux/gcc was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.1.1 was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.1.1/ar was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.1.1/as was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.1.1/cc1 was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.1.1/cc1plus was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.1.1/collect2 was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.1.1/cpp was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.1.1/gcc was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.1.1/g++-mapper-server was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.1.1/i686-poky-linux-ar was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.1.1/i686-poky-linux-as was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.1.1/i686-poky-linux-cpp was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.1.1/i686-poky-linux-gcc was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.1.1/i686-poky-linux-ld.bfd was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.1.1/i686-poky-linux-ld was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.1.1/i686-poky-linux-ld.gold was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.1.1/i686-poky-linux-nm was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.1.1/i686-poky-linux-objcopy was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.1.1/i686-poky-linux-objdump was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.1.1/i686-poky-linux-ranlib was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.1.1/i686-poky-linux-strip was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.1.1/install-tools was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.1.1/install-tools/fixincl was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.1.1/install-tools/fixinc.sh was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.1.1/install-tools/mkheaders was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.1.1/install-tools/mkinstalldirs was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.1.1/ld.bfd was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.1.1/ld was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.1.1/ld.gold was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.1.1/libcc1plugin.so.0.0.0 was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.1.1/libcc1plugin.so.0 was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.1.1/libcc1plugin.so was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.1.1/libcc1.so.0.0.0 was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.1.1/libcc1.so.0 was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.1.1/libcc1.so was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.1.1/libcp1plugin.so.0.0.0 was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.1.1/libcp1plugin.so.0 was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.1.1/libcp1plugin.so was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.1.1/liblto_plugin.so was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.1.1/lto1 was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.1.1/lto-wrapper was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.1.1/nm was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.1.1/objcopy was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.1.1/objdump was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/gengtype was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.1.1/ranlib was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.1.1/strip was added
  /usr/lib/i686-poky-linux was added
  /usr/lib/i686-poky-linux/bfd-plugins was added
  /usr/lib/i686-poky-linux/bfd-plugins/liblto_plugin.so was added
  /usr/lib/i686-poky-linux/gcc was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1 was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/adxintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/ammintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/amxbf16intrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/amxint8intrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/amxtileintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/avx2intrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/avx5124fmapsintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/avx5124vnniwintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/avx512bf16intrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/avx512bf16vlintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/avx512bitalgintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/avx512bwintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/avx512cdintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/avx512dqintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/avx512erintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/avx512fintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/avx512ifmaintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/avx512ifmavlintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/avx512pfintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/avx512vbmi2intrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/avx512vbmi2vlintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/avx512vbmiintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/avx512vbmivlintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/avx512vlbwintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/avx512vldqintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/avx512vlintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/avx512vnniintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/avx512vnnivlintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/avx512vp2intersectintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/avx512vp2intersectvlintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/avx512vpopcntdqintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/avx512vpopcntdqvlintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/avxintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/avxvnniintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/bmi2intrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/bmiintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/bmmintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/cet.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/cetintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/cldemoteintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/clflushoptintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/clwbintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/clzerointrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/cpuid.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/cross-stdarg.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/emmintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/enqcmdintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/f16cintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include-fixed was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include-fixed/limits.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include-fixed/README was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include-fixed/syslimits.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/float.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/fma4intrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/fmaintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/fxsrintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/gfniintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/hresetintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/ia32intrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/immintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/iso646.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/keylockerintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/lwpintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/lzcntintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/mm3dnow.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/mmintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/mm_malloc.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/movdirintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/mwaitxintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/nmmintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/pconfigintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/pkuintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/pmmintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/popcntintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/prfchwintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/quadmath.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/quadmath_weak.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/rdseedintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/rtmintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/serializeintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/sgxintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/shaintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/smmintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/stdalign.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/stdarg.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/stdatomic.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/stdbool.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/stddef.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/stdfix.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/stdint-gcc.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/stdint.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/stdnoreturn.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/tbmintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/tmmintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/tsxldtrkintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/uintrintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/unwind.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/vaesintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/varargs.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/vpclmulqdqintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/waitpkgintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/wbnoinvdintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/wmmintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/x86gprintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/x86intrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/xmmintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/xopintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/xsavecintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/xsaveintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/xsaveoptintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/xsavesintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/xtestintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/install-tools was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/install-tools/fixinc_list was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/install-tools/gsyslimits.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/install-tools/include was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/install-tools/include/limits.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/install-tools/include/README was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/install-tools/macro_list was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/install-tools/mkheaders.conf was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/gtype.state was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/ada was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/ada/gcc-interface was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/ada/gcc-interface/ada-tree.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/addresses.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/alias.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/align.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/alloc-pool.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/all-tree.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/ansidecl.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/array-traits.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/asan.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/attr-fnspec.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/attribs.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/auto-host.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/auto-profile.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/backend.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/basic-block.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/bb-reorder.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/b-header-vars was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/bitmap.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/brig-builtins.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/builtin-attrs.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/builtins.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/builtins.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/builtin-types.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/bversion.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/calls.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/ccmp.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/c-family was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/c-family/c-common.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/c-family/c-common.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/c-family/c-objc.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/c-family/c-pragma.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/c-family/c-pretty-print.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/cfganal.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/cfgbuild.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/cfgcleanup.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/cfgexpand.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/cfg-flags.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/cfg.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/cfghooks.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/cfgloop.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/cfgloopmanip.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/cfgrtl.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/cgraph.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/cif-code.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/collect2-aix.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/collect2.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/collect-utils.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/color-macros.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/common was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/common/config was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/common/config/i386 was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/common/config/i386/i386-cpuinfo.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/conditions.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/config was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/configargs.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/config/dbxelf.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/config/elfos.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/config/glibc-stdint.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/config/gnu-user.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/config.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/config/i386 was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/config/i386/att.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/config/i386/gnu-user64.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/config/i386/gnu-user-common.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/config/i386/i386.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/config/i386/i386-opts.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/config/i386/i386-protos.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/config/i386/linux-common.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/config/i386/stringop.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/config/i386/unix.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/config/i386/x86-64.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/config/i386/x86-tune.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/config/initfini-array.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/config/linux-android.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/config/linux.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/config/linux-protos.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/config/vxworks-dummy.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/context.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/convert.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/coretypes.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/coroutine-builtins.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/coverage.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/cp was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/cp/cp-tree.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/cp/cp-tree.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/cp/cxx-pretty-print.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/cp/name-lookup.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/cp/operators.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/cppbuiltin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/cppdefault.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/cpplib.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/cp/type-utils.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/cselib.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/c-tree.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/d was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/data-streamer.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/dbgcnt.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/dbgcnt.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/dbxout.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/dce.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/ddg.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/d/d-tree.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/debug.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/defaults.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/df.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/dfp.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/diagnostic-color.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/diagnostic-core.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/diagnostic.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/diagnostic-event-id.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/diagnostic.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/diagnostic-metadata.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/diagnostic-path.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/diagnostic-url.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/digraph.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/dojump.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/dominance.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/domwalk.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/double-int.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/dump-context.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/dumpfile.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/dwarf2asm.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/dwarf2out.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/edit-context.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/emit-rtl.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/errors.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/escaped_string.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/et-forest.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/except.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/explow.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/expmed.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/expr.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/fibonacci_heap.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/file-find.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/filenames.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/file-prefix-map.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/fixed-value.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/flags.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/flag-types.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/fold-const-call.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/fold-const.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/function-abi.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/function.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/gcc.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/gcc-plugin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/gcc-rich-location.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/gcc-symtab.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/gcov-counter.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/gcov-io.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/gcse-common.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/gcse.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/generic-match.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/gengtype.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/genrtl.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/gensupport.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/ggc.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/ggc-internal.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/gimple-array-bounds.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/gimple-builder.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/gimple.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/gimple-expr.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/gimple-fold.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/gimple.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/gimple-iterator.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/gimple-low.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/gimple-match.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/gimple-predict.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/gimple-pretty-print.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/gimple-range-cache.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/gimple-range-edge.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/gimple-range-gori.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/gimple-range.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/gimple-ssa-evrp-analyze.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/gimple-ssa.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/gimple-ssa-warn-restrict.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/gimple-streamer.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/gimple-walk.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/gimplify.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/gimplify-me.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/glimits.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/gomp-constants.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/graphds.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/graph.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/graphite.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/graphviz.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/gsstruct.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/gstab.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/gsyms.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/gsyslimits.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/gtm-builtins.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/gtype-desc.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/hard-reg-set.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/hash-map.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/hash-map-traits.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/hash-set.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/hashtab.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/hash-table.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/hash-traits.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/highlev-plugin-common.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/hooks.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/hosthooks-def.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/hosthooks.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/hw-doloop.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/hwint.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/ifcvt.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/inchash.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/incpath.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/input.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/insn-addr.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/insn-attr-common.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/insn-attr.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/insn-codes.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/insn-config.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/insn-constants.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/insn-flags.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/insn-modes.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/insn-modes-inline.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/insn-notes.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/internal-fn.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/internal-fn.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/intl.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/int-vector-builder.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/ipa-fnsummary.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/ipa-icf-gimple.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/ipa-icf.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/ipa-inline.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/ipa-modref.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/ipa-modref-tree.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/ipa-param-manipulation.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/ipa-predicate.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/ipa-prop.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/ipa-reference.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/ipa-ref.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/ipa-utils.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/ira.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/ira-int.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/is-a.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/iterator-utils.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/json.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/langhooks-def.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/langhooks.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/lcm.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/libfuncs.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/libiberty.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/limitx.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/limity.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/line-map.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/linux64.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/linux.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/loop-unroll.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/lower-subreg.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/lra.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/lra-int.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/lto-compress.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/lto-section-names.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/lto-streamer.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/machmode.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/machmode.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/md5.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/memmodel.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/memory-block.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/mem-stats.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/mem-stats-traits.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/mode-classes.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/mux-utils.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/objc was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/objc/objc-tree.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/obstack.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/obstack-utils.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/omp-builtins.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/omp-expand.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/omp-general.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/omp-low.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/omp-offload.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/omp-simd-clone.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/optabs.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/optabs.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/optabs-libfuncs.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/optabs-query.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/optabs-tree.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/optinfo-emit-json.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/optinfo.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/options.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/opt-problem.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/opts-diagnostic.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/opts.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/opt-suggestions.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/ordered-hash-map.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/output.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/passes.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/pass-instances.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/pass_manager.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/plugin-api.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/plugin.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/plugin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/plugin-version.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/poly-int.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/poly-int-types.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/predict.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/predict.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/prefix.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/pretty-print.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/print-rtl.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/print-tree.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/profile-count.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/profile.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/range.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/range-op.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/read-md.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/read-rtl-function.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/real.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/realmpfr.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/recog.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/regcprop.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/reg-notes.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/regrename.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/regset.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/regs.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/reload.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/resource.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/rtlanal.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/rtl.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/rtl-error.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/rtl.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/rtlhash.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/rtlhooks-def.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/rtl-iter.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/rtl-ssa.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/rtx-vector-builder.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/run-rtl-passes.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/safe-ctype.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/sanitizer.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/sbitmap.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/sched-int.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/selftest-diagnostic.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/selftest.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/selftest-rtl.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/sel-sched-dump.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/sel-sched.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/sel-sched-ir.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/sese.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/shortest-paths.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/shrink-wrap.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/signop.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/sparseset.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/spellcheck.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/spellcheck-tree.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/splay-tree.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/splay-tree-utils.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/sreal.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/ssa.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/ssa-iterators.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/stab.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/statistics.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/stmt.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/stor-layout.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/streamer-hooks.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/stringpool.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/substring-locations.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/symbol-summary.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/symtab-clones.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/symtab.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/symtab-thunks.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/sync-builtins.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/system.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/target.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/target-def.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/target-globals.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/target.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/target-hooks-macros.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/target-insns.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/targhooks.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/timevar.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/timevar.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/tm.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/tm_p.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/tm-preds.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/toplev.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/tracer.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/trans-mem.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/tree-affine.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/tree-cfgcleanup.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/tree-cfg.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/tree-check.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/tree-chrec.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/tree-core.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/tree-data-ref.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/tree.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/tree-dfa.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/tree-diagnostic.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/tree-dump.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/tree-eh.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/tree.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/tree-hasher.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/tree-hash-traits.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/tree-if-conv.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/tree-inline.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/tree-into-ssa.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/tree-iterator.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/tree-nested.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/tree-object-size.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/tree-outof-ssa.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/tree-parloops.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/tree-pass.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/tree-phinodes.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/tree-pretty-print.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/tree-scalar-evolution.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/tree-sra.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/tree-ssa-address.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/tree-ssa-alias-compare.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/tree-ssa-alias.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/tree-ssa-ccp.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/tree-ssa-coalesce.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/tree-ssa-dce.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/tree-ssa-dom.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/tree-ssa-dse.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/tree-ssa.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/tree-ssa-live.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/tree-ssa-loop.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/tree-ssa-loop-ivopts.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/tree-ssa-loop-manip.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/tree-ssa-loop-niter.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/tree-ssa-math-opts.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/tree-ssanames.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/tree-ssa-operands.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/tree-ssa-propagate.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/tree-ssa-reassoc.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/tree-ssa-sccvn.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/tree-ssa-scopedtables.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/tree-ssa-strlen.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/tree-ssa-ter.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/tree-ssa-threadedge.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/tree-ssa-threadupdate.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/tree-stdarg.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/tree-streamer.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/treestruct.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/tree-switch-conversion.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/tree-vector-builder.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/tree-vectorizer.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/tree-vrp.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/tristate.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/tsan.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/tsystem.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/typeclass.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/typed-splay-tree.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/ubsan.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/valtrack.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/value-prof.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/value-query.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/value-range-equiv.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/value-range.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/varasm.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/vec.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/vec-perm-indices.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/vector-builder.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/version.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/vmsdbg.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/vr-values.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/vtable-verify.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/wide-int-bitmask.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/wide-int.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/wide-int-print.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/xcoff.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/xcoffout.h was added
  /sysroot-providers/virtual_i686-poky-linux-musl-g++ was removed
  /sysroot-providers/virtual_i686-poky-linux-musl-gcc was removed
  /usr/bin/i686-poky-linux-musl was removed
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-c++ was removed
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-cpp was removed
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-g++ was removed
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-gcc was removed
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-gcc-11.1.1 was removed
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-gcc-ar was removed
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-gcc-nm was removed
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-gcc-ranlib was removed
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-gcov was removed
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-gcov-dump was removed
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-gcov-tool was removed
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-lto-dump was removed
  /usr/libexec/i686-poky-linux-musl was removed
  /usr/libexec/i686-poky-linux-musl/gcc was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1 was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/ar was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/as was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/cc1 was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/cc1plus was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/collect2 was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/cpp was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/gcc was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/g++-mapper-server was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/i686-poky-linux-musl-ar was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/i686-poky-linux-musl-as was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/i686-poky-linux-musl-cpp was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/i686-poky-linux-musl-gcc was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/i686-poky-linux-musl-ld.bfd was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/i686-poky-linux-musl-ld was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/i686-poky-linux-musl-ld.gold was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/i686-poky-linux-musl-nm was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/i686-poky-linux-musl-objcopy was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/i686-poky-linux-musl-objdump was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/i686-poky-linux-musl-ranlib was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/i686-poky-linux-musl-strip was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/install-tools was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/install-tools/fixincl was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/install-tools/fixinc.sh was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/install-tools/mkheaders was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/install-tools/mkinstalldirs was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/ld.bfd was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/ld was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/ld.gold was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/libcc1plugin.so.0.0.0 was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/libcc1plugin.so.0 was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/libcc1plugin.so was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/libcc1.so.0.0.0 was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/libcc1.so.0 was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/libcc1.so was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/libcp1plugin.so.0.0.0 was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/libcp1plugin.so.0 was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/libcp1plugin.so was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/liblto_plugin.so was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/lto1 was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/lto-wrapper was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/nm was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/objcopy was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/objdump was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/gengtype was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/ranlib was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/strip was removed
  /usr/lib/i686-poky-linux-musl was removed
  /usr/lib/i686-poky-linux-musl/bfd-plugins was removed
  /usr/lib/i686-poky-linux-musl/bfd-plugins/liblto_plugin.so was removed
  /usr/lib/i686-poky-linux-musl/gcc was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1 was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/adxintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/ammintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/amxbf16intrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/amxint8intrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/amxtileintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/avx2intrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/avx5124fmapsintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/avx5124vnniwintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/avx512bf16intrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/avx512bf16vlintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/avx512bitalgintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/avx512bwintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/avx512cdintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/avx512dqintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/avx512erintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/avx512fintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/avx512ifmaintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/avx512ifmavlintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/avx512pfintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/avx512vbmi2intrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/avx512vbmi2vlintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/avx512vbmiintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/avx512vbmivlintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/avx512vlbwintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/avx512vldqintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/avx512vlintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/avx512vnniintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/avx512vnnivlintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/avx512vp2intersectintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/avx512vp2intersectvlintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/avx512vpopcntdqintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/avx512vpopcntdqvlintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/avxintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/avxvnniintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/bmi2intrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/bmiintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/bmmintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/cet.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/cetintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/cldemoteintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/clflushoptintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/clwbintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/clzerointrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/cpuid.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/cross-stdarg.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/emmintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/enqcmdintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/f16cintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include-fixed was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include-fixed/limits.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include-fixed/README was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include-fixed/syslimits.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/float.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/fma4intrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/fmaintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/fxsrintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/gfniintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/hresetintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/ia32intrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/immintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/iso646.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/keylockerintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/lwpintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/lzcntintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/mm3dnow.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/mmintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/mm_malloc.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/movdirintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/mwaitxintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/nmmintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/pconfigintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/pkuintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/pmmintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/popcntintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/prfchwintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/quadmath.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/quadmath_weak.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/rdseedintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/rtmintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/serializeintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/sgxintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/shaintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/smmintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/stdalign.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/stdarg.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/stdatomic.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/stdbool.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/stddef.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/stdfix.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/stdint-gcc.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/stdint.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/stdnoreturn.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/tbmintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/tmmintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/tsxldtrkintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/uintrintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/unwind.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/vaesintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/varargs.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/vpclmulqdqintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/waitpkgintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/wbnoinvdintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/wmmintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/x86gprintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/x86intrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/xmmintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/xopintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/xsavecintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/xsaveintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/xsaveoptintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/xsavesintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/xtestintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/install-tools was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/install-tools/fixinc_list was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/install-tools/gsyslimits.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/install-tools/include was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/install-tools/include/limits.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/install-tools/include/README was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/install-tools/macro_list was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/install-tools/mkheaders.conf was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/gtype.state was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/ada was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/ada/gcc-interface was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/ada/gcc-interface/ada-tree.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/addresses.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/alias.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/align.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/alloc-pool.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/all-tree.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/ansidecl.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/array-traits.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/asan.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/attr-fnspec.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/attribs.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/auto-host.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/auto-profile.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/backend.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/basic-block.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/bb-reorder.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/b-header-vars was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/bitmap.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/brig-builtins.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/builtin-attrs.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/builtins.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/builtins.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/builtin-types.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/bversion.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/calls.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/ccmp.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/c-family was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/c-family/c-common.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/c-family/c-common.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/c-family/c-objc.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/c-family/c-pragma.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/c-family/c-pretty-print.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/cfganal.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/cfgbuild.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/cfgcleanup.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/cfgexpand.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/cfg-flags.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/cfg.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/cfghooks.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/cfgloop.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/cfgloopmanip.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/cfgrtl.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/cgraph.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/cif-code.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/collect2-aix.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/collect2.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/collect-utils.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/color-macros.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/common was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/common/config was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/common/config/i386 was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/common/config/i386/i386-cpuinfo.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/conditions.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/config was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/configargs.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/config/dbxelf.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/config/elfos.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/config/glibc-stdint.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/config/gnu-user.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/config.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/config/i386 was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/config/i386/att.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/config/i386/gnu-user64.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/config/i386/gnu-user-common.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/config/i386/i386.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/config/i386/i386-opts.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/config/i386/i386-protos.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/config/i386/linux-common.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/config/i386/stringop.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/config/i386/unix.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/config/i386/x86-64.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/config/i386/x86-tune.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/config/initfini-array.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/config/linux-android.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/config/linux.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/config/linux-protos.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/config/vxworks-dummy.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/context.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/convert.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/coretypes.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/coroutine-builtins.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/coverage.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/cp was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/cp/cp-tree.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/cp/cp-tree.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/cp/cxx-pretty-print.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/cp/name-lookup.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/cp/operators.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/cppbuiltin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/cppdefault.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/cpplib.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/cp/type-utils.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/cselib.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/c-tree.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/d was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/data-streamer.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/dbgcnt.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/dbgcnt.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/dbxout.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/dce.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/ddg.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/d/d-tree.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/debug.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/defaults.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/df.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/dfp.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/diagnostic-color.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/diagnostic-core.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/diagnostic.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/diagnostic-event-id.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/diagnostic.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/diagnostic-metadata.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/diagnostic-path.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/diagnostic-url.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/digraph.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/dojump.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/dominance.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/domwalk.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/double-int.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/dump-context.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/dumpfile.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/dwarf2asm.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/dwarf2out.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/edit-context.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/emit-rtl.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/errors.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/escaped_string.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/et-forest.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/except.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/explow.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/expmed.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/expr.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/fibonacci_heap.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/file-find.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/filenames.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/file-prefix-map.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/fixed-value.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/flags.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/flag-types.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/fold-const-call.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/fold-const.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/function-abi.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/function.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/gcc.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/gcc-plugin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/gcc-rich-location.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/gcc-symtab.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/gcov-counter.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/gcov-io.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/gcse-common.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/gcse.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/generic-match.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/gengtype.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/genrtl.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/gensupport.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/ggc.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/ggc-internal.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/gimple-array-bounds.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/gimple-builder.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/gimple.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/gimple-expr.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/gimple-fold.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/gimple.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/gimple-iterator.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/gimple-low.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/gimple-match.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/gimple-predict.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/gimple-pretty-print.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/gimple-range-cache.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/gimple-range-edge.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/gimple-range-gori.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/gimple-range.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/gimple-ssa-evrp-analyze.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/gimple-ssa.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/gimple-ssa-warn-restrict.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/gimple-streamer.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/gimple-walk.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/gimplify.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/gimplify-me.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/glimits.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/gomp-constants.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/graphds.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/graph.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/graphite.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/graphviz.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/gsstruct.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/gstab.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/gsyms.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/gsyslimits.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/gtm-builtins.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/gtype-desc.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/hard-reg-set.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/hash-map.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/hash-map-traits.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/hash-set.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/hashtab.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/hash-table.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/hash-traits.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/highlev-plugin-common.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/hooks.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/hosthooks-def.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/hosthooks.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/hw-doloop.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/hwint.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/ifcvt.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/inchash.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/incpath.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/input.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/insn-addr.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/insn-attr-common.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/insn-attr.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/insn-codes.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/insn-config.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/insn-constants.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/insn-flags.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/insn-modes.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/insn-modes-inline.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/insn-notes.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/internal-fn.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/internal-fn.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/intl.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/int-vector-builder.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/ipa-fnsummary.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/ipa-icf-gimple.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/ipa-icf.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/ipa-inline.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/ipa-modref.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/ipa-modref-tree.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/ipa-param-manipulation.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/ipa-predicate.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/ipa-prop.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/ipa-reference.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/ipa-ref.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/ipa-utils.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/ira.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/ira-int.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/is-a.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/iterator-utils.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/json.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/langhooks-def.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/langhooks.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/lcm.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/libfuncs.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/libiberty.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/limitx.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/limity.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/line-map.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/linux64.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/linux.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/loop-unroll.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/lower-subreg.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/lra.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/lra-int.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/lto-compress.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/lto-section-names.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/lto-streamer.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/machmode.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/machmode.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/md5.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/memmodel.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/memory-block.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/mem-stats.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/mem-stats-traits.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/mode-classes.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/mux-utils.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/objc was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/objc/objc-tree.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/obstack.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/obstack-utils.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/omp-builtins.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/omp-expand.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/omp-general.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/omp-low.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/omp-offload.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/omp-simd-clone.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/optabs.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/optabs.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/optabs-libfuncs.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/optabs-query.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/optabs-tree.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/optinfo-emit-json.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/optinfo.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/options.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/opt-problem.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/opts-diagnostic.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/opts.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/opt-suggestions.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/ordered-hash-map.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/output.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/passes.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/pass-instances.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/pass_manager.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/plugin-api.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/plugin.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/plugin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/plugin-version.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/poly-int.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/poly-int-types.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/predict.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/predict.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/prefix.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/pretty-print.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/print-rtl.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/print-tree.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/profile-count.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/profile.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/range.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/range-op.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/read-md.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/read-rtl-function.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/real.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/realmpfr.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/recog.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/regcprop.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/reg-notes.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/regrename.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/regset.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/regs.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/reload.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/resource.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/rtlanal.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/rtl.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/rtl-error.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/rtl.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/rtlhash.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/rtlhooks-def.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/rtl-iter.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/rtl-ssa.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/rtx-vector-builder.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/run-rtl-passes.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/safe-ctype.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/sanitizer.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/sbitmap.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/sched-int.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/selftest-diagnostic.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/selftest.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/selftest-rtl.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/sel-sched-dump.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/sel-sched.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/sel-sched-ir.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/sese.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/shortest-paths.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/shrink-wrap.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/signop.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/sparseset.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/spellcheck.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/spellcheck-tree.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/splay-tree.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/splay-tree-utils.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/sreal.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/ssa.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/ssa-iterators.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/stab.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/statistics.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/stmt.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/stor-layout.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/streamer-hooks.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/stringpool.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/substring-locations.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/symbol-summary.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/symtab-clones.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/symtab.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/symtab-thunks.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/sync-builtins.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/system.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/target.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/target-def.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/target-globals.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/target.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/target-hooks-macros.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/target-insns.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/targhooks.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/timevar.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/timevar.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/tm.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/tm_p.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/tm-preds.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/toplev.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/tracer.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/trans-mem.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/tree-affine.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/tree-cfgcleanup.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/tree-cfg.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/tree-check.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/tree-chrec.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/tree-core.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/tree-data-ref.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/tree.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/tree-dfa.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/tree-diagnostic.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/tree-dump.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/tree-eh.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/tree.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/tree-hasher.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/tree-hash-traits.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/tree-if-conv.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/tree-inline.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/tree-into-ssa.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/tree-iterator.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/tree-nested.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/tree-object-size.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/tree-outof-ssa.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/tree-parloops.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/tree-pass.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/tree-phinodes.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/tree-pretty-print.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/tree-scalar-evolution.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/tree-sra.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/tree-ssa-address.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/tree-ssa-alias-compare.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/tree-ssa-alias.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/tree-ssa-ccp.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/tree-ssa-coalesce.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/tree-ssa-dce.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/tree-ssa-dom.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/tree-ssa-dse.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/tree-ssa.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/tree-ssa-live.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/tree-ssa-loop.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/tree-ssa-loop-ivopts.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/tree-ssa-loop-manip.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/tree-ssa-loop-niter.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/tree-ssa-math-opts.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/tree-ssanames.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/tree-ssa-operands.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/tree-ssa-propagate.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/tree-ssa-reassoc.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/tree-ssa-sccvn.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/tree-ssa-scopedtables.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/tree-ssa-strlen.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/tree-ssa-ter.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/tree-ssa-threadedge.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/tree-ssa-threadupdate.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/tree-stdarg.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/tree-streamer.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/treestruct.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/tree-switch-conversion.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/tree-vector-builder.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/tree-vectorizer.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/tree-vrp.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/tristate.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/tsan.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/tsystem.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/typeclass.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/typed-splay-tree.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/ubsan.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/valtrack.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/value-prof.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/value-query.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/value-range-equiv.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/value-range.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/varasm.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/vec.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/vec-perm-indices.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/vector-builder.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/version.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/vmsdbg.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/vr-values.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/vtable-verify.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/wide-int-bitmask.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/wide-int.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/wide-int-print.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/xcoff.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/xcoffout.h was removed

--===============2541978223779550285==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 817 .bb files complete (0 cached, 817 parsed). 1454 targets, 49 skipped, 0 masked, 0 errors.
Removing 1 recipes from the armv7vet2hf-neon sysroot...done.
Removing 1 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.51.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "3.3+snapshot-cc837ba202a5cb632c5d72a899276ba1c192654c"
TUNE_FEATURES        = "arm armv7ve vfp thumb neon callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:cc837ba202a5cb632c5d72a899276ba1c192654c"
workspace            = "master:29c42cf24da05abb499936556dad1902e110c5a7"

Initialising tasks...done.
Sstate summary: Wanted 12 Local 5 Network 0 Missed 7 Current 190 (41% match, 96% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 191 of 202 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 192 of 202 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.1.bb:do_populate_sysroot_setscene)
NOTE: Running task 666 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_fetch)
NOTE: recipe libxi-1_1.7.99.2-r0: task do_fetch: Started
NOTE: recipe libx11-1_1.7.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libx11-1_1.7.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_fetch: Succeeded
NOTE: Running task 689 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_unpack)
NOTE: recipe libx11-1_1.7.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 200 of 202 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.1.bb:do_packagedata_setscene)
NOTE: recipe libxi-1_1.7.99.2-r0: task do_unpack: Started
NOTE: recipe libx11-1_1.7.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxi-1_1.7.99.2-r0: task do_unpack: Succeeded
NOTE: Running task 690 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_patch)
NOTE: recipe libx11-1_1.7.1-r0: task do_packagedata_setscene: Started
ERROR: libx11-1_1.7.1-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-src went backwards which would break package feeds (from 1:1.7.2-r0 to 1:1.7.1-r0) [version-going-backwards]
NOTE: recipe libxi-1_1.7.99.2-r0: task do_patch: Started
ERROR: libx11-1_1.7.1-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-dbg went backwards which would break package feeds (from 1:1.7.2-r0 to 1:1.7.1-r0) [version-going-backwards]
ERROR: libx11-1_1.7.1-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-xcb went backwards which would break package feeds (from 1:1.7.2-r0 to 1:1.7.1-r0) [version-going-backwards]
ERROR: libx11-1_1.7.1-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-staticdev went backwards which would break package feeds (from 1:1.7.2-r0 to 1:1.7.1-r0) [version-going-backwards]
ERROR: libx11-1_1.7.1-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-dev went backwards which would break package feeds (from 1:1.7.2-r0 to 1:1.7.1-r0) [version-going-backwards]
ERROR: libx11-1_1.7.1-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-doc went backwards which would break package feeds (from 1:1.7.2-r0 to 1:1.7.1-r0) [version-going-backwards]
ERROR: libx11-1_1.7.1-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-locale went backwards which would break package feeds (from 1:1.7.2-r0 to 1:1.7.1-r0) [version-going-backwards]
ERROR: libx11-1_1.7.1-r0 do_packagedata_setscene: QA Issue: Package version for package libx11 went backwards which would break package feeds (from 1:1.7.2-r0 to 1:1.7.1-r0) [version-going-backwards]
NOTE: recipe libx11-1_1.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 202 of 202 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxi-1_1.7.99.2-r0: task do_patch: Succeeded
NOTE: Running task 691 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 692 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_populate_lic)
NOTE: recipe libx11-1_1.7.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_populate_lic: Started
NOTE: recipe libx11-1_1.7.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 716 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxi-1_1.7.99.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxi-1_1.7.99.2-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_populate_lic unihash changed to 8ffd0924315df5cba7ada852191ab2643f9fe7ebb44bd3fc409594d458a2a1d0
NOTE: recipe libxi-1_1.7.99.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 722 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_configure)
NOTE: recipe libxi-1_1.7.99.2-r0: task do_configure: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_configure: Succeeded
NOTE: Running task 723 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_compile)
NOTE: recipe libxi-1_1.7.99.2-r0: task do_compile: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_compile: Succeeded
NOTE: Running task 724 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_install)
NOTE: recipe libxi-1_1.7.99.2-r0: task do_install: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_install: Succeeded
NOTE: Running task 725 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_package)
NOTE: Running task 726 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_populate_sysroot)
NOTE: recipe libxi-1_1.7.99.2-r0: task do_populate_sysroot: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_package: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxi-1_1.7.99.2-r0: task do_package: Succeeded
NOTE: Running task 727 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_packagedata)
NOTE: recipe libxi-1_1.7.99.2-r0: task do_packagedata: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_packagedata: Succeeded
NOTE: Running task 728 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_package_write_rpm)
NOTE: Running task 729 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_package_qa)
NOTE: recipe libxi-1_1.7.99.2-r0: task do_package_write_rpm: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_package_qa: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_package_qa: Succeeded
NOTE: recipe libxi-1_1.7.99.2-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 730 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_build)
NOTE: Tasks Summary: Attempted 730 tasks of which 715 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 8 ERROR messages shown, returning a non-zero exit code.

--===============2541978223779550285==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 817 .bb files complete (0 cached, 817 parsed). 1454 targets, 58 skipped, 0 masked, 0 errors.
Removing 1 recipes from the mips32r2 sysroot...done.
Removing 1 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.51.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "3.3+snapshot-cc837ba202a5cb632c5d72a899276ba1c192654c"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:cc837ba202a5cb632c5d72a899276ba1c192654c"
workspace            = "master:29c42cf24da05abb499936556dad1902e110c5a7"

Initialising tasks...done.
Sstate summary: Wanted 12 Local 5 Network 0 Missed 7 Current 190 (41% match, 96% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 191 of 202 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 192 of 202 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.1.bb:do_populate_sysroot_setscene)
NOTE: Running task 666 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_fetch)
NOTE: recipe libx11-1_1.7.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_fetch: Started
NOTE: recipe libx11-1_1.7.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_fetch: Succeeded
NOTE: Running task 689 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_unpack)
NOTE: recipe libx11-1_1.7.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 200 of 202 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.1.bb:do_packagedata_setscene)
NOTE: recipe libxi-1_1.7.99.2-r0: task do_unpack: Started
NOTE: recipe libx11-1_1.7.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxi-1_1.7.99.2-r0: task do_unpack: Succeeded
NOTE: Running task 690 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_patch)
NOTE: recipe libx11-1_1.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_patch: Started
ERROR: libx11-1_1.7.1-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-src went backwards which would break package feeds (from 1:1.7.2-r0 to 1:1.7.1-r0) [version-going-backwards]
ERROR: libx11-1_1.7.1-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-dbg went backwards which would break package feeds (from 1:1.7.2-r0 to 1:1.7.1-r0) [version-going-backwards]
ERROR: libx11-1_1.7.1-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-xcb went backwards which would break package feeds (from 1:1.7.2-r0 to 1:1.7.1-r0) [version-going-backwards]
ERROR: libx11-1_1.7.1-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-staticdev went backwards which would break package feeds (from 1:1.7.2-r0 to 1:1.7.1-r0) [version-going-backwards]
ERROR: libx11-1_1.7.1-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-dev went backwards which would break package feeds (from 1:1.7.2-r0 to 1:1.7.1-r0) [version-going-backwards]
ERROR: libx11-1_1.7.1-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-doc went backwards which would break package feeds (from 1:1.7.2-r0 to 1:1.7.1-r0) [version-going-backwards]
ERROR: libx11-1_1.7.1-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-locale went backwards which would break package feeds (from 1:1.7.2-r0 to 1:1.7.1-r0) [version-going-backwards]
ERROR: libx11-1_1.7.1-r0 do_packagedata_setscene: QA Issue: Package version for package libx11 went backwards which would break package feeds (from 1:1.7.2-r0 to 1:1.7.1-r0) [version-going-backwards]
NOTE: recipe libx11-1_1.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 202 of 202 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxi-1_1.7.99.2-r0: task do_patch: Succeeded
NOTE: Running task 691 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 692 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_populate_lic)
NOTE: recipe libx11-1_1.7.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_populate_lic: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libx11-1_1.7.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 716 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxi-1_1.7.99.2-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_populate_lic unihash changed to 8ffd0924315df5cba7ada852191ab2643f9fe7ebb44bd3fc409594d458a2a1d0
NOTE: recipe libxi-1_1.7.99.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxi-1_1.7.99.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 722 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_configure)
NOTE: recipe libxi-1_1.7.99.2-r0: task do_configure: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_configure: Succeeded
NOTE: Running task 723 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_compile)
NOTE: recipe libxi-1_1.7.99.2-r0: task do_compile: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_compile: Succeeded
NOTE: Running task 724 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_install)
NOTE: recipe libxi-1_1.7.99.2-r0: task do_install: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_install: Succeeded
NOTE: Running task 725 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_package)
NOTE: Running task 726 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_populate_sysroot)
NOTE: recipe libxi-1_1.7.99.2-r0: task do_populate_sysroot: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_package: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxi-1_1.7.99.2-r0: task do_package: Succeeded
NOTE: Running task 727 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_packagedata)
NOTE: recipe libxi-1_1.7.99.2-r0: task do_packagedata: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_packagedata: Succeeded
NOTE: Running task 728 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_package_write_rpm)
NOTE: Running task 729 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_package_qa)
NOTE: recipe libxi-1_1.7.99.2-r0: task do_package_qa: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_package_write_rpm: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_package_qa: Succeeded
NOTE: recipe libxi-1_1.7.99.2-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 730 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_build)
NOTE: Tasks Summary: Attempted 730 tasks of which 715 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 8 ERROR messages shown, returning a non-zero exit code.

--===============2541978223779550285==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/x86_64-linux/gcc-cross-i686 (sysroot):
  /sysroot-providers/virtual_i686-poky-linux-g++ was added
  /sysroot-providers/virtual_i686-poky-linux-gcc was added
  /usr/bin/i686-poky-linux was added
  /usr/bin/i686-poky-linux/i686-poky-linux-c++ was added
  /usr/bin/i686-poky-linux/i686-poky-linux-cpp was added
  /usr/bin/i686-poky-linux/i686-poky-linux-g++ was added
  /usr/bin/i686-poky-linux/i686-poky-linux-gcc was added
  /usr/bin/i686-poky-linux/i686-poky-linux-gcc-11.1.1 was added
  /usr/bin/i686-poky-linux/i686-poky-linux-gcc-ar was added
  /usr/bin/i686-poky-linux/i686-poky-linux-gcc-nm was added
  /usr/bin/i686-poky-linux/i686-poky-linux-gcc-ranlib was added
  /usr/bin/i686-poky-linux/i686-poky-linux-gcov was added
  /usr/bin/i686-poky-linux/i686-poky-linux-gcov-dump was added
  /usr/bin/i686-poky-linux/i686-poky-linux-gcov-tool was added
  /usr/bin/i686-poky-linux/i686-poky-linux-lto-dump was added
  /usr/libexec/i686-poky-linux was added
  /usr/libexec/i686-poky-linux/gcc was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.1.1 was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.1.1/ar was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.1.1/as was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.1.1/cc1 was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.1.1/cc1plus was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.1.1/collect2 was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.1.1/cpp was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.1.1/gcc was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.1.1/g++-mapper-server was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.1.1/i686-poky-linux-ar was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.1.1/i686-poky-linux-as was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.1.1/i686-poky-linux-cpp was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.1.1/i686-poky-linux-gcc was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.1.1/i686-poky-linux-ld.bfd was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.1.1/i686-poky-linux-ld was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.1.1/i686-poky-linux-ld.gold was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.1.1/i686-poky-linux-nm was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.1.1/i686-poky-linux-objcopy was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.1.1/i686-poky-linux-objdump was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.1.1/i686-poky-linux-ranlib was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.1.1/i686-poky-linux-strip was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.1.1/install-tools was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.1.1/install-tools/fixincl was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.1.1/install-tools/fixinc.sh was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.1.1/install-tools/mkheaders was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.1.1/install-tools/mkinstalldirs was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.1.1/ld.bfd was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.1.1/ld was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.1.1/ld.gold was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.1.1/libcc1plugin.so.0.0.0 was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.1.1/libcc1plugin.so.0 was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.1.1/libcc1plugin.so was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.1.1/libcc1.so.0.0.0 was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.1.1/libcc1.so.0 was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.1.1/libcc1.so was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.1.1/libcp1plugin.so.0.0.0 was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.1.1/libcp1plugin.so.0 was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.1.1/libcp1plugin.so was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.1.1/liblto_plugin.so was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.1.1/lto1 was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.1.1/lto-wrapper was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.1.1/nm was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.1.1/objcopy was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.1.1/objdump was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/gengtype was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.1.1/ranlib was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.1.1/strip was added
  /usr/lib/i686-poky-linux was added
  /usr/lib/i686-poky-linux/bfd-plugins was added
  /usr/lib/i686-poky-linux/bfd-plugins/liblto_plugin.so was added
  /usr/lib/i686-poky-linux/gcc was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1 was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/adxintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/ammintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/amxbf16intrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/amxint8intrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/amxtileintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/avx2intrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/avx5124fmapsintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/avx5124vnniwintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/avx512bf16intrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/avx512bf16vlintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/avx512bitalgintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/avx512bwintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/avx512cdintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/avx512dqintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/avx512erintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/avx512fintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/avx512ifmaintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/avx512ifmavlintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/avx512pfintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/avx512vbmi2intrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/avx512vbmi2vlintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/avx512vbmiintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/avx512vbmivlintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/avx512vlbwintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/avx512vldqintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/avx512vlintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/avx512vnniintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/avx512vnnivlintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/avx512vp2intersectintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/avx512vp2intersectvlintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/avx512vpopcntdqintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/avx512vpopcntdqvlintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/avxintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/avxvnniintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/bmi2intrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/bmiintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/bmmintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/cet.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/cetintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/cldemoteintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/clflushoptintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/clwbintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/clzerointrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/cpuid.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/cross-stdarg.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/emmintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/enqcmdintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/f16cintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include-fixed was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include-fixed/limits.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include-fixed/README was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include-fixed/syslimits.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/float.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/fma4intrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/fmaintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/fxsrintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/gfniintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/hresetintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/ia32intrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/immintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/iso646.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/keylockerintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/lwpintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/lzcntintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/mm3dnow.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/mmintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/mm_malloc.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/movdirintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/mwaitxintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/nmmintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/pconfigintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/pkuintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/pmmintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/popcntintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/prfchwintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/quadmath.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/quadmath_weak.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/rdseedintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/rtmintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/serializeintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/sgxintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/shaintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/smmintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/stdalign.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/stdarg.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/stdatomic.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/stdbool.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/stddef.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/stdfix.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/stdint-gcc.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/stdint.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/stdnoreturn.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/tbmintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/tmmintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/tsxldtrkintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/uintrintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/unwind.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/vaesintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/varargs.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/vpclmulqdqintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/waitpkgintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/wbnoinvdintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/wmmintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/x86gprintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/x86intrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/xmmintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/xopintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/xsavecintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/xsaveintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/xsaveoptintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/xsavesintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/include/xtestintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/install-tools was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/install-tools/fixinc_list was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/install-tools/gsyslimits.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/install-tools/include was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/install-tools/include/limits.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/install-tools/include/README was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/install-tools/macro_list was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/install-tools/mkheaders.conf was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/gtype.state was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/ada was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/ada/gcc-interface was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/ada/gcc-interface/ada-tree.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/addresses.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/alias.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/align.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/alloc-pool.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/all-tree.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/ansidecl.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/array-traits.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/asan.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/attr-fnspec.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/attribs.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/auto-host.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/auto-profile.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/backend.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/basic-block.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/bb-reorder.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/b-header-vars was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/bitmap.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/brig-builtins.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/builtin-attrs.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/builtins.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/builtins.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/builtin-types.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/bversion.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/calls.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/ccmp.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/c-family was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/c-family/c-common.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/c-family/c-common.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/c-family/c-objc.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/c-family/c-pragma.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/c-family/c-pretty-print.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/cfganal.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/cfgbuild.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/cfgcleanup.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/cfgexpand.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/cfg-flags.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/cfg.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/cfghooks.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/cfgloop.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/cfgloopmanip.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/cfgrtl.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/cgraph.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/cif-code.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/collect2-aix.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/collect2.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/collect-utils.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/color-macros.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/common was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/common/config was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/common/config/i386 was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/common/config/i386/i386-cpuinfo.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/conditions.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/config was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/configargs.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/config/dbxelf.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/config/elfos.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/config/glibc-stdint.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/config/gnu-user.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/config.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/config/i386 was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/config/i386/att.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/config/i386/gnu-user64.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/config/i386/gnu-user-common.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/config/i386/i386.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/config/i386/i386-opts.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/config/i386/i386-protos.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/config/i386/linux-common.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/config/i386/stringop.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/config/i386/unix.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/config/i386/x86-64.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/config/i386/x86-tune.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/config/initfini-array.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/config/linux-android.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/config/linux.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/config/linux-protos.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/config/vxworks-dummy.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/context.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/convert.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/coretypes.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/coroutine-builtins.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/coverage.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/cp was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/cp/cp-tree.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/cp/cp-tree.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/cp/cxx-pretty-print.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/cp/name-lookup.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/cp/operators.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/cppbuiltin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/cppdefault.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/cpplib.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/cp/type-utils.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/cselib.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/c-tree.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/d was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/data-streamer.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/dbgcnt.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/dbgcnt.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/dbxout.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/dce.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/ddg.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/d/d-tree.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/debug.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/defaults.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/df.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/dfp.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/diagnostic-color.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/diagnostic-core.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/diagnostic.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/diagnostic-event-id.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/diagnostic.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/diagnostic-metadata.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/diagnostic-path.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/diagnostic-url.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/digraph.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/dojump.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/dominance.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/domwalk.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/double-int.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/dump-context.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/dumpfile.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/dwarf2asm.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/dwarf2out.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/edit-context.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/emit-rtl.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/errors.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/escaped_string.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/et-forest.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/except.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/explow.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/expmed.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/expr.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/fibonacci_heap.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/file-find.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/filenames.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/file-prefix-map.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/fixed-value.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/flags.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/flag-types.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/fold-const-call.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/fold-const.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/function-abi.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/function.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/gcc.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/gcc-plugin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/gcc-rich-location.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/gcc-symtab.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/gcov-counter.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/gcov-io.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/gcse-common.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/gcse.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/generic-match.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/gengtype.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/genrtl.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/gensupport.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/ggc.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/ggc-internal.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/gimple-array-bounds.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/gimple-builder.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/gimple.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/gimple-expr.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/gimple-fold.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/gimple.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/gimple-iterator.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/gimple-low.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/gimple-match.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/gimple-predict.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/gimple-pretty-print.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/gimple-range-cache.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/gimple-range-edge.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/gimple-range-gori.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/gimple-range.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/gimple-ssa-evrp-analyze.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/gimple-ssa.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/gimple-ssa-warn-restrict.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/gimple-streamer.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/gimple-walk.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/gimplify.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/gimplify-me.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/glimits.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/gomp-constants.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/graphds.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/graph.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/graphite.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/graphviz.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/gsstruct.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/gstab.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/gsyms.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/gsyslimits.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/gtm-builtins.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/gtype-desc.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/hard-reg-set.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/hash-map.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/hash-map-traits.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/hash-set.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/hashtab.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/hash-table.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/hash-traits.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/highlev-plugin-common.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/hooks.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/hosthooks-def.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/hosthooks.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/hw-doloop.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/hwint.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/ifcvt.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/inchash.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/incpath.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/input.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/insn-addr.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/insn-attr-common.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/insn-attr.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/insn-codes.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/insn-config.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/insn-constants.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/insn-flags.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/insn-modes.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/insn-modes-inline.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/insn-notes.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/internal-fn.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/internal-fn.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/intl.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/int-vector-builder.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/ipa-fnsummary.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/ipa-icf-gimple.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/ipa-icf.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/ipa-inline.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/ipa-modref.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/ipa-modref-tree.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/ipa-param-manipulation.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/ipa-predicate.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/ipa-prop.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/ipa-reference.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/ipa-ref.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/ipa-utils.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/ira.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/ira-int.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/is-a.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/iterator-utils.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/json.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/langhooks-def.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/langhooks.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/lcm.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/libfuncs.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/libiberty.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/limitx.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/limity.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/line-map.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/linux64.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/linux.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/loop-unroll.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/lower-subreg.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/lra.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/lra-int.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/lto-compress.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/lto-section-names.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/lto-streamer.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/machmode.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/machmode.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/md5.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/memmodel.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/memory-block.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/mem-stats.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/mem-stats-traits.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/mode-classes.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/mux-utils.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/objc was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/objc/objc-tree.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/obstack.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/obstack-utils.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/omp-builtins.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/omp-expand.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/omp-general.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/omp-low.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/omp-offload.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/omp-simd-clone.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/optabs.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/optabs.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/optabs-libfuncs.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/optabs-query.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/optabs-tree.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/optinfo-emit-json.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/optinfo.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/options.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/opt-problem.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/opts-diagnostic.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/opts.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/opt-suggestions.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/ordered-hash-map.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/output.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/passes.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/pass-instances.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/pass_manager.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/plugin-api.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/plugin.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/plugin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/plugin-version.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/poly-int.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/poly-int-types.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/predict.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/predict.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/prefix.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/pretty-print.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/print-rtl.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/print-tree.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/profile-count.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/profile.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/range.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/range-op.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/read-md.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/read-rtl-function.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/real.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/realmpfr.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/recog.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/regcprop.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/reg-notes.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/regrename.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/regset.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/regs.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/reload.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/resource.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/rtlanal.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/rtl.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/rtl-error.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/rtl.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/rtlhash.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/rtlhooks-def.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/rtl-iter.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/rtl-ssa.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/rtx-vector-builder.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/run-rtl-passes.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/safe-ctype.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/sanitizer.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/sbitmap.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/sched-int.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/selftest-diagnostic.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/selftest.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/selftest-rtl.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/sel-sched-dump.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/sel-sched.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/sel-sched-ir.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/sese.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/shortest-paths.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/shrink-wrap.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/signop.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/sparseset.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/spellcheck.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/spellcheck-tree.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/splay-tree.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/splay-tree-utils.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/sreal.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/ssa.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/ssa-iterators.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/stab.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/statistics.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/stmt.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/stor-layout.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/streamer-hooks.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/stringpool.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/substring-locations.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/symbol-summary.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/symtab-clones.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/symtab.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/symtab-thunks.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/sync-builtins.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/system.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/target.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/target-def.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/target-globals.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/target.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/target-hooks-macros.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/target-insns.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/targhooks.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/timevar.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/timevar.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/tm.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/tm_p.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/tm-preds.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/toplev.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/tracer.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/trans-mem.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/tree-affine.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/tree-cfgcleanup.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/tree-cfg.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/tree-check.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/tree-chrec.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/tree-core.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/tree-data-ref.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/tree.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/tree-dfa.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/tree-diagnostic.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/tree-dump.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/tree-eh.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/tree.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/tree-hasher.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/tree-hash-traits.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/tree-if-conv.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/tree-inline.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/tree-into-ssa.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/tree-iterator.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/tree-nested.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/tree-object-size.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/tree-outof-ssa.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/tree-parloops.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/tree-pass.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/tree-phinodes.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/tree-pretty-print.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/tree-scalar-evolution.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/tree-sra.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/tree-ssa-address.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/tree-ssa-alias-compare.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/tree-ssa-alias.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/tree-ssa-ccp.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/tree-ssa-coalesce.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/tree-ssa-dce.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/tree-ssa-dom.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/tree-ssa-dse.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/tree-ssa.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/tree-ssa-live.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/tree-ssa-loop.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/tree-ssa-loop-ivopts.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/tree-ssa-loop-manip.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/tree-ssa-loop-niter.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/tree-ssa-math-opts.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/tree-ssanames.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/tree-ssa-operands.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/tree-ssa-propagate.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/tree-ssa-reassoc.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/tree-ssa-sccvn.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/tree-ssa-scopedtables.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/tree-ssa-strlen.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/tree-ssa-ter.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/tree-ssa-threadedge.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/tree-ssa-threadupdate.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/tree-stdarg.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/tree-streamer.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/treestruct.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/tree-switch-conversion.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/tree-vector-builder.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/tree-vectorizer.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/tree-vrp.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/tristate.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/tsan.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/tsystem.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/typeclass.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/typed-splay-tree.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/ubsan.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/valtrack.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/value-prof.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/value-query.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/value-range-equiv.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/value-range.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/varasm.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/vec.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/vec-perm-indices.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/vector-builder.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/version.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/vmsdbg.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/vr-values.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/vtable-verify.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/wide-int-bitmask.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/wide-int.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/wide-int-print.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/xcoff.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.1.1/plugin/include/xcoffout.h was added
  /sysroot-providers/virtual_i686-poky-linux-musl-g++ was removed
  /sysroot-providers/virtual_i686-poky-linux-musl-gcc was removed
  /usr/bin/i686-poky-linux-musl was removed
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-c++ was removed
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-cpp was removed
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-g++ was removed
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-gcc was removed
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-gcc-11.1.1 was removed
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-gcc-ar was removed
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-gcc-nm was removed
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-gcc-ranlib was removed
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-gcov was removed
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-gcov-dump was removed
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-gcov-tool was removed
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-lto-dump was removed
  /usr/libexec/i686-poky-linux-musl was removed
  /usr/libexec/i686-poky-linux-musl/gcc was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1 was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/ar was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/as was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/cc1 was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/cc1plus was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/collect2 was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/cpp was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/gcc was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/g++-mapper-server was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/i686-poky-linux-musl-ar was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/i686-poky-linux-musl-as was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/i686-poky-linux-musl-cpp was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/i686-poky-linux-musl-gcc was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/i686-poky-linux-musl-ld.bfd was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/i686-poky-linux-musl-ld was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/i686-poky-linux-musl-ld.gold was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/i686-poky-linux-musl-nm was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/i686-poky-linux-musl-objcopy was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/i686-poky-linux-musl-objdump was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/i686-poky-linux-musl-ranlib was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/i686-poky-linux-musl-strip was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/install-tools was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/install-tools/fixincl was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/install-tools/fixinc.sh was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/install-tools/mkheaders was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/install-tools/mkinstalldirs was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/ld.bfd was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/ld was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/ld.gold was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/libcc1plugin.so.0.0.0 was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/libcc1plugin.so.0 was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/libcc1plugin.so was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/libcc1.so.0.0.0 was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/libcc1.so.0 was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/libcc1.so was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/libcp1plugin.so.0.0.0 was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/libcp1plugin.so.0 was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/libcp1plugin.so was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/liblto_plugin.so was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/lto1 was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/lto-wrapper was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/nm was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/objcopy was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/objdump was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/gengtype was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/ranlib was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/strip was removed
  /usr/lib/i686-poky-linux-musl was removed
  /usr/lib/i686-poky-linux-musl/bfd-plugins was removed
  /usr/lib/i686-poky-linux-musl/bfd-plugins/liblto_plugin.so was removed
  /usr/lib/i686-poky-linux-musl/gcc was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1 was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/adxintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/ammintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/amxbf16intrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/amxint8intrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/amxtileintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/avx2intrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/avx5124fmapsintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/avx5124vnniwintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/avx512bf16intrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/avx512bf16vlintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/avx512bitalgintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/avx512bwintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/avx512cdintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/avx512dqintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/avx512erintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/avx512fintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/avx512ifmaintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/avx512ifmavlintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/avx512pfintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/avx512vbmi2intrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/avx512vbmi2vlintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/avx512vbmiintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/avx512vbmivlintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/avx512vlbwintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/avx512vldqintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/avx512vlintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/avx512vnniintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/avx512vnnivlintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/avx512vp2intersectintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/avx512vp2intersectvlintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/avx512vpopcntdqintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/avx512vpopcntdqvlintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/avxintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/avxvnniintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/bmi2intrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/bmiintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/bmmintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/cet.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/cetintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/cldemoteintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/clflushoptintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/clwbintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/clzerointrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/cpuid.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/cross-stdarg.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/emmintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/enqcmdintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/f16cintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include-fixed was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include-fixed/limits.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include-fixed/README was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include-fixed/syslimits.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/float.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/fma4intrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/fmaintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/fxsrintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/gfniintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/hresetintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/ia32intrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/immintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/iso646.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/keylockerintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/lwpintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/lzcntintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/mm3dnow.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/mmintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/mm_malloc.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/movdirintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/mwaitxintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/nmmintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/pconfigintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/pkuintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/pmmintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/popcntintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/prfchwintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/quadmath.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/quadmath_weak.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/rdseedintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/rtmintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/serializeintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/sgxintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/shaintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/smmintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/stdalign.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/stdarg.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/stdatomic.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/stdbool.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/stddef.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/stdfix.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/stdint-gcc.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/stdint.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/stdnoreturn.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/tbmintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/tmmintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/tsxldtrkintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/uintrintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/unwind.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/vaesintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/varargs.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/vpclmulqdqintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/waitpkgintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/wbnoinvdintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/wmmintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/x86gprintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/x86intrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/xmmintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/xopintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/xsavecintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/xsaveintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/xsaveoptintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/xsavesintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/include/xtestintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/install-tools was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/install-tools/fixinc_list was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/install-tools/gsyslimits.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/install-tools/include was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/install-tools/include/limits.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/install-tools/include/README was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/install-tools/macro_list was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/install-tools/mkheaders.conf was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/gtype.state was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/ada was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/ada/gcc-interface was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/ada/gcc-interface/ada-tree.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/addresses.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/alias.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/align.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/alloc-pool.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/all-tree.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/ansidecl.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/array-traits.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/asan.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/attr-fnspec.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/attribs.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/auto-host.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/auto-profile.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/backend.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/basic-block.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/bb-reorder.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/b-header-vars was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/bitmap.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/brig-builtins.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/builtin-attrs.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/builtins.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/builtins.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/builtin-types.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/bversion.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/calls.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/ccmp.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/c-family was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/c-family/c-common.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/c-family/c-common.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/c-family/c-objc.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/c-family/c-pragma.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/c-family/c-pretty-print.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/cfganal.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/cfgbuild.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/cfgcleanup.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/cfgexpand.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/cfg-flags.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/cfg.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/cfghooks.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/cfgloop.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/cfgloopmanip.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/cfgrtl.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/cgraph.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/cif-code.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/collect2-aix.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/collect2.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/collect-utils.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/color-macros.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/common was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/common/config was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/common/config/i386 was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/common/config/i386/i386-cpuinfo.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/conditions.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/config was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/configargs.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/config/dbxelf.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/config/elfos.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/config/glibc-stdint.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/config/gnu-user.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/config.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/config/i386 was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/config/i386/att.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/config/i386/gnu-user64.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/config/i386/gnu-user-common.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/config/i386/i386.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/config/i386/i386-opts.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/config/i386/i386-protos.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/config/i386/linux-common.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/config/i386/stringop.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/config/i386/unix.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/config/i386/x86-64.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/config/i386/x86-tune.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/config/initfini-array.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/config/linux-android.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/config/linux.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/config/linux-protos.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/config/vxworks-dummy.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/context.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/convert.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/coretypes.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/coroutine-builtins.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/coverage.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/cp was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/cp/cp-tree.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/cp/cp-tree.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/cp/cxx-pretty-print.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/cp/name-lookup.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/cp/operators.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/cppbuiltin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/cppdefault.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/cpplib.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/cp/type-utils.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/cselib.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/c-tree.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/d was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/data-streamer.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/dbgcnt.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/dbgcnt.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/dbxout.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/dce.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/ddg.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/d/d-tree.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/debug.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/defaults.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/df.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/dfp.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/diagnostic-color.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/diagnostic-core.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/diagnostic.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/diagnostic-event-id.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/diagnostic.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/diagnostic-metadata.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/diagnostic-path.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/diagnostic-url.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/digraph.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/dojump.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/dominance.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/domwalk.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/double-int.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/dump-context.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/dumpfile.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/dwarf2asm.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/dwarf2out.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/edit-context.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/emit-rtl.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/errors.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/escaped_string.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/et-forest.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/except.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/explow.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/expmed.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/expr.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/fibonacci_heap.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/file-find.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/filenames.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/file-prefix-map.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/fixed-value.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/flags.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/flag-types.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/fold-const-call.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/fold-const.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/function-abi.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/function.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/gcc.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/gcc-plugin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/gcc-rich-location.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/gcc-symtab.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/gcov-counter.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/gcov-io.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/gcse-common.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/gcse.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/generic-match.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/gengtype.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/genrtl.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/gensupport.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/ggc.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/ggc-internal.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/gimple-array-bounds.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/gimple-builder.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/gimple.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/gimple-expr.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/gimple-fold.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/gimple.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/gimple-iterator.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/gimple-low.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/gimple-match.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/gimple-predict.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/gimple-pretty-print.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/gimple-range-cache.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/gimple-range-edge.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/gimple-range-gori.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/gimple-range.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/gimple-ssa-evrp-analyze.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/gimple-ssa.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/gimple-ssa-warn-restrict.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/gimple-streamer.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/gimple-walk.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/gimplify.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/gimplify-me.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/glimits.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/gomp-constants.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/graphds.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/graph.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/graphite.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/graphviz.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/gsstruct.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/gstab.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/gsyms.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/gsyslimits.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/gtm-builtins.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/gtype-desc.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/hard-reg-set.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/hash-map.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/hash-map-traits.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/hash-set.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/hashtab.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/hash-table.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/hash-traits.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/highlev-plugin-common.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/hooks.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/hosthooks-def.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/hosthooks.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/hw-doloop.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/hwint.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/ifcvt.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/inchash.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/incpath.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/input.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/insn-addr.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/insn-attr-common.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/insn-attr.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/insn-codes.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/insn-config.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/insn-constants.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/insn-flags.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/insn-modes.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/insn-modes-inline.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/insn-notes.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/internal-fn.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/internal-fn.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/intl.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/int-vector-builder.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/ipa-fnsummary.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/ipa-icf-gimple.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/ipa-icf.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/ipa-inline.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/ipa-modref.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/ipa-modref-tree.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/ipa-param-manipulation.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/ipa-predicate.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/ipa-prop.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/ipa-reference.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/ipa-ref.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/ipa-utils.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/ira.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/ira-int.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/is-a.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/iterator-utils.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/json.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/langhooks-def.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/langhooks.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/lcm.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/libfuncs.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/libiberty.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/limitx.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/limity.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/line-map.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/linux64.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/linux.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/loop-unroll.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/lower-subreg.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/lra.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/lra-int.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/lto-compress.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/lto-section-names.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/lto-streamer.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/machmode.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/machmode.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/md5.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/memmodel.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/memory-block.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/mem-stats.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/mem-stats-traits.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/mode-classes.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/mux-utils.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/objc was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/objc/objc-tree.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/obstack.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/obstack-utils.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/omp-builtins.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/omp-expand.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/omp-general.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/omp-low.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/omp-offload.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/omp-simd-clone.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/optabs.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/optabs.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/optabs-libfuncs.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/optabs-query.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/optabs-tree.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/optinfo-emit-json.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/optinfo.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/options.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/opt-problem.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/opts-diagnostic.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/opts.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/opt-suggestions.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/ordered-hash-map.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/output.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/passes.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/pass-instances.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/pass_manager.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/plugin-api.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/plugin.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/plugin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/plugin-version.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/poly-int.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/poly-int-types.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/predict.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/predict.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/prefix.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/pretty-print.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/print-rtl.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/print-tree.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/profile-count.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/profile.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/range.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/range-op.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/read-md.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/read-rtl-function.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/real.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/realmpfr.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/recog.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/regcprop.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/reg-notes.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/regrename.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/regset.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/regs.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/reload.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/resource.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/rtlanal.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/rtl.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/rtl-error.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/rtl.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/rtlhash.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/rtlhooks-def.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/rtl-iter.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/rtl-ssa.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/rtx-vector-builder.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/run-rtl-passes.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/safe-ctype.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/sanitizer.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/sbitmap.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/sched-int.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/selftest-diagnostic.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/selftest.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/selftest-rtl.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/sel-sched-dump.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/sel-sched.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/sel-sched-ir.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/sese.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/shortest-paths.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/shrink-wrap.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/signop.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/sparseset.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/spellcheck.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/spellcheck-tree.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/splay-tree.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/splay-tree-utils.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/sreal.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/ssa.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/ssa-iterators.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/stab.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/statistics.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/stmt.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/stor-layout.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/streamer-hooks.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/stringpool.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/substring-locations.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/symbol-summary.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/symtab-clones.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/symtab.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/symtab-thunks.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/sync-builtins.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/system.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/target.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/target-def.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/target-globals.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/target.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/target-hooks-macros.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/target-insns.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/targhooks.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/timevar.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/timevar.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/tm.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/tm_p.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/tm-preds.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/toplev.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/tracer.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/trans-mem.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/tree-affine.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/tree-cfgcleanup.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/tree-cfg.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/tree-check.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/tree-chrec.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/tree-core.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/tree-data-ref.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/tree.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/tree-dfa.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/tree-diagnostic.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/tree-dump.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/tree-eh.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/tree.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/tree-hasher.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/tree-hash-traits.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/tree-if-conv.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/tree-inline.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/tree-into-ssa.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/tree-iterator.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/tree-nested.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/tree-object-size.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/tree-outof-ssa.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/tree-parloops.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/tree-pass.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/tree-phinodes.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/tree-pretty-print.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/tree-scalar-evolution.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/tree-sra.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/tree-ssa-address.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/tree-ssa-alias-compare.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/tree-ssa-alias.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/tree-ssa-ccp.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/tree-ssa-coalesce.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/tree-ssa-dce.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/tree-ssa-dom.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/tree-ssa-dse.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/tree-ssa.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/tree-ssa-live.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/tree-ssa-loop.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/tree-ssa-loop-ivopts.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/tree-ssa-loop-manip.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/tree-ssa-loop-niter.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/tree-ssa-math-opts.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/tree-ssanames.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/tree-ssa-operands.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/tree-ssa-propagate.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/tree-ssa-reassoc.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/tree-ssa-sccvn.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/tree-ssa-scopedtables.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/tree-ssa-strlen.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/tree-ssa-ter.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/tree-ssa-threadedge.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/tree-ssa-threadupdate.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/tree-stdarg.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/tree-streamer.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/treestruct.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/tree-switch-conversion.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/tree-vector-builder.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/tree-vectorizer.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/tree-vrp.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/tristate.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/tsan.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/tsystem.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/typeclass.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/typed-splay-tree.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/ubsan.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/valtrack.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/value-prof.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/value-query.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/value-range-equiv.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/value-range.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/varasm.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/vec.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/vec-perm-indices.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/vector-builder.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/version.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/vmsdbg.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/vr-values.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/vtable-verify.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/wide-int-bitmask.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/wide-int.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/wide-int-print.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/xcoff.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.1.1/plugin/include/xcoffout.h was removed

--===============2541978223779550285==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 817 .bb files complete (0 cached, 817 parsed). 1454 targets, 66 skipped, 0 masked, 0 errors.
Removing 1 recipes from the ppc7400 sysroot...done.
Removing 1 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.51.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "3.3+snapshot-cc837ba202a5cb632c5d72a899276ba1c192654c"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:cc837ba202a5cb632c5d72a899276ba1c192654c"
workspace            = "master:29c42cf24da05abb499936556dad1902e110c5a7"

Initialising tasks...done.
Sstate summary: Wanted 12 Local 5 Network 0 Missed 7 Current 190 (41% match, 96% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 191 of 202 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 192 of 202 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.1.bb:do_populate_sysroot_setscene)
NOTE: Running task 666 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_fetch)
NOTE: recipe libxi-1_1.7.99.2-r0: task do_fetch: Started
NOTE: recipe libx11-1_1.7.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libx11-1_1.7.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_fetch: Succeeded
NOTE: Running task 689 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_unpack)
NOTE: recipe libxi-1_1.7.99.2-r0: task do_unpack: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_unpack: Succeeded
NOTE: Running task 690 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_patch)
NOTE: recipe libxi-1_1.7.99.2-r0: task do_patch: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_patch: Succeeded
NOTE: Running task 691 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 692 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_populate_lic)
NOTE: recipe libx11-1_1.7.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 200 of 202 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.1.bb:do_packagedata_setscene)
NOTE: recipe libx11-1_1.7.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxi-1_1.7.99.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_populate_lic: Started
NOTE: recipe libx11-1_1.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_populate_lic unihash changed to 8ffd0924315df5cba7ada852191ab2643f9fe7ebb44bd3fc409594d458a2a1d0
ERROR: libx11-1_1.7.1-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-src went backwards which would break package feeds (from 1:1.7.2-r0 to 1:1.7.1-r0) [version-going-backwards]
ERROR: libx11-1_1.7.1-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-dbg went backwards which would break package feeds (from 1:1.7.2-r0 to 1:1.7.1-r0) [version-going-backwards]
ERROR: libx11-1_1.7.1-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-xcb went backwards which would break package feeds (from 1:1.7.2-r0 to 1:1.7.1-r0) [version-going-backwards]
NOTE: recipe libxi-1_1.7.99.2-r0: task do_deploy_source_date_epoch: Succeeded
ERROR: libx11-1_1.7.1-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-staticdev went backwards which would break package feeds (from 1:1.7.2-r0 to 1:1.7.1-r0) [version-going-backwards]
ERROR: libx11-1_1.7.1-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-dev went backwards which would break package feeds (from 1:1.7.2-r0 to 1:1.7.1-r0) [version-going-backwards]
ERROR: libx11-1_1.7.1-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-doc went backwards which would break package feeds (from 1:1.7.2-r0 to 1:1.7.1-r0) [version-going-backwards]
ERROR: libx11-1_1.7.1-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-locale went backwards which would break package feeds (from 1:1.7.2-r0 to 1:1.7.1-r0) [version-going-backwards]
ERROR: libx11-1_1.7.1-r0 do_packagedata_setscene: QA Issue: Package version for package libx11 went backwards which would break package feeds (from 1:1.7.2-r0 to 1:1.7.1-r0) [version-going-backwards]
NOTE: recipe libx11-1_1.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 202 of 202 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libx11-1_1.7.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libx11-1_1.7.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 716 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxi-1_1.7.99.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 722 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_configure)
NOTE: recipe libxi-1_1.7.99.2-r0: task do_configure: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_configure: Succeeded
NOTE: Running task 723 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_compile)
NOTE: recipe libxi-1_1.7.99.2-r0: task do_compile: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_compile: Succeeded
NOTE: Running task 724 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_install)
NOTE: recipe libxi-1_1.7.99.2-r0: task do_install: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_install: Succeeded
NOTE: Running task 725 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_package)
NOTE: Running task 726 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_populate_sysroot)
NOTE: recipe libxi-1_1.7.99.2-r0: task do_populate_sysroot: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_package: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxi-1_1.7.99.2-r0: task do_package: Succeeded
NOTE: Running task 727 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_packagedata)
NOTE: recipe libxi-1_1.7.99.2-r0: task do_packagedata: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_packagedata: Succeeded
NOTE: Running task 728 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_package_write_rpm)
NOTE: Running task 729 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_package_qa)
NOTE: recipe libxi-1_1.7.99.2-r0: task do_package_write_rpm: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_package_qa: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_package_qa: Succeeded
NOTE: recipe libxi-1_1.7.99.2-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 730 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_build)
NOTE: Tasks Summary: Attempted 730 tasks of which 715 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 8 ERROR messages shown, returning a non-zero exit code.

--===============2541978223779550285==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1456 entries from dependency cache.
Parsing recipes...done.
Parsing of 817 .bb files complete (816 cached, 1 parsed). 1454 targets, 31 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.51.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "3.3+snapshot-cc837ba202a5cb632c5d72a899276ba1c192654c"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:cc837ba202a5cb632c5d72a899276ba1c192654c"
workspace            = "master:29c42cf24da05abb499936556dad1902e110c5a7"

Initialising tasks...done.
Sstate summary: Wanted 15 Local 8 Network 0 Missed 7 Current 187 (53% match, 96% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 188 of 202 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 189 of 202 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.1.bb:do_populate_sysroot_setscene)
NOTE: Running task 666 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_fetch)
NOTE: recipe libx11-1_1.7.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_fetch: Started
NOTE: recipe libx11-1_1.7.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_fetch: Succeeded
NOTE: Running task 689 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_unpack)
NOTE: recipe libx11-1_1.7.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 200 of 202 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.1.bb:do_packagedata_setscene)
NOTE: recipe libxi-1_1.7.99.2-r0: task do_unpack: Started
NOTE: recipe libx11-1_1.7.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libx11-1_1.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_unpack: Succeeded
NOTE: Running task 690 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_patch)
ERROR: libx11-1_1.7.1-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-src went backwards which would break package feeds (from 1:1.7.2-r0 to 1:1.7.1-r0) [version-going-backwards]
ERROR: libx11-1_1.7.1-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-dbg went backwards which would break package feeds (from 1:1.7.2-r0 to 1:1.7.1-r0) [version-going-backwards]
ERROR: libx11-1_1.7.1-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-xcb went backwards which would break package feeds (from 1:1.7.2-r0 to 1:1.7.1-r0) [version-going-backwards]
ERROR: libx11-1_1.7.1-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-staticdev went backwards which would break package feeds (from 1:1.7.2-r0 to 1:1.7.1-r0) [version-going-backwards]
ERROR: libx11-1_1.7.1-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-dev went backwards which would break package feeds (from 1:1.7.2-r0 to 1:1.7.1-r0) [version-going-backwards]
NOTE: recipe libxi-1_1.7.99.2-r0: task do_patch: Started
ERROR: libx11-1_1.7.1-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-doc went backwards which would break package feeds (from 1:1.7.2-r0 to 1:1.7.1-r0) [version-going-backwards]
ERROR: libx11-1_1.7.1-r0 do_packagedata_setscene: QA Issue: Package version for package libx11-locale went backwards which would break package feeds (from 1:1.7.2-r0 to 1:1.7.1-r0) [version-going-backwards]
ERROR: libx11-1_1.7.1-r0 do_packagedata_setscene: QA Issue: Package version for package libx11 went backwards which would break package feeds (from 1:1.7.2-r0 to 1:1.7.1-r0) [version-going-backwards]
NOTE: recipe libx11-1_1.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 202 of 202 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxi-1_1.7.99.2-r0: task do_patch: Succeeded
NOTE: Running task 691 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 692 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_populate_lic)
NOTE: recipe libx11-1_1.7.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_populate_lic: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libx11-1_1.7.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 716 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxi-1_1.7.99.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_populate_lic unihash changed to 8ffd0924315df5cba7ada852191ab2643f9fe7ebb44bd3fc409594d458a2a1d0
NOTE: recipe libxi-1_1.7.99.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxi-1_1.7.99.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 722 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_configure)
NOTE: recipe libxi-1_1.7.99.2-r0: task do_configure: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_configure: Succeeded
NOTE: Running task 723 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_compile)
NOTE: recipe libxi-1_1.7.99.2-r0: task do_compile: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_compile: Succeeded
NOTE: Running task 724 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_install)
NOTE: recipe libxi-1_1.7.99.2-r0: task do_install: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_install: Succeeded
NOTE: Running task 725 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_package)
NOTE: Running task 726 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_populate_sysroot)
NOTE: recipe libxi-1_1.7.99.2-r0: task do_populate_sysroot: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_package: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxi-1_1.7.99.2-r0: task do_package: Succeeded
NOTE: Running task 727 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_packagedata)
NOTE: recipe libxi-1_1.7.99.2-r0: task do_packagedata: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_packagedata: Succeeded
NOTE: Running task 728 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_package_write_rpm)
NOTE: Running task 729 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_package_qa)
NOTE: recipe libxi-1_1.7.99.2-r0: task do_package_write_rpm: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_package_qa: Started
NOTE: recipe libxi-1_1.7.99.2-r0: task do_package_qa: Succeeded
NOTE: recipe libxi-1_1.7.99.2-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 730 of 730 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.7.99.2.bb:do_build)
NOTE: Tasks Summary: Attempted 730 tasks of which 715 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 8 ERROR messages shown, returning a non-zero exit code.

--===============2541978223779550285==--
