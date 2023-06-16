Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1AAFC2FC19
	for <webhook@archiver.kernel.org>; Fri, 16 Jun 2023 03:51:29 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.804.1686887482657561571
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jun 2023 20:51:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=ZmG+ydm1;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 01010188c2545069-389a350b-6640-4959-a723-d9fc3f9a92bc-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1686887485;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=uRzk65hTo7ql8pbQ1B5WP9KKW60nNbp6PRRnN4hENAQ=;
	b=ZmG+ydm1aZnAD/X7HimVfGa6MBcPb1jwOEgOzIStMUXcadVrMxZDJXni7PxBOHt4
	XU5eAOmGBkvuf9NZsSCJZ67s/BTCxiZKoA8vQTsJhH6Zu8Hla5IPn7zC3GTHuapTTjj
	uljo4I3axm03+WjmifINdS3gEr4rGWqp9LtKADp8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1686887485;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=uRzk65hTo7ql8pbQ1B5WP9KKW60nNbp6PRRnN4hENAQ=;
	b=CZn5sJimf6WM6TQh2sZZZibE2IiAkQlUNh9Osmc2kGIQz7mbSP38knf8if8dpXA3
	DcK8R54GvLCnYVWM4yL/AXv+WqzZPb0ME8pbDQjlbuMf6MisV3kunWIF+Gi6b09Vyrf
	OYhBes3L1Kt7T6yTw7KBAVxzaYjbmdBVA5Z4twsg=
Content-Type: multipart/mixed; boundary="===============3337391849830019487=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vte: upgrading to 0.72.2 SUCCEEDED
Message-ID: <01010188c2545069-389a350b-6640-4959-a723-d9fc3f9a92bc-000000@us-west-2.amazonses.com>
Date: Fri, 16 Jun 2023 03:51:25 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.06.16-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 03:51:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182995

--===============3337391849830019487==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *vte* to *0.72.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-vte-upgrade-0.72.1-0.72.2.patch
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
From a6ed2f45b005a1dabaaf18631e0dae9824cc0360 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 16 Jun 2023 03:46:53 +0000
Subject: [PATCH] vte: upgrade 0.72.1 -> 0.72.2

---
 meta/recipes-support/vte/{vte_0.72.1.bb => vte_0.72.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/vte/{vte_0.72.1.bb => vte_0.72.2.bb} (94%)

diff --git a/meta/recipes-support/vte/vte_0.72.1.bb b/meta/recipes-support/vte/vte_0.72.2.bb
similarity index 94%
rename from meta/recipes-support/vte/vte_0.72.1.bb
rename to meta/recipes-support/vte/vte_0.72.2.bb
index b9ff3183c8..4249b75ac0 100644
--- a/meta/recipes-support/vte/vte_0.72.1.bb
+++ b/meta/recipes-support/vte/vte_0.72.2.bb
@@ -21,7 +21,7 @@ inherit gnomebase gi-docgen features_check upstream-version-is-even gobject-intr
 
 # vapigen.m4 is required when vala is not present (but the one from vala should be used normally)
 SRC_URI += "file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch"
-SRC_URI[archive.sha256sum] = "0554f9f88d56ce2d78398fcc7f69bc00e53bbbc5f694e0ae1dcaf5286f89d7e4"
+SRC_URI[archive.sha256sum] = "f7966fd185a6981f53964162b71cfef7e606495155d6f5827b72aa0dd6741c9e"
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
-- 
2.39.2


--===============3337391849830019487==
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
meta-yocto-bsp       = "tmp-auh-upgrades:da4545c2bcb275e255e5d9de7e72379b46918227"
workspace            = "master:d9cf8973d01b74aa2680dba5ac46c5cea3d1a6d0"

Initialising tasks...done.
Sstate summary: Wanted 69 Local 60 Mirrors 0 Missed 9 Current 738 (86% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 759 of 807 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 760 of 807 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 762 of 807 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.41.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 763 of 807 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.41.2.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.41.2-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.41.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe nettle-3.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.8.1-r0: task do_populate_sysroot_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/nettle/3.8.1-r0/temp/log.do_packagedata_setscene.1653121
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 797 of 807 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_package_setscene)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/sqlite3/3_3.41.2-r0/temp/log.do_packagedata_setscene.1653123
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.41.2.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe sqlite3-3_3.41.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe nettle-3.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 798 of 807 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.41.2.bb:do_package_setscene)
NOTE: Running task 1511 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.72.2.bb:do_fetch)
NOTE: Running task 1550 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.72.2.bb:do_write_config)
NOTE: recipe vte-0.72.2-r0: task do_fetch: Started
NOTE: recipe vte-0.72.2-r0: task do_fetch: Succeeded
NOTE: recipe vte-0.72.2-r0: task do_write_config: Started
NOTE: Running task 1589 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.72.2.bb:do_unpack)
NOTE: recipe vte-0.72.2-r0: task do_write_config: Succeeded
NOTE: recipe vte-0.72.2-r0: task do_unpack: Started
NOTE: recipe sqlite3-3_3.41.2-r0: task do_package_setscene: Started
NOTE: recipe nettle-3.8.1-r0: task do_package_setscene: Started
NOTE: recipe vte-0.72.2-r0: task do_unpack: Succeeded
NOTE: Running task 1590 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.72.2.bb:do_patch)
NOTE: recipe sqlite3-3_3.41.2-r0: task do_package_setscene: Succeeded
NOTE: recipe vte-0.72.2-r0: task do_patch: Started
NOTE: recipe vte-0.72.2-r0: task do_patch: Succeeded
NOTE: Running task 1595 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.72.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1596 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.72.2.bb:do_populate_lic)
NOTE: recipe vte-0.72.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vte-0.72.2-r0: task do_populate_lic: Started
NOTE: recipe vte-0.72.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vte-0.72.2-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.72.2.bb:do_populate_lic unihash changed to 4140411a554febec2e1fc44c68f736176fe112820f4bb62ddaf965a2909cf172
NOTE: recipe nettle-3.8.1-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 801 of 807 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-13.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-13.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 803 of 807 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-13.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-13.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 804 of 807 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.37.bb:do_populate_sysroot_setscene)
NOTE: recipe glibc-2.37-r1: task do_populate_sysroot_setscene: Started
NOTE: recipe glibc-2.37-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 807 of 807 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2087 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.41.2.bb:do_packagedata)
NOTE: Running task 2401 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_packagedata)
NOTE: Running task 2424 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.72.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe sqlite3-3_3.41.2-r0: task do_packagedata: Started
NOTE: recipe nettle-3.8.1-r0: task do_packagedata: Started
NOTE: recipe vte-0.72.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sqlite3-3_3.41.2-r0: task do_packagedata: Succeeded
NOTE: recipe nettle-3.8.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2546 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.72.2.bb:do_collect_spdx_deps)
NOTE: recipe vte-0.72.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe vte-0.72.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2547 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.72.2.bb:do_configure)
NOTE: recipe vte-0.72.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe vte-0.72.2-r0: task do_configure: Started
NOTE: recipe vte-0.72.2-r0: task do_configure: Succeeded
NOTE: Running task 2548 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.72.2.bb:do_compile)
NOTE: recipe vte-0.72.2-r0: task do_compile: Started
NOTE: recipe vte-0.72.2-r0: task do_compile: Succeeded
NOTE: Running task 2549 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.72.2.bb:do_install)
NOTE: recipe vte-0.72.2-r0: task do_install: Started
NOTE: recipe vte-0.72.2-r0: task do_install: Succeeded
NOTE: Running task 2550 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.72.2.bb:do_package)
NOTE: Running task 2551 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.72.2.bb:do_populate_sysroot)
NOTE: recipe vte-0.72.2-r0: task do_populate_sysroot: Started
NOTE: recipe vte-0.72.2-r0: task do_package: Started
NOTE: recipe vte-0.72.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe vte-0.72.2-r0: task do_package: Succeeded
NOTE: Running task 2552 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.72.2.bb:do_packagedata)
NOTE: recipe vte-0.72.2-r0: task do_packagedata: Started
NOTE: recipe vte-0.72.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2553 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.72.2.bb:do_create_spdx)
NOTE: Running task 2554 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.72.2.bb:do_package_write_rpm)
NOTE: Running task 2555 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.72.2.bb:do_package_qa)
NOTE: recipe vte-0.72.2-r0: task do_create_spdx: Started
NOTE: recipe vte-0.72.2-r0: task do_package_write_rpm: Started
NOTE: recipe vte-0.72.2-r0: task do_package_qa: Started
NOTE: recipe vte-0.72.2-r0: task do_create_spdx: Succeeded
NOTE: recipe vte-0.72.2-r0: task do_package_qa: Succeeded
NOTE: Running task 2556 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.72.2.bb:do_create_runtime_spdx)
NOTE: recipe vte-0.72.2-r0: task do_create_runtime_spdx: Started
NOTE: recipe vte-0.72.2-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe vte-0.72.2-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2557 of 2557 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.72.2.bb:do_build)
NOTE: Tasks Summary: Attempted 2557 tasks of which 2536 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 6 seconds

Summary: There was 1 WARNING message.
Summary: There were 18 ERROR messages, returning a non-zero exit code.
ERROR: sqlite3-3_3.41.2-r0 do_packagedata_setscene: QA Issue: Package version for package sqlite3-src went backwards which would break package feeds (from 3:3.42.0-r0 to 3:3.41.2-r0) [version-going-backwards]
ERROR: nettle-3.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package nettle-src went backwards which would break package feeds (from 0:3.9.1-r0 to 0:3.8.1-r0) [version-going-backwards]
ERROR: sqlite3-3_3.41.2-r0 do_packagedata_setscene: QA Issue: Package version for package sqlite3-dbg went backwards which would break package feeds (from 3:3.42.0-r0 to 3:3.41.2-r0) [version-going-backwards]
ERROR: nettle-3.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package nettle-dbg went backwards which would break package feeds (from 0:3.9.1-r0 to 0:3.8.1-r0) [version-going-backwards]
ERROR: sqlite3-3_3.41.2-r0 do_packagedata_setscene: QA Issue: Package version for package libsqlite3 went backwards which would break package feeds (from 3:3.42.0-r0 to 3:3.41.2-r0) [version-going-backwards]
ERROR: nettle-3.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package nettle-ptest went backwards which would break package feeds (from 0:3.9.1-r0 to 0:3.8.1-r0) [version-going-backwards]
ERROR: nettle-3.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package nettle-staticdev went backwards which would break package feeds (from 0:3.9.1-r0 to 0:3.8.1-r0) [version-going-backwards]
ERROR: sqlite3-3_3.41.2-r0 do_packagedata_setscene: QA Issue: Package version for package libsqlite3-dev went backwards which would break package feeds (from 3:3.42.0-r0 to 3:3.41.2-r0) [version-going-backwards]
ERROR: nettle-3.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package nettle-dev went backwards which would break package feeds (from 0:3.9.1-r0 to 0:3.8.1-r0) [version-going-backwards]
ERROR: nettle-3.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package nettle-doc went backwards which would break package feeds (from 0:3.9.1-r0 to 0:3.8.1-r0) [version-going-backwards]
ERROR: sqlite3-3_3.41.2-r0 do_packagedata_setscene: QA Issue: Package version for package libsqlite3-doc went backwards which would break package feeds (from 3:3.42.0-r0 to 3:3.41.2-r0) [version-going-backwards]
ERROR: nettle-3.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package nettle-locale went backwards which would break package feeds (from 0:3.9.1-r0 to 0:3.8.1-r0) [version-going-backwards]
ERROR: nettle-3.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package nettle-bin went backwards which would break package feeds (from 0:3.9.1-r0 to 0:3.8.1-r0) [version-going-backwards]
ERROR: sqlite3-3_3.41.2-r0 do_packagedata_setscene: QA Issue: Package version for package libsqlite3-staticdev went backwards which would break package feeds (from 3:3.42.0-r0 to 3:3.41.2-r0) [version-going-backwards]
ERROR: nettle-3.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package nettle went backwards which would break package feeds (from 0:3.9.1-r0 to 0:3.8.1-r0) [version-going-backwards]
ERROR: nettle-3.8.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: sqlite3-3_3.41.2-r0 do_packagedata_setscene: QA Issue: Package version for package sqlite3 went backwards which would break package feeds (from 3:3.42.0-r0 to 3:3.41.2-r0) [version-going-backwards]
ERROR: sqlite3-3_3.41.2-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============3337391849830019487==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/vte: PV changed from "0.72.1" to "0.72.2"
packages/core2-32-poky-linux/vte: PKGV changed from 0.72.1 [default] to 0.72.2 [default]
packages/core2-32-poky-linux/vte: SRC_URI changed from "https://download.gnome.org/sources//vte/0.72/vte-0.72.1.tar.xz;name=archive file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch" to "https://download.gnome.org/sources//vte/0.72/vte-0.72.2.tar.xz;name=archive file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch"
packages/core2-32-poky-linux/vte/libvte: PV changed from "0.72.1" to "0.72.2"
packages/core2-32-poky-linux/vte/libvte: PKGV changed from 0.72.1 [default] to 0.72.2 [default]
packages/core2-32-poky-linux/vte/libvte: FILELIST: removed "/usr/lib/libvte-2.91.so.0.7200.1", added "/usr/lib/libvte-2.91.so.0.7200.2"
Changes to packages/core2-32-poky-linux/vte (sysroot):
  /usr/lib/libvte-2.91.so.0 changed symlink target from libvte-2.91.so.0.7200.1 to libvte-2.91.so.0.7200.2
  /usr/lib/libvte-2.91.so.0.7200.1 moved to /usr/lib/libvte-2.91.so.0.7200.2
packages/core2-32-poky-linux/vte/vte-dbg: PV changed from "0.72.1" to "0.72.2"
packages/core2-32-poky-linux/vte/vte-dbg: PKGV changed from 0.72.1 [default] to 0.72.2 [default]
packages/core2-32-poky-linux/vte/vte-dbg: FILELIST: removed "/usr/lib/.debug/libvte-2.91.so.0.7200.1", added "/usr/lib/.debug/libvte-2.91.so.0.7200.2"
packages/core2-32-poky-linux/vte/vte-dbg: PKGSIZE changed from 6447784 to 6448188 (+0%)
packages/core2-32-poky-linux/vte/vte-dev: PV changed from "0.72.1" to "0.72.2"
packages/core2-32-poky-linux/vte/vte-dev: PKGV changed from 0.72.1 [default] to 0.72.2 [default]
packages/core2-32-poky-linux/vte/vte-doc: PV changed from "0.72.1" to "0.72.2"
packages/core2-32-poky-linux/vte/vte-doc: PKGV changed from 0.72.1 [default] to 0.72.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-ab: PV changed from "0.72.1" to "0.72.2"
packages/core2-32-poky-linux/vte/vte-locale-ab: PKGV changed from 0.72.1 [default] to 0.72.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-am: PV changed from "0.72.1" to "0.72.2"
packages/core2-32-poky-linux/vte/vte-locale-am: PKGV changed from 0.72.1 [default] to 0.72.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-an: PV changed from "0.72.1" to "0.72.2"
packages/core2-32-poky-linux/vte/vte-locale-an: PKGV changed from 0.72.1 [default] to 0.72.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-ang: PV changed from "0.72.1" to "0.72.2"
packages/core2-32-poky-linux/vte/vte-locale-ang: PKGV changed from 0.72.1 [default] to 0.72.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-ar: PV changed from "0.72.1" to "0.72.2"
packages/core2-32-poky-linux/vte/vte-locale-ar: PKGV changed from 0.72.1 [default] to 0.72.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-as: PV changed from "0.72.1" to "0.72.2"
packages/core2-32-poky-linux/vte/vte-locale-as: PKGV changed from 0.72.1 [default] to 0.72.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-ast: PV changed from "0.72.1" to "0.72.2"
packages/core2-32-poky-linux/vte/vte-locale-ast: PKGV changed from 0.72.1 [default] to 0.72.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-az: PV changed from "0.72.1" to "0.72.2"
packages/core2-32-poky-linux/vte/vte-locale-az: PKGV changed from 0.72.1 [default] to 0.72.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-be+latin: PV changed from "0.72.1" to "0.72.2"
packages/core2-32-poky-linux/vte/vte-locale-be+latin: PKGV changed from 0.72.1 [default] to 0.72.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-be: PV changed from "0.72.1" to "0.72.2"
packages/core2-32-poky-linux/vte/vte-locale-be: PKGV changed from 0.72.1 [default] to 0.72.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-bg: PV changed from "0.72.1" to "0.72.2"
packages/core2-32-poky-linux/vte/vte-locale-bg: PKGV changed from 0.72.1 [default] to 0.72.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-bn-in: PV changed from "0.72.1" to "0.72.2"
packages/core2-32-poky-linux/vte/vte-locale-bn-in: PKGV changed from 0.72.1 [default] to 0.72.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-bn: PV changed from "0.72.1" to "0.72.2"
packages/core2-32-poky-linux/vte/vte-locale-bn: PKGV changed from 0.72.1 [default] to 0.72.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-bs: PV changed from "0.72.1" to "0.72.2"
packages/core2-32-poky-linux/vte/vte-locale-bs: PKGV changed from 0.72.1 [default] to 0.72.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-ca+valencia: PV changed from "0.72.1" to "0.72.2"
packages/core2-32-poky-linux/vte/vte-locale-ca+valencia: PKGV changed from 0.72.1 [default] to 0.72.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-ca: PV changed from "0.72.1" to "0.72.2"
packages/core2-32-poky-linux/vte/vte-locale-ca: PKGV changed from 0.72.1 [default] to 0.72.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-ckb: PV changed from "0.72.1" to "0.72.2"
packages/core2-32-poky-linux/vte/vte-locale-ckb: PKGV changed from 0.72.1 [default] to 0.72.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-cs: PV changed from "0.72.1" to "0.72.2"
packages/core2-32-poky-linux/vte/vte-locale-cs: PKGV changed from 0.72.1 [default] to 0.72.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-cy: PV changed from "0.72.1" to "0.72.2"
packages/core2-32-poky-linux/vte/vte-locale-cy: PKGV changed from 0.72.1 [default] to 0.72.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-da: PV changed from "0.72.1" to "0.72.2"
packages/core2-32-poky-linux/vte/vte-locale-da: PKGV changed from 0.72.1 [default] to 0.72.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-de: PV changed from "0.72.1" to "0.72.2"
packages/core2-32-poky-linux/vte/vte-locale-de: PKGV changed from 0.72.1 [default] to 0.72.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-dz: PV changed from "0.72.1" to "0.72.2"
packages/core2-32-poky-linux/vte/vte-locale-dz: PKGV changed from 0.72.1 [default] to 0.72.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-el: PV changed from "0.72.1" to "0.72.2"
packages/core2-32-poky-linux/vte/vte-locale-el: PKGV changed from 0.72.1 [default] to 0.72.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-en+shaw: PV changed from "0.72.1" to "0.72.2"
packages/core2-32-poky-linux/vte/vte-locale-en+shaw: PKGV changed from 0.72.1 [default] to 0.72.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-en-ca: PV changed from "0.72.1" to "0.72.2"
packages/core2-32-poky-linux/vte/vte-locale-en-ca: PKGV changed from 0.72.1 [default] to 0.72.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-en-gb: PV changed from "0.72.1" to "0.72.2"
packages/core2-32-poky-linux/vte/vte-locale-en-gb: PKGV changed from 0.72.1 [default] to 0.72.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-eo: PV changed from "0.72.1" to "0.72.2"
packages/core2-32-poky-linux/vte/vte-locale-eo: PKGV changed from 0.72.1 [default] to 0.72.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-es: PV changed from "0.72.1" to "0.72.2"
packages/core2-32-poky-linux/vte/vte-locale-es: PKGV changed from 0.72.1 [default] to 0.72.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-et: PV changed from "0.72.1" to "0.72.2"
packages/core2-32-poky-linux/vte/vte-locale-et: PKGV changed from 0.72.1 [default] to 0.72.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-eu: PV changed from "0.72.1" to "0.72.2"
packages/core2-32-poky-linux/vte/vte-locale-eu: PKGV changed from 0.72.1 [default] to 0.72.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-fa: PV changed from "0.72.1" to "0.72.2"
packages/core2-32-poky-linux/vte/vte-locale-fa: PKGV changed from 0.72.1 [default] to 0.72.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-fi: PV changed from "0.72.1" to "0.72.2"
packages/core2-32-poky-linux/vte/vte-locale-fi: PKGV changed from 0.72.1 [default] to 0.72.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-fr: PV changed from "0.72.1" to "0.72.2"
packages/core2-32-poky-linux/vte/vte-locale-fr: PKGV changed from 0.72.1 [default] to 0.72.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-fur: PV changed from "0.72.1" to "0.72.2"
packages/core2-32-poky-linux/vte/vte-locale-fur: PKGV changed from 0.72.1 [default] to 0.72.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-ga: PV changed from "0.72.1" to "0.72.2"
packages/core2-32-poky-linux/vte/vte-locale-ga: PKGV changed from 0.72.1 [default] to 0.72.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-gd: PV changed from "0.72.1" to "0.72.2"
packages/core2-32-poky-linux/vte/vte-locale-gd: PKGV changed from 0.72.1 [default] to 0.72.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-gl: PV changed from "0.72.1" to "0.72.2"
packages/core2-32-poky-linux/vte/vte-locale-gl: PKGV changed from 0.72.1 [default] to 0.72.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-gu: PV changed from "0.72.1" to "0.72.2"
packages/core2-32-poky-linux/vte/vte-locale-gu: PKGV changed from 0.72.1 [default] to 0.72.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-he: PV changed from "0.72.1" to "0.72.2"
packages/core2-32-poky-linux/vte/vte-locale-he: PKGV changed from 0.72.1 [default] to 0.72.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-hi: PV changed from "0.72.1" to "0.72.2"
packages/core2-32-poky-linux/vte/vte-locale-hi: PKGV changed from 0.72.1 [default] to 0.72.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-hr: PV changed from "0.72.1" to "0.72.2"
packages/core2-32-poky-linux/vte/vte-locale-hr: PKGV changed from 0.72.1 [default] to 0.72.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-hu: PV changed from "0.72.1" to "0.72.2"
packages/core2-32-poky-linux/vte/vte-locale-hu: PKGV changed from 0.72.1 [default] to 0.72.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-id: PV changed from "0.72.1" to "0.72.2"
packages/core2-32-poky-linux/vte/vte-locale-id: PKGV changed from 0.72.1 [default] to 0.72.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-is: PV changed from "0.72.1" to "0.72.2"
packages/core2-32-poky-linux/vte/vte-locale-is: PKGV changed from 0.72.1 [default] to 0.72.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-it: PV changed from "0.72.1" to "0.72.2"
packages/core2-32-poky-linux/vte/vte-locale-it: PKGV changed from 0.72.1 [default] to 0.72.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-ja: PV changed from "0.72.1" to "0.72.2"
packages/core2-32-poky-linux/vte/vte-locale-ja: PKGV changed from 0.72.1 [default] to 0.72.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-ka: PV changed from "0.72.1" to "0.72.2"
packages/core2-32-poky-linux/vte/vte-locale-ka: PKGV changed from 0.72.1 [default] to 0.72.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-kk: PV changed from "0.72.1" to "0.72.2"
packages/core2-32-poky-linux/vte/vte-locale-kk: PKGV changed from 0.72.1 [default] to 0.72.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-kn: PV changed from "0.72.1" to "0.72.2"
packages/core2-32-poky-linux/vte/vte-locale-kn: PKGV changed from 0.72.1 [default] to 0.72.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-ko: PV changed from "0.72.1" to "0.72.2"
packages/core2-32-poky-linux/vte/vte-locale-ko: PKGV changed from 0.72.1 [default] to 0.72.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-ku: PV changed from "0.72.1" to "0.72.2"
packages/core2-32-poky-linux/vte/vte-locale-ku: PKGV changed from 0.72.1 [default] to 0.72.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-ky: PV changed from "0.72.1" to "0.72.2"
packages/core2-32-poky-linux/vte/vte-locale-ky: PKGV changed from 0.72.1 [default] to 0.72.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-li: PV changed from "0.72.1" to "0.72.2"
packages/core2-32-poky-linux/vte/vte-locale-li: PKGV changed from 0.72.1 [default] to 0.72.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-lt: PV changed from "0.72.1" to "0.72.2"
packages/core2-32-poky-linux/vte/vte-locale-lt: PKGV changed from 0.72.1 [default] to 0.72.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-lv: PV changed from "0.72.1" to "0.72.2"
packages/core2-32-poky-linux/vte/vte-locale-lv: PKGV changed from 0.72.1 [default] to 0.72.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-mai: PV changed from "0.72.1" to "0.72.2"
packages/core2-32-poky-linux/vte/vte-locale-mai: PKGV changed from 0.72.1 [default] to 0.72.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-mi: PV changed from "0.72.1" to "0.72.2"
packages/core2-32-poky-linux/vte/vte-locale-mi: PKGV changed from 0.72.1 [default] to 0.72.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-mjw: PV changed from "0.72.1" to "0.72.2"
packages/core2-32-poky-linux/vte/vte-locale-mjw: PKGV changed from 0.72.1 [default] to 0.72.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-mk: PV changed from "0.72.1" to "0.72.2"
packages/core2-32-poky-linux/vte/vte-locale-mk: PKGV changed from 0.72.1 [default] to 0.72.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-ml: PV changed from "0.72.1" to "0.72.2"
packages/core2-32-poky-linux/vte/vte-locale-ml: PKGV changed from 0.72.1 [default] to 0.72.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-mn: PV changed from "0.72.1" to "0.72.2"
packages/core2-32-poky-linux/vte/vte-locale-mn: PKGV changed from 0.72.1 [default] to 0.72.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-mr: PV changed from "0.72.1" to "0.72.2"
packages/core2-32-poky-linux/vte/vte-locale-mr: PKGV changed from 0.72.1 [default] to 0.72.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-ms: PV changed from "0.72.1" to "0.72.2"
packages/core2-32-poky-linux/vte/vte-locale-ms: PKGV changed from 0.72.1 [default] to 0.72.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-nb: PV changed from "0.72.1" to "0.72.2"
packages/core2-32-poky-linux/vte/vte-locale-nb: PKGV changed from 0.72.1 [default] to 0.72.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-nds: PV changed from "0.72.1" to "0.72.2"
packages/core2-32-poky-linux/vte/vte-locale-nds: PKGV changed from 0.72.1 [default] to 0.72.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-ne: PV changed from "0.72.1" to "0.72.2"
packages/core2-32-poky-linux/vte/vte-locale-ne: PKGV changed from 0.72.1 [default] to 0.72.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-nl: PV changed from "0.72.1" to "0.72.2"
packages/core2-32-poky-linux/vte/vte-locale-nl: PKGV changed from 0.72.1 [default] to 0.72.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-nn: PV changed from "0.72.1" to "0.72.2"
packages/core2-32-poky-linux/vte/vte-locale-nn: PKGV changed from 0.72.1 [default] to 0.72.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-oc: PV changed from "0.72.1" to "0.72.2"
packages/core2-32-poky-linux/vte/vte-locale-oc: PKGV changed from 0.72.1 [default] to 0.72.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-or: PV changed from "0.72.1" to "0.72.2"
packages/core2-32-poky-linux/vte/vte-locale-or: PKGV changed from 0.72.1 [default] to 0.72.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-pa: PV changed from "0.72.1" to "0.72.2"
packages/core2-32-poky-linux/vte/vte-locale-pa: PKGV changed from 0.72.1 [default] to 0.72.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-pl: PV changed from "0.72.1" to "0.72.2"
packages/core2-32-poky-linux/vte/vte-locale-pl: PKGV changed from 0.72.1 [default] to 0.72.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-pt-br: PV changed from "0.72.1" to "0.72.2"
packages/core2-32-poky-linux/vte/vte-locale-pt-br: PKGV changed from 0.72.1 [default] to 0.72.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-pt: PV changed from "0.72.1" to "0.72.2"
packages/core2-32-poky-linux/vte/vte-locale-pt: PKGV changed from 0.72.1 [default] to 0.72.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-ro: PV changed from "0.72.1" to "0.72.2"
packages/core2-32-poky-linux/vte/vte-locale-ro: PKGV changed from 0.72.1 [default] to 0.72.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-ru: PV changed from "0.72.1" to "0.72.2"
packages/core2-32-poky-linux/vte/vte-locale-ru: PKGV changed from 0.72.1 [default] to 0.72.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-rw: PV changed from "0.72.1" to "0.72.2"
packages/core2-32-poky-linux/vte/vte-locale-rw: PKGV changed from 0.72.1 [default] to 0.72.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-si: PV changed from "0.72.1" to "0.72.2"
packages/core2-32-poky-linux/vte/vte-locale-si: PKGV changed from 0.72.1 [default] to 0.72.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-sk: PV changed from "0.72.1" to "0.72.2"
packages/core2-32-poky-linux/vte/vte-locale-sk: PKGV changed from 0.72.1 [default] to 0.72.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-sl: PV changed from "0.72.1" to "0.72.2"
packages/core2-32-poky-linux/vte/vte-locale-sl: PKGV changed from 0.72.1 [default] to 0.72.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-sq: PV changed from "0.72.1" to "0.72.2"
packages/core2-32-poky-linux/vte/vte-locale-sq: PKGV changed from 0.72.1 [default] to 0.72.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-sr+latin: PV changed from "0.72.1" to "0.72.2"
packages/core2-32-poky-linux/vte/vte-locale-sr+latin: PKGV changed from 0.72.1 [default] to 0.72.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-sr: PV changed from "0.72.1" to "0.72.2"
packages/core2-32-poky-linux/vte/vte-locale-sr: PKGV changed from 0.72.1 [default] to 0.72.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-sv: PV changed from "0.72.1" to "0.72.2"
packages/core2-32-poky-linux/vte/vte-locale-sv: PKGV changed from 0.72.1 [default] to 0.72.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-ta: PV changed from "0.72.1" to "0.72.2"
packages/core2-32-poky-linux/vte/vte-locale-ta: PKGV changed from 0.72.1 [default] to 0.72.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-te: PV changed from "0.72.1" to "0.72.2"
packages/core2-32-poky-linux/vte/vte-locale-te: PKGV changed from 0.72.1 [default] to 0.72.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-tg: PV changed from "0.72.1" to "0.72.2"
packages/core2-32-poky-linux/vte/vte-locale-tg: PKGV changed from 0.72.1 [default] to 0.72.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-th: PV changed from "0.72.1" to "0.72.2"
packages/core2-32-poky-linux/vte/vte-locale-th: PKGV changed from 0.72.1 [default] to 0.72.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-tr: PV changed from "0.72.1" to "0.72.2"
packages/core2-32-poky-linux/vte/vte-locale-tr: PKGV changed from 0.72.1 [default] to 0.72.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-ug: PV changed from "0.72.1" to "0.72.2"
packages/core2-32-poky-linux/vte/vte-locale-ug: PKGV changed from 0.72.1 [default] to 0.72.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-uk: PV changed from "0.72.1" to "0.72.2"
packages/core2-32-poky-linux/vte/vte-locale-uk: PKGV changed from 0.72.1 [default] to 0.72.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-uz+cyrillic: PV changed from "0.72.1" to "0.72.2"
packages/core2-32-poky-linux/vte/vte-locale-uz+cyrillic: PKGV changed from 0.72.1 [default] to 0.72.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-vi: PV changed from "0.72.1" to "0.72.2"
packages/core2-32-poky-linux/vte/vte-locale-vi: PKGV changed from 0.72.1 [default] to 0.72.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-wa: PV changed from "0.72.1" to "0.72.2"
packages/core2-32-poky-linux/vte/vte-locale-wa: PKGV changed from 0.72.1 [default] to 0.72.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-xh: PV changed from "0.72.1" to "0.72.2"
packages/core2-32-poky-linux/vte/vte-locale-xh: PKGV changed from 0.72.1 [default] to 0.72.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-zh-cn: PV changed from "0.72.1" to "0.72.2"
packages/core2-32-poky-linux/vte/vte-locale-zh-cn: PKGV changed from 0.72.1 [default] to 0.72.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-zh-hk: PV changed from "0.72.1" to "0.72.2"
packages/core2-32-poky-linux/vte/vte-locale-zh-hk: PKGV changed from 0.72.1 [default] to 0.72.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-zh-tw: PV changed from "0.72.1" to "0.72.2"
packages/core2-32-poky-linux/vte/vte-locale-zh-tw: PKGV changed from 0.72.1 [default] to 0.72.2 [default]
packages/core2-32-poky-linux/vte/vte-prompt: PV changed from "0.72.1" to "0.72.2"
packages/core2-32-poky-linux/vte/vte-prompt: PKGV changed from 0.72.1 [default] to 0.72.2 [default]
packages/core2-32-poky-linux/vte/vte-src: PV changed from "0.72.1" to "0.72.2"
packages/core2-32-poky-linux/vte/vte-src: PKGV changed from 0.72.1 [default] to 0.72.2 [default]
packages/core2-32-poky-linux/vte/vte-src: PKGSIZE changed from 2209039 to 2208706 (-0%)
packages/core2-32-poky-linux/vte/vte-staticdev: PV changed from "0.72.1" to "0.72.2"
packages/core2-32-poky-linux/vte/vte-staticdev: PKGV changed from 0.72.1 [default] to 0.72.2 [default]
packages/core2-32-poky-linux/vte/vte: PV changed from "0.72.1" to "0.72.2"
packages/core2-32-poky-linux/vte/vte: PKGV changed from 0.72.1 [default] to 0.72.2 [default]

--===============3337391849830019487==
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
meta-yocto-bsp       = "tmp-auh-upgrades:da4545c2bcb275e255e5d9de7e72379b46918227"
workspace            = "master:d9cf8973d01b74aa2680dba5ac46c5cea3d1a6d0"

Initialising tasks...done.
Sstate summary: Wanted 78 Local 69 Mirrors 0 Missed 9 Current 723 (88% match, 98% complete)
Removing 5 stale sstate objects for arch cortexa15t2hf-neon...done.
NOTE: Executing Tasks
NOTE: Running setscene task 753 of 801 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 754 of 801 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 756 of 801 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.41.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 757 of 801 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.41.2.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.41.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe nettle-3.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe nettle-3.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.41.2-r0: task do_packagedata_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/sqlite3/3_3.41.2-r0/temp/log.do_packagedata_setscene.1681791
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.41.2.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 791 of 801 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.41.2.bb:do_package_setscene)
NOTE: recipe sqlite3-3_3.41.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe nettle-3.8.1-r0: task do_populate_sysroot_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/nettle/3.8.1-r0/temp/log.do_packagedata_setscene.1681789
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 792 of 801 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_package_setscene)
NOTE: Running task 1493 of 2535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.72.2.bb:do_fetch)
NOTE: Running task 1532 of 2535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.72.2.bb:do_write_config)
NOTE: recipe sqlite3-3_3.41.2-r0: task do_package_setscene: Started
NOTE: recipe vte-0.72.2-r0: task do_write_config: Started
NOTE: recipe vte-0.72.2-r0: task do_fetch: Started
NOTE: recipe vte-0.72.2-r0: task do_fetch: Succeeded
NOTE: Running task 1567 of 2535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.72.2.bb:do_unpack)
NOTE: recipe nettle-3.8.1-r0: task do_package_setscene: Started
NOTE: recipe vte-0.72.2-r0: task do_write_config: Succeeded
NOTE: recipe vte-0.72.2-r0: task do_unpack: Started
NOTE: recipe vte-0.72.2-r0: task do_unpack: Succeeded
NOTE: Running task 1568 of 2535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.72.2.bb:do_patch)
NOTE: recipe sqlite3-3_3.41.2-r0: task do_package_setscene: Succeeded
NOTE: recipe vte-0.72.2-r0: task do_patch: Started
NOTE: recipe vte-0.72.2-r0: task do_patch: Succeeded
NOTE: Running task 1573 of 2535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.72.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1574 of 2535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.72.2.bb:do_populate_lic)
NOTE: recipe vte-0.72.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vte-0.72.2-r0: task do_populate_lic: Started
NOTE: recipe vte-0.72.2-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.72.2.bb:do_populate_lic unihash changed to 4140411a554febec2e1fc44c68f736176fe112820f4bb62ddaf965a2909cf172
NOTE: recipe nettle-3.8.1-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 795 of 801 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.1.bb:do_populate_sysroot_setscene)
NOTE: recipe vte-0.72.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gcc-runtime-13.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-13.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 797 of 801 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-13.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-13.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 798 of 801 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.37.bb:do_populate_sysroot_setscene)
NOTE: recipe glibc-2.37-r1: task do_populate_sysroot_setscene: Started
NOTE: recipe glibc-2.37-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 801 of 801 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2067 of 2535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.41.2.bb:do_packagedata)
NOTE: Running task 2379 of 2535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_packagedata)
NOTE: Running task 2402 of 2535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.72.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe sqlite3-3_3.41.2-r0: task do_packagedata: Started
NOTE: recipe nettle-3.8.1-r0: task do_packagedata: Started
NOTE: recipe vte-0.72.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sqlite3-3_3.41.2-r0: task do_packagedata: Succeeded
NOTE: recipe nettle-3.8.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2524 of 2535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.72.2.bb:do_collect_spdx_deps)
NOTE: recipe vte-0.72.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe vte-0.72.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vte-0.72.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2525 of 2535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.72.2.bb:do_configure)
NOTE: recipe vte-0.72.2-r0: task do_configure: Started
NOTE: recipe vte-0.72.2-r0: task do_configure: Succeeded
NOTE: Running task 2526 of 2535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.72.2.bb:do_compile)
NOTE: recipe vte-0.72.2-r0: task do_compile: Started
NOTE: recipe vte-0.72.2-r0: task do_compile: Succeeded
NOTE: Running task 2527 of 2535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.72.2.bb:do_install)
NOTE: recipe vte-0.72.2-r0: task do_install: Started
NOTE: recipe vte-0.72.2-r0: task do_install: Succeeded
NOTE: Running task 2528 of 2535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.72.2.bb:do_package)
NOTE: Running task 2529 of 2535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.72.2.bb:do_populate_sysroot)
NOTE: recipe vte-0.72.2-r0: task do_package: Started
NOTE: recipe vte-0.72.2-r0: task do_populate_sysroot: Started
NOTE: recipe vte-0.72.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe vte-0.72.2-r0: task do_package: Succeeded
NOTE: Running task 2530 of 2535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.72.2.bb:do_packagedata)
NOTE: recipe vte-0.72.2-r0: task do_packagedata: Started
NOTE: recipe vte-0.72.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2531 of 2535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.72.2.bb:do_create_spdx)
NOTE: Running task 2532 of 2535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.72.2.bb:do_package_write_rpm)
NOTE: Running task 2533 of 2535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.72.2.bb:do_package_qa)
NOTE: recipe vte-0.72.2-r0: task do_create_spdx: Started
NOTE: recipe vte-0.72.2-r0: task do_package_write_rpm: Started
NOTE: recipe vte-0.72.2-r0: task do_package_qa: Started
NOTE: recipe vte-0.72.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 2534 of 2535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.72.2.bb:do_create_runtime_spdx)
NOTE: recipe vte-0.72.2-r0: task do_package_qa: Succeeded
NOTE: recipe vte-0.72.2-r0: task do_create_runtime_spdx: Started
NOTE: recipe vte-0.72.2-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe vte-0.72.2-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2535 of 2535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.72.2.bb:do_build)
NOTE: Tasks Summary: Attempted 2535 tasks of which 2514 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 18 ERROR messages, returning a non-zero exit code.
ERROR: sqlite3-3_3.41.2-r0 do_packagedata_setscene: QA Issue: Package version for package sqlite3-src went backwards which would break package feeds (from 3:3.42.0-r0 to 3:3.41.2-r0) [version-going-backwards]
ERROR: nettle-3.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package nettle-src went backwards which would break package feeds (from 0:3.9.1-r0 to 0:3.8.1-r0) [version-going-backwards]
ERROR: sqlite3-3_3.41.2-r0 do_packagedata_setscene: QA Issue: Package version for package sqlite3-dbg went backwards which would break package feeds (from 3:3.42.0-r0 to 3:3.41.2-r0) [version-going-backwards]
ERROR: sqlite3-3_3.41.2-r0 do_packagedata_setscene: QA Issue: Package version for package libsqlite3 went backwards which would break package feeds (from 3:3.42.0-r0 to 3:3.41.2-r0) [version-going-backwards]
ERROR: nettle-3.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package nettle-dbg went backwards which would break package feeds (from 0:3.9.1-r0 to 0:3.8.1-r0) [version-going-backwards]
ERROR: sqlite3-3_3.41.2-r0 do_packagedata_setscene: QA Issue: Package version for package libsqlite3-dev went backwards which would break package feeds (from 3:3.42.0-r0 to 3:3.41.2-r0) [version-going-backwards]
ERROR: nettle-3.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package nettle-ptest went backwards which would break package feeds (from 0:3.9.1-r0 to 0:3.8.1-r0) [version-going-backwards]
ERROR: sqlite3-3_3.41.2-r0 do_packagedata_setscene: QA Issue: Package version for package libsqlite3-doc went backwards which would break package feeds (from 3:3.42.0-r0 to 3:3.41.2-r0) [version-going-backwards]
ERROR: nettle-3.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package nettle-staticdev went backwards which would break package feeds (from 0:3.9.1-r0 to 0:3.8.1-r0) [version-going-backwards]
ERROR: sqlite3-3_3.41.2-r0 do_packagedata_setscene: QA Issue: Package version for package libsqlite3-staticdev went backwards which would break package feeds (from 3:3.42.0-r0 to 3:3.41.2-r0) [version-going-backwards]
ERROR: sqlite3-3_3.41.2-r0 do_packagedata_setscene: QA Issue: Package version for package sqlite3 went backwards which would break package feeds (from 3:3.42.0-r0 to 3:3.41.2-r0) [version-going-backwards]
ERROR: nettle-3.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package nettle-dev went backwards which would break package feeds (from 0:3.9.1-r0 to 0:3.8.1-r0) [version-going-backwards]
ERROR: sqlite3-3_3.41.2-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: nettle-3.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package nettle-doc went backwards which would break package feeds (from 0:3.9.1-r0 to 0:3.8.1-r0) [version-going-backwards]
ERROR: nettle-3.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package nettle-locale went backwards which would break package feeds (from 0:3.9.1-r0 to 0:3.8.1-r0) [version-going-backwards]
ERROR: nettle-3.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package nettle-bin went backwards which would break package feeds (from 0:3.9.1-r0 to 0:3.8.1-r0) [version-going-backwards]
ERROR: nettle-3.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package nettle went backwards which would break package feeds (from 0:3.9.1-r0 to 0:3.8.1-r0) [version-going-backwards]
ERROR: nettle-3.8.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============3337391849830019487==
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
meta-yocto-bsp       = "tmp-auh-upgrades:da4545c2bcb275e255e5d9de7e72379b46918227"
workspace            = "master:d9cf8973d01b74aa2680dba5ac46c5cea3d1a6d0"

Initialising tasks...done.
Sstate summary: Wanted 78 Local 69 Mirrors 0 Missed 9 Current 723 (88% match, 98% complete)
Removing 5 stale sstate objects for arch ppc7400...done.
NOTE: Executing Tasks
NOTE: Running setscene task 753 of 801 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 754 of 801 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 756 of 801 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.41.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 757 of 801 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.41.2.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.41.2-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.41.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe nettle-3.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe nettle-3.8.1-r0: task do_packagedata_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/sqlite3/3_3.41.2-r0/temp/log.do_packagedata_setscene.1728384
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.41.2.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 791 of 801 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.41.2.bb:do_package_setscene)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/nettle/3.8.1-r0/temp/log.do_packagedata_setscene.1728382
NOTE: recipe sqlite3-3_3.41.2-r0: task do_populate_sysroot_setscene: Succeeded
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe nettle-3.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 792 of 801 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_package_setscene)
NOTE: Running task 1493 of 2535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.72.2.bb:do_fetch)
NOTE: Running task 1532 of 2535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.72.2.bb:do_write_config)
NOTE: recipe vte-0.72.2-r0: task do_fetch: Started
NOTE: recipe vte-0.72.2-r0: task do_write_config: Started
NOTE: recipe vte-0.72.2-r0: task do_fetch: Succeeded
NOTE: Running task 1567 of 2535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.72.2.bb:do_unpack)
NOTE: recipe vte-0.72.2-r0: task do_write_config: Succeeded
NOTE: recipe vte-0.72.2-r0: task do_unpack: Started
NOTE: recipe nettle-3.8.1-r0: task do_package_setscene: Started
NOTE: recipe sqlite3-3_3.41.2-r0: task do_package_setscene: Started
NOTE: recipe vte-0.72.2-r0: task do_unpack: Succeeded
NOTE: Running task 1568 of 2535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.72.2.bb:do_patch)
NOTE: recipe vte-0.72.2-r0: task do_patch: Started
NOTE: recipe sqlite3-3_3.41.2-r0: task do_package_setscene: Succeeded
NOTE: recipe vte-0.72.2-r0: task do_patch: Succeeded
NOTE: Running task 1573 of 2535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.72.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1574 of 2535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.72.2.bb:do_populate_lic)
NOTE: recipe vte-0.72.2-r0: task do_populate_lic: Started
NOTE: recipe vte-0.72.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vte-0.72.2-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.72.2.bb:do_populate_lic unihash changed to 4140411a554febec2e1fc44c68f736176fe112820f4bb62ddaf965a2909cf172
NOTE: recipe nettle-3.8.1-r0: task do_package_setscene: Succeeded
NOTE: recipe vte-0.72.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 795 of 801 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-13.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-13.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 797 of 801 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-13.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-13.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 798 of 801 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.37.bb:do_populate_sysroot_setscene)
NOTE: recipe glibc-2.37-r1: task do_populate_sysroot_setscene: Started
NOTE: recipe glibc-2.37-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 801 of 801 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2067 of 2535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.41.2.bb:do_packagedata)
NOTE: Running task 2380 of 2535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_packagedata)
NOTE: Running task 2402 of 2535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.72.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe sqlite3-3_3.41.2-r0: task do_packagedata: Started
NOTE: recipe nettle-3.8.1-r0: task do_packagedata: Started
NOTE: recipe vte-0.72.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe nettle-3.8.1-r0: task do_packagedata: Succeeded
NOTE: recipe sqlite3-3_3.41.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2524 of 2535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.72.2.bb:do_collect_spdx_deps)
NOTE: recipe vte-0.72.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe vte-0.72.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2525 of 2535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.72.2.bb:do_configure)
NOTE: recipe vte-0.72.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe vte-0.72.2-r0: task do_configure: Started
NOTE: recipe vte-0.72.2-r0: task do_configure: Succeeded
NOTE: Running task 2526 of 2535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.72.2.bb:do_compile)
NOTE: recipe vte-0.72.2-r0: task do_compile: Started
NOTE: recipe vte-0.72.2-r0: task do_compile: Succeeded
NOTE: Running task 2527 of 2535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.72.2.bb:do_install)
NOTE: recipe vte-0.72.2-r0: task do_install: Started
NOTE: recipe vte-0.72.2-r0: task do_install: Succeeded
NOTE: Running task 2528 of 2535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.72.2.bb:do_package)
NOTE: Running task 2529 of 2535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.72.2.bb:do_populate_sysroot)
NOTE: recipe vte-0.72.2-r0: task do_populate_sysroot: Started
NOTE: recipe vte-0.72.2-r0: task do_package: Started
NOTE: recipe vte-0.72.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe vte-0.72.2-r0: task do_package: Succeeded
NOTE: Running task 2530 of 2535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.72.2.bb:do_packagedata)
NOTE: recipe vte-0.72.2-r0: task do_packagedata: Started
NOTE: recipe vte-0.72.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2531 of 2535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.72.2.bb:do_create_spdx)
NOTE: Running task 2532 of 2535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.72.2.bb:do_package_write_rpm)
NOTE: Running task 2533 of 2535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.72.2.bb:do_package_qa)
NOTE: recipe vte-0.72.2-r0: task do_create_spdx: Started
NOTE: recipe vte-0.72.2-r0: task do_package_write_rpm: Started
NOTE: recipe vte-0.72.2-r0: task do_package_qa: Started
NOTE: recipe vte-0.72.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 2534 of 2535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.72.2.bb:do_create_runtime_spdx)
NOTE: recipe vte-0.72.2-r0: task do_create_runtime_spdx: Started
NOTE: recipe vte-0.72.2-r0: task do_package_qa: Succeeded
NOTE: recipe vte-0.72.2-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe vte-0.72.2-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2535 of 2535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.72.2.bb:do_build)
NOTE: Tasks Summary: Attempted 2535 tasks of which 2514 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: There was 1 WARNING message.
Summary: There were 18 ERROR messages, returning a non-zero exit code.
ERROR: sqlite3-3_3.41.2-r0 do_packagedata_setscene: QA Issue: Package version for package sqlite3-src went backwards which would break package feeds (from 3:3.42.0-r0 to 3:3.41.2-r0) [version-going-backwards]
ERROR: sqlite3-3_3.41.2-r0 do_packagedata_setscene: QA Issue: Package version for package sqlite3-dbg went backwards which would break package feeds (from 3:3.42.0-r0 to 3:3.41.2-r0) [version-going-backwards]
ERROR: sqlite3-3_3.41.2-r0 do_packagedata_setscene: QA Issue: Package version for package libsqlite3 went backwards which would break package feeds (from 3:3.42.0-r0 to 3:3.41.2-r0) [version-going-backwards]
ERROR: sqlite3-3_3.41.2-r0 do_packagedata_setscene: QA Issue: Package version for package libsqlite3-dev went backwards which would break package feeds (from 3:3.42.0-r0 to 3:3.41.2-r0) [version-going-backwards]
ERROR: sqlite3-3_3.41.2-r0 do_packagedata_setscene: QA Issue: Package version for package libsqlite3-doc went backwards which would break package feeds (from 3:3.42.0-r0 to 3:3.41.2-r0) [version-going-backwards]
ERROR: sqlite3-3_3.41.2-r0 do_packagedata_setscene: QA Issue: Package version for package libsqlite3-staticdev went backwards which would break package feeds (from 3:3.42.0-r0 to 3:3.41.2-r0) [version-going-backwards]
ERROR: sqlite3-3_3.41.2-r0 do_packagedata_setscene: QA Issue: Package version for package sqlite3 went backwards which would break package feeds (from 3:3.42.0-r0 to 3:3.41.2-r0) [version-going-backwards]
ERROR: sqlite3-3_3.41.2-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: nettle-3.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package nettle-src went backwards which would break package feeds (from 0:3.9.1-r0 to 0:3.8.1-r0) [version-going-backwards]
ERROR: nettle-3.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package nettle-dbg went backwards which would break package feeds (from 0:3.9.1-r0 to 0:3.8.1-r0) [version-going-backwards]
ERROR: nettle-3.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package nettle-ptest went backwards which would break package feeds (from 0:3.9.1-r0 to 0:3.8.1-r0) [version-going-backwards]
ERROR: nettle-3.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package nettle-staticdev went backwards which would break package feeds (from 0:3.9.1-r0 to 0:3.8.1-r0) [version-going-backwards]
ERROR: nettle-3.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package nettle-dev went backwards which would break package feeds (from 0:3.9.1-r0 to 0:3.8.1-r0) [version-going-backwards]
ERROR: nettle-3.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package nettle-doc went backwards which would break package feeds (from 0:3.9.1-r0 to 0:3.8.1-r0) [version-going-backwards]
ERROR: nettle-3.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package nettle-locale went backwards which would break package feeds (from 0:3.9.1-r0 to 0:3.8.1-r0) [version-going-backwards]
ERROR: nettle-3.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package nettle-bin went backwards which would break package feeds (from 0:3.9.1-r0 to 0:3.8.1-r0) [version-going-backwards]
ERROR: nettle-3.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package nettle went backwards which would break package feeds (from 0:3.9.1-r0 to 0:3.8.1-r0) [version-going-backwards]
ERROR: nettle-3.8.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============3337391849830019487==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/vte/libvte: FILELIST: removed "/usr/lib/libvte-2.91.so.0.7200.1", added "/usr/lib/libvte-2.91.so.0.7200.2"
Changes to packages/core2-32-poky-linux/vte (sysroot):
  /usr/lib/libvte-2.91.so.0 changed symlink target from libvte-2.91.so.0.7200.1 to libvte-2.91.so.0.7200.2
  /usr/lib/libvte-2.91.so.0.7200.1 moved to /usr/lib/libvte-2.91.so.0.7200.2

--===============3337391849830019487==
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
meta-yocto-bsp       = "tmp-auh-upgrades:da4545c2bcb275e255e5d9de7e72379b46918227"
workspace            = "master:d9cf8973d01b74aa2680dba5ac46c5cea3d1a6d0"

Initialising tasks...done.
Sstate summary: Wanted 78 Local 69 Mirrors 0 Missed 9 Current 723 (88% match, 98% complete)
Removing 5 stale sstate objects for arch mips32r2...done.
NOTE: Executing Tasks
NOTE: Running setscene task 753 of 801 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 754 of 801 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 756 of 801 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.41.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 757 of 801 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.41.2.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.41.2-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.41.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe nettle-3.8.1-r0: task do_populate_sysroot_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/sqlite3/3_3.41.2-r0/temp/log.do_packagedata_setscene.1704970
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.41.2.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 791 of 801 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.41.2.bb:do_package_setscene)
NOTE: recipe nettle-3.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.41.2-r0: task do_populate_sysroot_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/nettle/3.8.1-r0/temp/log.do_packagedata_setscene.1704968
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 792 of 801 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_package_setscene)
NOTE: Running task 1493 of 2535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.72.2.bb:do_fetch)
NOTE: Running task 1532 of 2535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.72.2.bb:do_write_config)
NOTE: recipe vte-0.72.2-r0: task do_write_config: Started
NOTE: recipe vte-0.72.2-r0: task do_fetch: Started
NOTE: recipe vte-0.72.2-r0: task do_fetch: Succeeded
NOTE: Running task 1567 of 2535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.72.2.bb:do_unpack)
NOTE: recipe vte-0.72.2-r0: task do_write_config: Succeeded
NOTE: recipe nettle-3.8.1-r0: task do_package_setscene: Started
NOTE: recipe sqlite3-3_3.41.2-r0: task do_package_setscene: Started
NOTE: recipe vte-0.72.2-r0: task do_unpack: Started
NOTE: recipe vte-0.72.2-r0: task do_unpack: Succeeded
NOTE: Running task 1568 of 2535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.72.2.bb:do_patch)
NOTE: recipe sqlite3-3_3.41.2-r0: task do_package_setscene: Succeeded
NOTE: recipe vte-0.72.2-r0: task do_patch: Started
NOTE: recipe vte-0.72.2-r0: task do_patch: Succeeded
NOTE: Running task 1573 of 2535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.72.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1574 of 2535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.72.2.bb:do_populate_lic)
NOTE: recipe vte-0.72.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vte-0.72.2-r0: task do_populate_lic: Started
NOTE: recipe vte-0.72.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vte-0.72.2-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.72.2.bb:do_populate_lic unihash changed to 4140411a554febec2e1fc44c68f736176fe112820f4bb62ddaf965a2909cf172
NOTE: recipe nettle-3.8.1-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 795 of 801 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-13.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-13.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 797 of 801 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-13.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-13.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 798 of 801 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.37.bb:do_populate_sysroot_setscene)
NOTE: recipe glibc-2.37-r1: task do_populate_sysroot_setscene: Started
NOTE: recipe glibc-2.37-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 801 of 801 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2062 of 2535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.41.2.bb:do_packagedata)
NOTE: Running task 2378 of 2535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_packagedata)
NOTE: Running task 2402 of 2535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.72.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe sqlite3-3_3.41.2-r0: task do_packagedata: Started
NOTE: recipe nettle-3.8.1-r0: task do_packagedata: Started
NOTE: recipe vte-0.72.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sqlite3-3_3.41.2-r0: task do_packagedata: Succeeded
NOTE: recipe nettle-3.8.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2524 of 2535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.72.2.bb:do_collect_spdx_deps)
NOTE: recipe vte-0.72.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe vte-0.72.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2525 of 2535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.72.2.bb:do_configure)
NOTE: recipe vte-0.72.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe vte-0.72.2-r0: task do_configure: Started
NOTE: recipe vte-0.72.2-r0: task do_configure: Succeeded
NOTE: Running task 2526 of 2535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.72.2.bb:do_compile)
NOTE: recipe vte-0.72.2-r0: task do_compile: Started
NOTE: recipe vte-0.72.2-r0: task do_compile: Succeeded
NOTE: Running task 2527 of 2535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.72.2.bb:do_install)
NOTE: recipe vte-0.72.2-r0: task do_install: Started
NOTE: recipe vte-0.72.2-r0: task do_install: Succeeded
NOTE: Running task 2528 of 2535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.72.2.bb:do_package)
NOTE: Running task 2529 of 2535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.72.2.bb:do_populate_sysroot)
NOTE: recipe vte-0.72.2-r0: task do_populate_sysroot: Started
NOTE: recipe vte-0.72.2-r0: task do_package: Started
NOTE: recipe vte-0.72.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe vte-0.72.2-r0: task do_package: Succeeded
NOTE: Running task 2530 of 2535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.72.2.bb:do_packagedata)
NOTE: recipe vte-0.72.2-r0: task do_packagedata: Started
NOTE: recipe vte-0.72.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2531 of 2535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.72.2.bb:do_create_spdx)
NOTE: Running task 2532 of 2535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.72.2.bb:do_package_write_rpm)
NOTE: Running task 2533 of 2535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.72.2.bb:do_package_qa)
NOTE: recipe vte-0.72.2-r0: task do_create_spdx: Started
NOTE: recipe vte-0.72.2-r0: task do_package_write_rpm: Started
NOTE: recipe vte-0.72.2-r0: task do_package_qa: Started
NOTE: recipe vte-0.72.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 2534 of 2535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.72.2.bb:do_create_runtime_spdx)
NOTE: recipe vte-0.72.2-r0: task do_create_runtime_spdx: Started
NOTE: recipe vte-0.72.2-r0: task do_package_qa: Succeeded
NOTE: recipe vte-0.72.2-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe vte-0.72.2-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2535 of 2535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.72.2.bb:do_build)
NOTE: Tasks Summary: Attempted 2535 tasks of which 2514 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: There was 1 WARNING message.
Summary: There were 18 ERROR messages, returning a non-zero exit code.
ERROR: sqlite3-3_3.41.2-r0 do_packagedata_setscene: QA Issue: Package version for package sqlite3-src went backwards which would break package feeds (from 3:3.42.0-r0 to 3:3.41.2-r0) [version-going-backwards]
ERROR: sqlite3-3_3.41.2-r0 do_packagedata_setscene: QA Issue: Package version for package sqlite3-dbg went backwards which would break package feeds (from 3:3.42.0-r0 to 3:3.41.2-r0) [version-going-backwards]
ERROR: nettle-3.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package nettle-src went backwards which would break package feeds (from 0:3.9.1-r0 to 0:3.8.1-r0) [version-going-backwards]
ERROR: sqlite3-3_3.41.2-r0 do_packagedata_setscene: QA Issue: Package version for package libsqlite3 went backwards which would break package feeds (from 3:3.42.0-r0 to 3:3.41.2-r0) [version-going-backwards]
ERROR: nettle-3.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package nettle-dbg went backwards which would break package feeds (from 0:3.9.1-r0 to 0:3.8.1-r0) [version-going-backwards]
ERROR: sqlite3-3_3.41.2-r0 do_packagedata_setscene: QA Issue: Package version for package libsqlite3-dev went backwards which would break package feeds (from 3:3.42.0-r0 to 3:3.41.2-r0) [version-going-backwards]
ERROR: nettle-3.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package nettle-ptest went backwards which would break package feeds (from 0:3.9.1-r0 to 0:3.8.1-r0) [version-going-backwards]
ERROR: sqlite3-3_3.41.2-r0 do_packagedata_setscene: QA Issue: Package version for package libsqlite3-doc went backwards which would break package feeds (from 3:3.42.0-r0 to 3:3.41.2-r0) [version-going-backwards]
ERROR: nettle-3.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package nettle-staticdev went backwards which would break package feeds (from 0:3.9.1-r0 to 0:3.8.1-r0) [version-going-backwards]
ERROR: sqlite3-3_3.41.2-r0 do_packagedata_setscene: QA Issue: Package version for package libsqlite3-staticdev went backwards which would break package feeds (from 3:3.42.0-r0 to 3:3.41.2-r0) [version-going-backwards]
ERROR: sqlite3-3_3.41.2-r0 do_packagedata_setscene: QA Issue: Package version for package sqlite3 went backwards which would break package feeds (from 3:3.42.0-r0 to 3:3.41.2-r0) [version-going-backwards]
ERROR: nettle-3.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package nettle-dev went backwards which would break package feeds (from 0:3.9.1-r0 to 0:3.8.1-r0) [version-going-backwards]
ERROR: sqlite3-3_3.41.2-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: nettle-3.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package nettle-doc went backwards which would break package feeds (from 0:3.9.1-r0 to 0:3.8.1-r0) [version-going-backwards]
ERROR: nettle-3.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package nettle-locale went backwards which would break package feeds (from 0:3.9.1-r0 to 0:3.8.1-r0) [version-going-backwards]
ERROR: nettle-3.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package nettle-bin went backwards which would break package feeds (from 0:3.9.1-r0 to 0:3.8.1-r0) [version-going-backwards]
ERROR: nettle-3.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package nettle went backwards which would break package feeds (from 0:3.9.1-r0 to 0:3.8.1-r0) [version-going-backwards]
ERROR: nettle-3.8.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============3337391849830019487==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-vte-upgrade-0.72.1-0.72.2.patch"

RnJvbSBhNmVkMmY0NWIwMDVhMWRhYmFhZjE4NjMxZTBkYWU5ODI0Y2MwMzYwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTYgSnVuIDIwMjMgMDM6NDY6NTMgKzAwMDAKU3ViamVjdDogW1BBVENIXSB2
dGU6IHVwZ3JhZGUgMC43Mi4xIC0+IDAuNzIuMgoKLS0tCiBtZXRhL3JlY2lwZXMtc3VwcG9ydC92
dGUve3Z0ZV8wLjcyLjEuYmIgPT4gdnRlXzAuNzIuMi5iYn0gfCAyICstCiAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtc3Vw
cG9ydC92dGUve3Z0ZV8wLjcyLjEuYmIgPT4gdnRlXzAuNzIuMi5iYn0gKDk0JSkKCmRpZmYgLS1n
aXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC92dGUvdnRlXzAuNzIuMS5iYiBiL21ldGEvcmVjaXBl
cy1zdXBwb3J0L3Z0ZS92dGVfMC43Mi4yLmJiCnNpbWlsYXJpdHkgaW5kZXggOTQlCnJlbmFtZSBm
cm9tIG1ldGEvcmVjaXBlcy1zdXBwb3J0L3Z0ZS92dGVfMC43Mi4xLmJiCnJlbmFtZSB0byBtZXRh
L3JlY2lwZXMtc3VwcG9ydC92dGUvdnRlXzAuNzIuMi5iYgppbmRleCBiOWZmMzE4M2M4Li40MjQ5
Yjc1YWMwIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC92dGUvdnRlXzAuNzIuMS5i
YgorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC92dGUvdnRlXzAuNzIuMi5iYgpAQCAtMjEsNyAr
MjEsNyBAQCBpbmhlcml0IGdub21lYmFzZSBnaS1kb2NnZW4gZmVhdHVyZXNfY2hlY2sgdXBzdHJl
YW0tdmVyc2lvbi1pcy1ldmVuIGdvYmplY3QtaW50cgogCiAjIHZhcGlnZW4ubTQgaXMgcmVxdWly
ZWQgd2hlbiB2YWxhIGlzIG5vdCBwcmVzZW50IChidXQgdGhlIG9uZSBmcm9tIHZhbGEgc2hvdWxk
IGJlIHVzZWQgbm9ybWFsbHkpCiBTUkNfVVJJICs9ICJmaWxlOi8vMDAwMS1BZGQtV19FWElUQ09E
RS1tYWNyby1mb3Itbm9uLWdsaWJjLXN5c3RlbXMucGF0Y2giCi1TUkNfVVJJW2FyY2hpdmUuc2hh
MjU2c3VtXSA9ICIwNTU0ZjlmODhkNTZjZTJkNzgzOThmY2M3ZjY5YmMwMGU1M2JiYmM1ZjY5NGUw
YWUxZGNhZjUyODZmODlkN2U0IgorU1JDX1VSSVthcmNoaXZlLnNoYTI1NnN1bV0gPSAiZjc5NjZm
ZDE4NWE2OTgxZjUzOTY0MTYyYjcxY2ZlZjdlNjA2NDk1MTU1ZDZmNTgyN2I3MmFhMGRkNjc0MWM5
ZSIKIAogQU5ZX09GX0RJU1RST19GRUFUVVJFUyA9ICIke0dUSzNESVNUUk9GRUFUVVJFU30iCiAK
LS0gCjIuMzkuMgoK

--===============3337391849830019487==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1802 targets, 47 skipped, 0 masked, 0 errors.
Removing 95 recipes from the core2-32 sysroot...done.
Removing 95 recipes from the qemux86 sysroot...done.
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
meta-yocto-bsp       = "tmp-auh-upgrades:da4545c2bcb275e255e5d9de7e72379b46918227"
workspace            = "master:d9cf8973d01b74aa2680dba5ac46c5cea3d1a6d0"

Initialising tasks...done.
Sstate summary: Wanted 501 Local 492 Mirrors 0 Missed 9 Current 273 (98% match, 98% complete)
Removing 3 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 274 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 277 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 280 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_create_spdx_setscene)
NOTE: Running setscene task 281 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 288 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 289 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_populate_sysroot_setscene)
NOTE: recipe gtk+3-3.24.38-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnutls-3.8.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gtk+3-3.24.38-r0: task do_create_spdx_setscene: Started
NOTE: recipe gnutls-3.8.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 820 of 2455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.72.2.bb:do_fetch)
NOTE: Running task 837 of 2455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.72.2.bb:do_write_config)
NOTE: recipe gnutls-3.8.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 310 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_packagedata_setscene)
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gtk+3-3.24.38-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 318 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_packagedata_setscene)
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 352 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 370 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_create_spdx_setscene)
NOTE: recipe gtk+3-3.24.38-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vte-0.72.2-r0: task do_write_config: Started
NOTE: recipe vte-0.72.2-r0: task do_fetch: Started
NOTE: recipe gnutls-3.8.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vte-0.72.2-r0: task do_fetch: Succeeded
NOTE: Running task 861 of 2455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.72.2.bb:do_unpack)
NOTE: recipe gnutls-3.8.0-r0: task do_packagedata_setscene: Started
NOTE: recipe vte-0.72.2-r0: task do_write_config: Succeeded
NOTE: recipe icu-72-1-r0: task do_create_spdx_setscene: Started
NOTE: recipe gtk+3-3.24.38-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe vte-0.72.2-r0: task do_unpack: Started
NOTE: recipe icu-72-1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 376 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_create_spdx_setscene)
NOTE: recipe vte-0.72.2-r0: task do_unpack: Succeeded
NOTE: Running task 862 of 2455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.72.2.bb:do_patch)
NOTE: recipe gnutls-3.8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 387 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 388 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 390 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 391 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 392 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 393 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 394 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 395 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_populate_sysroot_setscene)
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe vte-0.72.2-r0: task do_patch: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 404 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_create_spdx_setscene)
NOTE: recipe vte-0.72.2-r0: task do_patch: Succeeded
NOTE: Running task 867 of 2455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.72.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 868 of 2455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.72.2.bb:do_populate_lic)
NOTE: recipe libtasn1-4.19.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_populate_sysroot_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/nettle/3.8.1-r0/temp/log.do_packagedata_setscene.1753452
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 409 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_package_setscene)
NOTE: recipe libidn2-2.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_create_spdx_setscene: Started
NOTE: recipe vte-0.72.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-3.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vte-0.72.2-r0: task do_populate_lic: Started
NOTE: recipe gtk+3-3.24.38-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe vte-0.72.2-r0: task do_populate_lic: Succeeded
NOTE: recipe vte-0.72.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.72.2.bb:do_populate_lic unihash changed to 4140411a554febec2e1fc44c68f736176fe112820f4bb62ddaf965a2909cf172
NOTE: Running setscene task 415 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 418 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 419 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 421 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 422 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 423 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 424 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 425 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 426 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 427 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 428 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 429 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 430 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 431 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.48.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 432 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.48.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 433 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 434 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe pango-1.50.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pango-1.50.14-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunistring-1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.1.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe nettle-3.8.1-r0: task do_package_setscene: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe at-spi2-core-2.48.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe at-spi2-core-2.48.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-runtime-13.1.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 437 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pango-1.50.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 440 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_7.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 441 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 442 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_packagedata_setscene)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxkbcommon-1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pango-1.50.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 448 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_packagedata_setscene)
NOTE: Running setscene task 449 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_7.3.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 451 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 452 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_populate_sysroot_setscene)
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxkbcommon-1.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 455 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.38.bb:do_populate_sysroot_setscene)
NOTE: recipe libunistring-1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe at-spi2-core-2.48.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.38-r0: task do_packagedata_setscene: Started
NOTE: recipe harfbuzz-7.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.38-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fribidi-1.0.13-r0: task do_packagedata_setscene: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fribidi-1.0.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe harfbuzz-7.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 460 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.1.bb:do_create_spdx_setscene)
NOTE: recipe libxft-1_2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe harfbuzz-7.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fribidi-1.0.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 463 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 464 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_packagedata_setscene)
NOTE: recipe xkeyboard-config-2.38-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gcc-cross-i686-13.1.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fribidi-1.0.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe harfbuzz-7.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 468 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 470 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_populate_sysroot_setscene)
NOTE: recipe icu-72-1-r0: task do_packagedata_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-cross-i686-13.1.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.38-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe icu-72-1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe icu-72-1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 477 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 478 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.0.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 479 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_packagedata_setscene)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/at-spi2-core/2.48.0-r0/temp/log.do_packagedata_setscene.1754385
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.48.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe nettle-3.8.1-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 481 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.48.0.bb:do_package_setscene)
NOTE: Running setscene task 482 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 483 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_populate_sysroot_setscene)
NOTE: recipe fontconfig-2.14.2-r0: task do_packagedata_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 486 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 487 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.0.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 488 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mesa-2_23.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 491 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 492 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 493 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 494 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_populate_sysroot_setscene)
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-72-1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe at-spi2-core-2.48.0-r0: task do_package_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fontconfig-2.14.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe fontconfig-2.14.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mesa-2_23.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 500 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.13.0.bb:do_packagedata_setscene)
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mesa-2_23.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 504 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_packagedata_setscene)
NOTE: Running setscene task 505 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.243.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 506 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 507 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 508 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 509 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_packagedata_setscene)
NOTE: recipe freetype-2.13.0-r0: task do_packagedata_setscene: Started
NOTE: recipe fontconfig-2.14.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 511 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.13.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.243.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe freetype-2.13.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.115-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_23.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 515 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 517 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.243.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 518 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 519 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 520 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 521 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: recipe freetype-2.13.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 523 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.39.bb:do_packagedata_setscene)
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-loader-1.3.243.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 525 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.243.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 526 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_packagedata_setscene)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpng-1.6.39-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-loader-1.3.243.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.115-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 530 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_packagedata_setscene)
NOTE: recipe freetype-2.13.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 533 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.39.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-headers-1.3.243.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.115-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 535 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_packagedata_setscene)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpng-1.6.39-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpng-1.6.39-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-loader-1.3.243.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 540 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.243.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 542 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 543 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libdrm-2.4.115-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 547 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_populate_sysroot_setscene)
NOTE: recipe libpciaccess-0.17-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.3.243.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 551 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_packagedata_setscene)
NOTE: recipe wayland-1.22.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.243.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.17-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.39-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.243.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 559 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_populate_sysroot_setscene)
NOTE: recipe wayland-1.22.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe at-spi2-core-2.48.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 561 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 562 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 563 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 564 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 565 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 566 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 567 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 568 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.10.4-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.14.6-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.14.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.10.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 571 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_packagedata_setscene)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxml2-2.10.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 574 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_packagedata_setscene)
NOTE: recipe dbus-1.14.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 576 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 577 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 578 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 579 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 580 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 581 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_packagedata_setscene)
NOTE: recipe libxtst-1_1.2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 583 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxml2-2.10.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe dbus-1.14.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 586 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 588 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 589 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 590 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_populate_sysroot_setscene)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxi-1_1.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Started
NOTE: Running setscene task 591 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 592 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_populate_sysroot_setscene)
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.11.2-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 596 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 597 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_packagedata_setscene)
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.11.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 602 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_packagedata_setscene)
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxi-1_1.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 604 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 605 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 607 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 612 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 615 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 616 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libx11-1_1.8.4-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 620 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.11.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 623 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 624 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 625 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 626 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 627 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 628 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 629 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.41.2.bb:do_packagedata_setscene)
NOTE: recipe libx11-1_1.8.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 631 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 632 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata_setscene)
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.4.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 633 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 634 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 635 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 637 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 638 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 639 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 640 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.41.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libedit-20221030-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.41.2-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 644 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 645 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 647 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 648 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 649 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_packagedata_setscene)
NOTE: Running setscene task 650 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.41.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20221030-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 652 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 653 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 656 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: recipe libedit-20221030-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/sqlite3/3_3.41.2-r0/temp/log.do_packagedata_setscene.1761701
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.41.2.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 658 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.41.2.bb:do_package_setscene)
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 662 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.41.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.4.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.41.2-r0: task do_package_setscene: Started
NOTE: recipe libedit-20221030-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 671 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 674 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 677 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 678 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 679 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 680 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_packagedata_setscene)
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 683 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 684 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 686 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 687 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.41.2-r0: task do_package_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 695 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 696 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_packagedata_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2022.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 702 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 703 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_populate_sysroot_setscene)
NOTE: recipe util-macros-1_1.20.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2022.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 707 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 708 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 709 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 710 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 712 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 713 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 714 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 715 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 716 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 717 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe util-macros-1_1.20.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 728 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 729 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 733 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 734 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_populate_sysroot_setscene)
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 737 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 738 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 743 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.1.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 745 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-13.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-13.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 747 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.1.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-13.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 749 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-13.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-13.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 751 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 752 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 755 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 756 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 757 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_packagedata_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 758 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 759 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 768 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-13.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-13.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 771 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 772 of 774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.40.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2024 of 2455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.41.2.bb:do_packagedata)
NOTE: recipe sqlite3-3_3.41.2-r0: task do_packagedata: Started
NOTE: Running task 2315 of 2455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_packagedata)
NOTE: Running task 2334 of 2455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.72.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe nettle-3.8.1-r0: task do_packagedata: Started
NOTE: recipe vte-0.72.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sqlite3-3_3.41.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2408 of 2455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.48.0.bb:do_packagedata)
NOTE: recipe nettle-3.8.1-r0: task do_packagedata: Succeeded
NOTE: recipe at-spi2-core-2.48.0-r0: task do_packagedata: Started
NOTE: recipe vte-0.72.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2439 of 2455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.72.2.bb:do_configure)
NOTE: recipe at-spi2-core-2.48.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2445 of 2455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.72.2.bb:do_collect_spdx_deps)
NOTE: recipe vte-0.72.2-r0: task do_configure: Started
NOTE: recipe vte-0.72.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe vte-0.72.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe vte-0.72.2-r0: task do_configure: Succeeded
NOTE: Running task 2446 of 2455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.72.2.bb:do_compile)
NOTE: recipe vte-0.72.2-r0: task do_compile: Started
NOTE: recipe vte-0.72.2-r0: task do_compile: Succeeded
NOTE: Running task 2447 of 2455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.72.2.bb:do_install)
NOTE: recipe vte-0.72.2-r0: task do_install: Started
NOTE: recipe vte-0.72.2-r0: task do_install: Succeeded
NOTE: Running task 2448 of 2455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.72.2.bb:do_package)
NOTE: Running task 2449 of 2455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.72.2.bb:do_populate_sysroot)
NOTE: recipe vte-0.72.2-r0: task do_populate_sysroot: Started
NOTE: recipe vte-0.72.2-r0: task do_package: Started
NOTE: recipe vte-0.72.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe vte-0.72.2-r0: task do_package: Succeeded
NOTE: Running task 2450 of 2455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.72.2.bb:do_packagedata)
NOTE: recipe vte-0.72.2-r0: task do_packagedata: Started
NOTE: recipe vte-0.72.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2451 of 2455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.72.2.bb:do_create_spdx)
NOTE: Running task 2452 of 2455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.72.2.bb:do_package_write_rpm)
NOTE: Running task 2453 of 2455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.72.2.bb:do_package_qa)
NOTE: recipe vte-0.72.2-r0: task do_create_spdx: Started
NOTE: recipe vte-0.72.2-r0: task do_package_write_rpm: Started
NOTE: recipe vte-0.72.2-r0: task do_package_qa: Started
NOTE: recipe vte-0.72.2-r0: task do_package_qa: Succeeded
NOTE: recipe vte-0.72.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 2454 of 2455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.72.2.bb:do_create_runtime_spdx)
NOTE: recipe vte-0.72.2-r0: task do_create_runtime_spdx: Started
NOTE: recipe vte-0.72.2-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe vte-0.72.2-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2455 of 2455 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.72.2.bb:do_build)
NOTE: Tasks Summary: Attempted 2455 tasks of which 2433 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: There was 1 WARNING message.
Summary: There were 127 ERROR messages, returning a non-zero exit code.
ERROR: nettle-3.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package nettle-src went backwards which would break package feeds (from 0:3.9.1-r0 to 0:3.8.1-r0) [version-going-backwards]
ERROR: nettle-3.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package nettle-dbg went backwards which would break package feeds (from 0:3.9.1-r0 to 0:3.8.1-r0) [version-going-backwards]
ERROR: nettle-3.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package nettle-ptest went backwards which would break package feeds (from 0:3.9.1-r0 to 0:3.8.1-r0) [version-going-backwards]
ERROR: nettle-3.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package nettle-staticdev went backwards which would break package feeds (from 0:3.9.1-r0 to 0:3.8.1-r0) [version-going-backwards]
ERROR: nettle-3.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package nettle-dev went backwards which would break package feeds (from 0:3.9.1-r0 to 0:3.8.1-r0) [version-going-backwards]
ERROR: nettle-3.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package nettle-doc went backwards which would break package feeds (from 0:3.9.1-r0 to 0:3.8.1-r0) [version-going-backwards]
ERROR: nettle-3.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package nettle-locale went backwards which would break package feeds (from 0:3.9.1-r0 to 0:3.8.1-r0) [version-going-backwards]
ERROR: nettle-3.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package nettle-bin went backwards which would break package feeds (from 0:3.9.1-r0 to 0:3.8.1-r0) [version-going-backwards]
ERROR: nettle-3.8.1-r0 do_packagedata_setscene: QA Issue: Package version for package nettle went backwards which would break package feeds (from 0:3.9.1-r0 to 0:3.8.1-r0) [version-going-backwards]
ERROR: nettle-3.8.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-src went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-dbg went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-staticdev went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-dev went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-doc went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ab went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-af went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-am went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-an went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ar went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-as went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ast went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-az went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-be went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-be+latin went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-bg went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-bn went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-bn-in went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-bs went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ca went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ca+valencia went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ckb went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-cs went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-cy went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-da went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-de went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-dz went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-el went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-en+shaw went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-en-ca went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-en-gb went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-eo went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-es went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-et went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-eu went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-fa went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-fi went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-fr went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-fur went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ga went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-gd went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-gl went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-gu went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-he went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-hi went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-hr went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-hu went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-hy went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-id went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-is went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-it went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ja went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ka went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-kk went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-km went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-kn went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ko went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ku went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-li went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-lt went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-lv went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-mai went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-mk went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ml went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-mn went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-mr went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ms went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-nb went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ne went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-nl went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-nn went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-oc went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-or went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-pa went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-pl went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ps went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-pt went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-pt-br went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ro went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ru went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-rw went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-si went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-sk went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-sl went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-sq went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-sr went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-sr+ije went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-sr+latin went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-sv went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ta went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-te went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-tg went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-th went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-tk went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-tr went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-tt went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-ug went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-uk went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-uz+cyrillic went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-vi went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-wa went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-xh went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-yi went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-zh-cn went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-zh-hk went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-zh-tw went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: QA Issue: Package version for package at-spi2-core-locale-zu went backwards which would break package feeds (from 0:2.48.3-r0 to 0:2.48.0-r0) [version-going-backwards]
ERROR: at-spi2-core-2.48.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: sqlite3-3_3.41.2-r0 do_packagedata_setscene: QA Issue: Package version for package sqlite3-src went backwards which would break package feeds (from 3:3.42.0-r0 to 3:3.41.2-r0) [version-going-backwards]
ERROR: sqlite3-3_3.41.2-r0 do_packagedata_setscene: QA Issue: Package version for package sqlite3-dbg went backwards which would break package feeds (from 3:3.42.0-r0 to 3:3.41.2-r0) [version-going-backwards]
ERROR: sqlite3-3_3.41.2-r0 do_packagedata_setscene: QA Issue: Package version for package libsqlite3 went backwards which would break package feeds (from 3:3.42.0-r0 to 3:3.41.2-r0) [version-going-backwards]
ERROR: sqlite3-3_3.41.2-r0 do_packagedata_setscene: QA Issue: Package version for package libsqlite3-dev went backwards which would break package feeds (from 3:3.42.0-r0 to 3:3.41.2-r0) [version-going-backwards]
ERROR: sqlite3-3_3.41.2-r0 do_packagedata_setscene: QA Issue: Package version for package libsqlite3-doc went backwards which would break package feeds (from 3:3.42.0-r0 to 3:3.41.2-r0) [version-going-backwards]
ERROR: sqlite3-3_3.41.2-r0 do_packagedata_setscene: QA Issue: Package version for package libsqlite3-staticdev went backwards which would break package feeds (from 3:3.42.0-r0 to 3:3.41.2-r0) [version-going-backwards]
ERROR: sqlite3-3_3.41.2-r0 do_packagedata_setscene: QA Issue: Package version for package sqlite3 went backwards which would break package feeds (from 3:3.42.0-r0 to 3:3.41.2-r0) [version-going-backwards]
ERROR: sqlite3-3_3.41.2-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============3337391849830019487==--

