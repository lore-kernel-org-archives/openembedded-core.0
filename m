Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B244CA100F
	for <webhook@archiver.kernel.org>; Sat,  2 Sep 2023 10:29:14 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.5722.1693650552638793047
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 Sep 2023 03:29:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=OrFzZnrl;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=YQB5eU3G;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101018a55708380-0c454037-522e-4e0d-95af-b6d7550ffd65-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1693650551;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=u64SmES3ycETabdSl9TyKliflhtxz90QyZRXeRwSh0Y=;
	b=OrFzZnrlJ1QmX6W64341tbEpRshYlJGikcasU59cvQ6ZgIRMjT+ZCKQHd8eDMGLP
	e/jP4NP+Eo3wMey0jb9o5C8brnHz1zi9edKb/YmYiuTKgDMBIUjby8NY1xgK22VDj4M
	7roBQFv4Y/1W4A5kWFJObZU6naTe2BHqK79+44qE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1693650551;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=u64SmES3ycETabdSl9TyKliflhtxz90QyZRXeRwSh0Y=;
	b=YQB5eU3GZWN9b2bVadCG8Xi5SI6lWOqSsYJ1M3oRhd0fJW9Eny6cq2d9ZmDM7jXx
	gz3ib2AydDsVhG9fdGe55xcqGUzMsuaBatMVGFdhW/4VDmimqvfBtKp7Kg+n6AxBGcf
	TZ+5cM1zbPUPCDTqcDsY9jcOz/QHRcnAJzdisXdw=
Content-Type: multipart/mixed; boundary="===============5423456207813852415=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] glib-2.0: upgrading to 2.76.5 SUCCEEDED
Message-ID: <0101018a55708380-0c454037-522e-4e0d-95af-b6d7550ffd65-000000@us-west-2.amazonses.com>
Date: Sat, 2 Sep 2023 10:29:11 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.09.02-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 Sep 2023 10:29:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187047

--===============5423456207813852415==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *glib-2.0* to *2.76.5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-glib-2.0-upgrade-2.76.4-2.76.5.patch
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
From 709bd12151e2b489454a2eece28c27be31a6197b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Sep 2023 09:15:24 +0000
Subject: [PATCH] glib-2.0: upgrade 2.76.4 -> 2.76.5

---
 meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch  | 6 ++----
 .../glib-2.0/{glib-2.0_2.76.4.bb => glib-2.0_2.76.5.bb}     | 2 +-
 2 files changed, 3 insertions(+), 5 deletions(-)
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.76.4.bb => glib-2.0_2.76.5.bb} (96%)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch b/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
index 3dba599fc0..ebef5c62e6 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
@@ -1,4 +1,4 @@
-From 38e401969a2ff8269919cbeacec733a67f041735 Mon Sep 17 00:00:00 2001
+From d89cbf2b7647b8521d8dc341f9307009f09e675e Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Fri, 11 Mar 2016 15:35:55 +0000
 Subject: [PATCH] glib-2.0: relocate the GIO module directory for native builds
@@ -13,6 +13,7 @@ Signed-off-by: Ross Burton <ross.burton@intel.com>
 
 Port patch to 2.48
 Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
+
 ---
  gio/giomodule.c | 5 -----
  1 file changed, 5 deletions(-)
@@ -40,6 +41,3 @@ index 11ce7d8..cc27ecd 100644
  #endif
      }
  
--- 
-2.30.2
-
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.76.4.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.76.5.bb
similarity index 96%
rename from meta/recipes-core/glib-2.0/glib-2.0_2.76.4.bb
rename to meta/recipes-core/glib-2.0/glib-2.0_2.76.5.bb
index 64a3c6d80c..1773d23ab0 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.76.4.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.76.5.bb
@@ -19,7 +19,7 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            "
 SRC_URI:append:class-native = " file://relocate-modules.patch"
 
-SRC_URI[sha256sum] = "5a5a191c96836e166a7771f7ea6ca2b0069c603c7da3cba1cd38d1694a395dda"
+SRC_URI[sha256sum] = "ed3a9953a90b20da8e5578a79f7d1c8a532eacbe2adac82aa3881208db8a3abe"
 
 # Find any meson cross files in FILESPATH that are relevant for the current
 # build (using siteinfo) and add them to EXTRA_OEMESON.
-- 
2.39.2


--===============5423456207813852415==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (0 cached, 899 parsed). 1807 targets, 70 skipped, 0 masked, 0 errors.
Removing 2 recipes from the ppc7400 sysroot...done.
Removing 2 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2+snapshot-3591be8a4f897f7215e0bc6fb518a333f07cc68f"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:3591be8a4f897f7215e0bc6fb518a333f07cc68f"
workspace            = "master:bdc74e5ff3c16fed24829fd494e5860754c08778"

Initialising tasks...done.
Sstate summary: Wanted 91 Local 9 Mirrors 0 Missed 82 Current 815 (9% match, 90% complete)
Removing 37 stale sstate objects for arch ppc7400...done.
Removing 16 stale sstate objects for arch qemuppc...done.
NOTE: Executing Tasks
NOTE: Running setscene task 823 of 906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.3.bb:do_packagedata_setscene)
NOTE: recipe coreutils-9.3-r0: task do_packagedata_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/coreutils/9.3/temp/log.do_packagedata_setscene.1913132
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.3.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 904 of 906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.3.bb:do_package_setscene)
NOTE: Running task 1284 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.5.bb:do_recipe_qa)
NOTE: Running task 1355 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1360 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1372 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.5.bb:do_write_config)
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_recipe_qa: Started
NOTE: recipe xorgproto-2023.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1610 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe wayland-1.22.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_write_config: Started
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_recipe_qa: Succeeded
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_write_config: Succeeded
NOTE: Running task 1616 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.5.bb:do_fetch)
NOTE: recipe xorgproto-2023.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1622 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_configure)
NOTE: recipe wayland-1.22.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1633 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_configure)
NOTE: Running task 1687 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.39.bb:do_prepare_recipe_sysroot)
NOTE: recipe base-files-3.0.14-r90: task do_install: Started
NOTE: recipe xorgproto-2023.2-r0: task do_configure: Started
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_fetch: Started
NOTE: recipe coreutils-9.3-r0: task do_package_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_configure: Started
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_fetch: Succeeded
NOTE: Running task 1941 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_recipe_qa)
NOTE: Running task 1942 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_recipe_qa)
NOTE: Running task 1958 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.5.bb:do_unpack)
NOTE: Running task 1959 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe xkeyboard-config-2.39-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1977 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_collect_spdx_deps)
NOTE: Running task 2103 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_write_config)
NOTE: Running task 2178 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_collect_spdx_deps)
NOTE: recipe shared-mime-info-2.2-r0: task do_recipe_qa: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_recipe_qa: Started
NOTE: Running task 2179 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.39.bb:do_collect_spdx_deps)
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_unpack: Started
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xorgproto-2023.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_write_config: Started
NOTE: recipe xorgproto-2023.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe xkeyboard-config-2.39-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2285 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.39.bb:do_configure)
NOTE: recipe shared-mime-info-2.2-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2286 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_fetch)
NOTE: recipe wayland-1.22.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_write_config: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2312 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_package_write_rpm)
NOTE: Running task 2313 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_fetch)
NOTE: recipe xkeyboard-config-2.39-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2316 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package_write_rpm)
NOTE: recipe xkeyboard-config-2.39-r0: task do_configure: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_fetch: Started
NOTE: recipe xkeyboard-config-2.39-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_fetch: Succeeded
NOTE: Running task 2317 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_unpack)
NOTE: Running task 2318 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r90: task do_install: Succeeded
NOTE: recipe libgcc-13.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm: Started
NOTE: Running task 2319 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2320 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r90: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r90: task do_package: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Succeeded
NOTE: Running task 2321 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_patch)
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Started
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_unpack: Succeeded
NOTE: Running task 2322 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.5.bb:do_patch)
NOTE: Running task 2323 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.5.bb:do_collect_spdx_deps)
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Succeeded
NOTE: Running task 2324 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_deploy_source_date_epoch)
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_patch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r90: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 7568d355d9c9c8ce2f4df915a11aa6dcfb33f13fac4dcb464666b2b9b9ba02ef
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_unpack: Succeeded
NOTE: Running task 2329 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_patch)
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_configure: Succeeded
NOTE: Running task 2330 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_compile)
NOTE: recipe shared-mime-info-2.2-r0: task do_patch: Started
NOTE: recipe xkeyboard-config-2.39-r0: task do_configure: Succeeded
NOTE: Running task 2331 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.39.bb:do_compile)
NOTE: recipe xorgproto-2023.2-r0: task do_compile: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_patch: Succeeded
NOTE: Running task 2332 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_deploy_source_date_epoch)
NOTE: recipe shared-mime-info-2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xkeyboard-config-2.39-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r90: task do_package: Succeeded
NOTE: Running task 2333 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_patch: Succeeded
NOTE: Running task 2334 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 2335 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.5.bb:do_populate_lic)
NOTE: recipe xorgproto-2023.2-r0: task do_compile: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2336 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_install)
NOTE: recipe base-files-3.0.14-r90: task do_packagedata: Started
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_populate_lic: Started
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xorgproto-2023.2-r0: task do_install: Started
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.5.bb:do_populate_lic unihash changed to 635ab920143c4896c47179d3faa01d60abf90729f96d63c49265f88edbb66d61
NOTE: recipe base-files-3.0.14-r90: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 9817e6a4efa6dd3c576432bcaa0a5cf193db4cf18a5504b969245390a17b5548
NOTE: Running task 2339 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx)
NOTE: recipe xkeyboard-config-2.39-r0: task do_compile: Succeeded
NOTE: Running task 2341 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.39.bb:do_install)
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2342 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.5.bb:do_configure)
NOTE: recipe base-files-3.0.14-r90: task do_create_spdx: Started
NOTE: recipe xkeyboard-config-2.39-r0: task do_install: Started
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_configure: Started
NOTE: recipe coreutils-9.3-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 905 of 906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_configure: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_create_spdx: Succeeded
NOTE: Running task 2343 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_configure_ptest_base)
NOTE: recipe coreutils-9.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe coreutils-9.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 906 of 906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.3.bb:do_recipe_qa_setscene)
NOTE: recipe wayland-1.22.0-r0: task do_configure_ptest_base: Started
NOTE: recipe wayland-1.22.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2346 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_compile)
NOTE: recipe coreutils-9.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe coreutils-9.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2348 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.3.bb:do_fetch)
NOTE: recipe wayland-1.22.0-r0: task do_compile: Started
NOTE: recipe xorgproto-2023.2-r0: task do_install: Succeeded
NOTE: Running task 2349 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_populate_sysroot)
NOTE: Running task 2350 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_package)
NOTE: recipe coreutils-9.3-r0: task do_fetch: Started
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm: Succeeded
NOTE: recipe coreutils-9.3-r0: task do_fetch: Succeeded
NOTE: Running task 2351 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.3.bb:do_unpack)
NOTE: recipe xorgproto-2023.2-r0: task do_populate_sysroot: Started
NOTE: recipe xorgproto-2023.2-r0: task do_package: Started
NOTE: recipe coreutils-9.3-r0: task do_unpack: Started
NOTE: recipe xorgproto-2023.2-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_populate_sysroot unihash changed to 8eb6beea503aa7c113cde0b651db7b8fe665a7f73291bd92b1aa974acb6751a9
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb:do_populate_sysroot became valid
NOTE: Running setscene task 877 of 906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 881 of 906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.39-r0: task do_install: Succeeded
NOTE: Running task 2353 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.39.bb:do_populate_sysroot)
NOTE: Running task 2354 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.39.bb:do_package)
NOTE: recipe coreutils-9.3-r0: task do_unpack: Succeeded
NOTE: Running task 2364 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.3.bb:do_packagedata)
NOTE: Running task 2365 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.3.bb:do_collect_spdx_deps)
NOTE: recipe xkeyboard-config-2.39-r0: task do_populate_sysroot: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.39-r0: task do_package: Started
NOTE: Running setscene task 903 of 906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libx11-1_1.8.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 904 of 906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_populate_sysroot_setscene)
NOTE: recipe coreutils-9.3-r0: task do_packagedata: Started
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe coreutils-9.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe coreutils-9.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 905 of 906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 906 of 906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_populate_sysroot_setscene)
NOTE: recipe wayland-1.22.0-r0: task do_compile: Succeeded
NOTE: Running task 2376 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_compile_ptest_base)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.39-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.39.bb:do_populate_sysroot unihash changed to 38b0eb591199d5720493d21f4b123edbfb816c18411600d432789b75c59fa80d
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_package unihash changed to df94e3950c908c4bcff74f0347bfc9650ffe765203b6c72c35cb66f574d4141c
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_package became valid
NOTE: Running setscene task 877 of 906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 879 of 906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb:do_packagedata_setscene)
NOTE: recipe wayland-1.22.0-r0: task do_compile_ptest_base: Started
NOTE: recipe coreutils-9.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2377 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.3.bb:do_create_spdx)
NOTE: Running task 2379 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.3.bb:do_package_write_rpm)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.6-r0: task do_packagedata_setscene: Started
NOTE: Running task 2380 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_install)
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe coreutils-9.3-r0: task do_create_spdx: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 896 of 906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_package_setscene)
NOTE: recipe libx11-1_1.8.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 897 of 906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb:do_package_setscene)
NOTE: recipe coreutils-9.3-r0: task do_package_write_rpm: Started
NOTE: recipe wayland-1.22.0-r0: task do_install: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_package_setscene: Started
NOTE: recipe libx11-1_1.8.6-r0: task do_package_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_install: Succeeded
NOTE: Running task 2381 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_install_ptest_base)
NOTE: recipe wayland-1.22.0-r0: task do_install_ptest_base: Started
NOTE: recipe wayland-1.22.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2382 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_populate_sysroot)
NOTE: Running task 2383 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_package)
NOTE: recipe wayland-1.22.0-r0: task do_populate_sysroot: Started
NOTE: recipe wayland-1.22.0-r0: task do_package: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 898 of 906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_packagedata_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_populate_sysroot unihash changed to 06366436c091fcfccf8eab3e4043443790ad5946eceeae668dc14afd3549a7dd
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 891 of 906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_package_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_package_setscene: Started
NOTE: recipe libx11-1_1.8.6-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 900 of 906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_packagedata_setscene)
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 901 of 906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_package_setscene)
NOTE: recipe libxcb-1.15-r0: task do_package_setscene: Started
NOTE: recipe xkeyboard-config-2.39-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.39.bb:do_package unihash changed to 8070f9904e81ecded13870e9be664e621cb810562255e4ad4c095d9a47acd7cd
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.39.bb:do_packagedata became valid
NOTE: recipe libice-1_1.1.1-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 901 of 906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.39.bb:do_packagedata_setscene)
NOTE: recipe xkeyboard-config-2.39-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.39-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 2385 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.39.bb:do_create_spdx)
NOTE: recipe xkeyboard-config-2.39-r0: task do_create_spdx: Started
NOTE: recipe wayland-1.22.0-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_package unihash changed to 00ce7e12ebb455a485680b467afa78b341bf4381be7932f354becb7cb0b6d483
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_packagedata became valid
NOTE: Running setscene task 901 of 906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_packagedata_setscene)
NOTE: recipe wayland-1.22.0-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 2387 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_create_spdx)
NOTE: recipe wayland-1.22.0-r0: task do_create_spdx: Started
NOTE: recipe xkeyboard-config-2.39-r0: task do_create_spdx: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_create_spdx: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 902 of 906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 903 of 906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_packagedata_setscene)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 904 of 906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_package_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 905 of 906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_package_setscene)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_package_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_package_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_package_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 906 of 906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_packagedata_setscene)
NOTE: Running task 2403 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe coreutils-9.3-r0: task do_create_spdx: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xorgproto-2023.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2416 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_create_spdx)
NOTE: recipe libxkbcommon-1.5.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2423 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_configure)
NOTE: recipe xorgproto-2023.2-r0: task do_create_spdx: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_configure: Started
NOTE: recipe xorgproto-2023.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 2424 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_collect_spdx_deps)
NOTE: Running task 2425 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_collect_spdx_deps)
NOTE: Running task 2426 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_collect_spdx_deps)
NOTE: recipe libxau-1_1.0.11-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe libice-1_1.1.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2427 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_create_spdx)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2428 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_create_spdx)
NOTE: recipe libice-1_1.1.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2429 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_create_spdx)
NOTE: recipe libxau-1_1.0.11-r0: task do_create_spdx: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_create_spdx: Started
NOTE: recipe libice-1_1.1.1-r0: task do_create_spdx: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_create_spdx: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_create_spdx: Succeeded
NOTE: Running task 2430 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_collect_spdx_deps)
NOTE: recipe libice-1_1.1.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 2431 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_collect_spdx_deps)
NOTE: recipe libxcb-1.15-r0: task do_collect_spdx_deps: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxcb-1.15-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2432 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_create_spdx)
NOTE: recipe libsm-1_1.2.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2433 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_create_spdx)
NOTE: recipe libxcb-1.15-r0: task do_create_spdx: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_create_spdx: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_create_spdx: Succeeded
NOTE: recipe libxkbcommon-1.5.0-r0: task do_configure: Succeeded
NOTE: Running task 2434 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_compile)
NOTE: recipe libxkbcommon-1.5.0-r0: task do_compile: Started
NOTE: recipe libxcb-1.15-r0: task do_create_spdx: Succeeded
NOTE: Running task 2435 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_collect_spdx_deps)
NOTE: Running task 2436 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb:do_collect_spdx_deps)
NOTE: recipe libxkbcommon-1.5.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libx11-1_1.8.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe libx11-1_1.8.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2437 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb:do_create_spdx)
NOTE: recipe libxkbcommon-1.5.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libx11-1_1.8.6-r0: task do_create_spdx: Started
NOTE: recipe libx11-1_1.8.6-r0: task do_create_spdx: Succeeded
NOTE: recipe libxkbcommon-1.5.0-r0: task do_compile: Succeeded
NOTE: Running task 2438 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_install)
NOTE: recipe libxkbcommon-1.5.0-r0: task do_install: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_install: Succeeded
NOTE: Running task 2439 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_populate_sysroot)
NOTE: Running task 2440 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_package)
NOTE: recipe libxkbcommon-1.5.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_package: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_populate_sysroot unihash changed to 6e8fd3105a493ce9ad80dca5fbdf7facb6c481af930c642d00640603e66ff974
NOTE: Setscene tasks completed
NOTE: Running task 2441 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_254.bb:do_prepare_recipe_sysroot)
NOTE: recipe systemd-1_254-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe coreutils-9.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe systemd-1_254-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2442 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_254.bb:do_configure)
NOTE: recipe systemd-1_254-r0: task do_configure: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_package unihash changed to 465209bc2d532bf63067381b210964a0cdc1577d6323ed4d9c3baf3bd43d3664
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_packagedata became valid
NOTE: Running setscene task 902 of 906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_packagedata_setscene)
NOTE: recipe libxkbcommon-1.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2444 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_create_spdx)
NOTE: recipe libxkbcommon-1.5.0-r0: task do_create_spdx: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 2445 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_254.bb:do_collect_spdx_deps)
NOTE: recipe systemd-1_254-r0: task do_collect_spdx_deps: Started
NOTE: recipe systemd-1_254-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_configure: Succeeded
NOTE: Running task 2446 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.5.bb:do_configure_ptest_base)
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_configure_ptest_base: Started
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2447 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.5.bb:do_compile)
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_compile: Started
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_compile: Succeeded
NOTE: Running task 2448 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.5.bb:do_compile_ptest_base)
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_compile_ptest_base: Started
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2449 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.5.bb:do_install)
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_install: Started
NOTE: recipe systemd-1_254-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2450 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_254.bb:do_compile)
NOTE: recipe systemd-1_254-r0: task do_compile: Started
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_install: Succeeded
NOTE: Running task 2451 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.5.bb:do_install_ptest_base)
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_install_ptest_base: Started
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2452 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.5.bb:do_populate_sysroot)
NOTE: Running task 2453 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.5.bb:do_package)
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_populate_sysroot: Started
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_package: Started
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2454 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2455 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2456 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_configure)
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2457 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_configure)
NOTE: recipe shared-mime-info-2.2-r0: task do_configure: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_configure: Succeeded
NOTE: Running task 2458 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_compile)
NOTE: recipe shared-mime-info-2.2-r0: task do_compile: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Succeeded
NOTE: Running task 2459 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_compile)
NOTE: recipe shared-mime-info-2.2-r0: task do_compile: Succeeded
NOTE: Running task 2460 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_install)
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_install: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Succeeded
NOTE: Running task 2461 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_install)
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_install: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Succeeded
NOTE: recipe systemd-1_254-r0: task do_compile: Succeeded
NOTE: Running task 2462 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_254.bb:do_install)
NOTE: recipe systemd-1_254-r0: task do_install: Started
NOTE: recipe systemd-1_254-r0: task do_install: Succeeded
NOTE: Running task 2463 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_254.bb:do_populate_sysroot)
NOTE: Running task 2464 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_254.bb:do_package)
NOTE: recipe systemd-1_254-r0: task do_populate_sysroot: Started
NOTE: recipe systemd-1_254-r0: task do_package: Started
NOTE: recipe systemd-1_254-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_254.bb:do_populate_sysroot unihash changed to 81e0adc0b26349f75b0cf4864558f4afd7f7fa63cc023fe8a35ec8fed87c5545
NOTE: Setscene tasks completed
NOTE: Running task 2465 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2466 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dbus-1.14.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2467 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_configure)
NOTE: recipe dbus-1.14.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2468 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_configure)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_configure: Started
NOTE: recipe dbus-1.14.8-r0: task do_configure: Started
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_package: Succeeded
NOTE: Running task 2469 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.5.bb:do_packagedata)
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_packagedata: Started
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_packagedata: Succeeded
NOTE: Running task 2470 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.5.bb:do_create_spdx)
NOTE: Running task 2471 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_package)
NOTE: Running task 2472 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package)
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_create_spdx: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_package: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Succeeded
NOTE: Running task 2473 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_packagedata)
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata: Succeeded
NOTE: Running task 2474 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_package_write_rpm)
NOTE: recipe desktop-file-utils-0.26-r0: task do_package_write_rpm: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_package_write_rpm: Succeeded
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_create_spdx: Succeeded
NOTE: Running task 2475 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_collect_spdx_deps)
NOTE: Running task 2476 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_collect_spdx_deps)
NOTE: recipe desktop-file-utils-0.26-r0: task do_collect_spdx_deps: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_configure: Succeeded
NOTE: Running task 2477 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_compile)
NOTE: recipe desktop-file-utils-0.26-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2478 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_create_spdx)
NOTE: recipe shared-mime-info-2.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_compile: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_create_spdx: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_create_spdx: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_compile: Succeeded
NOTE: Running task 2479 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_install)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_install: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_package: Succeeded
NOTE: Running task 2480 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata)
NOTE: recipe shared-mime-info-2.2-r0: task do_packagedata: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_install: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2481 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_create_spdx)
NOTE: Running task 2482 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_write_rpm)
NOTE: recipe shared-mime-info-2.2-r0: task do_create_spdx: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_package_write_rpm: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_create_spdx: Succeeded
NOTE: recipe systemd-1_254-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_254.bb:do_package unihash changed to db47f1b6ea15bbc7143760e66215f5e841c94cbb7fa948e5e82ca171ca825b27
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_254.bb:do_packagedata became valid
NOTE: Running setscene task 906 of 906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_254.bb:do_packagedata_setscene)
NOTE: recipe systemd-1_254-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-1_254-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2484 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_package)
NOTE: Running task 2485 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_254.bb:do_create_spdx)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package: Started
NOTE: recipe systemd-1_254-r0: task do_create_spdx: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package: Succeeded
NOTE: Running task 2486 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_packagedata)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2487 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_package_write_rpm)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package_write_rpm: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe systemd-1_254-r0: task do_create_spdx: Succeeded
NOTE: Running task 2488 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_collect_spdx_deps)
NOTE: Running task 2489 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_collect_spdx_deps)
NOTE: recipe dbus-1.14.8-r0: task do_collect_spdx_deps: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe dbus-1.14.8-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2490 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_create_spdx)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_create_spdx: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_create_spdx: Succeeded
NOTE: recipe dbus-1.14.8-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2491 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_configure_ptest_base)
NOTE: recipe dbus-1.14.8-r0: task do_configure_ptest_base: Started
NOTE: recipe dbus-1.14.8-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2492 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_compile)
NOTE: recipe dbus-1.14.8-r0: task do_compile: Started
NOTE: recipe dbus-1.14.8-r0: task do_compile: Succeeded
NOTE: Running task 2493 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_compile_ptest_base)
NOTE: recipe dbus-1.14.8-r0: task do_compile_ptest_base: Started
NOTE: recipe dbus-1.14.8-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2494 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_install)
NOTE: recipe dbus-1.14.8-r0: task do_install: Started
NOTE: recipe dbus-1.14.8-r0: task do_install: Succeeded
NOTE: Running task 2495 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_install_ptest_base)
NOTE: recipe dbus-1.14.8-r0: task do_install_ptest_base: Started
NOTE: recipe dbus-1.14.8-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2496 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_package)
NOTE: recipe dbus-1.14.8-r0: task do_package: Started
NOTE: recipe dbus-1.14.8-r0: task do_package: Succeeded
NOTE: Running task 2497 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_packagedata)
NOTE: recipe dbus-1.14.8-r0: task do_packagedata: Started
NOTE: recipe dbus-1.14.8-r0: task do_packagedata: Succeeded
NOTE: Running task 2498 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_create_spdx)
NOTE: Running task 2499 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_package_write_rpm)
NOTE: Running task 2500 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.5.bb:do_package_write_rpm)
NOTE: Running task 2501 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.5.bb:do_package_qa)
NOTE: recipe dbus-1.14.8-r0: task do_create_spdx: Started
NOTE: recipe dbus-1.14.8-r0: task do_package_write_rpm: Started
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_package_write_rpm: Started
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_package_qa: Started
NOTE: recipe dbus-1.14.8-r0: task do_create_spdx: Succeeded
NOTE: Running task 2502 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.5.bb:do_create_runtime_spdx)
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_create_runtime_spdx: Started
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe dbus-1.14.8-r0: task do_package_write_rpm: Succeeded
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_package_qa: Succeeded
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2503 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.5.bb:do_build)
NOTE: Tasks Summary: Attempted 2503 tasks of which 2362 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 53 ERROR messages, returning a non-zero exit code.
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-src went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-dbg went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-ptest went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-staticdev went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-dev went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-doc went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-stdbuf went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-af went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-be went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-bg went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-ca went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-cs went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-da went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-de went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-el went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-eo went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-es went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-et went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-eu went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-fi went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-fr went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-ga went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-gl went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-hr went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-hu went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-ia went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-id went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-it went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-ja went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-ka went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-kk went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-ko went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-lg went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-lt went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-ms went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-nb went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-nl went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-pl went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-pt went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-pt-br went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-ro went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-ru went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-sk went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-sl went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-sr went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-sv went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-tr went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-uk went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-vi went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-zh-cn went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-zh-tw went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============5423456207813852415==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/glib-2.0/glib-2.0-bash-completion: PV changed from "2.76.4" to "2.76.5"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-bash-completion: PKGV changed from 2.76.4 [default] to 2.76.5 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-codegen: PV changed from "2.76.4" to "2.76.5"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-codegen: PKGV changed from 2.76.4 [default] to 2.76.5 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-dbg: FILELIST: removed "/usr/lib/.debug/libgio-2.0.so.0.7600.4 /usr/lib/.debug/libgobject-2.0.so.0.7600.4 /usr/lib/.debug/libgthread-2.0.so.0.7600.4 /usr/lib/.debug/libglib-2.0.so.0.7600.4 /usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.7600.4-gdb.py /usr/lib/.debug/libgmodule-2.0.so.0.7600.4 /usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.7600.4-gdb.py", added "/usr/lib/.debug/libgobject-2.0.so.0.7600.5 /usr/lib/.debug/libgio-2.0.so.0.7600.5 /usr/lib/.debug/libgthread-2.0.so.0.7600.5 /usr/lib/.debug/libglib-2.0.so.0.7600.5 /usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.7600.5-gdb.py /usr/lib/.debug/libgmodule-2.0.so.0.7600.5 /usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.7600.5-gdb.py"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-dbg: PKGSIZE changed from 20600368 to 20605360 (+0%)
packages/core2-32-poky-linux/glib-2.0/glib-2.0-dbg: PV changed from "2.76.4" to "2.76.5"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-dbg: PKGV changed from 2.76.4 [default] to 2.76.5 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-dev: PV changed from "2.76.4" to "2.76.5"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-dev: PKGV changed from 2.76.4 [default] to 2.76.5 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-doc: PV changed from "2.76.4" to "2.76.5"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-doc: PKGV changed from 2.76.4 [default] to 2.76.5 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ab: PV changed from "2.76.4" to "2.76.5"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ab: PKGV changed from 2.76.4 [default] to 2.76.5 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-af: PV changed from "2.76.4" to "2.76.5"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-af: PKGV changed from 2.76.4 [default] to 2.76.5 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-am: PV changed from "2.76.4" to "2.76.5"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-am: PKGV changed from 2.76.4 [default] to 2.76.5 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-an: PV changed from "2.76.4" to "2.76.5"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-an: PKGV changed from 2.76.4 [default] to 2.76.5 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ar: PV changed from "2.76.4" to "2.76.5"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ar: PKGV changed from 2.76.4 [default] to 2.76.5 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-as: PV changed from "2.76.4" to "2.76.5"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-as: PKGV changed from 2.76.4 [default] to 2.76.5 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ast: PV changed from "2.76.4" to "2.76.5"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ast: PKGV changed from 2.76.4 [default] to 2.76.5 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-az: PV changed from "2.76.4" to "2.76.5"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-az: PKGV changed from 2.76.4 [default] to 2.76.5 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-be+latin: PV changed from "2.76.4" to "2.76.5"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-be+latin: PKGV changed from 2.76.4 [default] to 2.76.5 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-be: PV changed from "2.76.4" to "2.76.5"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-be: PKGV changed from 2.76.4 [default] to 2.76.5 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-bg: PV changed from "2.76.4" to "2.76.5"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-bg: PKGV changed from 2.76.4 [default] to 2.76.5 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-bn-in: PV changed from "2.76.4" to "2.76.5"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-bn-in: PKGV changed from 2.76.4 [default] to 2.76.5 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-bn: PV changed from "2.76.4" to "2.76.5"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-bn: PKGV changed from 2.76.4 [default] to 2.76.5 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-bs: PV changed from "2.76.4" to "2.76.5"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-bs: PKGV changed from 2.76.4 [default] to 2.76.5 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ca+valencia: PV changed from "2.76.4" to "2.76.5"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ca+valencia: PKGV changed from 2.76.4 [default] to 2.76.5 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ca: PV changed from "2.76.4" to "2.76.5"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ca: PKGV changed from 2.76.4 [default] to 2.76.5 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-cs: PV changed from "2.76.4" to "2.76.5"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-cs: PKGV changed from 2.76.4 [default] to 2.76.5 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-cy: PV changed from "2.76.4" to "2.76.5"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-cy: PKGV changed from 2.76.4 [default] to 2.76.5 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-da: PV changed from "2.76.4" to "2.76.5"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-da: PKGV changed from 2.76.4 [default] to 2.76.5 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-de: PV changed from "2.76.4" to "2.76.5"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-de: PKGV changed from 2.76.4 [default] to 2.76.5 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-dz: PV changed from "2.76.4" to "2.76.5"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-dz: PKGV changed from 2.76.4 [default] to 2.76.5 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-el: PV changed from "2.76.4" to "2.76.5"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-el: PKGV changed from 2.76.4 [default] to 2.76.5 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-en+shaw: PV changed from "2.76.4" to "2.76.5"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-en+shaw: PKGV changed from 2.76.4 [default] to 2.76.5 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-en-ca: PV changed from "2.76.4" to "2.76.5"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-en-ca: PKGV changed from 2.76.4 [default] to 2.76.5 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-en-gb: PV changed from "2.76.4" to "2.76.5"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-en-gb: PKGV changed from 2.76.4 [default] to 2.76.5 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-eo: PV changed from "2.76.4" to "2.76.5"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-eo: PKGV changed from 2.76.4 [default] to 2.76.5 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-es: PV changed from "2.76.4" to "2.76.5"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-es: PKGV changed from 2.76.4 [default] to 2.76.5 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-et: PV changed from "2.76.4" to "2.76.5"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-et: PKGV changed from 2.76.4 [default] to 2.76.5 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-eu: PV changed from "2.76.4" to "2.76.5"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-eu: PKGV changed from 2.76.4 [default] to 2.76.5 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-fa: PV changed from "2.76.4" to "2.76.5"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-fa: PKGV changed from 2.76.4 [default] to 2.76.5 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-fi: PV changed from "2.76.4" to "2.76.5"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-fi: PKGV changed from 2.76.4 [default] to 2.76.5 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-fr: PV changed from "2.76.4" to "2.76.5"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-fr: PKGV changed from 2.76.4 [default] to 2.76.5 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-fur: PV changed from "2.76.4" to "2.76.5"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-fur: PKGV changed from 2.76.4 [default] to 2.76.5 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ga: PV changed from "2.76.4" to "2.76.5"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ga: PKGV changed from 2.76.4 [default] to 2.76.5 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-gd: PV changed from "2.76.4" to "2.76.5"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-gd: PKGV changed from 2.76.4 [default] to 2.76.5 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-gl: PV changed from "2.76.4" to "2.76.5"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-gl: PKGV changed from 2.76.4 [default] to 2.76.5 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-gu: PV changed from "2.76.4" to "2.76.5"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-gu: PKGV changed from 2.76.4 [default] to 2.76.5 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-he: PV changed from "2.76.4" to "2.76.5"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-he: PKGV changed from 2.76.4 [default] to 2.76.5 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-hi: PV changed from "2.76.4" to "2.76.5"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-hi: PKGV changed from 2.76.4 [default] to 2.76.5 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-hr: PV changed from "2.76.4" to "2.76.5"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-hr: PKGV changed from 2.76.4 [default] to 2.76.5 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-hu: PV changed from "2.76.4" to "2.76.5"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-hu: PKGV changed from 2.76.4 [default] to 2.76.5 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-hy: PV changed from "2.76.4" to "2.76.5"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-hy: PKGV changed from 2.76.4 [default] to 2.76.5 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-id: PV changed from "2.76.4" to "2.76.5"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-id: PKGV changed from 2.76.4 [default] to 2.76.5 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ie: PV changed from "2.76.4" to "2.76.5"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ie: PKGV changed from 2.76.4 [default] to 2.76.5 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-is: PV changed from "2.76.4" to "2.76.5"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-is: PKGV changed from 2.76.4 [default] to 2.76.5 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-it: PV changed from "2.76.4" to "2.76.5"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-it: PKGV changed from 2.76.4 [default] to 2.76.5 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ja: PV changed from "2.76.4" to "2.76.5"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ja: PKGV changed from 2.76.4 [default] to 2.76.5 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ka: PV changed from "2.76.4" to "2.76.5"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ka: PKGV changed from 2.76.4 [default] to 2.76.5 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-kk: PV changed from "2.76.4" to "2.76.5"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-kk: PKGV changed from 2.76.4 [default] to 2.76.5 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-kn: PV changed from "2.76.4" to "2.76.5"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-kn: PKGV changed from 2.76.4 [default] to 2.76.5 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ko: PV changed from "2.76.4" to "2.76.5"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ko: PKGV changed from 2.76.4 [default] to 2.76.5 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ku: PV changed from "2.76.4" to "2.76.5"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ku: PKGV changed from 2.76.4 [default] to 2.76.5 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-lt: PV changed from "2.76.4" to "2.76.5"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-lt: PKGV changed from 2.76.4 [default] to 2.76.5 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-lv: PV changed from "2.76.4" to "2.76.5"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-lv: PKGV changed from 2.76.4 [default] to 2.76.5 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-mai: PV changed from "2.76.4" to "2.76.5"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-mai: PKGV changed from 2.76.4 [default] to 2.76.5 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-mg: PV changed from "2.76.4" to "2.76.5"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-mg: PKGV changed from 2.76.4 [default] to 2.76.5 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-mk: PV changed from "2.76.4" to "2.76.5"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-mk: PKGV changed from 2.76.4 [default] to 2.76.5 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ml: PV changed from "2.76.4" to "2.76.5"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ml: PKGV changed from 2.76.4 [default] to 2.76.5 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-mn: PV changed from "2.76.4" to "2.76.5"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-mn: PKGV changed from 2.76.4 [default] to 2.76.5 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-mr: PV changed from "2.76.4" to "2.76.5"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-mr: PKGV changed from 2.76.4 [default] to 2.76.5 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ms: PV changed from "2.76.4" to "2.76.5"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ms: PKGV changed from 2.76.4 [default] to 2.76.5 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-nb: PV changed from "2.76.4" to "2.76.5"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-nb: PKGV changed from 2.76.4 [default] to 2.76.5 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-nds: PV changed from "2.76.4" to "2.76.5"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-nds: PKGV changed from 2.76.4 [default] to 2.76.5 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ne: PV changed from "2.76.4" to "2.76.5"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ne: PKGV changed from 2.76.4 [default] to 2.76.5 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-nl: PV changed from "2.76.4" to "2.76.5"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-nl: PKGV changed from 2.76.4 [default] to 2.76.5 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-nn: PV changed from "2.76.4" to "2.76.5"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-nn: PKGV changed from 2.76.4 [default] to 2.76.5 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-oc: PV changed from "2.76.4" to "2.76.5"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-oc: PKGV changed from 2.76.4 [default] to 2.76.5 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-or: PV changed from "2.76.4" to "2.76.5"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-or: PKGV changed from 2.76.4 [default] to 2.76.5 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-pa: PV changed from "2.76.4" to "2.76.5"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-pa: PKGV changed from 2.76.4 [default] to 2.76.5 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-pl: PV changed from "2.76.4" to "2.76.5"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-pl: PKGV changed from 2.76.4 [default] to 2.76.5 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ps: PV changed from "2.76.4" to "2.76.5"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ps: PKGV changed from 2.76.4 [default] to 2.76.5 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-pt-br: PV changed from "2.76.4" to "2.76.5"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-pt-br: PKGV changed from 2.76.4 [default] to 2.76.5 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-pt: PV changed from "2.76.4" to "2.76.5"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-pt: PKGV changed from 2.76.4 [default] to 2.76.5 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ro: PV changed from "2.76.4" to "2.76.5"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ro: PKGV changed from 2.76.4 [default] to 2.76.5 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ru: PV changed from "2.76.4" to "2.76.5"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ru: PKGV changed from 2.76.4 [default] to 2.76.5 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-rw: PV changed from "2.76.4" to "2.76.5"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-rw: PKGV changed from 2.76.4 [default] to 2.76.5 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-si: PV changed from "2.76.4" to "2.76.5"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-si: PKGV changed from 2.76.4 [default] to 2.76.5 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-sk: PV changed from "2.76.4" to "2.76.5"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-sk: PKGV changed from 2.76.4 [default] to 2.76.5 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-sl: PV changed from "2.76.4" to "2.76.5"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-sl: PKGV changed from 2.76.4 [default] to 2.76.5 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-sq: PV changed from "2.76.4" to "2.76.5"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-sq: PKGV changed from 2.76.4 [default] to 2.76.5 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-sr+ije: PV changed from "2.76.4" to "2.76.5"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-sr+ije: PKGV changed from 2.76.4 [default] to 2.76.5 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-sr+latin: PV changed from "2.76.4" to "2.76.5"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-sr+latin: PKGV changed from 2.76.4 [default] to 2.76.5 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-sr: PV changed from "2.76.4" to "2.76.5"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-sr: PKGV changed from 2.76.4 [default] to 2.76.5 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-sv: PV changed from "2.76.4" to "2.76.5"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-sv: PKGV changed from 2.76.4 [default] to 2.76.5 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ta: PV changed from "2.76.4" to "2.76.5"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ta: PKGV changed from 2.76.4 [default] to 2.76.5 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-te: PV changed from "2.76.4" to "2.76.5"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-te: PKGV changed from 2.76.4 [default] to 2.76.5 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-tg: PV changed from "2.76.4" to "2.76.5"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-tg: PKGV changed from 2.76.4 [default] to 2.76.5 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-th: PV changed from "2.76.4" to "2.76.5"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-th: PKGV changed from 2.76.4 [default] to 2.76.5 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-tl: PV changed from "2.76.4" to "2.76.5"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-tl: PKGV changed from 2.76.4 [default] to 2.76.5 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-tr: PV changed from "2.76.4" to "2.76.5"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-tr: PKGV changed from 2.76.4 [default] to 2.76.5 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-tt: PV changed from "2.76.4" to "2.76.5"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-tt: PKGV changed from 2.76.4 [default] to 2.76.5 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ug: PV changed from "2.76.4" to "2.76.5"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-ug: PKGV changed from 2.76.4 [default] to 2.76.5 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-uk: PV changed from "2.76.4" to "2.76.5"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-uk: PKGV changed from 2.76.4 [default] to 2.76.5 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-vi: PV changed from "2.76.4" to "2.76.5"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-vi: PKGV changed from 2.76.4 [default] to 2.76.5 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-wa: PV changed from "2.76.4" to "2.76.5"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-wa: PKGV changed from 2.76.4 [default] to 2.76.5 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-xh: PV changed from "2.76.4" to "2.76.5"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-xh: PKGV changed from 2.76.4 [default] to 2.76.5 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-yi: PV changed from "2.76.4" to "2.76.5"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-yi: PKGV changed from 2.76.4 [default] to 2.76.5 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-zh-cn: PV changed from "2.76.4" to "2.76.5"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-zh-cn: PKGV changed from 2.76.4 [default] to 2.76.5 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-zh-hk: PV changed from "2.76.4" to "2.76.5"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-zh-hk: PKGV changed from 2.76.4 [default] to 2.76.5 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-zh-tw: PV changed from "2.76.4" to "2.76.5"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-locale-zh-tw: PKGV changed from 2.76.4 [default] to 2.76.5 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-ptest: PKGSIZE changed from 11328486 to 11328693 (+0%)
packages/core2-32-poky-linux/glib-2.0/glib-2.0-ptest: PV changed from "2.76.4" to "2.76.5"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-ptest: PKGV changed from 2.76.4 [default] to 2.76.5 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-src: PKGSIZE changed from 23477381 to 23480889 (+0%)
packages/core2-32-poky-linux/glib-2.0/glib-2.0-src: PV changed from "2.76.4" to "2.76.5"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-src: PKGV changed from 2.76.4 [default] to 2.76.5 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-staticdev: PV changed from "2.76.4" to "2.76.5"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-staticdev: PKGV changed from 2.76.4 [default] to 2.76.5 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0-utils: PV changed from "2.76.4" to "2.76.5"
packages/core2-32-poky-linux/glib-2.0/glib-2.0-utils: PKGV changed from 2.76.4 [default] to 2.76.5 [default]
packages/core2-32-poky-linux/glib-2.0/glib-2.0: FILELIST: removed "/usr/lib/libglib-2.0.so.0.7600.4 /usr/lib/libgmodule-2.0.so.0.7600.4 /usr/lib/libgobject-2.0.so.0.7600.4 /usr/lib/libgthread-2.0.so.0.7600.4 /usr/lib/libgio-2.0.so.0.7600.4", added "/usr/lib/libglib-2.0.so.0.7600.5 /usr/lib/libgmodule-2.0.so.0.7600.5 /usr/lib/libgthread-2.0.so.0.7600.5 /usr/lib/libgobject-2.0.so.0.7600.5 /usr/lib/libgio-2.0.so.0.7600.5"
packages/core2-32-poky-linux/glib-2.0/glib-2.0: PKGSIZE changed from 4246439 to 4250535 (+0%)
packages/core2-32-poky-linux/glib-2.0/glib-2.0: PV changed from "2.76.4" to "2.76.5"
packages/core2-32-poky-linux/glib-2.0/glib-2.0: PKGV changed from 2.76.4 [default] to 2.76.5 [default]
packages/core2-32-poky-linux/glib-2.0: SRC_URI changed from "https://download.gnome.org/sources//glib/2.76/glib-2.76.4.tar.xz file://run-ptest file://0001-Fix-DATADIRNAME-on-uclibc-Linux.patch file://0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch file://0001-Install-gio-querymodules-as-libexec_PROGRAM.patch file://0010-Do-not-hardcode-python-path-into-various-tools.patch file://0001-Set-host_machine-correctly-when-building-with-mingw3.patch file://0001-Do-not-write-bindir-into-pkg-config-files.patch file://0001-meson-Run-atomics-test-on-clang-as-well.patch file://0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch file://0001-gio-tests-portal-support-Fix-snap-test-ordering-race.patch file://0001-glocalfile-Sum-apparent-size-only-for-files-and-syml.patch" to "https://download.gnome.org/sources//glib/2.76/glib-2.76.5.tar.xz file://run-ptest file://0001-Fix-DATADIRNAME-on-uclibc-Linux.patch file://0001-Remove-the-warning-about-deprecated-paths-in-schemas.pat
 ch file://0001-Install-gio-querymodules-as-libexec_PROGRAM.patch file://0010-Do-not-hardcode-python-path-into-various-tools.patch file://0001-Set-host_machine-correctly-when-building-with-mingw3.patch file://0001-Do-not-write-bindir-into-pkg-config-files.patch file://0001-meson-Run-atomics-test-on-clang-as-well.patch file://0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch file://0001-gio-tests-portal-support-Fix-snap-test-ordering-race.patch file://0001-glocalfile-Sum-apparent-size-only-for-files-and-syml.patch"
packages/core2-32-poky-linux/glib-2.0: PV changed from "2.76.4" to "2.76.5"
packages/core2-32-poky-linux/glib-2.0: PKGV changed from 2.76.4 [default] to 2.76.5 [default]
Changes to packages/core2-32-poky-linux/glib-2.0 (sysroot):
  /usr/lib/libgio-2.0.so.0 changed symlink target from libgio-2.0.so.0.7600.4 to libgio-2.0.so.0.7600.5
  /usr/lib/libglib-2.0.so.0 changed symlink target from libglib-2.0.so.0.7600.4 to libglib-2.0.so.0.7600.5
  /usr/lib/libgmodule-2.0.so.0 changed symlink target from libgmodule-2.0.so.0.7600.4 to libgmodule-2.0.so.0.7600.5
  /usr/lib/libgobject-2.0.so.0 changed symlink target from libgobject-2.0.so.0.7600.4 to libgobject-2.0.so.0.7600.5
  /usr/lib/libgthread-2.0.so.0 changed symlink target from libgthread-2.0.so.0.7600.4 to libgthread-2.0.so.0.7600.5
  /usr/lib/libgio-2.0.so.0.7600.4 moved to /usr/lib/libgio-2.0.so.0.7600.5
  /usr/lib/libglib-2.0.so.0.7600.4 moved to /usr/lib/libglib-2.0.so.0.7600.5
  /usr/lib/libgmodule-2.0.so.0.7600.4 moved to /usr/lib/libgmodule-2.0.so.0.7600.5
  /usr/lib/libgobject-2.0.so.0.7600.4 moved to /usr/lib/libgobject-2.0.so.0.7600.5
  /usr/lib/libgthread-2.0.so.0.7600.4 moved to /usr/lib/libgthread-2.0.so.0.7600.5
  /usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.7600.4-gdb.py moved to /usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.7600.5-gdb.py
  /usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.7600.4-gdb.py moved to /usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.7600.5-gdb.py
Changes to packages/x86_64-linux/glib-2.0-native (sysroot):
  /usr/lib/libgio-2.0.so.0 changed symlink target from libgio-2.0.so.0.7600.4 to libgio-2.0.so.0.7600.5
  /usr/lib/libglib-2.0.so.0 changed symlink target from libglib-2.0.so.0.7600.4 to libglib-2.0.so.0.7600.5
  /usr/lib/libgmodule-2.0.so.0 changed symlink target from libgmodule-2.0.so.0.7600.4 to libgmodule-2.0.so.0.7600.5
  /usr/lib/libgobject-2.0.so.0 changed symlink target from libgobject-2.0.so.0.7600.4 to libgobject-2.0.so.0.7600.5
  /usr/lib/libgthread-2.0.so.0 changed symlink target from libgthread-2.0.so.0.7600.4 to libgthread-2.0.so.0.7600.5
  /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.76.4/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.7600.4-gdb.py moved to /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.76.5/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.7600.5-gdb.py
  /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.76.4/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.7600.4-gdb.py moved to /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.76.5/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.7600.5-gdb.py
  /usr/lib/libgio-2.0.so.0.7600.4 moved to /usr/lib/libgio-2.0.so.0.7600.5
  /usr/lib/libglib-2.0.so.0.7600.4 moved to /usr/lib/libglib-2.0.so.0.7600.5
  /usr/lib/libgmodule-2.0.so.0.7600.4 moved to /usr/lib/libgmodule-2.0.so.0.7600.5
  /usr/lib/libgobject-2.0.so.0.7600.4 moved to /usr/lib/libgobject-2.0.so.0.7600.5
  /usr/lib/libgthread-2.0.so.0.7600.4 moved to /usr/lib/libgthread-2.0.so.0.7600.5
  /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.76.4 moved to /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.76.5

--===============5423456207813852415==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (0 cached, 899 parsed). 1807 targets, 50 skipped, 0 masked, 0 errors.
Removing 65 recipes from the core2-32 sysroot...done.
Removing 89 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2+snapshot-3591be8a4f897f7215e0bc6fb518a333f07cc68f"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:3591be8a4f897f7215e0bc6fb518a333f07cc68f"
workspace            = "master:bdc74e5ff3c16fed24829fd494e5860754c08778"

Initialising tasks...done.
Sstate summary: Wanted 507 Local 439 Mirrors 0 Missed 68 Current 349 (86% match, 92% complete)
Removing 5 stale sstate objects for arch x86_64...done.
Removing 3 stale sstate objects for arch qemux86...done.
Removing 4 stale sstate objects for arch allarch...done.
NOTE: Executing Tasks
NOTE: Running setscene task 350 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 360 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 361 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_create_spdx_setscene)
NOTE: Running setscene task 369 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 370 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_packagedata_setscene)
NOTE: Running setscene task 371 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 372 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 373 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 374 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 381 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 384 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 385 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 387 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 389 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.3.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 394 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 395 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.69.bb:do_create_spdx_setscene)
NOTE: Running setscene task 396 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 397 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 400 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 401 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.39.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 402 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_create_spdx_setscene)
NOTE: Running setscene task 406 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.4.bb:do_populate_sysroot_setscene)
NOTE: recipe update-rc.d-0.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_create_spdx_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_create_spdx_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe findutils-4.9.0-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gawk-5.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxml2-2.11.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxml2-2.11.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.39.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.11.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe update-rc.d-0.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_create_spdx_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xtrans-1_1.5.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libcap-2.69-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 410 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 411 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_create_spdx_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 413 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 414 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_create_spdx_setscene)
NOTE: Running setscene task 415 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_recipe_qa_setscene)
NOTE: recipe liberror-perl-0.17029-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 419 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.1.bb:do_packagedata_setscene)
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxml2-2.11.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 422 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 423 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_create_spdx_setscene)
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 425 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 431 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 432 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 433 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 434 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.39.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 441 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 442 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 446 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 449 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 453 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 455 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 456 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 460 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 461 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 462 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 463 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_packagedata_setscene)
NOTE: recipe shadow-sysroot-4.6-r3: task do_create_spdx_setscene: Started
NOTE: recipe util-linux-2.39.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 464 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.39.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 465 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 469 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 470 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_create_spdx_setscene)
NOTE: Running setscene task 472 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_packagedata_setscene)
NOTE: Running setscene task 473 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_populate_sysroot_setscene)
NOTE: recipe psmisc-23.6-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_create_spdx_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxml2-2.11.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gawk-5.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 475 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_packagedata_setscene)
NOTE: recipe python3-3.11.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 479 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 480 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.41.bb:do_packagedata_setscene)
NOTE: Running setscene task 481 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc_13.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 482 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 483 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 484 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: Running setscene task 485 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 486 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_packagedata_setscene)
NOTE: Running setscene task 487 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: recipe perl-5.36.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.11.4-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Started
NOTE: recipe update-rc.d-0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.14.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 871 of 2362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.5.bb:do_recipe_qa)
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_create_spdx_setscene: Succeeded
NOTE: Running task 889 of 2362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.5.bb:do_write_config)
NOTE: Running task 892 of 2362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_write_config)
NOTE: Running setscene task 488 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 489 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xorgproto-2023.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libx11-1_1.8.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe findutils-4.9.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.39.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_create_spdx_setscene: Started
NOTE: Running task 1000 of 2362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_recipe_qa)
NOTE: recipe util-macros-1_1.20.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1001 of 2362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_recipe_qa)
NOTE: recipe python3-3.11.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Started
NOTE: Running task 1020 of 2362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_fetch)
NOTE: recipe shadow-4.13-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata_setscene: Started
NOTE: recipe tzdata-2023c-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 498 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_create_spdx_setscene)
NOTE: recipe util-linux-2.39.1-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.41-r0: task do_packagedata_setscene: Started
NOTE: Running task 1048 of 2362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_write_config)
NOTE: recipe coreutils-9.3-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_recipe_qa_setscene: Started
NOTE: recipe dbus-1.14.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe update-rc.d-0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 499 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_recipe_qa_setscene)
NOTE: recipe xorgproto-2023.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 501 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 502 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_recipe_qa_setscene)
NOTE: recipe libsm-1_1.2.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libx11-1_1.8.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_write_config: Started
NOTE: Running setscene task 503 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_recipe_qa_setscene)
NOTE: recipe base-passwd-3.6.1-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 504 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 505 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_recipe_qa_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_write_config: Started
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_recipe_qa: Started
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 506 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 507 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_recipe_qa_setscene)
NOTE: recipe libxml2-2.11.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 511 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 512 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 514 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_recipe_qa_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_recipe_qa: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xtrans-1_1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_fetch: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_recipe_qa: Started
NOTE: Running setscene task 517 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 519 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_packagedata_setscene)
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.11.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_write_config: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 522 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 524 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_create_spdx_setscene)
NOTE: Running setscene task 527 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 533 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 536 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 537 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_populate_sysroot_setscene)
NOTE: recipe psmisc-23.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_write_config: Succeeded
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_write_config: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-2.39.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe tzdata-2023c-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 550 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 551 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/timezone/tzdata.bb:do_package_setscene)
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_fetch: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_recipe_qa_setscene: Started
NOTE: recipe dbus-1.14.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libx11-1_1.8.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.11.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_recipe_qa: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_recipe_qa: Succeeded
NOTE: Running setscene task 553 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_recipe_qa_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_create_spdx_setscene: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_write_config: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 558 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xorgproto-2023.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxml2-2.11.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe dbus-1.14.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 559 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_packagedata_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libx11-1_1.8.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.11.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-2.41-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.11.4-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gcc-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 563 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_packagedata_setscene)
NOTE: recipe util-macros-1_1.20.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 568 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 569 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 576 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 577 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 580 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 581 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_packagedata_setscene)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/coreutils/9.3/temp/log.do_packagedata_setscene.2099006
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.3.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 582 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.3.bb:do_package_setscene)
NOTE: Running task 1100 of 2362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.5.bb:do_fetch)
NOTE: Running task 1104 of 2362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_fetch)
NOTE: Running task 1115 of 2362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_fetch)
NOTE: Running task 1117 of 2362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_fetch)
NOTE: Running task 1123 of 2362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_fetch)
NOTE: Running task 1124 of 2362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_fetch)
NOTE: Running task 1128 of 2362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_fetch)
NOTE: Running task 1129 of 2362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb:do_fetch)
NOTE: Running task 1134 of 2362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_fetch)
NOTE: Running task 1162 of 2362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_fetch)
NOTE: Running task 1163 of 2362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_fetch)
NOTE: Running task 1167 of 2362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r90: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_fetch: Started
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_fetch: Started
NOTE: recipe xorgproto-2023.2-r0: task do_fetch: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_fetch: Started
NOTE: recipe libx11-1_1.8.6-r0: task do_fetch: Started
NOTE: recipe elfutils-0.189-r0: task do_packagedata_setscene: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_unpack: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_fetch: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_fetch: Started
NOTE: recipe libice-1_1.1.1-r0: task do_fetch: Succeeded
NOTE: Running task 1201 of 2362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_unpack)
NOTE: recipe libsm-1_1.2.4-r0: task do_fetch: Succeeded
NOTE: recipe dbus-1.14.8-r0: task do_fetch: Started
NOTE: recipe xorgproto-2023.2-r0: task do_fetch: Succeeded
NOTE: Running task 1202 of 2362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_unpack)
NOTE: Running task 1203 of 2362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_unpack)
NOTE: recipe libx11-1_1.8.6-r0: task do_fetch: Succeeded
NOTE: Running task 1204 of 2362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_unpack)
NOTE: Running task 1205 of 2362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r90: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_fetch: Succeeded
NOTE: recipe dbus-1.14.8-r0: task do_fetch: Succeeded
NOTE: Running setscene task 586 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: Running task 1209 of 2362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_unpack)
NOTE: Running task 1211 of 2362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_unpack)
NOTE: recipe libxcb-1.15-r0: task do_fetch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_fetch: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_fetch: Started
NOTE: Running setscene task 587 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: recipe libxcb-1.15-r0: task do_fetch: Succeeded
NOTE: Running task 1213 of 2362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_unpack)
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Succeeded
NOTE: Running task 1214 of 2362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_unpack)
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_unpack: Started
NOTE: Running setscene task 590 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_recipe_qa_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_unpack: Started
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_fetch: Succeeded
NOTE: recipe libx11-1_1.8.6-r0: task do_unpack: Started
NOTE: Running task 1215 of 2362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.5.bb:do_unpack)
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 594 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/mpfr/mpfr_4.2.0.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_fetch: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_unpack: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_unpack: Started
NOTE: Running task 1221 of 2362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_unpack)
NOTE: recipe xorgproto-2023.2-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r90: task do_recipe_qa_setscene: Started
NOTE: recipe dbus-1.14.8-r0: task do_unpack: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe elfutils-0.189-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_unpack: Started
NOTE: recipe python3-3.11.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 597 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 599 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 603 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.7.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 605 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 607 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_packagedata_setscene)
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_unpack: Succeeded
NOTE: Running task 1232 of 2362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_patch)
NOTE: recipe mpfr-4.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_unpack: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_unpack: Started
NOTE: Running task 1233 of 2362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_patch)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_unpack: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_unpack: Succeeded
NOTE: Running task 1234 of 2362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_patch)
NOTE: recipe util-linux-2.39.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1235 of 2362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_patch)
NOTE: recipe base-files-3.0.14-r90: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_unpack: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 611 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.39.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 612 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 613 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 614 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 615 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 616 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 619 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_recipe_qa_setscene)
NOTE: Running task 1237 of 2362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_unpack: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.7.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 621 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_packagedata_setscene)
NOTE: recipe libxcb-1.15-r0: task do_unpack: Succeeded
NOTE: Running setscene task 622 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 623 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 624 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 625 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 626 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 628 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 629 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 630 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 631 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 632 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 633 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.42.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 634 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.42.0.bb:do_populate_sysroot_setscene)
NOTE: Running task 1239 of 2362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_patch)
NOTE: recipe libxau-1_1.0.11-r0: task do_patch: Started
NOTE: Running task 1244 of 2362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_patch)
NOTE: Running task 1245 of 2362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_patch)
NOTE: recipe libxau-1_1.0.11-r0: task do_patch: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_unpack: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_patch: Started
NOTE: Running task 1247 of 2362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_patch)
NOTE: recipe mpfr-4.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_patch: Started
NOTE: recipe libice-1_1.1.1-r0: task do_patch: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r90: task do_fetch: Started
NOTE: recipe libgcc-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe dbus-1.14.8-r0: task do_unpack: Succeeded
NOTE: Running task 1253 of 2362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_patch)
NOTE: recipe shadow-4.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_fetch: Succeeded
NOTE: recipe util-linux-2.39.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1255 of 2362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 1256 of 2362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe libx11-1_1.8.6-r0: task do_unpack: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.1-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_patch: Succeeded
NOTE: Running setscene task 642 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.45.bb:do_packagedata_setscene)
NOTE: Running setscene task 647 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 649 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 654 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_packagedata_setscene)
NOTE: Running task 1259 of 2362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb:do_patch)
NOTE: recipe libice-1_1.1.1-r0: task do_patch: Succeeded
NOTE: recipe util-linux-libuuid-2.39.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20221030-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Started
NOTE: recipe libedit-20221030-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_patch: Started
NOTE: recipe sqlite3-3_3.42.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.42.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libarchive-3.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_patch: Started
NOTE: Running setscene task 661 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_packagedata_setscene)
NOTE: recipe tzdata-2023c-r0: task do_package_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_patch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_unpack: Started
NOTE: Running setscene task 663 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: Running task 1290 of 2362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r90: task do_prepare_recipe_sysroot: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_patch: Succeeded
NOTE: recipe util-linux-2.39.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 664 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package_setscene)
NOTE: recipe python3-3.11.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe coreutils-9.3-r0: task do_package_setscene: Started
NOTE: recipe base-files-3.0.14-r90: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe file-5.45-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe dbus-1.14.8-r0: task do_patch: Started
NOTE: recipe curl-8.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.0-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_patch: Succeeded
NOTE: recipe libx11-1_1.8.6-r0: task do_patch: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 669 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_recipe_qa_setscene)
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20221030-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 672 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 673 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: recipe python3-3.11.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_unpack: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.42.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.42.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 676 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 677 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.39.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 680 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 682 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.42.0.bb:do_recipe_qa_setscene)
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1303 of 2362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: Running task 1304 of 2362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_collect_spdx_deps)
NOTE: Running setscene task 684 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20221030-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 685 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 687 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 689 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_patch: Succeeded
NOTE: recipe dbus-1.14.8-r0: task do_patch: Succeeded
NOTE: recipe libx11-1_1.8.6-r0: task do_patch: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_package_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe file-5.45-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 693 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 694 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 695 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 696 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r90: task do_collect_spdx_deps: Started
NOTE: recipe curl-8.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 700 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 702 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 703 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcrypt-1.10.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_patch: Started
NOTE: recipe zstd-1.5.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 709 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.4.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.42.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20221030-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_unpack: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1328 of 2362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_patch)
NOTE: recipe libcap-ng-0.8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gnutls-3.8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 715 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 719 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 721 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 723 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.9.1.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r90: task do_collect_spdx_deps: Succeeded
NOTE: recipe xz-5.4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe sqlite3-3_3.42.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_patch: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libgpg-error-1.47-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20221030-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1371 of 2362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_unpack: Succeeded
NOTE: Running task 1372 of 2362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.5.bb:do_patch)
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 727 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_patch: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r90: task do_configure: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.4.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 733 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_patch: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_configure: Succeeded
NOTE: Running task 1373 of 2362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_deploy_source_date_epoch)
NOTE: recipe libtirpc-1.3.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1374 of 2362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe openssl-3.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 736 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 738 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.2.bb:do_recipe_qa_setscene)
NOTE: recipe libgpg-error-1.47-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 744 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_recipe_qa_setscene)
NOTE: recipe libseccomp-2.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe nettle-3.9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_compile: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 757 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.1.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r90: task do_compile: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.4.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1405 of 2362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 759 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe openssl-3.1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_install: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libunistring-1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 763 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_recipe_qa_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_patch: Succeeded
NOTE: Running task 1436 of 2362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 1437 of 2362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.5.bb:do_populate_lic)
NOTE: recipe base-files-3.0.14-r90: task do_install: Succeeded
NOTE: Running task 1438 of 2362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_populate_lic: Started
NOTE: recipe base-files-3.0.14-r90: task do_package: Started
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.5.bb:do_populate_lic unihash changed to 635ab920143c4896c47179d3faa01d60abf90729f96d63c49265f88edbb66d61
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe tzdata-2023c-r0: task do_package_setscene: Succeeded
NOTE: Running task 1440 of 2362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/timezone/tzdata.bb:do_unpack)
NOTE: recipe coreutils-9.3-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 764 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 765 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 767 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 769 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.69.bb:do_packagedata_setscene)
NOTE: recipe tzdata-2023c-r0: task do_unpack: Started
NOTE: recipe tzdata-2023c-r0: task do_unpack: Succeeded
NOTE: Running task 1449 of 2362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/timezone/tzdata.bb:do_collect_spdx_deps)
NOTE: Running task 1450 of 2362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/timezone/tzdata.bb:do_package_write_rpm)
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe tzdata-2023c-r0: task do_collect_spdx_deps: Started
NOTE: recipe tzdata-2023c-r0: task do_package_write_rpm: Started
NOTE: recipe tzdata-2023c-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1451 of 2362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/timezone/tzdata.bb:do_create_spdx)
NOTE: recipe coreutils-9.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 771 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.3.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 773 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 774 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe tzdata-2023c-r0: task do_create_spdx: Started
NOTE: Running setscene task 783 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 784 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: recipe coreutils-9.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1468 of 2362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.3.bb:do_fetch)
NOTE: recipe coreutils-9.3-r0: task do_fetch: Started
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 787 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_recipe_qa_setscene)
NOTE: recipe coreutils-9.3-r0: task do_fetch: Succeeded
NOTE: Running task 1469 of 2362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.3.bb:do_unpack)
NOTE: recipe perl-5.36.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 789 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 790 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 793 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 794 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: recipe attr-2.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe coreutils-9.3-r0: task do_unpack: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 797 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 800 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_recipe_qa_setscene)
NOTE: recipe tzdata-2023c-r0: task do_create_spdx: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 802 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 803 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 805 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r90: task do_package: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1485 of 2362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r90: task do_packagedata: Started
NOTE: recipe coreutils-9.3-r0: task do_unpack: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 3a1cc294b777438cf57075b2ade5a9c63b5460abf3eed3615217df9727300a7a
NOTE: Running task 1498 of 2362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx)
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 807 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 808 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 809 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 811 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r90: task do_create_spdx: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 813 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 816 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 817 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 818 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r90: task do_create_spdx: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 820 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 822 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 823 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 824 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_package_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe tzdata-2023c-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/timezone/tzdata.bb:do_package_write_rpm unihash changed to 60325abfcc8d321b3ce8ba8d762a98ef375f58290d299ad61fe7a5090a16d90d
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgcc-13.2.0-r0: task do_package_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 825 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 826 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 827 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 828 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 830 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 831 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 832 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.4.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 833 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 834 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 836 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 844 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 846 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 847 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 850 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 851 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.4.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 852 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 854 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.4.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-i686-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-i686-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 856 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-i686-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-i686-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1779 of 2362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1808 of 2362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1919 of 2362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2060 of 2362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_collect_spdx_deps)
NOTE: Running task 2084 of 2362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.5.bb:do_collect_spdx_deps)
NOTE: Running task 2095 of 2362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.3.bb:do_packagedata)
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xorgproto-2023.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r90: task do_populate_sysroot: Started
NOTE: Running task 2227 of 2362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.3.bb:do_collect_spdx_deps)
NOTE: Running task 2236 of 2362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_package_write_rpm)
NOTE: Running task 2237 of 2362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package_write_rpm)
NOTE: recipe xorgproto-2023.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe coreutils-9.3-r0: task do_packagedata: Started
NOTE: recipe coreutils-9.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe libgcc-13.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm: Started
NOTE: recipe coreutils-9.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 8e674b5c93ffaaba6f218d1060d51b2e2023bdc01969167a5eb944c404805895
NOTE: recipe xorgproto-2023.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2246 of 2362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_configure)
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2247 of 2362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.5.bb:do_configure)
NOTE: recipe xorgproto-2023.2-r0: task do_configure: Started
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_configure: Started
NOTE: recipe coreutils-9.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2248 of 2362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.3.bb:do_create_spdx)
NOTE: Running task 2249 of 2362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.3.bb:do_package_write_rpm)
NOTE: recipe coreutils-9.3-r0: task do_create_spdx: Started
NOTE: recipe coreutils-9.3-r0: task do_package_write_rpm: Started
NOTE: recipe xorgproto-2023.2-r0: task do_configure: Succeeded
NOTE: Running task 2251 of 2362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_compile)
NOTE: recipe xorgproto-2023.2-r0: task do_compile: Started
NOTE: recipe xorgproto-2023.2-r0: task do_compile: Succeeded
NOTE: Running task 2252 of 2362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_install)
NOTE: recipe xorgproto-2023.2-r0: task do_install: Started
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_install: Succeeded
NOTE: Running task 2253 of 2362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_populate_sysroot)
NOTE: Running task 2254 of 2362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_package)
NOTE: recipe xorgproto-2023.2-r0: task do_populate_sysroot: Started
NOTE: recipe xorgproto-2023.2-r0: task do_package: Started
NOTE: recipe xorgproto-2023.2-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_populate_sysroot unihash changed to e2ea829dec629c2c860bb6128ee39ed29d13104fe45d9684d0ccb453e672edba
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_populate_sysroot became valid
NOTE: Running setscene task 839 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 843 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libx11-1_1.8.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 853 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_populate_sysroot_setscene)
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 854 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 855 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 856 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_populate_sysroot_setscene)
NOTE: Running task 2255 of 2362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 2256 of 2362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 2257 of 2362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_prepare_recipe_sysroot)
NOTE: recipe libice-1_1.1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2258 of 2362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_configure)
NOTE: recipe xorgproto-2023.2-r0: task do_package: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_package unihash changed to c37daea65082478dd68f6adb9e35d785fab8878b44e3f525e557f9adef0b75ca
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_packagedata became valid
NOTE: Running setscene task 842 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 844 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb:do_packagedata_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_configure: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_package became valid
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 847 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_package_setscene)
NOTE: recipe libx11-1_1.8.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 848 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb:do_package_setscene)
NOTE: recipe libsm-1_1.2.4-r0: task do_package_setscene: Started
NOTE: recipe libx11-1_1.8.6-r0: task do_package_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 849 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_packagedata_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.8.6-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 850 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_packagedata_setscene)
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 851 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_package_setscene)
NOTE: recipe libxcb-1.15-r0: task do_package_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 852 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 853 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_packagedata_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 854 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_package_setscene)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 855 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_package_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_package_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_package_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_package_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 856 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_packagedata_setscene)
NOTE: recipe xorgproto-2023.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2023.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2285 of 2362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_create_spdx)
NOTE: recipe xorgproto-2023.2-r0: task do_create_spdx: Started
NOTE: recipe coreutils-9.3-r0: task do_create_spdx: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 2287 of 2362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_collect_spdx_deps)
NOTE: Running task 2288 of 2362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_collect_spdx_deps)
NOTE: Running task 2289 of 2362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_collect_spdx_deps)
NOTE: recipe libxau-1_1.0.11-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe libice-1_1.1.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2290 of 2362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_create_spdx)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2291 of 2362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_create_spdx)
NOTE: recipe libice-1_1.1.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_create_spdx: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_create_spdx: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_create_spdx: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_create_spdx: Succeeded
NOTE: Running task 2292 of 2362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_collect_spdx_deps)
NOTE: recipe libxcb-1.15-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxcb-1.15-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2293 of 2362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_create_spdx)
NOTE: recipe libxcb-1.15-r0: task do_create_spdx: Started
NOTE: recipe libxcb-1.15-r0: task do_create_spdx: Succeeded
NOTE: Running task 2294 of 2362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb:do_collect_spdx_deps)
NOTE: recipe libx11-1_1.8.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe libx11-1_1.8.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2295 of 2362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb:do_create_spdx)
NOTE: recipe libx11-1_1.8.6-r0: task do_create_spdx: Started
NOTE: recipe libx11-1_1.8.6-r0: task do_create_spdx: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_configure: Succeeded
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_package became valid
NOTE: Running setscene task 856 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_package_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_package_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2308 of 2362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_create_spdx)
NOTE: recipe libice-1_1.1.1-r0: task do_create_spdx: Started
NOTE: recipe libice-1_1.1.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 2309 of 2362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_collect_spdx_deps)
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_configure: Succeeded
NOTE: Running task 2310 of 2362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.5.bb:do_configure_ptest_base)
NOTE: recipe libsm-1_1.2.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2311 of 2362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_create_spdx)
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_configure_ptest_base: Started
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2312 of 2362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.5.bb:do_compile)
NOTE: recipe libsm-1_1.2.4-r0: task do_create_spdx: Started
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_compile: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_create_spdx: Succeeded
NOTE: recipe coreutils-9.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_compile: Succeeded
NOTE: Running task 2313 of 2362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.5.bb:do_compile_ptest_base)
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_compile_ptest_base: Started
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2314 of 2362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.5.bb:do_install)
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_install: Started
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_install: Succeeded
NOTE: Running task 2315 of 2362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.5.bb:do_install_ptest_base)
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_install_ptest_base: Started
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2316 of 2362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.5.bb:do_populate_sysroot)
NOTE: Running task 2317 of 2362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.5.bb:do_package)
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_populate_sysroot: Started
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_package: Started
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2318 of 2362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2319 of 2362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2320 of 2362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2321 of 2362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dbus-1.14.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2322 of 2362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_configure)
NOTE: Running task 2323 of 2362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_configure)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_configure: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Started
NOTE: recipe dbus-1.14.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2324 of 2362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_configure)
NOTE: recipe dbus-1.14.8-r0: task do_configure: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2325 of 2362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_configure)
NOTE: recipe shared-mime-info-2.2-r0: task do_configure: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_configure: Succeeded
NOTE: Running task 2326 of 2362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_compile)
NOTE: recipe shared-mime-info-2.2-r0: task do_compile: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_compile: Succeeded
NOTE: Running task 2327 of 2362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_install)
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Succeeded
NOTE: Running task 2328 of 2362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_compile)
NOTE: recipe shared-mime-info-2.2-r0: task do_install: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Succeeded
NOTE: Running task 2329 of 2362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_install)
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_install: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_configure: Succeeded
NOTE: Running task 2330 of 2362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_compile)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_compile: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_compile: Succeeded
NOTE: Running task 2331 of 2362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_install)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_install: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_install: Succeeded
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_package: Succeeded
NOTE: Running task 2332 of 2362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.5.bb:do_packagedata)
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_packagedata: Started
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_packagedata: Succeeded
NOTE: Running task 2333 of 2362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_package)
NOTE: Running task 2334 of 2362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.5.bb:do_create_spdx)
NOTE: Running task 2335 of 2362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_package)
NOTE: Running task 2336 of 2362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package: Started
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_create_spdx: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_package: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package: Succeeded
NOTE: Running task 2337 of 2362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_packagedata)
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Succeeded
NOTE: Running task 2338 of 2362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_packagedata)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2339 of 2362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_package_write_rpm)
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata: Succeeded
NOTE: Running task 2340 of 2362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_package_write_rpm)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package_write_rpm: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_package_write_rpm: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_package_write_rpm: Succeeded
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_create_spdx: Succeeded
NOTE: Running task 2341 of 2362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_collect_spdx_deps)
NOTE: Running task 2342 of 2362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_collect_spdx_deps)
NOTE: Running task 2343 of 2362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_collect_spdx_deps)
NOTE: Running task 2344 of 2362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_collect_spdx_deps)
NOTE: recipe desktop-file-utils-0.26-r0: task do_collect_spdx_deps: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe dbus-1.14.8-r0: task do_collect_spdx_deps: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2345 of 2362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_create_spdx)
NOTE: recipe shared-mime-info-2.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2346 of 2362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_create_spdx)
NOTE: recipe dbus-1.14.8-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_create_spdx: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_create_spdx: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_create_spdx: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_create_spdx: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_package: Succeeded
NOTE: Running task 2347 of 2362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata)
NOTE: recipe shared-mime-info-2.2-r0: task do_packagedata: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2348 of 2362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_create_spdx)
NOTE: Running task 2349 of 2362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_write_rpm)
NOTE: recipe shared-mime-info-2.2-r0: task do_create_spdx: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_package_write_rpm: Started
NOTE: recipe dbus-1.14.8-r0: task do_configure: Succeeded
NOTE: Running task 2350 of 2362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_configure_ptest_base)
NOTE: recipe dbus-1.14.8-r0: task do_configure_ptest_base: Started
NOTE: recipe dbus-1.14.8-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2351 of 2362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_compile)
NOTE: recipe dbus-1.14.8-r0: task do_compile: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_create_spdx: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe dbus-1.14.8-r0: task do_compile: Succeeded
NOTE: Running task 2352 of 2362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_compile_ptest_base)
NOTE: recipe dbus-1.14.8-r0: task do_compile_ptest_base: Started
NOTE: recipe dbus-1.14.8-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2353 of 2362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_install)
NOTE: recipe dbus-1.14.8-r0: task do_install: Started
NOTE: recipe dbus-1.14.8-r0: task do_install: Succeeded
NOTE: Running task 2354 of 2362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_install_ptest_base)
NOTE: recipe dbus-1.14.8-r0: task do_install_ptest_base: Started
NOTE: recipe dbus-1.14.8-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2355 of 2362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_package)
NOTE: recipe dbus-1.14.8-r0: task do_package: Started
NOTE: recipe dbus-1.14.8-r0: task do_package: Succeeded
NOTE: Running task 2356 of 2362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_packagedata)
NOTE: recipe dbus-1.14.8-r0: task do_packagedata: Started
NOTE: recipe dbus-1.14.8-r0: task do_packagedata: Succeeded
NOTE: Running task 2357 of 2362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_create_spdx)
NOTE: Running task 2358 of 2362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_package_write_rpm)
NOTE: Running task 2359 of 2362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.5.bb:do_package_write_rpm)
NOTE: Running task 2360 of 2362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.5.bb:do_package_qa)
NOTE: recipe dbus-1.14.8-r0: task do_create_spdx: Started
NOTE: recipe dbus-1.14.8-r0: task do_package_write_rpm: Started
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_package_qa: Started
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_package_write_rpm: Started
NOTE: recipe dbus-1.14.8-r0: task do_create_spdx: Succeeded
NOTE: Running task 2361 of 2362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.5.bb:do_create_runtime_spdx)
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_create_runtime_spdx: Started
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe dbus-1.14.8-r0: task do_package_write_rpm: Succeeded
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_package_qa: Succeeded
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2362 of 2362 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.5.bb:do_build)
NOTE: Tasks Summary: Attempted 2362 tasks of which 2213 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 53 ERROR messages, returning a non-zero exit code.
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-src went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-dbg went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-ptest went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-staticdev went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-dev went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-doc went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-stdbuf went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-af went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-be went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-bg went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-ca went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-cs went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-da went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-de went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-el went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-eo went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-es went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-et went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-eu went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-fi went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-fr went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-ga went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-gl went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-hr went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-hu went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-ia went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-id went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-it went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-ja went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-ka went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-kk went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-ko went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-lg went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-lt went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-ms went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-nb went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-nl went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-pl went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-pt went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-pt-br went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-ro went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-ru went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-sk went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-sl went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-sr went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-sv went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-tr went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-uk went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-vi went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-zh-cn went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-zh-tw went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============5423456207813852415==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-glib-2.0-upgrade-2.76.4-2.76.5.patch"

RnJvbSA3MDliZDEyMTUxZTJiNDg5NDU0YTJlZWNlMjhjMjdiZTMxYTYxOTdiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBTZXAgMjAyMyAwOToxNToyNCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGds
aWItMi4wOiB1cGdyYWRlIDIuNzYuNCAtPiAyLjc2LjUKCi0tLQogbWV0YS9yZWNpcGVzLWNvcmUv
Z2xpYi0yLjAvZ2xpYi0yLjAvcmVsb2NhdGUtbW9kdWxlcy5wYXRjaCAgfCA2ICsrLS0tLQogLi4u
L2dsaWItMi4wL3tnbGliLTIuMF8yLjc2LjQuYmIgPT4gZ2xpYi0yLjBfMi43Ni41LmJifSAgICAg
fCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkK
IHJlbmFtZSBtZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC97Z2xpYi0yLjBfMi43Ni40LmJiID0+
IGdsaWItMi4wXzIuNzYuNS5iYn0gKDk2JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29y
ZS9nbGliLTIuMC9nbGliLTIuMC9yZWxvY2F0ZS1tb2R1bGVzLnBhdGNoIGIvbWV0YS9yZWNpcGVz
LWNvcmUvZ2xpYi0yLjAvZ2xpYi0yLjAvcmVsb2NhdGUtbW9kdWxlcy5wYXRjaAppbmRleCAzZGJh
NTk5ZmMwLi5lYmVmNWM2MmU2IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS9nbGliLTIu
MC9nbGliLTIuMC9yZWxvY2F0ZS1tb2R1bGVzLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1jb3Jl
L2dsaWItMi4wL2dsaWItMi4wL3JlbG9jYXRlLW1vZHVsZXMucGF0Y2gKQEAgLTEsNCArMSw0IEBA
Ci1Gcm9tIDM4ZTQwMTk2OWEyZmY4MjY5OTE5Y2JlYWNlYzczM2E2N2YwNDE3MzUgTW9uIFNlcCAx
NyAwMDowMDowMCAyMDAxCitGcm9tIGQ4OWNiZjJiNzY0N2I4NTIxZDhkYzM0MWY5MzA3MDA5ZjA5
ZTY3NWUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBSb3NzIEJ1cnRvbiA8cm9zcy5i
dXJ0b25AaW50ZWwuY29tPgogRGF0ZTogRnJpLCAxMSBNYXIgMjAxNiAxNTozNTo1NSArMDAwMAog
U3ViamVjdDogW1BBVENIXSBnbGliLTIuMDogcmVsb2NhdGUgdGhlIEdJTyBtb2R1bGUgZGlyZWN0
b3J5IGZvciBuYXRpdmUgYnVpbGRzCkBAIC0xMyw2ICsxMyw3IEBAIFNpZ25lZC1vZmYtYnk6IFJv
c3MgQnVydG9uIDxyb3NzLmJ1cnRvbkBpbnRlbC5jb20+CiAKIFBvcnQgcGF0Y2ggdG8gMi40OAog
U2lnbmVkLW9mZi1ieTogSnVzc2kgS3Vra29uZW4gPGp1c3NpLmt1a2tvbmVuQGludGVsLmNvbT4K
KwogLS0tCiAgZ2lvL2dpb21vZHVsZS5jIHwgNSAtLS0tLQogIDEgZmlsZSBjaGFuZ2VkLCA1IGRl
bGV0aW9ucygtKQpAQCAtNDAsNiArNDEsMyBAQCBpbmRleCAxMWNlN2Q4Li5jYzI3ZWNkIDEwMDY0
NAogICNlbmRpZgogICAgICB9CiAgCi0tLSAKLTIuMzAuMgotCmRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtY29yZS9nbGliLTIuMC9nbGliLTIuMF8yLjc2LjQuYmIgYi9tZXRhL3JlY2lwZXMtY29y
ZS9nbGliLTIuMC9nbGliLTIuMF8yLjc2LjUuYmIKc2ltaWxhcml0eSBpbmRleCA5NiUKcmVuYW1l
IGZyb20gbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi0yLjAvZ2xpYi0yLjBfMi43Ni40LmJiCnJlbmFt
ZSB0byBtZXRhL3JlY2lwZXMtY29yZS9nbGliLTIuMC9nbGliLTIuMF8yLjc2LjUuYmIKaW5kZXgg
NjRhM2M2ZDgwYy4uMTc3M2QyM2FiMCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvZ2xp
Yi0yLjAvZ2xpYi0yLjBfMi43Ni40LmJiCisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItMi4w
L2dsaWItMi4wXzIuNzYuNS5iYgpAQCAtMTksNyArMTksNyBAQCBTUkNfVVJJID0gIiR7R05PTUVf
TUlSUk9SfS9nbGliLyR7U0hSVF9WRVJ9L2dsaWItJHtQVn0udGFyLnh6IFwKICAgICAgICAgICAg
IgogU1JDX1VSSTphcHBlbmQ6Y2xhc3MtbmF0aXZlID0gIiBmaWxlOi8vcmVsb2NhdGUtbW9kdWxl
cy5wYXRjaCIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjVhNWExOTFjOTY4MzZlMTY2YTc3NzFm
N2VhNmNhMmIwMDY5YzYwM2M3ZGEzY2JhMWNkMzhkMTY5NGEzOTVkZGEiCitTUkNfVVJJW3NoYTI1
NnN1bV0gPSAiZWQzYTk5NTNhOTBiMjBkYThlNTU3OGE3OWY3ZDFjOGE1MzJlYWNiZTJhZGFjODJh
YTM4ODEyMDhkYjhhM2FiZSIKIAogIyBGaW5kIGFueSBtZXNvbiBjcm9zcyBmaWxlcyBpbiBGSUxF
U1BBVEggdGhhdCBhcmUgcmVsZXZhbnQgZm9yIHRoZSBjdXJyZW50CiAjIGJ1aWxkICh1c2luZyBz
aXRlaW5mbykgYW5kIGFkZCB0aGVtIHRvIEVYVFJBX09FTUVTT04uCi0tIAoyLjM5LjIKCg==

--===============5423456207813852415==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (0 cached, 899 parsed). 1807 targets, 64 skipped, 0 masked, 0 errors.
Removing 2 recipes from the mips32r2 sysroot...done.
Removing 2 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2+snapshot-3591be8a4f897f7215e0bc6fb518a333f07cc68f"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:3591be8a4f897f7215e0bc6fb518a333f07cc68f"
workspace            = "master:bdc74e5ff3c16fed24829fd494e5860754c08778"

Initialising tasks...done.
Sstate summary: Wanted 91 Local 9 Mirrors 0 Missed 82 Current 814 (9% match, 90% complete)
Removing 16 stale sstate objects for arch qemumips...done.
Removing 37 stale sstate objects for arch mips32r2...done.
NOTE: Executing Tasks
NOTE: Running setscene task 822 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.3.bb:do_packagedata_setscene)
NOTE: recipe coreutils-9.3-r0: task do_packagedata_setscene: Started
NOTE: Running task 1284 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.5.bb:do_recipe_qa)
NOTE: Running task 1353 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1358 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1370 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.5.bb:do_write_config)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/coreutils/9.3/temp/log.do_packagedata_setscene.1708236
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.3.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 903 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.3.bb:do_package_setscene)
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_recipe_qa: Started
NOTE: recipe xorgproto-2023.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe wayland-1.22.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_write_config: Started
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_write_config: Succeeded
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1513 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.5.bb:do_fetch)
NOTE: recipe xorgproto-2023.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1518 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_configure)
NOTE: recipe wayland-1.22.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1588 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_configure)
NOTE: Running task 1613 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe xorgproto-2023.2-r0: task do_configure: Started
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_fetch: Started
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_fetch: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_configure: Started
NOTE: Running task 1615 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.5.bb:do_unpack)
NOTE: Running task 1616 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1686 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.39.bb:do_prepare_recipe_sysroot)
NOTE: recipe base-files-3.0.14-r90: task do_install: Started
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_unpack: Started
NOTE: Running task 1941 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_recipe_qa)
NOTE: Running task 1942 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_recipe_qa)
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1975 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_collect_spdx_deps)
NOTE: recipe coreutils-9.3-r0: task do_package_setscene: Started
NOTE: recipe xkeyboard-config-2.39-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2101 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_write_config)
NOTE: Running task 2175 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_collect_spdx_deps)
NOTE: recipe desktop-file-utils-0.26-r0: task do_recipe_qa: Started
NOTE: Running task 2176 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.39.bb:do_collect_spdx_deps)
NOTE: recipe shared-mime-info-2.2-r0: task do_recipe_qa: Started
NOTE: recipe xorgproto-2023.2-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2308 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_package_write_rpm)
NOTE: Running task 2311 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package_write_rpm)
NOTE: recipe shared-mime-info-2.2-r0: task do_write_config: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_recipe_qa: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe xorgproto-2023.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2312 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_fetch)
NOTE: recipe shared-mime-info-2.2-r0: task do_write_config: Succeeded
NOTE: recipe xkeyboard-config-2.39-r0: task do_collect_spdx_deps: Started
NOTE: recipe xkeyboard-config-2.39-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2313 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.39.bb:do_configure)
NOTE: Running task 2314 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_fetch)
NOTE: recipe libgcc-13.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm: Started
NOTE: recipe xkeyboard-config-2.39-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Succeeded
NOTE: Running task 2315 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r90: task do_install: Succeeded
NOTE: Running task 2316 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe xkeyboard-config-2.39-r0: task do_configure: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_fetch: Started
NOTE: Running task 2317 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_fetch: Succeeded
NOTE: Running task 2318 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_unpack)
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r90: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r90: task do_package: Started
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_unpack: Succeeded
NOTE: Running task 2319 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.5.bb:do_patch)
NOTE: Running task 2320 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.5.bb:do_collect_spdx_deps)
NOTE: recipe shared-mime-info-2.2-r0: task do_unpack: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_configure: Succeeded
NOTE: Running task 2321 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_compile)
NOTE: Running task 2322 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_patch)
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_patch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Started
NOTE: recipe xorgproto-2023.2-r0: task do_compile: Started
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe base-files-3.0.14-r90: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 0b33c027f0202e62503cab7c451fbd457bbba674288a166b0ab8845afb7d30f6
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Succeeded
NOTE: Running task 2327 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_deploy_source_date_epoch)
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_unpack: Succeeded
NOTE: Running task 2328 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_patch)
NOTE: recipe xkeyboard-config-2.39-r0: task do_configure: Succeeded
NOTE: Running task 2329 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.39.bb:do_compile)
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_compile: Succeeded
NOTE: Running task 2330 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_install)
NOTE: recipe shared-mime-info-2.2-r0: task do_patch: Started
NOTE: recipe xkeyboard-config-2.39-r0: task do_compile: Started
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_patch: Succeeded
NOTE: Running task 2331 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 2332 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.5.bb:do_populate_lic)
NOTE: recipe shared-mime-info-2.2-r0: task do_patch: Succeeded
NOTE: Running task 2333 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_deploy_source_date_epoch)
NOTE: recipe xorgproto-2023.2-r0: task do_install: Started
NOTE: recipe base-files-3.0.14-r90: task do_package: Succeeded
NOTE: Running task 2334 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_populate_lic: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r90: task do_packagedata: Started
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.5.bb:do_populate_lic unihash changed to 635ab920143c4896c47179d3faa01d60abf90729f96d63c49265f88edbb66d61
NOTE: recipe shared-mime-info-2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2335 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.5.bb:do_configure)
NOTE: recipe base-files-3.0.14-r90: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 5a0aa8749c4947fab02dda4b951409725b6a3a9c7a5a5ec59338227ae49b9835
NOTE: Running task 2338 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx)
NOTE: recipe wayland-1.22.0-r0: task do_configure: Succeeded
NOTE: Running task 2340 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_configure_ptest_base)
NOTE: recipe xkeyboard-config-2.39-r0: task do_compile: Succeeded
NOTE: Running task 2341 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.39.bb:do_install)
NOTE: recipe coreutils-9.3-r0: task do_package_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_configure: Started
NOTE: Running setscene task 904 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-files-3.0.14-r90: task do_create_spdx: Started
NOTE: recipe wayland-1.22.0-r0: task do_configure_ptest_base: Started
NOTE: recipe wayland-1.22.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2342 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_compile)
NOTE: recipe xkeyboard-config-2.39-r0: task do_install: Started
NOTE: recipe coreutils-9.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe coreutils-9.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 905 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.3.bb:do_recipe_qa_setscene)
NOTE: recipe wayland-1.22.0-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r90: task do_create_spdx: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_install: Succeeded
NOTE: Running task 2345 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_populate_sysroot)
NOTE: Running task 2346 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_package)
NOTE: recipe coreutils-9.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm: Succeeded
NOTE: recipe coreutils-9.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2348 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.3.bb:do_fetch)
NOTE: recipe xorgproto-2023.2-r0: task do_populate_sysroot: Started
NOTE: recipe xorgproto-2023.2-r0: task do_package: Started
NOTE: recipe coreutils-9.3-r0: task do_fetch: Started
NOTE: recipe coreutils-9.3-r0: task do_fetch: Succeeded
NOTE: Running task 2349 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.3.bb:do_unpack)
NOTE: recipe coreutils-9.3-r0: task do_unpack: Started
NOTE: recipe xorgproto-2023.2-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_populate_sysroot unihash changed to e8603b953e323ae4a724a01691c067d5b1f0783a24d01c5b7e5483359d554885
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb:do_populate_sysroot became valid
NOTE: Running setscene task 876 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 880 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libx11-1_1.8.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libx11-1_1.8.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 902 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 903 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.39-r0: task do_install: Succeeded
NOTE: Running task 2351 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.39.bb:do_populate_sysroot)
NOTE: Running task 2352 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.39.bb:do_package)
NOTE: recipe coreutils-9.3-r0: task do_unpack: Succeeded
NOTE: Running task 2362 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.3.bb:do_packagedata)
NOTE: Running task 2363 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.3.bb:do_collect_spdx_deps)
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.39-r0: task do_populate_sysroot: Started
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 904 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 905 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_populate_sysroot_setscene)
NOTE: recipe xkeyboard-config-2.39-r0: task do_package: Started
NOTE: recipe coreutils-9.3-r0: task do_packagedata: Started
NOTE: recipe coreutils-9.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2023.2-r0: task do_package: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_compile: Succeeded
NOTE: Running task 2374 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_compile_ptest_base)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_package unihash changed to 81860e43194a28c8c302bf68c79fb098e5d44711b9d6aababfeef4fa1c4fa8d9
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_packagedata became valid
NOTE: Running setscene task 878 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 880 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb:do_packagedata_setscene)
NOTE: recipe coreutils-9.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_compile_ptest_base: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2375 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_install)
NOTE: recipe xkeyboard-config-2.39-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.39.bb:do_populate_sysroot unihash changed to 5af0b0c4b481d1086d6a7507c803ca204d373e166179ba64f20dbea8fdc55f69
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.8.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 895 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_package_setscene)
NOTE: Running setscene task 896 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb:do_package_setscene)
NOTE: recipe wayland-1.22.0-r0: task do_install: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_package_setscene: Started
NOTE: recipe libx11-1_1.8.6-r0: task do_package_setscene: Started
NOTE: recipe coreutils-9.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2376 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.3.bb:do_create_spdx)
NOTE: Running task 2377 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.3.bb:do_package_write_rpm)
NOTE: recipe coreutils-9.3-r0: task do_create_spdx: Started
NOTE: recipe coreutils-9.3-r0: task do_package_write_rpm: Started
NOTE: recipe wayland-1.22.0-r0: task do_install: Succeeded
NOTE: Running task 2379 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_install_ptest_base)
NOTE: recipe wayland-1.22.0-r0: task do_install_ptest_base: Started
NOTE: recipe wayland-1.22.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2380 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_populate_sysroot)
NOTE: Running task 2381 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_package)
NOTE: recipe wayland-1.22.0-r0: task do_populate_sysroot: Started
NOTE: recipe wayland-1.22.0-r0: task do_package: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 897 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_packagedata_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_populate_sysroot unihash changed to 29fb3f895e3b34fc9e730bd4ae836ffacfef84c0c003d92258d993e03d783dfc
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 898 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_package_setscene)
NOTE: recipe libx11-1_1.8.6-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 899 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_packagedata_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_package_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 900 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_package_setscene)
NOTE: recipe libxcb-1.15-r0: task do_package_setscene: Started
NOTE: recipe xkeyboard-config-2.39-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.39.bb:do_package unihash changed to 878c36c193c22c307e604f6611986fbe70d99d902feffb554f88990570b8c04b
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.39.bb:do_packagedata became valid
NOTE: Running setscene task 900 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.39.bb:do_packagedata_setscene)
NOTE: recipe xkeyboard-config-2.39-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_package_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.39-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 2383 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.39.bb:do_create_spdx)
NOTE: recipe wayland-1.22.0-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_package unihash changed to 63258f87992b2315ed8d424e98cfd2ff54d8765e5d38b418a63e57f36f8c6b9f
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_packagedata became valid
NOTE: Running setscene task 900 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_packagedata_setscene)
NOTE: recipe xkeyboard-config-2.39-r0: task do_create_spdx: Started
NOTE: recipe wayland-1.22.0-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 2385 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_create_spdx)
NOTE: recipe wayland-1.22.0-r0: task do_create_spdx: Started
NOTE: recipe xkeyboard-config-2.39-r0: task do_create_spdx: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_create_spdx: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 901 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 902 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_packagedata_setscene)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 903 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_package_setscene)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 904 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_package_setscene)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_package_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_package_setscene: Started
NOTE: recipe coreutils-9.3-r0: task do_create_spdx: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_package_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 905 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_packagedata_setscene)
NOTE: Running task 2401 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe xorgproto-2023.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xorgproto-2023.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2414 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_create_spdx)
NOTE: recipe libxkbcommon-1.5.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2421 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_configure)
NOTE: recipe xorgproto-2023.2-r0: task do_create_spdx: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_configure: Started
NOTE: recipe xorgproto-2023.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 2422 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_collect_spdx_deps)
NOTE: Running task 2423 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_collect_spdx_deps)
NOTE: Running task 2424 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_collect_spdx_deps)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_collect_spdx_deps: Started
NOTE: recipe libice-1_1.1.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2425 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_create_spdx)
NOTE: Running task 2426 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_create_spdx)
NOTE: recipe libice-1_1.1.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2427 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_create_spdx)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_create_spdx: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_create_spdx: Started
NOTE: recipe libice-1_1.1.1-r0: task do_create_spdx: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_create_spdx: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_create_spdx: Succeeded
NOTE: Running task 2428 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_collect_spdx_deps)
NOTE: recipe libice-1_1.1.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 2429 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_collect_spdx_deps)
NOTE: recipe libxcb-1.15-r0: task do_collect_spdx_deps: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxcb-1.15-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2430 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_create_spdx)
NOTE: recipe libsm-1_1.2.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2431 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_create_spdx)
NOTE: recipe libxcb-1.15-r0: task do_create_spdx: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_create_spdx: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_create_spdx: Succeeded
NOTE: recipe libxkbcommon-1.5.0-r0: task do_configure: Succeeded
NOTE: Running task 2432 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_compile)
NOTE: recipe libxkbcommon-1.5.0-r0: task do_compile: Started
NOTE: recipe libxcb-1.15-r0: task do_create_spdx: Succeeded
NOTE: Running task 2433 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_collect_spdx_deps)
NOTE: Running task 2434 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb:do_collect_spdx_deps)
NOTE: recipe libxkbcommon-1.5.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libx11-1_1.8.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe libx11-1_1.8.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxkbcommon-1.5.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2435 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb:do_create_spdx)
NOTE: recipe libx11-1_1.8.6-r0: task do_create_spdx: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_compile: Succeeded
NOTE: Running task 2436 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_install)
NOTE: recipe libxkbcommon-1.5.0-r0: task do_install: Started
NOTE: recipe libx11-1_1.8.6-r0: task do_create_spdx: Succeeded
NOTE: recipe libxkbcommon-1.5.0-r0: task do_install: Succeeded
NOTE: Running task 2437 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_populate_sysroot)
NOTE: Running task 2438 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_package)
NOTE: recipe libxkbcommon-1.5.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_package: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_populate_sysroot unihash changed to d767acc78733d7f87fb8dcf85586fe8a9d5ca327fe6053f7b4c48acbfa50c976
NOTE: Setscene tasks completed
NOTE: Running task 2439 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_254.bb:do_prepare_recipe_sysroot)
NOTE: recipe systemd-1_254-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe systemd-1_254-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2440 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_254.bb:do_configure)
NOTE: recipe systemd-1_254-r0: task do_configure: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_package unihash changed to c2f1c5e616f76d7d192cbff767742c819949c39c065a8ee40a861cbcfa367f9a
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_packagedata became valid
NOTE: Running setscene task 901 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_packagedata_setscene)
NOTE: recipe libxkbcommon-1.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2442 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_create_spdx)
NOTE: recipe libxkbcommon-1.5.0-r0: task do_create_spdx: Started
NOTE: recipe coreutils-9.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxkbcommon-1.5.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 2443 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_254.bb:do_collect_spdx_deps)
NOTE: recipe systemd-1_254-r0: task do_collect_spdx_deps: Started
NOTE: recipe systemd-1_254-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_configure: Succeeded
NOTE: Running task 2444 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.5.bb:do_configure_ptest_base)
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_configure_ptest_base: Started
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2445 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.5.bb:do_compile)
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_compile: Started
NOTE: recipe systemd-1_254-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2446 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_254.bb:do_compile)
NOTE: recipe systemd-1_254-r0: task do_compile: Started
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_compile: Succeeded
NOTE: Running task 2447 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.5.bb:do_compile_ptest_base)
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_compile_ptest_base: Started
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2448 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.5.bb:do_install)
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_install: Started
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_install: Succeeded
NOTE: Running task 2449 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.5.bb:do_install_ptest_base)
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_install_ptest_base: Started
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2450 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.5.bb:do_populate_sysroot)
NOTE: Running task 2451 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.5.bb:do_package)
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_populate_sysroot: Started
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_package: Started
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2452 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2453 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2454 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_configure)
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2455 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_configure)
NOTE: recipe shared-mime-info-2.2-r0: task do_configure: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_configure: Succeeded
NOTE: Running task 2456 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_compile)
NOTE: recipe shared-mime-info-2.2-r0: task do_compile: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Succeeded
NOTE: Running task 2457 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_compile)
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_compile: Succeeded
NOTE: Running task 2458 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_install)
NOTE: recipe shared-mime-info-2.2-r0: task do_install: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Succeeded
NOTE: Running task 2459 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_install)
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_install: Succeeded
NOTE: recipe systemd-1_254-r0: task do_compile: Succeeded
NOTE: Running task 2460 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_254.bb:do_install)
NOTE: recipe systemd-1_254-r0: task do_install: Started
NOTE: recipe systemd-1_254-r0: task do_install: Succeeded
NOTE: Running task 2461 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_254.bb:do_populate_sysroot)
NOTE: Running task 2462 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_254.bb:do_package)
NOTE: recipe systemd-1_254-r0: task do_populate_sysroot: Started
NOTE: recipe systemd-1_254-r0: task do_package: Started
NOTE: recipe systemd-1_254-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_254.bb:do_populate_sysroot unihash changed to f65347095f8c4a60d601fe9973b478c81fbb1f32e6068adbe6ec69d2525136ce
NOTE: Setscene tasks completed
NOTE: Running task 2463 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2464 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe dbus-1.14.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2465 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_configure)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_configure: Started
NOTE: recipe dbus-1.14.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2466 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_configure)
NOTE: recipe dbus-1.14.8-r0: task do_configure: Started
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_package: Succeeded
NOTE: Running task 2467 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.5.bb:do_packagedata)
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_packagedata: Started
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_packagedata: Succeeded
NOTE: Running task 2468 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.5.bb:do_create_spdx)
NOTE: Running task 2469 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_package)
NOTE: Running task 2470 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package)
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_create_spdx: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_package: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Succeeded
NOTE: Running task 2471 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_packagedata)
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata: Succeeded
NOTE: Running task 2472 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_package_write_rpm)
NOTE: recipe desktop-file-utils-0.26-r0: task do_package_write_rpm: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_configure: Succeeded
NOTE: Running task 2473 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_compile)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_compile: Started
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_create_spdx: Succeeded
NOTE: Running task 2474 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_collect_spdx_deps)
NOTE: Running task 2475 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_collect_spdx_deps)
NOTE: recipe desktop-file-utils-0.26-r0: task do_collect_spdx_deps: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2476 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_create_spdx)
NOTE: recipe shared-mime-info-2.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_create_spdx: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_compile: Succeeded
NOTE: Running task 2477 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_install)
NOTE: recipe desktop-file-utils-0.26-r0: task do_create_spdx: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_install: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_install: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_package: Succeeded
NOTE: Running task 2478 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata)
NOTE: recipe shared-mime-info-2.2-r0: task do_packagedata: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2479 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_create_spdx)
NOTE: Running task 2480 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_write_rpm)
NOTE: recipe shared-mime-info-2.2-r0: task do_create_spdx: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_package_write_rpm: Started
NOTE: recipe systemd-1_254-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_254.bb:do_package unihash changed to f74996680138d511dc997bf89e4c52bcfbaeb91cc66f4f2667cf7d4b1eee9139
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_254.bb:do_packagedata became valid
NOTE: Running setscene task 905 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_254.bb:do_packagedata_setscene)
NOTE: recipe systemd-1_254-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_create_spdx: Succeeded
NOTE: recipe systemd-1_254-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2482 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_package)
NOTE: Running task 2483 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_254.bb:do_create_spdx)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package: Started
NOTE: recipe systemd-1_254-r0: task do_create_spdx: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package: Succeeded
NOTE: Running task 2484 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_packagedata)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2485 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_package_write_rpm)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package_write_rpm: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe systemd-1_254-r0: task do_create_spdx: Succeeded
NOTE: Running task 2486 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_collect_spdx_deps)
NOTE: Running task 2487 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_collect_spdx_deps)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe dbus-1.14.8-r0: task do_collect_spdx_deps: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2488 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_create_spdx)
NOTE: recipe dbus-1.14.8-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_create_spdx: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_create_spdx: Succeeded
NOTE: recipe dbus-1.14.8-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2489 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_configure_ptest_base)
NOTE: recipe dbus-1.14.8-r0: task do_configure_ptest_base: Started
NOTE: recipe dbus-1.14.8-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2490 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_compile)
NOTE: recipe dbus-1.14.8-r0: task do_compile: Started
NOTE: recipe dbus-1.14.8-r0: task do_compile: Succeeded
NOTE: Running task 2491 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_compile_ptest_base)
NOTE: recipe dbus-1.14.8-r0: task do_compile_ptest_base: Started
NOTE: recipe dbus-1.14.8-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2492 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_install)
NOTE: recipe dbus-1.14.8-r0: task do_install: Started
NOTE: recipe dbus-1.14.8-r0: task do_install: Succeeded
NOTE: Running task 2493 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_install_ptest_base)
NOTE: recipe dbus-1.14.8-r0: task do_install_ptest_base: Started
NOTE: recipe dbus-1.14.8-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2494 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_package)
NOTE: recipe dbus-1.14.8-r0: task do_package: Started
NOTE: recipe dbus-1.14.8-r0: task do_package: Succeeded
NOTE: Running task 2495 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_packagedata)
NOTE: recipe dbus-1.14.8-r0: task do_packagedata: Started
NOTE: recipe dbus-1.14.8-r0: task do_packagedata: Succeeded
NOTE: Running task 2496 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_create_spdx)
NOTE: Running task 2497 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_package_write_rpm)
NOTE: Running task 2498 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.5.bb:do_package_write_rpm)
NOTE: Running task 2499 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.5.bb:do_package_qa)
NOTE: recipe dbus-1.14.8-r0: task do_create_spdx: Started
NOTE: recipe dbus-1.14.8-r0: task do_package_write_rpm: Started
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_package_write_rpm: Started
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_package_qa: Started
NOTE: recipe dbus-1.14.8-r0: task do_create_spdx: Succeeded
NOTE: Running task 2500 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.5.bb:do_create_runtime_spdx)
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_create_runtime_spdx: Started
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe dbus-1.14.8-r0: task do_package_write_rpm: Succeeded
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_package_qa: Succeeded
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2501 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.5.bb:do_build)
NOTE: Tasks Summary: Attempted 2501 tasks of which 2360 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 53 ERROR messages, returning a non-zero exit code.
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-src went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-dbg went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-ptest went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-staticdev went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-dev went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-doc went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-stdbuf went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-af went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-be went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-bg went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-ca went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-cs went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-da went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-de went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-el went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-eo went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-es went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-et went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-eu went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-fi went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-fr went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-ga went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-gl went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-hr went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-hu went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-ia went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-id went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-it went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-ja went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-ka went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-kk went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-ko went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-lg went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-lt went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-ms went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-nb went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-nl went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-pl went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-pt went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-pt-br went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-ro went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-ru went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-sk went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-sl went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-sr went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-sv went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-tr went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-uk went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-vi went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-zh-cn went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-zh-tw went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============5423456207813852415==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1811 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (898 cached, 1 parsed). 1807 targets, 37 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2+snapshot-3591be8a4f897f7215e0bc6fb518a333f07cc68f"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:3591be8a4f897f7215e0bc6fb518a333f07cc68f"
workspace            = "master:bdc74e5ff3c16fed24829fd494e5860754c08778"

Initialising tasks...done.
Sstate summary: Wanted 91 Local 9 Mirrors 0 Missed 82 Current 815 (9% match, 90% complete)
Removing 37 stale sstate objects for arch core2-64...done.
Removing 16 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 823 of 906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.3.bb:do_packagedata_setscene)
NOTE: recipe coreutils-9.3-r0: task do_packagedata_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/coreutils/9.3/temp/log.do_packagedata_setscene.1403675
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.3.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 904 of 906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.3.bb:do_package_setscene)
NOTE: Running task 1284 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.5.bb:do_recipe_qa)
NOTE: Running task 1355 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1360 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1372 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.5.bb:do_write_config)
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_recipe_qa: Started
NOTE: recipe xorgproto-2023.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1610 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe wayland-1.22.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_write_config: Started
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_write_config: Succeeded
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1616 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.5.bb:do_fetch)
NOTE: recipe xorgproto-2023.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1621 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_configure)
NOTE: recipe wayland-1.22.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1630 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_configure)
NOTE: Running task 1684 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.39.bb:do_prepare_recipe_sysroot)
NOTE: recipe base-files-3.0.14-r90: task do_install: Started
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_fetch: Started
NOTE: recipe coreutils-9.3-r0: task do_package_setscene: Started
NOTE: recipe xorgproto-2023.2-r0: task do_configure: Started
NOTE: recipe wayland-1.22.0-r0: task do_configure: Started
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_fetch: Succeeded
NOTE: Running task 1941 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_recipe_qa)
NOTE: Running task 1942 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_recipe_qa)
NOTE: Running task 1954 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.5.bb:do_unpack)
NOTE: Running task 1955 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe xkeyboard-config-2.39-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1977 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_collect_spdx_deps)
NOTE: Running task 2103 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_write_config)
NOTE: recipe desktop-file-utils-0.26-r0: task do_recipe_qa: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_recipe_qa: Started
NOTE: Running task 2177 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.39.bb:do_collect_spdx_deps)
NOTE: Running task 2178 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_collect_spdx_deps)
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_unpack: Started
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xorgproto-2023.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_write_config: Started
NOTE: recipe xkeyboard-config-2.39-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2309 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.39.bb:do_configure)
NOTE: recipe shared-mime-info-2.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_recipe_qa: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe xkeyboard-config-2.39-r0: task do_collect_spdx_deps: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_write_config: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2310 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_fetch)
NOTE: Running task 2311 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_fetch)
NOTE: Running task 2313 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_package_write_rpm)
NOTE: Running task 2316 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package_write_rpm)
NOTE: recipe xkeyboard-config-2.39-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_install: Succeeded
NOTE: Running task 2317 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2318 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe wayland-1.22.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Started
NOTE: recipe xkeyboard-config-2.39-r0: task do_configure: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_fetch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Succeeded
NOTE: Running task 2319 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r90: task do_populate_sysroot: Started
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm: Started
NOTE: recipe base-files-3.0.14-r90: task do_package: Started
NOTE: recipe libgcc-13.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_fetch: Succeeded
NOTE: Running task 2320 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_unpack)
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Started
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_unpack: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Succeeded
NOTE: Running task 2321 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_patch)
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_unpack: Succeeded
NOTE: Running task 2322 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.5.bb:do_patch)
NOTE: Running task 2323 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.5.bb:do_collect_spdx_deps)
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Succeeded
NOTE: Running task 2324 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r90: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to d09c5a32b26f664d547f186926a3641ab5aaa30a571662d12e240218b0e77eee
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_patch: Started
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_configure: Succeeded
NOTE: Running task 2329 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_compile)
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_unpack: Succeeded
NOTE: Running task 2330 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_patch)
NOTE: recipe xorgproto-2023.2-r0: task do_compile: Started
NOTE: recipe xkeyboard-config-2.39-r0: task do_configure: Succeeded
NOTE: Running task 2331 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.39.bb:do_compile)
NOTE: recipe shared-mime-info-2.2-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r90: task do_package: Succeeded
NOTE: Running task 2332 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe xkeyboard-config-2.39-r0: task do_compile: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_patch: Succeeded
NOTE: Running task 2333 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r90: task do_packagedata: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xorgproto-2023.2-r0: task do_compile: Succeeded
NOTE: Running task 2334 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_install)
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_patch: Succeeded
NOTE: Running task 2335 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 2336 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.5.bb:do_populate_lic)
NOTE: recipe xorgproto-2023.2-r0: task do_install: Started
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_populate_lic: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 3a34e87fb12bc478fce02fd1539f1bd8da47d021d6031c63048a9a21401fce53
NOTE: Running task 2339 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx)
NOTE: recipe coreutils-9.3-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 905 of 906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.5.bb:do_populate_lic unihash changed to 635ab920143c4896c47179d3faa01d60abf90729f96d63c49265f88edbb66d61
NOTE: recipe base-files-3.0.14-r90: task do_create_spdx: Started
NOTE: recipe coreutils-9.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xkeyboard-config-2.39-r0: task do_compile: Succeeded
NOTE: Running task 2341 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.5.bb:do_configure)
NOTE: Running task 2342 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.39.bb:do_install)
NOTE: recipe coreutils-9.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 906 of 906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.3.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_configure: Started
NOTE: recipe xkeyboard-config-2.39-r0: task do_install: Started
NOTE: recipe base-files-3.0.14-r90: task do_create_spdx: Succeeded
NOTE: recipe coreutils-9.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_configure: Succeeded
NOTE: Running task 2345 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_configure_ptest_base)
NOTE: recipe coreutils-9.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2347 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.3.bb:do_fetch)
NOTE: recipe wayland-1.22.0-r0: task do_configure_ptest_base: Started
NOTE: recipe coreutils-9.3-r0: task do_fetch: Started
NOTE: recipe wayland-1.22.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2348 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_compile)
NOTE: recipe coreutils-9.3-r0: task do_fetch: Succeeded
NOTE: Running task 2349 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.3.bb:do_unpack)
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_compile: Started
NOTE: recipe coreutils-9.3-r0: task do_unpack: Started
NOTE: recipe xorgproto-2023.2-r0: task do_install: Succeeded
NOTE: Running task 2351 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_populate_sysroot)
NOTE: Running task 2352 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_package)
NOTE: recipe xorgproto-2023.2-r0: task do_populate_sysroot: Started
NOTE: recipe xorgproto-2023.2-r0: task do_package: Started
NOTE: recipe coreutils-9.3-r0: task do_unpack: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2362 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.3.bb:do_packagedata)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_populate_sysroot unihash changed to 20d1f16707a205e6f054cacde1c72bcfd379997ae00b98f259a78dce590fbd72
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb:do_populate_sysroot became valid
NOTE: Running setscene task 877 of 906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 881 of 906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb:do_populate_sysroot_setscene)
NOTE: Running task 2363 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.3.bb:do_collect_spdx_deps)
NOTE: recipe coreutils-9.3-r0: task do_packagedata: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe coreutils-9.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe xkeyboard-config-2.39-r0: task do_install: Succeeded
NOTE: Running task 2364 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.39.bb:do_populate_sysroot)
NOTE: Running task 2365 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.39.bb:do_package)
NOTE: recipe coreutils-9.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libx11-1_1.8.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.39-r0: task do_populate_sysroot: Started
NOTE: Running setscene task 903 of 906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_populate_sysroot_setscene)
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 904 of 906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: recipe xkeyboard-config-2.39-r0: task do_package: Started
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_compile: Succeeded
NOTE: Running task 2366 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_compile_ptest_base)
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 905 of 906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 906 of 906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_populate_sysroot_setscene)
NOTE: recipe coreutils-9.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2377 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.3.bb:do_create_spdx)
NOTE: Running task 2378 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.3.bb:do_package_write_rpm)
NOTE: recipe wayland-1.22.0-r0: task do_compile_ptest_base: Started
NOTE: recipe xorgproto-2023.2-r0: task do_package: Succeeded
NOTE: recipe xkeyboard-config-2.39-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.39.bb:do_populate_sysroot unihash changed to a393b72c1e5bb55291750c20ae76fe4caf8d11dc61a0d748792c35da35420673
NOTE: recipe wayland-1.22.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_package unihash changed to 4d6c439381fadecfd95b84b7ff427a143bacc15857182ce01f66e3b007aca13b
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_packagedata became valid
NOTE: Running setscene task 877 of 906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 879 of 906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb:do_packagedata_setscene)
NOTE: Running task 2380 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_install)
NOTE: recipe coreutils-9.3-r0: task do_create_spdx: Started
NOTE: recipe coreutils-9.3-r0: task do_package_write_rpm: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_install: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 896 of 906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_package_setscene)
NOTE: recipe libx11-1_1.8.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 897 of 906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb:do_package_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_package_setscene: Started
NOTE: recipe libx11-1_1.8.6-r0: task do_package_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_install: Succeeded
NOTE: Running task 2381 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_install_ptest_base)
NOTE: recipe wayland-1.22.0-r0: task do_install_ptest_base: Started
NOTE: recipe wayland-1.22.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2382 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_populate_sysroot)
NOTE: Running task 2383 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_package)
NOTE: recipe wayland-1.22.0-r0: task do_populate_sysroot: Started
NOTE: recipe wayland-1.22.0-r0: task do_package: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 898 of 906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_packagedata_setscene)
NOTE: recipe wayland-1.22.0-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_populate_sysroot unihash changed to 38e0429766a6c5cca402fa8b12822a647cc13653d460955773994ba2bdfc3508
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 899 of 906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_package_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_package_setscene: Started
NOTE: recipe libx11-1_1.8.6-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 900 of 906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_packagedata_setscene)
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 901 of 906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_package_setscene)
NOTE: recipe libxcb-1.15-r0: task do_package_setscene: Started
NOTE: recipe xkeyboard-config-2.39-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.39.bb:do_package unihash changed to 5e93c8dc2c866f66718c86b149995b13c8eefd66447537910722b813b16533f0
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.39.bb:do_packagedata became valid
NOTE: Running setscene task 901 of 906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.39.bb:do_packagedata_setscene)
NOTE: recipe xkeyboard-config-2.39-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.39-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 2385 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.39.bb:do_create_spdx)
NOTE: recipe libice-1_1.1.1-r0: task do_package_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.39-r0: task do_create_spdx: Started
NOTE: recipe wayland-1.22.0-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_package unihash changed to 9471d061a15c9cd666a17c331794fc74651f922cf91346f1622492726f0807ae
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_packagedata became valid
NOTE: Running setscene task 901 of 906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_packagedata_setscene)
NOTE: recipe wayland-1.22.0-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 2387 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_create_spdx)
NOTE: recipe wayland-1.22.0-r0: task do_create_spdx: Started
NOTE: recipe xkeyboard-config-2.39-r0: task do_create_spdx: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_create_spdx: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 902 of 906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 903 of 906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_packagedata_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 904 of 906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_package_setscene)
NOTE: Running setscene task 905 of 906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_package_setscene)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_package_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_package_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_package_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 906 of 906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_packagedata_setscene)
NOTE: Running task 2403 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe coreutils-9.3-r0: task do_create_spdx: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xorgproto-2023.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2416 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_create_spdx)
NOTE: recipe xorgproto-2023.2-r0: task do_create_spdx: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2423 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_configure)
NOTE: recipe libxkbcommon-1.5.0-r0: task do_configure: Started
NOTE: recipe xorgproto-2023.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 2424 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_collect_spdx_deps)
NOTE: Running task 2425 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_collect_spdx_deps)
NOTE: Running task 2426 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_collect_spdx_deps)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_collect_spdx_deps: Started
NOTE: recipe libice-1_1.1.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2427 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_create_spdx)
NOTE: recipe libxau-1_1.0.11-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2428 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_create_spdx)
NOTE: recipe libice-1_1.1.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2429 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_create_spdx)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_create_spdx: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_create_spdx: Started
NOTE: recipe libice-1_1.1.1-r0: task do_create_spdx: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_create_spdx: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_create_spdx: Succeeded
NOTE: Running task 2430 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_collect_spdx_deps)
NOTE: recipe libice-1_1.1.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 2431 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_collect_spdx_deps)
NOTE: recipe libxcb-1.15-r0: task do_collect_spdx_deps: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxcb-1.15-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2432 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_create_spdx)
NOTE: recipe libsm-1_1.2.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2433 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_create_spdx)
NOTE: recipe libxcb-1.15-r0: task do_create_spdx: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_create_spdx: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_create_spdx: Succeeded
NOTE: recipe libxkbcommon-1.5.0-r0: task do_configure: Succeeded
NOTE: Running task 2434 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_compile)
NOTE: recipe libxkbcommon-1.5.0-r0: task do_compile: Started
NOTE: recipe libxcb-1.15-r0: task do_create_spdx: Succeeded
NOTE: Running task 2435 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_collect_spdx_deps)
NOTE: Running task 2436 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb:do_collect_spdx_deps)
NOTE: recipe libxkbcommon-1.5.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libx11-1_1.8.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe libx11-1_1.8.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2437 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb:do_create_spdx)
NOTE: recipe libxkbcommon-1.5.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libx11-1_1.8.6-r0: task do_create_spdx: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_compile: Succeeded
NOTE: Running task 2438 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_install)
NOTE: recipe libx11-1_1.8.6-r0: task do_create_spdx: Succeeded
NOTE: recipe libxkbcommon-1.5.0-r0: task do_install: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_install: Succeeded
NOTE: Running task 2439 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_populate_sysroot)
NOTE: Running task 2440 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_package)
NOTE: recipe libxkbcommon-1.5.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_package: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_populate_sysroot unihash changed to 510f5084b9bb832f148ef7debbbe2846e18aee2d856c6d038dce4eeb39868807
NOTE: Setscene tasks completed
NOTE: Running task 2441 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_254.bb:do_prepare_recipe_sysroot)
NOTE: recipe systemd-1_254-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe systemd-1_254-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2442 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_254.bb:do_configure)
NOTE: recipe systemd-1_254-r0: task do_configure: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_package unihash changed to d11c5fdd65c05f59444610daeee793d05f0928f92efb07033053c2ad2bbbb72a
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_packagedata became valid
NOTE: Running setscene task 902 of 906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_packagedata_setscene)
NOTE: recipe libxkbcommon-1.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2444 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_create_spdx)
NOTE: recipe libxkbcommon-1.5.0-r0: task do_create_spdx: Started
NOTE: recipe coreutils-9.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxkbcommon-1.5.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 2445 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_254.bb:do_collect_spdx_deps)
NOTE: recipe systemd-1_254-r0: task do_collect_spdx_deps: Started
NOTE: recipe systemd-1_254-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_configure: Succeeded
NOTE: Running task 2446 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.5.bb:do_configure_ptest_base)
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_configure_ptest_base: Started
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2447 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.5.bb:do_compile)
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_compile: Started
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_compile: Succeeded
NOTE: Running task 2448 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.5.bb:do_compile_ptest_base)
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_compile_ptest_base: Started
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2449 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.5.bb:do_install)
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_install: Started
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_install: Succeeded
NOTE: Running task 2450 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.5.bb:do_install_ptest_base)
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_install_ptest_base: Started
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2451 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.5.bb:do_populate_sysroot)
NOTE: Running task 2452 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.5.bb:do_package)
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_populate_sysroot: Started
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_package: Started
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2453 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2454 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2455 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_configure)
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2456 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_configure)
NOTE: recipe systemd-1_254-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2457 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_254.bb:do_compile)
NOTE: recipe shared-mime-info-2.2-r0: task do_configure: Started
NOTE: recipe systemd-1_254-r0: task do_compile: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_configure: Succeeded
NOTE: Running task 2458 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_compile)
NOTE: recipe shared-mime-info-2.2-r0: task do_compile: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_compile: Succeeded
NOTE: Running task 2459 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_install)
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Succeeded
NOTE: Running task 2460 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_compile)
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_install: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Succeeded
NOTE: Running task 2461 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_install)
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_install: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Succeeded
NOTE: recipe systemd-1_254-r0: task do_compile: Succeeded
NOTE: Running task 2462 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_254.bb:do_install)
NOTE: recipe systemd-1_254-r0: task do_install: Started
NOTE: recipe systemd-1_254-r0: task do_install: Succeeded
NOTE: Running task 2463 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_254.bb:do_populate_sysroot)
NOTE: Running task 2464 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_254.bb:do_package)
NOTE: recipe systemd-1_254-r0: task do_populate_sysroot: Started
NOTE: recipe systemd-1_254-r0: task do_package: Started
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_package: Succeeded
NOTE: Running task 2465 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.5.bb:do_packagedata)
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_packagedata: Started
NOTE: recipe systemd-1_254-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_254.bb:do_populate_sysroot unihash changed to 49eb8fb9ec824168694957cbcd78cee2b054e1401ac3a82c6f39071fac757b51
NOTE: Setscene tasks completed
NOTE: Running task 2466 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2467 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dbus-1.14.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_packagedata: Succeeded
NOTE: Running task 2468 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.5.bb:do_create_spdx)
NOTE: Running task 2469 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_package)
NOTE: Running task 2470 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2471 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_configure)
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_create_spdx: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_package: Started
NOTE: recipe dbus-1.14.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2472 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_configure)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_configure: Started
NOTE: recipe dbus-1.14.8-r0: task do_configure: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Succeeded
NOTE: Running task 2473 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_packagedata)
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata: Succeeded
NOTE: Running task 2474 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_package_write_rpm)
NOTE: recipe desktop-file-utils-0.26-r0: task do_package_write_rpm: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_package_write_rpm: Succeeded
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_create_spdx: Succeeded
NOTE: Running task 2475 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_collect_spdx_deps)
NOTE: Running task 2476 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_collect_spdx_deps)
NOTE: recipe desktop-file-utils-0.26-r0: task do_collect_spdx_deps: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2477 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_create_spdx)
NOTE: recipe shared-mime-info-2.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_create_spdx: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_create_spdx: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_package: Succeeded
NOTE: Running task 2478 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata)
NOTE: recipe shared-mime-info-2.2-r0: task do_packagedata: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2479 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_create_spdx)
NOTE: Running task 2480 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_write_rpm)
NOTE: recipe shared-mime-info-2.2-r0: task do_create_spdx: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_package_write_rpm: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_create_spdx: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_configure: Succeeded
NOTE: Running task 2481 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_compile)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_compile: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_compile: Succeeded
NOTE: Running task 2482 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_install)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_install: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_install: Succeeded
NOTE: recipe systemd-1_254-r0: task do_package: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_254.bb:do_package unihash changed to ca537df1cab8df5bcd4e37a2891bdf81b9d58ee669ef5d14fe5f7c364fb8fc0f
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_254.bb:do_packagedata became valid
NOTE: Running setscene task 906 of 906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_254.bb:do_packagedata_setscene)
NOTE: recipe systemd-1_254-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-1_254-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2484 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_package)
NOTE: Running task 2485 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_254.bb:do_create_spdx)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package: Started
NOTE: recipe systemd-1_254-r0: task do_create_spdx: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package: Succeeded
NOTE: Running task 2486 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_packagedata)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2487 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_package_write_rpm)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package_write_rpm: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe systemd-1_254-r0: task do_create_spdx: Succeeded
NOTE: Running task 2488 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_collect_spdx_deps)
NOTE: Running task 2489 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_collect_spdx_deps)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe dbus-1.14.8-r0: task do_collect_spdx_deps: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2490 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_create_spdx)
NOTE: recipe dbus-1.14.8-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_create_spdx: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_create_spdx: Succeeded
NOTE: recipe dbus-1.14.8-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2491 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_configure_ptest_base)
NOTE: recipe dbus-1.14.8-r0: task do_configure_ptest_base: Started
NOTE: recipe dbus-1.14.8-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2492 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_compile)
NOTE: recipe dbus-1.14.8-r0: task do_compile: Started
NOTE: recipe dbus-1.14.8-r0: task do_compile: Succeeded
NOTE: Running task 2493 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_compile_ptest_base)
NOTE: recipe dbus-1.14.8-r0: task do_compile_ptest_base: Started
NOTE: recipe dbus-1.14.8-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2494 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_install)
NOTE: recipe dbus-1.14.8-r0: task do_install: Started
NOTE: recipe dbus-1.14.8-r0: task do_install: Succeeded
NOTE: Running task 2495 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_install_ptest_base)
NOTE: recipe dbus-1.14.8-r0: task do_install_ptest_base: Started
NOTE: recipe dbus-1.14.8-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2496 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_package)
NOTE: recipe dbus-1.14.8-r0: task do_package: Started
NOTE: recipe dbus-1.14.8-r0: task do_package: Succeeded
NOTE: Running task 2497 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_packagedata)
NOTE: recipe dbus-1.14.8-r0: task do_packagedata: Started
NOTE: recipe dbus-1.14.8-r0: task do_packagedata: Succeeded
NOTE: Running task 2498 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_create_spdx)
NOTE: Running task 2499 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_package_write_rpm)
NOTE: Running task 2500 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.5.bb:do_package_write_rpm)
NOTE: Running task 2501 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.5.bb:do_package_qa)
NOTE: recipe dbus-1.14.8-r0: task do_create_spdx: Started
NOTE: recipe dbus-1.14.8-r0: task do_package_write_rpm: Started
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_package_write_rpm: Started
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_package_qa: Started
NOTE: recipe dbus-1.14.8-r0: task do_create_spdx: Succeeded
NOTE: Running task 2502 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.5.bb:do_create_runtime_spdx)
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_create_runtime_spdx: Started
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe dbus-1.14.8-r0: task do_package_write_rpm: Succeeded
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_package_qa: Succeeded
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2503 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.5.bb:do_build)
NOTE: Tasks Summary: Attempted 2503 tasks of which 2362 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 53 ERROR messages, returning a non-zero exit code.
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-src went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-dbg went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-ptest went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-staticdev went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-dev went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-doc went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-stdbuf went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-af went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-be went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-bg went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-ca went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-cs went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-da went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-de went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-el went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-eo went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-es went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-et went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-eu went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-fi went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-fr went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-ga went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-gl went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-hr went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-hu went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-ia went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-id went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-it went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-ja went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-ka went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-kk went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-ko went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-lg went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-lt went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-ms went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-nb went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-nl went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-pl went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-pt went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-pt-br went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-ro went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-ru went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-sk went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-sl went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-sr went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-sv went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-tr went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-uk went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-vi went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-zh-cn went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-zh-tw went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============5423456207813852415==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (0 cached, 899 parsed). 1807 targets, 54 skipped, 0 masked, 0 errors.
Removing 2 recipes from the cortexa15t2hf-neon sysroot...done.
Removing 2 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2+snapshot-3591be8a4f897f7215e0bc6fb518a333f07cc68f"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:3591be8a4f897f7215e0bc6fb518a333f07cc68f"
workspace            = "master:bdc74e5ff3c16fed24829fd494e5860754c08778"

Initialising tasks...done.
Sstate summary: Wanted 91 Local 9 Mirrors 0 Missed 82 Current 815 (9% match, 90% complete)
Removing 16 stale sstate objects for arch qemuarm...done.
Removing 37 stale sstate objects for arch cortexa15t2hf-neon...done.
NOTE: Executing Tasks
NOTE: Running setscene task 823 of 906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.3.bb:do_packagedata_setscene)
NOTE: recipe coreutils-9.3-r0: task do_packagedata_setscene: Started
NOTE: Running task 1284 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.5.bb:do_recipe_qa)
NOTE: Running task 1355 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1360 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1372 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.5.bb:do_write_config)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/coreutils/9.3/temp/log.do_packagedata_setscene.1529546
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.3.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 904 of 906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.3.bb:do_package_setscene)
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_recipe_qa: Started
NOTE: recipe xorgproto-2023.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe wayland-1.22.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_write_config: Started
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_write_config: Succeeded
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1470 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.5.bb:do_fetch)
NOTE: recipe xorgproto-2023.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1475 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_configure)
NOTE: recipe wayland-1.22.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1476 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_configure)
NOTE: Running task 1613 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_fetch: Started
NOTE: recipe xorgproto-2023.2-r0: task do_configure: Started
NOTE: recipe wayland-1.22.0-r0: task do_configure: Started
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_fetch: Succeeded
NOTE: Running task 1615 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.5.bb:do_unpack)
NOTE: Running task 1616 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1686 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.39.bb:do_prepare_recipe_sysroot)
NOTE: recipe base-files-3.0.14-r90: task do_install: Started
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_unpack: Started
NOTE: recipe coreutils-9.3-r0: task do_package_setscene: Started
NOTE: Running task 1943 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_recipe_qa)
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1944 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_recipe_qa)
NOTE: Running task 1977 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_collect_spdx_deps)
NOTE: recipe xkeyboard-config-2.39-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2103 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_write_config)
NOTE: Running task 2177 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.39.bb:do_collect_spdx_deps)
NOTE: recipe desktop-file-utils-0.26-r0: task do_recipe_qa: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_recipe_qa: Started
NOTE: Running task 2178 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_collect_spdx_deps)
NOTE: recipe xorgproto-2023.2-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2310 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_package_write_rpm)
NOTE: Running task 2313 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package_write_rpm)
NOTE: recipe shared-mime-info-2.2-r0: task do_write_config: Started
NOTE: recipe xorgproto-2023.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_recipe_qa: Succeeded
NOTE: recipe xkeyboard-config-2.39-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xkeyboard-config-2.39-r0: task do_collect_spdx_deps: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_write_config: Succeeded
NOTE: Running task 2314 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.39.bb:do_configure)
NOTE: Running task 2315 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_fetch)
NOTE: Running task 2316 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_fetch)
NOTE: recipe xkeyboard-config-2.39-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_install: Succeeded
NOTE: Running task 2317 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe libgcc-13.2.0-r0: task do_package_write_rpm: Started
NOTE: Running task 2318 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe wayland-1.22.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_fetch: Started
NOTE: recipe xkeyboard-config-2.39-r0: task do_configure: Started
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm: Started
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Succeeded
NOTE: Running task 2319 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r90: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r90: task do_package: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_fetch: Succeeded
NOTE: Running task 2320 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_unpack)
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_unpack: Succeeded
NOTE: Running task 2321 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.5.bb:do_patch)
NOTE: Running task 2322 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.5.bb:do_collect_spdx_deps)
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Started
NOTE: recipe xorgproto-2023.2-r0: task do_configure: Succeeded
NOTE: Running task 2323 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_compile)
NOTE: recipe shared-mime-info-2.2-r0: task do_unpack: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Succeeded
NOTE: Running task 2324 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_patch)
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_patch: Started
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe xorgproto-2023.2-r0: task do_compile: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Started
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to f982a4123a6cd558c191245ca50978150707844bc8d5e1992485a942d8fdeede
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Succeeded
NOTE: Running task 2329 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_deploy_source_date_epoch)
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_unpack: Succeeded
NOTE: Running task 2330 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_patch)
NOTE: recipe xorgproto-2023.2-r0: task do_compile: Succeeded
NOTE: Running task 2331 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_install)
NOTE: recipe xkeyboard-config-2.39-r0: task do_configure: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2332 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.39.bb:do_compile)
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_patch: Succeeded
NOTE: Running task 2333 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 2334 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.5.bb:do_populate_lic)
NOTE: recipe shared-mime-info-2.2-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r90: task do_package: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_install: Started
NOTE: Running task 2335 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe xkeyboard-config-2.39-r0: task do_compile: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_patch: Succeeded
NOTE: Running task 2336 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_deploy_source_date_epoch)
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_populate_lic: Started
NOTE: recipe base-files-3.0.14-r90: task do_packagedata: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.5.bb:do_populate_lic unihash changed to 635ab920143c4896c47179d3faa01d60abf90729f96d63c49265f88edbb66d61
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2337 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.5.bb:do_configure)
NOTE: recipe wayland-1.22.0-r0: task do_configure: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_packagedata: Succeeded
NOTE: Running task 2338 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_configure_ptest_base)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to f561b45f6c5e241d6ad9ef43d77edcf1f3a5b9f911a27c22eff9209cd0f9544a
NOTE: Running task 2341 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx)
NOTE: recipe shared-mime-info-2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe coreutils-9.3-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 905 of 906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r90: task do_create_spdx: Started
NOTE: recipe wayland-1.22.0-r0: task do_configure_ptest_base: Started
NOTE: recipe xkeyboard-config-2.39-r0: task do_compile: Succeeded
NOTE: Running task 2343 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.39.bb:do_install)
NOTE: recipe wayland-1.22.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2344 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_compile)
NOTE: recipe coreutils-9.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xkeyboard-config-2.39-r0: task do_install: Started
NOTE: recipe coreutils-9.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 906 of 906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.3.bb:do_recipe_qa_setscene)
NOTE: recipe wayland-1.22.0-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r90: task do_create_spdx: Succeeded
NOTE: recipe coreutils-9.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2023.2-r0: task do_install: Succeeded
NOTE: Running task 2347 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_populate_sysroot)
NOTE: Running task 2348 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_package)
NOTE: recipe coreutils-9.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2350 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.3.bb:do_fetch)
NOTE: recipe xorgproto-2023.2-r0: task do_populate_sysroot: Started
NOTE: recipe xorgproto-2023.2-r0: task do_package: Started
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm: Succeeded
NOTE: recipe coreutils-9.3-r0: task do_fetch: Started
NOTE: recipe coreutils-9.3-r0: task do_fetch: Succeeded
NOTE: Running task 2351 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.3.bb:do_unpack)
NOTE: recipe coreutils-9.3-r0: task do_unpack: Started
NOTE: recipe xorgproto-2023.2-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_populate_sysroot unihash changed to 8274c583d6c437cdda83a8c32baeee1096bdf6e37b67af461faccf1a5c58f857
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_populate_sysroot became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_populate_sysroot became valid
NOTE: Running setscene task 877 of 906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 881 of 906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 903 of 906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_populate_sysroot_setscene)
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 904 of 906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: recipe coreutils-9.3-r0: task do_unpack: Succeeded
NOTE: Running task 2362 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.3.bb:do_packagedata)
NOTE: Running task 2363 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.3.bb:do_collect_spdx_deps)
NOTE: recipe xkeyboard-config-2.39-r0: task do_install: Succeeded
NOTE: Running task 2364 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.39.bb:do_populate_sysroot)
NOTE: Running task 2365 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.39.bb:do_package)
NOTE: recipe libgcc-13.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe coreutils-9.3-r0: task do_packagedata: Started
NOTE: recipe wayland-1.22.0-r0: task do_compile: Succeeded
NOTE: Running task 2366 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_compile_ptest_base)
NOTE: recipe coreutils-9.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe xkeyboard-config-2.39-r0: task do_populate_sysroot: Started
NOTE: recipe xkeyboard-config-2.39-r0: task do_package: Started
NOTE: recipe coreutils-9.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_compile_ptest_base: Started
NOTE: Running setscene task 905 of 906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 906 of 906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_populate_sysroot_setscene)
NOTE: recipe xorgproto-2023.2-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_package unihash changed to fe1878ac2e7fe327611a120174d9143c7daecd3d8d98fe9302d98ffd9102cd06
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_package became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_packagedata became valid
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_packagedata became valid
NOTE: Running setscene task 879 of 906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 881 of 906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb:do_packagedata_setscene)
NOTE: recipe wayland-1.22.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2377 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_install)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.6-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_install: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.39-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.39.bb:do_populate_sysroot unihash changed to 6281cd6d9bcde498abb72415a5b168d1374369941d08492b8a8f500461d1be01
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 884 of 906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_package_setscene)
NOTE: recipe libx11-1_1.8.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 897 of 906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb:do_package_setscene)
NOTE: recipe coreutils-9.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2378 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.3.bb:do_create_spdx)
NOTE: Running task 2379 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.3.bb:do_package_write_rpm)
NOTE: recipe libsm-1_1.2.4-r0: task do_package_setscene: Started
NOTE: recipe libx11-1_1.8.6-r0: task do_package_setscene: Started
NOTE: recipe coreutils-9.3-r0: task do_create_spdx: Started
NOTE: recipe coreutils-9.3-r0: task do_package_write_rpm: Started
NOTE: recipe wayland-1.22.0-r0: task do_install: Succeeded
NOTE: Running task 2381 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_install_ptest_base)
NOTE: recipe wayland-1.22.0-r0: task do_install_ptest_base: Started
NOTE: recipe wayland-1.22.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2382 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_populate_sysroot)
NOTE: Running task 2383 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_package)
NOTE: recipe wayland-1.22.0-r0: task do_populate_sysroot: Started
NOTE: recipe wayland-1.22.0-r0: task do_package: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 898 of 906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_packagedata_setscene)
NOTE: recipe wayland-1.22.0-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_populate_sysroot unihash changed to 42cba318e6681451cab69fc64ca737c0289639d45ca2efec9dd4015d9e724c52
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 899 of 906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_package_setscene)
NOTE: recipe libx11-1_1.8.6-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 900 of 906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_packagedata_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_package_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 901 of 906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_package_setscene)
NOTE: recipe libxcb-1.15-r0: task do_package_setscene: Started
NOTE: recipe xkeyboard-config-2.39-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.39.bb:do_package unihash changed to 2aa6cde5fb642dfa2ec8bee0585ebff487cc44febe052b4dcfab554bb62e6d99
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.39.bb:do_packagedata became valid
NOTE: Running setscene task 901 of 906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.39.bb:do_packagedata_setscene)
NOTE: recipe xkeyboard-config-2.39-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_package_setscene: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_package unihash changed to e19aeed336dce5eb94dbc02e34a205bb4c9ef01ae23dfb93e97ba36c85efb6d5
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_packagedata became valid
NOTE: Running setscene task 901 of 906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_packagedata_setscene)
NOTE: recipe xkeyboard-config-2.39-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 2385 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.39.bb:do_create_spdx)
NOTE: recipe wayland-1.22.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.39-r0: task do_create_spdx: Started
NOTE: recipe wayland-1.22.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 2387 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_create_spdx)
NOTE: recipe wayland-1.22.0-r0: task do_create_spdx: Started
NOTE: recipe xkeyboard-config-2.39-r0: task do_create_spdx: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_create_spdx: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 902 of 906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 903 of 906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_packagedata_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 904 of 906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_package_setscene)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 905 of 906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_package_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_package_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_package_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_package_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 906 of 906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_packagedata_setscene)
NOTE: Running task 2403 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe xorgproto-2023.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xorgproto-2023.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2416 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_create_spdx)
NOTE: recipe xorgproto-2023.2-r0: task do_create_spdx: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2423 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_configure)
NOTE: recipe libxkbcommon-1.5.0-r0: task do_configure: Started
NOTE: recipe coreutils-9.3-r0: task do_create_spdx: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 2424 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_collect_spdx_deps)
NOTE: Running task 2425 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_collect_spdx_deps)
NOTE: Running task 2426 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_collect_spdx_deps)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_collect_spdx_deps: Started
NOTE: recipe libice-1_1.1.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2427 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_create_spdx)
NOTE: recipe libxau-1_1.0.11-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2428 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_create_spdx)
NOTE: recipe libice-1_1.1.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2429 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_create_spdx)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_create_spdx: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_create_spdx: Started
NOTE: recipe libice-1_1.1.1-r0: task do_create_spdx: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_create_spdx: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_create_spdx: Succeeded
NOTE: Running task 2430 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_collect_spdx_deps)
NOTE: recipe libice-1_1.1.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 2431 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_collect_spdx_deps)
NOTE: recipe libxcb-1.15-r0: task do_collect_spdx_deps: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxcb-1.15-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2432 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_create_spdx)
NOTE: recipe libsm-1_1.2.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2433 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_create_spdx)
NOTE: recipe libxcb-1.15-r0: task do_create_spdx: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_create_spdx: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_create_spdx: Succeeded
NOTE: recipe libxkbcommon-1.5.0-r0: task do_configure: Succeeded
NOTE: Running task 2434 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_compile)
NOTE: recipe libxkbcommon-1.5.0-r0: task do_compile: Started
NOTE: recipe libxcb-1.15-r0: task do_create_spdx: Succeeded
NOTE: Running task 2435 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_collect_spdx_deps)
NOTE: Running task 2436 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb:do_collect_spdx_deps)
NOTE: recipe libxkbcommon-1.5.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libx11-1_1.8.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe libx11-1_1.8.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2437 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb:do_create_spdx)
NOTE: recipe libxkbcommon-1.5.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libx11-1_1.8.6-r0: task do_create_spdx: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_compile: Succeeded
NOTE: Running task 2438 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_install)
NOTE: recipe libx11-1_1.8.6-r0: task do_create_spdx: Succeeded
NOTE: recipe libxkbcommon-1.5.0-r0: task do_install: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_install: Succeeded
NOTE: Running task 2439 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_populate_sysroot)
NOTE: Running task 2440 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_package)
NOTE: recipe libxkbcommon-1.5.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_package: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_populate_sysroot unihash changed to 96d7fb29e72cf1aaebb178d2bdeed1f1a610fc1ec4bfa2dfe3c56b517488e9d7
NOTE: Setscene tasks completed
NOTE: Running task 2441 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_254.bb:do_prepare_recipe_sysroot)
NOTE: recipe systemd-1_254-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe systemd-1_254-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2442 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_254.bb:do_configure)
NOTE: recipe systemd-1_254-r0: task do_configure: Started
NOTE: recipe coreutils-9.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxkbcommon-1.5.0-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_package unihash changed to a1e788e11f1f59fbea0fe4cebb68708dba7e0d3c086ccfdfffca8475bebe1bbb
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_packagedata became valid
NOTE: Running setscene task 902 of 906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_packagedata_setscene)
NOTE: recipe libxkbcommon-1.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2444 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_create_spdx)
NOTE: recipe libxkbcommon-1.5.0-r0: task do_create_spdx: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 2445 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_254.bb:do_collect_spdx_deps)
NOTE: recipe systemd-1_254-r0: task do_collect_spdx_deps: Started
NOTE: recipe systemd-1_254-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_configure: Succeeded
NOTE: Running task 2446 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.5.bb:do_configure_ptest_base)
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_configure_ptest_base: Started
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2447 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.5.bb:do_compile)
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_compile: Started
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_compile: Succeeded
NOTE: Running task 2448 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.5.bb:do_compile_ptest_base)
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_compile_ptest_base: Started
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2449 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.5.bb:do_install)
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_install: Started
NOTE: recipe systemd-1_254-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2450 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_254.bb:do_compile)
NOTE: recipe systemd-1_254-r0: task do_compile: Started
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_install: Succeeded
NOTE: Running task 2451 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.5.bb:do_install_ptest_base)
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_install_ptest_base: Started
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2452 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.5.bb:do_populate_sysroot)
NOTE: Running task 2453 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.5.bb:do_package)
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_populate_sysroot: Started
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_package: Started
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2454 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2455 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_prepare_recipe_sysroot)
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2456 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_configure)
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2457 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_configure)
NOTE: recipe shared-mime-info-2.2-r0: task do_configure: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_configure: Succeeded
NOTE: Running task 2458 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_compile)
NOTE: recipe shared-mime-info-2.2-r0: task do_compile: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Succeeded
NOTE: Running task 2459 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_compile)
NOTE: recipe shared-mime-info-2.2-r0: task do_compile: Succeeded
NOTE: Running task 2460 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_install)
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_install: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Succeeded
NOTE: Running task 2461 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_install)
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_install: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Succeeded
NOTE: recipe systemd-1_254-r0: task do_compile: Succeeded
NOTE: Running task 2462 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_254.bb:do_install)
NOTE: recipe systemd-1_254-r0: task do_install: Started
NOTE: recipe systemd-1_254-r0: task do_install: Succeeded
NOTE: Running task 2463 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_254.bb:do_populate_sysroot)
NOTE: Running task 2464 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_254.bb:do_package)
NOTE: recipe systemd-1_254-r0: task do_populate_sysroot: Started
NOTE: recipe systemd-1_254-r0: task do_package: Started
NOTE: recipe systemd-1_254-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_254.bb:do_populate_sysroot unihash changed to bf954b3ed35a064088fb12684fce9858f99b50dcaebc653250194d500c3bb4f6
NOTE: Setscene tasks completed
NOTE: Running task 2465 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2466 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dbus-1.14.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2467 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_configure)
NOTE: recipe dbus-1.14.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2468 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_configure)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_configure: Started
NOTE: recipe dbus-1.14.8-r0: task do_configure: Started
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_package: Succeeded
NOTE: Running task 2469 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.5.bb:do_packagedata)
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_packagedata: Started
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_packagedata: Succeeded
NOTE: Running task 2470 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.5.bb:do_create_spdx)
NOTE: Running task 2471 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package)
NOTE: Running task 2472 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_package)
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_create_spdx: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_package: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Succeeded
NOTE: Running task 2473 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_packagedata)
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata: Succeeded
NOTE: Running task 2474 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_package_write_rpm)
NOTE: recipe desktop-file-utils-0.26-r0: task do_package_write_rpm: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_package_write_rpm: Succeeded
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_create_spdx: Succeeded
NOTE: Running task 2475 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_collect_spdx_deps)
NOTE: Running task 2476 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_collect_spdx_deps)
NOTE: recipe desktop-file-utils-0.26-r0: task do_collect_spdx_deps: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2477 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_create_spdx)
NOTE: recipe desktop-file-utils-0.26-r0: task do_create_spdx: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_configure: Succeeded
NOTE: Running task 2478 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_compile)
NOTE: recipe desktop-file-utils-0.26-r0: task do_create_spdx: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_compile: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_package: Succeeded
NOTE: Running task 2479 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_compile: Succeeded
NOTE: Running task 2480 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_install)
NOTE: recipe shared-mime-info-2.2-r0: task do_packagedata: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_install: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_install: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2481 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_create_spdx)
NOTE: Running task 2482 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_write_rpm)
NOTE: recipe shared-mime-info-2.2-r0: task do_create_spdx: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_package_write_rpm: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_create_spdx: Succeeded
NOTE: recipe systemd-1_254-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_254.bb:do_package unihash changed to 32f19dc581d9ea532cf019ab208e3f5a8e2e310128492afa106ca6f8a4a3d4a8
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_254.bb:do_packagedata became valid
NOTE: Running setscene task 906 of 906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_254.bb:do_packagedata_setscene)
NOTE: recipe systemd-1_254-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-1_254-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2484 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_package)
NOTE: Running task 2485 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_254.bb:do_create_spdx)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package: Started
NOTE: recipe systemd-1_254-r0: task do_create_spdx: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package: Succeeded
NOTE: Running task 2486 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_packagedata)
NOTE: recipe shared-mime-info-2.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2487 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_package_write_rpm)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package_write_rpm: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe systemd-1_254-r0: task do_create_spdx: Succeeded
NOTE: Running task 2488 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_collect_spdx_deps)
NOTE: Running task 2489 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_collect_spdx_deps)
NOTE: recipe dbus-1.14.8-r0: task do_collect_spdx_deps: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe dbus-1.14.8-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2490 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_create_spdx)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_create_spdx: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_create_spdx: Succeeded
NOTE: recipe dbus-1.14.8-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2491 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_configure_ptest_base)
NOTE: recipe dbus-1.14.8-r0: task do_configure_ptest_base: Started
NOTE: recipe dbus-1.14.8-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2492 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_compile)
NOTE: recipe dbus-1.14.8-r0: task do_compile: Started
NOTE: recipe dbus-1.14.8-r0: task do_compile: Succeeded
NOTE: Running task 2493 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_compile_ptest_base)
NOTE: recipe dbus-1.14.8-r0: task do_compile_ptest_base: Started
NOTE: recipe dbus-1.14.8-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2494 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_install)
NOTE: recipe dbus-1.14.8-r0: task do_install: Started
NOTE: recipe dbus-1.14.8-r0: task do_install: Succeeded
NOTE: Running task 2495 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_install_ptest_base)
NOTE: recipe dbus-1.14.8-r0: task do_install_ptest_base: Started
NOTE: recipe dbus-1.14.8-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2496 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_package)
NOTE: recipe dbus-1.14.8-r0: task do_package: Started
NOTE: recipe dbus-1.14.8-r0: task do_package: Succeeded
NOTE: Running task 2497 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_packagedata)
NOTE: recipe dbus-1.14.8-r0: task do_packagedata: Started
NOTE: recipe dbus-1.14.8-r0: task do_packagedata: Succeeded
NOTE: Running task 2498 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_create_spdx)
NOTE: Running task 2499 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_package_write_rpm)
NOTE: Running task 2500 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.5.bb:do_package_write_rpm)
NOTE: Running task 2501 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.5.bb:do_package_qa)
NOTE: recipe dbus-1.14.8-r0: task do_create_spdx: Started
NOTE: recipe dbus-1.14.8-r0: task do_package_write_rpm: Started
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_package_qa: Started
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_package_write_rpm: Started
NOTE: recipe dbus-1.14.8-r0: task do_create_spdx: Succeeded
NOTE: Running task 2502 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.5.bb:do_create_runtime_spdx)
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_create_runtime_spdx: Started
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe dbus-1.14.8-r0: task do_package_write_rpm: Succeeded
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_package_qa: Succeeded
NOTE: recipe glib-2.0-1_2.76.5-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2503 of 2503 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.5.bb:do_build)
NOTE: Tasks Summary: Attempted 2503 tasks of which 2362 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 53 ERROR messages, returning a non-zero exit code.
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-src went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-dbg went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-ptest went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-staticdev went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-dev went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-doc went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-stdbuf went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-af went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-be went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-bg went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-ca went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-cs went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-da went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-de went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-el went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-eo went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-es went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-et went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-eu went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-fi went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-fr went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-ga went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-gl went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-hr went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-hu went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-ia went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-id went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-it went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-ja went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-ka went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-kk went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-ko went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-lg went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-lt went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-ms went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-nb went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-nl went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-pl went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-pt went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-pt-br went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-ro went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-ru went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-sk went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-sl went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-sr went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-sv went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-tr went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-uk went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-vi went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-zh-cn went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: QA Issue: Package version for package coreutils-locale-zh-tw went backwards which would break package feeds (from 0:9.4-r0 to 0:9.3-r0) [version-going-backwards]
ERROR: coreutils-9.3-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============5423456207813852415==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/glib-2.0/glib-2.0: FILELIST: removed "/usr/lib/libgthread-2.0.so.0.7600.4 /usr/lib/libgobject-2.0.so.0.7600.4 /usr/lib/libgio-2.0.so.0.7600.4 /usr/lib/libgmodule-2.0.so.0.7600.4 /usr/lib/libglib-2.0.so.0.7600.4", added "/usr/lib/libgobject-2.0.so.0.7600.5 /usr/lib/libgthread-2.0.so.0.7600.5 /usr/lib/libgio-2.0.so.0.7600.5 /usr/lib/libgmodule-2.0.so.0.7600.5 /usr/lib/libglib-2.0.so.0.7600.5"
Changes to packages/core2-32-poky-linux/glib-2.0 (sysroot):
  /usr/lib/libgio-2.0.so.0 changed symlink target from libgio-2.0.so.0.7600.4 to libgio-2.0.so.0.7600.5
  /usr/lib/libglib-2.0.so.0 changed symlink target from libglib-2.0.so.0.7600.4 to libglib-2.0.so.0.7600.5
  /usr/lib/libgmodule-2.0.so.0 changed symlink target from libgmodule-2.0.so.0.7600.4 to libgmodule-2.0.so.0.7600.5
  /usr/lib/libgobject-2.0.so.0 changed symlink target from libgobject-2.0.so.0.7600.4 to libgobject-2.0.so.0.7600.5
  /usr/lib/libgthread-2.0.so.0 changed symlink target from libgthread-2.0.so.0.7600.4 to libgthread-2.0.so.0.7600.5
  /usr/lib/libgio-2.0.so.0.7600.4 moved to /usr/lib/libgio-2.0.so.0.7600.5
  /usr/lib/libglib-2.0.so.0.7600.4 moved to /usr/lib/libglib-2.0.so.0.7600.5
  /usr/lib/libgmodule-2.0.so.0.7600.4 moved to /usr/lib/libgmodule-2.0.so.0.7600.5
  /usr/lib/libgobject-2.0.so.0.7600.4 moved to /usr/lib/libgobject-2.0.so.0.7600.5
  /usr/lib/libgthread-2.0.so.0.7600.4 moved to /usr/lib/libgthread-2.0.so.0.7600.5
  /usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.7600.4-gdb.py moved to /usr/share/gdb/auto-load/usr/lib/libglib-2.0.so.0.7600.5-gdb.py
  /usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.7600.4-gdb.py moved to /usr/share/gdb/auto-load/usr/lib/libgobject-2.0.so.0.7600.5-gdb.py
Changes to packages/x86_64-linux/glib-2.0-native (sysroot):
  /usr/lib/libgio-2.0.so.0 changed symlink target from libgio-2.0.so.0.7600.4 to libgio-2.0.so.0.7600.5
  /usr/lib/libglib-2.0.so.0 changed symlink target from libglib-2.0.so.0.7600.4 to libglib-2.0.so.0.7600.5
  /usr/lib/libgmodule-2.0.so.0 changed symlink target from libgmodule-2.0.so.0.7600.4 to libgmodule-2.0.so.0.7600.5
  /usr/lib/libgobject-2.0.so.0 changed symlink target from libgobject-2.0.so.0.7600.4 to libgobject-2.0.so.0.7600.5
  /usr/lib/libgthread-2.0.so.0 changed symlink target from libgthread-2.0.so.0.7600.4 to libgthread-2.0.so.0.7600.5
  /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.76.4/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.7600.4-gdb.py moved to /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.76.5/recipe-sysroot-native/usr/lib/libglib-2.0.so.0.7600.5-gdb.py
  /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.76.4/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.7600.4-gdb.py moved to /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.76.5/recipe-sysroot-native/usr/lib/libgobject-2.0.so.0.7600.5-gdb.py
  /usr/lib/libgio-2.0.so.0.7600.4 moved to /usr/lib/libgio-2.0.so.0.7600.5
  /usr/lib/libglib-2.0.so.0.7600.4 moved to /usr/lib/libglib-2.0.so.0.7600.5
  /usr/lib/libgmodule-2.0.so.0.7600.4 moved to /usr/lib/libgmodule-2.0.so.0.7600.5
  /usr/lib/libgobject-2.0.so.0.7600.4 moved to /usr/lib/libgobject-2.0.so.0.7600.5
  /usr/lib/libgthread-2.0.so.0.7600.4 moved to /usr/lib/libgthread-2.0.so.0.7600.5
  /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.76.4 moved to /usr/share/gdb/auto-load/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/glib-2.0-native/2.76.5

--===============5423456207813852415==--

