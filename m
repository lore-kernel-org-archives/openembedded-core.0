Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web11.39493.1605551303737590398
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Nov 2020 10:28:24 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from debian10-ty-2.yocto.io (unknown [172.29.10.56])
	by mail.yoctoproject.org (Postfix) with ESMTP id 4397E38C1360
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2020 18:28:23 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] man-pages: upgrading to 5.09 SUCCEEDED
Message-ID: <MADEUP.1648106794A5EF11.25243@lists.openembedded.org>
X-Groupsio-MsgNum: 144646
Content-Type: multipart/mixed; boundary="===============4233221315054572159=="

--===============4233221315054572159==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *man-pages* to *5.09* has Succeeded.

Next steps:
    - apply the patch: git am 0001-man-pages-upgrade-5.08-5.09.patch
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

--===============4233221315054572159==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 1395 entries from dependency cache.
Parsing recipes...done.
Parsing of 791 .bb files complete (789 cached, 2 parsed). 1372 targets, 61 skipped, 0 masked, 0 errors.
Removing 1 recipes from the mips32r2 sysroot...done.
Removing 1 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.49.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "3.2+snapshot-20201116"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:115b5c65eb4db0784ca7a30efcf2a2542a76f792"
workspace            = "master:aaf6aa3e530deb4a8d818a55a37b9029980b0b0d"

Initialising tasks...done.
Sstate summary: Wanted 20 Found 13 Missed 7 Current 703 (65% match, 99% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 706 of 723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 712 of 723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.5.bb:do_package_write_rpm_setscene)
NOTE: recipe grep-3.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe util-linux-2.36-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe grep-3.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe util-linux-2.36-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 721 of 723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.5.bb:do_packagedata_setscene)
NOTE: recipe grep-3.5-r0: task do_packagedata_setscene: Started
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-src went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-dbg went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-staticdev went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-dev went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-doc went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-af went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-be went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-bg went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
NOTE: Running task 1616 of 2274 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/man-pages/man-pages_5.09.bb:do_fetch)
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-ca went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-cs went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-da went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-de went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-el went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-eo went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-es went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-et went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-eu went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-fi went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-fr went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-ga went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-gl went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-he went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-hr went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-hu went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-id went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-it went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-ja went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
NOTE: recipe man-pages-5.09-r0: task do_fetch: Started
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-ko went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-ky went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-lt went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
NOTE: recipe man-pages-5.09-r0: task do_fetch: Succeeded
NOTE: Running task 1935 of 2274 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/man-pages/man-pages_5.09.bb:do_unpack)
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-nb went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
NOTE: Running task 1936 of 2274 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/man-pages/man-pages_5.09.bb:do_prepare_recipe_sysroot)
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-nl went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-pa went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-pl went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-pt went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-pt-br went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-ro went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-ru went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-sk went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-sl went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-sr went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-sv went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-th went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-tr went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-uk went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-vi went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-zh-cn went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-zh-tw went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
NOTE: recipe man-pages-5.09-r0: task do_unpack: Started
NOTE: recipe man-pages-5.09-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe grep-3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe man-pages-5.09-r0: task do_unpack: Succeeded
NOTE: Running task 2263 of 2274 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/man-pages/man-pages_5.09.bb:do_patch)
NOTE: recipe man-pages-5.09-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe man-pages-5.09-r0: task do_patch: Started
NOTE: recipe man-pages-5.09-r0: task do_patch: Succeeded
NOTE: Running task 2264 of 2274 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/man-pages/man-pages_5.09.bb:do_deploy_source_date_epoch)
NOTE: Running task 2265 of 2274 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/man-pages/man-pages_5.09.bb:do_populate_lic)
NOTE: recipe man-pages-5.09-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe man-pages-5.09-r0: task do_populate_lic: Started
NOTE: recipe man-pages-5.09-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/man-pages/man-pages_5.09.bb:do_populate_lic unihash changed to ded71a190009e08b88a7aed4e7e8eee58e153ae17a750d732ce97c2fd7a43960
NOTE: recipe man-pages-5.09-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running noexec task 2266 of 2274 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/man-pages/man-pages_5.09.bb:do_configure)
NOTE: Running noexec task 2267 of 2274 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/man-pages/man-pages_5.09.bb:do_compile)
NOTE: Running task 2268 of 2274 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/man-pages/man-pages_5.09.bb:do_install)
NOTE: recipe man-pages-5.09-r0: task do_install: Started
NOTE: recipe man-pages-5.09-r0: task do_install: Succeeded
NOTE: Running task 2269 of 2274 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/man-pages/man-pages_5.09.bb:do_package)
NOTE: Running task 2270 of 2274 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/man-pages/man-pages_5.09.bb:do_populate_sysroot)
NOTE: recipe man-pages-5.09-r0: task do_package: Started
NOTE: recipe man-pages-5.09-r0: task do_populate_sysroot: Started
NOTE: recipe man-pages-5.09-r0: task do_populate_sysroot: Succeeded
NOTE: recipe man-pages-5.09-r0: task do_package: Succeeded
NOTE: Running task 2271 of 2274 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/man-pages/man-pages_5.09.bb:do_packagedata)
NOTE: recipe man-pages-5.09-r0: task do_packagedata: Started
NOTE: recipe man-pages-5.09-r0: task do_packagedata: Succeeded
NOTE: Running task 2272 of 2274 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/man-pages/man-pages_5.09.bb:do_package_write_rpm)
NOTE: Running task 2273 of 2274 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/man-pages/man-pages_5.09.bb:do_package_qa)
NOTE: recipe man-pages-5.09-r0: task do_package_write_rpm: Started
NOTE: recipe man-pages-5.09-r0: task do_package_qa: Started
NOTE: recipe man-pages-5.09-r0: task do_package_qa: Succeeded
NOTE: recipe man-pages-5.09-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2274 of 2274 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/man-pages/man-pages_5.09.bb:do_build)
NOTE: Tasks Summary: Attempted 2274 tasks of which 2259 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 49 ERROR messages shown, returning a non-zero exit code.

--===============4233221315054572159==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1413 entries from dependency cache.
Parsing recipes...done.
Parsing of 791 .bb files complete (790 cached, 1 parsed). 1372 targets, 35 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.49.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "3.2+snapshot-20201116"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:115b5c65eb4db0784ca7a30efcf2a2542a76f792"
workspace            = "master:aaf6aa3e530deb4a8d818a55a37b9029980b0b0d"

Initialising tasks...done.
Sstate summary: Wanted 20 Found 13 Missed 7 Current 703 (65% match, 99% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 706 of 723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 712 of 723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.5.bb:do_package_write_rpm_setscene)
NOTE: recipe grep-3.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe util-linux-2.36-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe grep-3.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe util-linux-2.36-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 721 of 723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.5.bb:do_packagedata_setscene)
NOTE: recipe grep-3.5-r0: task do_packagedata_setscene: Started
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-src went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-dbg went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-staticdev went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-dev went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-doc went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-af went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-be went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-bg went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-ca went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-cs went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-da went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-de went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-el went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-eo went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-es went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-et went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-eu went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-fi went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-fr went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-ga went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-gl went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-he went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-hr went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-hu went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-id went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-it went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-ja went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-ko went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-ky went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-lt went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-nb went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-nl went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
NOTE: Running task 1616 of 2274 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/man-pages/man-pages_5.09.bb:do_fetch)
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-pa went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-pl went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-pt went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-pt-br went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-ro went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-ru went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-sk went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-sl went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-sr went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-sv went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-th went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-tr went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-uk went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-vi went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-zh-cn went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-zh-tw went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
NOTE: recipe man-pages-5.09-r0: task do_fetch: Started
NOTE: recipe man-pages-5.09-r0: task do_fetch: Succeeded
NOTE: Running task 1874 of 2274 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/man-pages/man-pages_5.09.bb:do_unpack)
NOTE: recipe grep-3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1919 of 2274 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/man-pages/man-pages_5.09.bb:do_prepare_recipe_sysroot)
NOTE: recipe man-pages-5.09-r0: task do_unpack: Started
NOTE: recipe man-pages-5.09-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe man-pages-5.09-r0: task do_unpack: Succeeded
NOTE: Running task 2263 of 2274 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/man-pages/man-pages_5.09.bb:do_patch)
NOTE: recipe man-pages-5.09-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe man-pages-5.09-r0: task do_patch: Started
NOTE: recipe man-pages-5.09-r0: task do_patch: Succeeded
NOTE: Running task 2264 of 2274 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/man-pages/man-pages_5.09.bb:do_deploy_source_date_epoch)
NOTE: Running task 2265 of 2274 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/man-pages/man-pages_5.09.bb:do_populate_lic)
NOTE: recipe man-pages-5.09-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe man-pages-5.09-r0: task do_populate_lic: Started
NOTE: recipe man-pages-5.09-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/man-pages/man-pages_5.09.bb:do_populate_lic unihash changed to ded71a190009e08b88a7aed4e7e8eee58e153ae17a750d732ce97c2fd7a43960
NOTE: recipe man-pages-5.09-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running noexec task 2266 of 2274 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/man-pages/man-pages_5.09.bb:do_configure)
NOTE: Running noexec task 2267 of 2274 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/man-pages/man-pages_5.09.bb:do_compile)
NOTE: Running task 2268 of 2274 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/man-pages/man-pages_5.09.bb:do_install)
NOTE: recipe man-pages-5.09-r0: task do_install: Started
NOTE: recipe man-pages-5.09-r0: task do_install: Succeeded
NOTE: Running task 2269 of 2274 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/man-pages/man-pages_5.09.bb:do_package)
NOTE: Running task 2270 of 2274 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/man-pages/man-pages_5.09.bb:do_populate_sysroot)
NOTE: recipe man-pages-5.09-r0: task do_populate_sysroot: Started
NOTE: recipe man-pages-5.09-r0: task do_package: Started
NOTE: recipe man-pages-5.09-r0: task do_populate_sysroot: Succeeded
NOTE: recipe man-pages-5.09-r0: task do_package: Succeeded
NOTE: Running task 2271 of 2274 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/man-pages/man-pages_5.09.bb:do_packagedata)
NOTE: recipe man-pages-5.09-r0: task do_packagedata: Started
NOTE: recipe man-pages-5.09-r0: task do_packagedata: Succeeded
NOTE: Running task 2272 of 2274 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/man-pages/man-pages_5.09.bb:do_package_write_rpm)
NOTE: Running task 2273 of 2274 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/man-pages/man-pages_5.09.bb:do_package_qa)
NOTE: recipe man-pages-5.09-r0: task do_package_write_rpm: Started
NOTE: recipe man-pages-5.09-r0: task do_package_qa: Started
NOTE: recipe man-pages-5.09-r0: task do_package_qa: Succeeded
NOTE: recipe man-pages-5.09-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2274 of 2274 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/man-pages/man-pages_5.09.bb:do_build)
NOTE: Tasks Summary: Attempted 2274 tasks of which 2259 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 49 ERROR messages shown, returning a non-zero exit code.

--===============4233221315054572159==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

Loading cache...done.
Loaded 1395 entries from dependency cache.
Parsing recipes...done.
Parsing of 791 .bb files complete (789 cached, 2 parsed). 1372 targets, 53 skipped, 0 masked, 0 errors.
Removing 1 recipes from the armv7vet2hf-neon sysroot...done.
Removing 1 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.49.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "3.2+snapshot-20201116"
TUNE_FEATURES        = "arm armv7ve vfp thumb neon callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:115b5c65eb4db0784ca7a30efcf2a2542a76f792"
workspace            = "master:aaf6aa3e530deb4a8d818a55a37b9029980b0b0d"

Initialising tasks...done.
Sstate summary: Wanted 20 Found 13 Missed 7 Current 703 (65% match, 99% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 706 of 723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 712 of 723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.5.bb:do_package_write_rpm_setscene)
NOTE: recipe grep-3.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe util-linux-2.36-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe grep-3.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe util-linux-2.36-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 721 of 723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.5.bb:do_packagedata_setscene)
NOTE: recipe grep-3.5-r0: task do_packagedata_setscene: Started
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-src went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-dbg went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-staticdev went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-dev went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-doc went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-af went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-be went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-bg went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-ca went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-cs went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-da went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-de went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-el went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-eo went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-es went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-et went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-eu went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
NOTE: Running task 1616 of 2274 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/man-pages/man-pages_5.09.bb:do_fetch)
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-fi went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-fr went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-ga went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-gl went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-he went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-hr went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-hu went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-id went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-it went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-ja went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-ko went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-ky went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-lt went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-nb went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-nl went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-pa went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
NOTE: recipe man-pages-5.09-r0: task do_fetch: Started
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-pl went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-pt went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-pt-br went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
NOTE: recipe man-pages-5.09-r0: task do_fetch: Succeeded
NOTE: Running task 1900 of 2274 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/man-pages/man-pages_5.09.bb:do_unpack)
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-ro went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-ru went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
NOTE: Running task 1916 of 2274 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/man-pages/man-pages_5.09.bb:do_prepare_recipe_sysroot)
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-sk went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-sl went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-sr went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-sv went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-th went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-tr went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-uk went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-vi went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-zh-cn went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-zh-tw went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
NOTE: recipe man-pages-5.09-r0: task do_unpack: Started
NOTE: recipe grep-3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe man-pages-5.09-r0: task do_prepare_recipe_sysroot: Started
NOTE: Setscene tasks completed
NOTE: recipe man-pages-5.09-r0: task do_unpack: Succeeded
NOTE: Running task 2263 of 2274 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/man-pages/man-pages_5.09.bb:do_patch)
NOTE: recipe man-pages-5.09-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe man-pages-5.09-r0: task do_patch: Started
NOTE: recipe man-pages-5.09-r0: task do_patch: Succeeded
NOTE: Running task 2264 of 2274 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/man-pages/man-pages_5.09.bb:do_deploy_source_date_epoch)
NOTE: Running task 2265 of 2274 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/man-pages/man-pages_5.09.bb:do_populate_lic)
NOTE: recipe man-pages-5.09-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe man-pages-5.09-r0: task do_populate_lic: Started
NOTE: recipe man-pages-5.09-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/man-pages/man-pages_5.09.bb:do_populate_lic unihash changed to ded71a190009e08b88a7aed4e7e8eee58e153ae17a750d732ce97c2fd7a43960
NOTE: recipe man-pages-5.09-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running noexec task 2266 of 2274 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/man-pages/man-pages_5.09.bb:do_configure)
NOTE: Running noexec task 2267 of 2274 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/man-pages/man-pages_5.09.bb:do_compile)
NOTE: Running task 2268 of 2274 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/man-pages/man-pages_5.09.bb:do_install)
NOTE: recipe man-pages-5.09-r0: task do_install: Started
NOTE: recipe man-pages-5.09-r0: task do_install: Succeeded
NOTE: Running task 2269 of 2274 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/man-pages/man-pages_5.09.bb:do_package)
NOTE: Running task 2270 of 2274 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/man-pages/man-pages_5.09.bb:do_populate_sysroot)
NOTE: recipe man-pages-5.09-r0: task do_package: Started
NOTE: recipe man-pages-5.09-r0: task do_populate_sysroot: Started
NOTE: recipe man-pages-5.09-r0: task do_populate_sysroot: Succeeded
NOTE: recipe man-pages-5.09-r0: task do_package: Succeeded
NOTE: Running task 2271 of 2274 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/man-pages/man-pages_5.09.bb:do_packagedata)
NOTE: recipe man-pages-5.09-r0: task do_packagedata: Started
NOTE: recipe man-pages-5.09-r0: task do_packagedata: Succeeded
NOTE: Running task 2272 of 2274 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/man-pages/man-pages_5.09.bb:do_package_write_rpm)
NOTE: Running task 2273 of 2274 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/man-pages/man-pages_5.09.bb:do_package_qa)
NOTE: recipe man-pages-5.09-r0: task do_package_qa: Started
NOTE: recipe man-pages-5.09-r0: task do_package_write_rpm: Started
NOTE: recipe man-pages-5.09-r0: task do_package_qa: Succeeded
NOTE: recipe man-pages-5.09-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2274 of 2274 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/man-pages/man-pages_5.09.bb:do_build)
NOTE: Tasks Summary: Attempted 2274 tasks of which 2259 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 49 ERROR messages shown, returning a non-zero exit code.

--===============4233221315054572159==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/man-pages/man-pages-dev: FILELIST: added "/usr/share/man/man3/imaxdiv_t.3 /usr/share/man/man3/strerrordesc_np.3 /usr/share/man/man3/uintmax_t.3 /usr/share/man/man3/float_t.3 /usr/share/man/man3/timespec.3 /usr/share/man/man3/int32_t.3 /usr/share/man/man3/sigset_t.3 /usr/share/man/man3/uintN_t.3 /usr/share/man/man3/sigdescr_np.3 /usr/share/man/man3/timer_t.3 /usr/share/man/man3/double_t.3 /usr/share/man/man3/regex_t.3 /usr/share/man/man3/off_t.3 /usr/share/man/man3/uid_t.3 /usr/share/man/man3/lldiv_t.3 /usr/share/man/man3/ssize_t.3 /usr/share/man/man7/system_data_types.7 /usr/share/man/man3/dev_t.3 /usr/share/man/man3/stailq.3 /usr/share/man/man3/fexcept_t.3 /usr/share/man/man3/fenv_t.3 /usr/share/man/man3/intptr_t.3 /usr/share/man/man7/kernel_lockdown.7 /usr/share/man/man3/pthread_attr_setsigmask_np.3 /usr/share/man/man3/ptrdiff_t.3 /usr/share/man/man3/tailq.3 /usr/share/man/man3/intmax_t.3 /usr/share/man/man3/id_t.3 /usr/share/man/man3/suseconds_t.3 /usr
 /share/man/man3/timeval.3 /usr/share/man/man3/lconv.3 /usr/share/man/man3/uint16_t.3 /usr/share/man/man2/getcwd.2 /usr/share/man/man3/ldiv_t.3 /usr/share/man/man3/intN_t.3 /usr/share/man/man3/time_t.3 /usr/share/man/man3/uint64_t.3 /usr/share/man/man3/int8_t.3 /usr/share/man/man3/regmatch_t.3 /usr/share/man/man3/strerrorname_np.3 /usr/share/man/man3/sigval.3 /usr/share/man/man3/gid_t.3 /usr/share/man/man7/queue.7 /usr/share/man/man3/clockid_t.3 /usr/share/man/man3/slist.3 /usr/share/man/man3/int16_t.3 /usr/share/man/man2/mq_timedreceive.2 /usr/share/man/man3/uintptr_t.3 /usr/share/man/man3/list.3 /usr/share/man/man3/div_t.3 /usr/share/man/man3/int64_t.3 /usr/share/man/man3/va_list.3 /usr/share/man/man3/siginfo_t.3 /usr/share/man/man3/void.3 /usr/share/man/man2/mq_open.2 /usr/share/man/man3/pid_t.3 /usr/share/man/man3/sigabbrev_np.3 /usr/share/man/man3/size_t.3 /usr/share/man/man3/aiocb.3 /usr/share/man/man2/mq_timedsend.2 /usr/share/man/man3/clock_t.3 /usr/share/man/man2/mq_notify.2
  /usr/share/man/man3/FILE.3 /usr/share/man/man3/uint8_t.3 /usr/share/man/man3/uint32_t.3 /usr/share/man/man2/mq_unlink.2 /usr/share/man/man3/regoff_t.3 /usr/share/man/man3/circleq.3 /usr/share/man/man3/sys_siglist.3"
packages/core2-32-poky-linux/man-pages/man-pages-doc: FILELIST: added "/usr/share/man/man3/imaxdiv_t.3 /usr/share/man/man3/strerrordesc_np.3 /usr/share/man/man3/uintmax_t.3 /usr/share/man/man3/float_t.3 /usr/share/man/man3/timespec.3 /usr/share/man/man3/int32_t.3 /usr/share/man/man3/sigset_t.3 /usr/share/man/man3/uintN_t.3 /usr/share/man/man3/sigdescr_np.3 /usr/share/man/man3/timer_t.3 /usr/share/man/man3/double_t.3 /usr/share/man/man3/regex_t.3 /usr/share/man/man3/off_t.3 /usr/share/man/man3/uid_t.3 /usr/share/man/man3/lldiv_t.3 /usr/share/man/man3/ssize_t.3 /usr/share/man/man7/system_data_types.7 /usr/share/man/man3/dev_t.3 /usr/share/man/man3/stailq.3 /usr/share/man/man3/fexcept_t.3 /usr/share/man/man3/fenv_t.3 /usr/share/man/man3/intptr_t.3 /usr/share/man/man7/kernel_lockdown.7 /usr/share/man/man3/pthread_attr_setsigmask_np.3 /usr/share/man/man3/ptrdiff_t.3 /usr/share/man/man3/tailq.3 /usr/share/man/man3/intmax_t.3 /usr/share/man/man3/id_t.3 /usr/share/man/man3/suseconds_t.3 /usr
 /share/man/man3/timeval.3 /usr/share/man/man3/lconv.3 /usr/share/man/man3/uint16_t.3 /usr/share/man/man2/getcwd.2 /usr/share/man/man3/ldiv_t.3 /usr/share/man/man3/intN_t.3 /usr/share/man/man3/time_t.3 /usr/share/man/man3/uint64_t.3 /usr/share/man/man3/int8_t.3 /usr/share/man/man3/regmatch_t.3 /usr/share/man/man3/strerrorname_np.3 /usr/share/man/man3/sigval.3 /usr/share/man/man3/gid_t.3 /usr/share/man/man7/queue.7 /usr/share/man/man3/clockid_t.3 /usr/share/man/man3/slist.3 /usr/share/man/man3/int16_t.3 /usr/share/man/man2/mq_timedreceive.2 /usr/share/man/man3/uintptr_t.3 /usr/share/man/man3/list.3 /usr/share/man/man3/div_t.3 /usr/share/man/man3/int64_t.3 /usr/share/man/man3/va_list.3 /usr/share/man/man3/siginfo_t.3 /usr/share/man/man3/void.3 /usr/share/man/man2/mq_open.2 /usr/share/man/man3/pid_t.3 /usr/share/man/man3/sigabbrev_np.3 /usr/share/man/man3/size_t.3 /usr/share/man/man3/aiocb.3 /usr/share/man/man2/mq_timedsend.2 /usr/share/man/man3/clock_t.3 /usr/share/man/man2/mq_notify.2
  /usr/share/man/man3/FILE.3 /usr/share/man/man3/uint8_t.3 /usr/share/man/man3/uint32_t.3 /usr/share/man/man2/mq_unlink.2 /usr/share/man/man3/regoff_t.3 /usr/share/man/man3/circleq.3 /usr/share/man/man3/sys_siglist.3"
packages/core2-32-poky-linux/man-pages/man-pages-locale: FILELIST: added "/usr/share/man/man3/imaxdiv_t.3 /usr/share/man/man3/strerrordesc_np.3 /usr/share/man/man3/uintmax_t.3 /usr/share/man/man3/float_t.3 /usr/share/man/man3/timespec.3 /usr/share/man/man3/int32_t.3 /usr/share/man/man3/sigset_t.3 /usr/share/man/man3/uintN_t.3 /usr/share/man/man3/sigdescr_np.3 /usr/share/man/man3/timer_t.3 /usr/share/man/man3/double_t.3 /usr/share/man/man3/regex_t.3 /usr/share/man/man3/off_t.3 /usr/share/man/man3/uid_t.3 /usr/share/man/man3/lldiv_t.3 /usr/share/man/man3/ssize_t.3 /usr/share/man/man7/system_data_types.7 /usr/share/man/man3/dev_t.3 /usr/share/man/man3/stailq.3 /usr/share/man/man3/fexcept_t.3 /usr/share/man/man3/fenv_t.3 /usr/share/man/man3/intptr_t.3 /usr/share/man/man7/kernel_lockdown.7 /usr/share/man/man3/pthread_attr_setsigmask_np.3 /usr/share/man/man3/ptrdiff_t.3 /usr/share/man/man3/tailq.3 /usr/share/man/man3/intmax_t.3 /usr/share/man/man3/id_t.3 /usr/share/man/man3/suseconds_t.3 /
 usr/share/man/man3/timeval.3 /usr/share/man/man3/lconv.3 /usr/share/man/man3/uint16_t.3 /usr/share/man/man2/getcwd.2 /usr/share/man/man3/ldiv_t.3 /usr/share/man/man3/intN_t.3 /usr/share/man/man3/time_t.3 /usr/share/man/man3/uint64_t.3 /usr/share/man/man3/int8_t.3 /usr/share/man/man3/regmatch_t.3 /usr/share/man/man3/strerrorname_np.3 /usr/share/man/man3/sigval.3 /usr/share/man/man3/gid_t.3 /usr/share/man/man7/queue.7 /usr/share/man/man3/clockid_t.3 /usr/share/man/man3/slist.3 /usr/share/man/man3/int16_t.3 /usr/share/man/man2/mq_timedreceive.2 /usr/share/man/man3/uintptr_t.3 /usr/share/man/man3/list.3 /usr/share/man/man3/div_t.3 /usr/share/man/man3/int64_t.3 /usr/share/man/man3/va_list.3 /usr/share/man/man3/siginfo_t.3 /usr/share/man/man3/void.3 /usr/share/man/man2/mq_open.2 /usr/share/man/man3/pid_t.3 /usr/share/man/man3/sigabbrev_np.3 /usr/share/man/man3/size_t.3 /usr/share/man/man3/aiocb.3 /usr/share/man/man2/mq_timedsend.2 /usr/share/man/man3/clock_t.3 /usr/share/man/man2/mq_notif
 y.2 /usr/share/man/man3/FILE.3 /usr/share/man/man3/uint8_t.3 /usr/share/man/man3/uint32_t.3 /usr/share/man/man2/mq_unlink.2 /usr/share/man/man3/regoff_t.3 /usr/share/man/man3/circleq.3 /usr/share/man/man3/sys_siglist.3"
packages/core2-32-poky-linux/man-pages/man-pages-staticdev: FILELIST: added "/usr/share/man/man3/imaxdiv_t.3 /usr/share/man/man3/strerrordesc_np.3 /usr/share/man/man3/uintmax_t.3 /usr/share/man/man3/float_t.3 /usr/share/man/man3/timespec.3 /usr/share/man/man3/int32_t.3 /usr/share/man/man3/sigset_t.3 /usr/share/man/man3/uintN_t.3 /usr/share/man/man3/sigdescr_np.3 /usr/share/man/man3/timer_t.3 /usr/share/man/man3/double_t.3 /usr/share/man/man3/regex_t.3 /usr/share/man/man3/off_t.3 /usr/share/man/man3/uid_t.3 /usr/share/man/man3/lldiv_t.3 /usr/share/man/man3/ssize_t.3 /usr/share/man/man7/system_data_types.7 /usr/share/man/man3/dev_t.3 /usr/share/man/man3/stailq.3 /usr/share/man/man3/fexcept_t.3 /usr/share/man/man3/fenv_t.3 /usr/share/man/man3/intptr_t.3 /usr/share/man/man7/kernel_lockdown.7 /usr/share/man/man3/pthread_attr_setsigmask_np.3 /usr/share/man/man3/ptrdiff_t.3 /usr/share/man/man3/tailq.3 /usr/share/man/man3/intmax_t.3 /usr/share/man/man3/id_t.3 /usr/share/man/man3/suseconds_t.
 3 /usr/share/man/man3/timeval.3 /usr/share/man/man3/lconv.3 /usr/share/man/man3/uint16_t.3 /usr/share/man/man2/getcwd.2 /usr/share/man/man3/ldiv_t.3 /usr/share/man/man3/intN_t.3 /usr/share/man/man3/time_t.3 /usr/share/man/man3/uint64_t.3 /usr/share/man/man3/int8_t.3 /usr/share/man/man3/regmatch_t.3 /usr/share/man/man3/strerrorname_np.3 /usr/share/man/man3/sigval.3 /usr/share/man/man3/gid_t.3 /usr/share/man/man7/queue.7 /usr/share/man/man3/clockid_t.3 /usr/share/man/man3/slist.3 /usr/share/man/man3/int16_t.3 /usr/share/man/man2/mq_timedreceive.2 /usr/share/man/man3/uintptr_t.3 /usr/share/man/man3/list.3 /usr/share/man/man3/div_t.3 /usr/share/man/man3/int64_t.3 /usr/share/man/man3/va_list.3 /usr/share/man/man3/siginfo_t.3 /usr/share/man/man3/void.3 /usr/share/man/man2/mq_open.2 /usr/share/man/man3/pid_t.3 /usr/share/man/man3/sigabbrev_np.3 /usr/share/man/man3/size_t.3 /usr/share/man/man3/aiocb.3 /usr/share/man/man2/mq_timedsend.2 /usr/share/man/man3/clock_t.3 /usr/share/man/man2/mq_no
 tify.2 /usr/share/man/man3/FILE.3 /usr/share/man/man3/uint8_t.3 /usr/share/man/man3/uint32_t.3 /usr/share/man/man2/mq_unlink.2 /usr/share/man/man3/regoff_t.3 /usr/share/man/man3/circleq.3 /usr/share/man/man3/sys_siglist.3"
packages/core2-32-poky-linux/man-pages/man-pages: FILELIST: added "/usr/share/man/man3/imaxdiv_t.3 /usr/share/man/man3/strerrordesc_np.3 /usr/share/man/man3/uintmax_t.3 /usr/share/man/man3/float_t.3 /usr/share/man/man3/timespec.3 /usr/share/man/man3/int32_t.3 /usr/share/man/man3/sigset_t.3 /usr/share/man/man3/uintN_t.3 /usr/share/man/man3/sigdescr_np.3 /usr/share/man/man3/timer_t.3 /usr/share/man/man3/double_t.3 /usr/share/man/man3/regex_t.3 /usr/share/man/man3/off_t.3 /usr/share/man/man3/uid_t.3 /usr/share/man/man3/lldiv_t.3 /usr/share/man/man3/ssize_t.3 /usr/share/man/man7/system_data_types.7 /usr/share/man/man3/dev_t.3 /usr/share/man/man3/stailq.3 /usr/share/man/man3/fexcept_t.3 /usr/share/man/man3/fenv_t.3 /usr/share/man/man3/intptr_t.3 /usr/share/man/man7/kernel_lockdown.7 /usr/share/man/man3/pthread_attr_setsigmask_np.3 /usr/share/man/man3/ptrdiff_t.3 /usr/share/man/man3/tailq.3 /usr/share/man/man3/intmax_t.3 /usr/share/man/man3/id_t.3 /usr/share/man/man3/suseconds_t.3 /usr/sha
 re/man/man3/timeval.3 /usr/share/man/man3/lconv.3 /usr/share/man/man3/uint16_t.3 /usr/share/man/man2/getcwd.2 /usr/share/man/man3/ldiv_t.3 /usr/share/man/man3/intN_t.3 /usr/share/man/man3/time_t.3 /usr/share/man/man3/uint64_t.3 /usr/share/man/man3/int8_t.3 /usr/share/man/man3/regmatch_t.3 /usr/share/man/man3/strerrorname_np.3 /usr/share/man/man3/sigval.3 /usr/share/man/man3/gid_t.3 /usr/share/man/man7/queue.7 /usr/share/man/man3/clockid_t.3 /usr/share/man/man3/slist.3 /usr/share/man/man3/int16_t.3 /usr/share/man/man2/mq_timedreceive.2 /usr/share/man/man3/uintptr_t.3 /usr/share/man/man3/list.3 /usr/share/man/man3/div_t.3 /usr/share/man/man3/int64_t.3 /usr/share/man/man3/va_list.3 /usr/share/man/man3/siginfo_t.3 /usr/share/man/man3/void.3 /usr/share/man/man2/mq_open.2 /usr/share/man/man3/pid_t.3 /usr/share/man/man3/sigabbrev_np.3 /usr/share/man/man3/size_t.3 /usr/share/man/man3/aiocb.3 /usr/share/man/man2/mq_timedsend.2 /usr/share/man/man3/clock_t.3 /usr/share/man/man2/mq_notify.2 /us
 r/share/man/man3/FILE.3 /usr/share/man/man3/uint8_t.3 /usr/share/man/man3/uint32_t.3 /usr/share/man/man2/mq_unlink.2 /usr/share/man/man3/regoff_t.3 /usr/share/man/man3/circleq.3 /usr/share/man/man3/sys_siglist.3"

--===============4233221315054572159==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-man-pages-upgrade-5.08-5.09.patch"

From c613aece5311743403c6e46a0d939a882a2773c2 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Mon, 16 Nov 2020 14:53:38 +0000
Subject: [PATCH] man-pages: upgrade 5.08 -> 5.09

---
 .../man-pages/{man-pages_5.08.bb => man-pages_5.09.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/man-pages/{man-pages_5.08.bb => man-pages_5.09.bb} (91%)

diff --git a/meta/recipes-extended/man-pages/man-pages_5.08.bb b/meta/recipes-extended/man-pages/man-pages_5.09.bb
similarity index 91%
rename from meta/recipes-extended/man-pages/man-pages_5.08.bb
rename to meta/recipes-extended/man-pages/man-pages_5.09.bb
index caf9320a67..00d6eb5c2e 100644
--- a/meta/recipes-extended/man-pages/man-pages_5.08.bb
+++ b/meta/recipes-extended/man-pages/man-pages_5.09.bb
@@ -7,7 +7,7 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://README;md5=207f70f56526417514ac46b6680e314f"
 SRC_URI = "${KERNELORG_MIRROR}/linux/docs/${BPN}/${BP}.tar.gz"
 
-SRC_URI[sha256sum] = "6e0b8ae23ee9467cee701f23dea908257a93e5fffa9e261b19a23efbd27e84a2"
+SRC_URI[sha256sum] = "3bd9029b94520c730fe1a1fb78ed7d8d878236da0f725ca86ee71c1969de6c4f"
 
 inherit manpages
 
-- 
2.20.1


--===============4233221315054572159==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 1395 entries from dependency cache.
Parsing recipes...done.
Parsing of 791 .bb files complete (789 cached, 2 parsed). 1372 targets, 70 skipped, 0 masked, 0 errors.
Removing 1 recipes from the ppc7400 sysroot...done.
Removing 1 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.49.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "3.2+snapshot-20201116"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:115b5c65eb4db0784ca7a30efcf2a2542a76f792"
workspace            = "master:aaf6aa3e530deb4a8d818a55a37b9029980b0b0d"

Initialising tasks...done.
Sstate summary: Wanted 20 Found 13 Missed 7 Current 703 (65% match, 99% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 706 of 723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 712 of 723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.5.bb:do_package_write_rpm_setscene)
NOTE: recipe grep-3.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe util-linux-2.36-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe grep-3.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe util-linux-2.36-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 721 of 723 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.5.bb:do_packagedata_setscene)
NOTE: recipe grep-3.5-r0: task do_packagedata_setscene: Started
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-src went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-dbg went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-staticdev went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-dev went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-doc went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-af went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-be went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-bg went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-ca went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-cs went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-da went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-de went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-el went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-eo went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-es went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-et went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-eu went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-fi went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-fr went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-ga went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-gl went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-he went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-hr went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-hu went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-id went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-it went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-ja went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-ko went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-ky went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-lt went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-nb went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-nl went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-pa went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-pl went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-pt went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
NOTE: Running task 1616 of 2274 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/man-pages/man-pages_5.09.bb:do_fetch)
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-pt-br went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-ro went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-ru went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-sk went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-sl went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-sr went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-sv went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-th went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-tr went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-uk went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-vi went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-zh-cn went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-zh-tw went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
NOTE: recipe grep-3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe man-pages-5.09-r0: task do_fetch: Started
NOTE: recipe man-pages-5.09-r0: task do_fetch: Succeeded
NOTE: Running task 1909 of 2274 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/man-pages/man-pages_5.09.bb:do_unpack)
NOTE: Running task 1919 of 2274 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/man-pages/man-pages_5.09.bb:do_prepare_recipe_sysroot)
NOTE: recipe man-pages-5.09-r0: task do_unpack: Started
NOTE: recipe man-pages-5.09-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe man-pages-5.09-r0: task do_unpack: Succeeded
NOTE: Running task 2263 of 2274 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/man-pages/man-pages_5.09.bb:do_patch)
NOTE: recipe man-pages-5.09-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe man-pages-5.09-r0: task do_patch: Started
NOTE: recipe man-pages-5.09-r0: task do_patch: Succeeded
NOTE: Running task 2264 of 2274 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/man-pages/man-pages_5.09.bb:do_deploy_source_date_epoch)
NOTE: Running task 2265 of 2274 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/man-pages/man-pages_5.09.bb:do_populate_lic)
NOTE: recipe man-pages-5.09-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe man-pages-5.09-r0: task do_populate_lic: Started
NOTE: recipe man-pages-5.09-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/man-pages/man-pages_5.09.bb:do_populate_lic unihash changed to ded71a190009e08b88a7aed4e7e8eee58e153ae17a750d732ce97c2fd7a43960
NOTE: recipe man-pages-5.09-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running noexec task 2266 of 2274 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/man-pages/man-pages_5.09.bb:do_configure)
NOTE: Running noexec task 2267 of 2274 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/man-pages/man-pages_5.09.bb:do_compile)
NOTE: Running task 2268 of 2274 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/man-pages/man-pages_5.09.bb:do_install)
NOTE: recipe man-pages-5.09-r0: task do_install: Started
NOTE: recipe man-pages-5.09-r0: task do_install: Succeeded
NOTE: Running task 2269 of 2274 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/man-pages/man-pages_5.09.bb:do_package)
NOTE: Running task 2270 of 2274 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/man-pages/man-pages_5.09.bb:do_populate_sysroot)
NOTE: recipe man-pages-5.09-r0: task do_package: Started
NOTE: recipe man-pages-5.09-r0: task do_populate_sysroot: Started
NOTE: recipe man-pages-5.09-r0: task do_populate_sysroot: Succeeded
NOTE: recipe man-pages-5.09-r0: task do_package: Succeeded
NOTE: Running task 2271 of 2274 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/man-pages/man-pages_5.09.bb:do_packagedata)
NOTE: recipe man-pages-5.09-r0: task do_packagedata: Started
NOTE: recipe man-pages-5.09-r0: task do_packagedata: Succeeded
NOTE: Running task 2272 of 2274 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/man-pages/man-pages_5.09.bb:do_package_write_rpm)
NOTE: Running task 2273 of 2274 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/man-pages/man-pages_5.09.bb:do_package_qa)
NOTE: recipe man-pages-5.09-r0: task do_package_write_rpm: Started
NOTE: recipe man-pages-5.09-r0: task do_package_qa: Started
NOTE: recipe man-pages-5.09-r0: task do_package_qa: Succeeded
NOTE: recipe man-pages-5.09-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2274 of 2274 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/man-pages/man-pages_5.09.bb:do_build)
NOTE: Tasks Summary: Attempted 2274 tasks of which 2259 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 49 ERROR messages shown, returning a non-zero exit code.

--===============4233221315054572159==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 1395 entries from dependency cache.
Parsing recipes...done.
Parsing of 791 .bb files complete (789 cached, 2 parsed). 1372 targets, 46 skipped, 0 masked, 0 errors.
Removing 105 recipes from the core2-32 sysroot...done.
Removing 108 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.49.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "3.2+snapshot-20201116"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:115b5c65eb4db0784ca7a30efcf2a2542a76f792"
workspace            = "master:aaf6aa3e530deb4a8d818a55a37b9029980b0b0d"

Initialising tasks...done.
Sstate summary: Wanted 539 Found 531 Missed 8 Current 195 (98% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 196 of 734 (/home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/binutils/binutils_2.35.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 197 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.9.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 198 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1h.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 199 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.3.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 200 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 201 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 202 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 203 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 204 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 205 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 206 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 207 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 208 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 209 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.58.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 210 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 211 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 212 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 213 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 214 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 215 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 216 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 217 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 218 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.9.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 219 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 220 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 221 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 222 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.9.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 223 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 224 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.181.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 225 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 226 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 227 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 228 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 229 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 230 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 231 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 232 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 233 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbus_1.2.16.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 234 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbusmock_0.19.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 235 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.20.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 236 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.38.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 237 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 238 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 239 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 240 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 241 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 242 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.7.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 243 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 244 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 245 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 246 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 247 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 248 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 256 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 257 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.16.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 258 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_package_write_rpm_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe init-system-helpers-1.58-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-obstack-1.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe iproute2-5.9.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe socat-1.7.3.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe expat-2.2.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-1.2.1+gitAUTOINC+d91a6cf6e3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe eudev-3.2.9-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe openssl-1.1.1h-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe binutils-2.35-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe readline-8.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe btrfs-tools-5.9-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe elfutils-0.181-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 259 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_package_write_rpm_setscene)
NOTE: recipe bison-3.7.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe make-4.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-dbusmock-0.19-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pycairo-1.20.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-dbus-1.2.16-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe util-linux-2.36-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe m4-1.4.18-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe perl-5.32.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pygobject-3.38.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-obstack-1.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe e2fsprogs-1.45.6-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 260 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-10.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe init-system-helpers-1.58-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe findutils-4.7.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe grep-3.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe iptables-1.8.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libmnl-1.0.4-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 261 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 262 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_package_write_rpm_setscene)
NOTE: recipe socat-1.7.3.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bash-5.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libtirpc-1.2.6-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 263 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_package_write_rpm_setscene)
NOTE: recipe initscripts-1.0-r155: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe eudev-3.2.9-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe diffutils-3.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe procps-3.3.16-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe expat-2.2.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 264 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.58.bb:do_packagedata_setscene)
NOTE: Running setscene task 265 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 266 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 267 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_package_write_rpm_setscene)
NOTE: recipe iproute2-5.9.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 268 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_package_write_rpm_setscene)
NOTE: recipe zlib-1.2.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gawk-5.1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe mdadm-4.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe readline-8.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe sed-4.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 269 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.102.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 270 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 271 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 272 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.2.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 273 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_package_write_rpm_setscene)
NOTE: recipe musl-1.2.1+gitAUTOINC+d91a6cf6e3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 274 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_packagedata_setscene)
NOTE: Running setscene task 275 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 276 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_package_write_rpm_setscene)
NOTE: recipe ncurses-6.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-dbusmock-0.19-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-3.9.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 277 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_package_write_rpm_setscene)
NOTE: recipe shadow-securetty-4.6-r3: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 278 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 279 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_package_write_rpm_setscene)
NOTE: recipe make-4.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-pycairo-1.20.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 280 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.6.12.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 281 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-dbus-1.2.16-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe m4-1.4.18-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-pygobject-3.38.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libgcc-10.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bison-3.7.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxml2-2.9.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe btrfs-tools-5.9-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe grep-3.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libmnl-1.0.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 282 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbus_1.2.16.bb:do_packagedata_setscene)
NOTE: recipe flex-2.6.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 283 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygobject_3.38.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 284 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 285 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 286 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 287 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_packagedata_setscene)
NOTE: Running setscene task 288 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 289 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 290 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 291 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 292 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 293 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_package_write_rpm_setscene)
NOTE: recipe findutils-4.7.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libtirpc-1.2.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 294 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_package_write_rpm_setscene)
NOTE: recipe util-linux-2.36-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bash-5.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe sed-4.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm_setscene: Started
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe diffutils-3.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gawk-5.1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe iptables-1.8.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe mdadm-4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe procps-3.3.16-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe e2fsprogs-1.45.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 295 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-dbusmock_0.19.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.8.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_package_write_rpm_setscene: Started
NOTE: recipe init-system-helpers-1.58-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 296 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 297 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 298 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.9.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 299 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 300 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 301 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 302 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 303 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 304 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 305 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 306 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_package_write_rpm_setscene)
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 307 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_packagedata_setscene)
NOTE: Running setscene task 308 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 309 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.16.bb:do_packagedata_setscene)
NOTE: recipe elfutils-0.181-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gcc-runtime-10.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe which-2.21-r3: task do_package_write_rpm_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe freetype-2.10.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe wayland-1.18.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libdrm-2.4.102-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 310 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.8.bb:do_package_write_rpm_setscene)
NOTE: recipe libice-1_1.0.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpciaccess-0.16-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libx11-1_1.6.12-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 311 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_deploy_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 312 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_package_write_rpm_setscene)
NOTE: recipe mesa-2_20.2.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-dbus-1.2.16-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pygobject-3.38.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 313 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_package_write_rpm_setscene)
NOTE: recipe openssl-1.1.1h-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 314 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_package_write_rpm_setscene)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe m4-1.4.18-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxfixes-1_5.0.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-dbusmock-0.19-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 315 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe which-2.21-r3: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 316 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_packagedata_setscene)
NOTE: recipe freetype-2.10.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 317 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_packagedata_setscene)
NOTE: Running setscene task 318 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_package_write_rpm_setscene)
NOTE: recipe xrandr-1_1.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 319 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 320 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package_write_rpm_setscene)
NOTE: recipe gobject-introspection-1.66.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 321 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_package_write_rpm_setscene)
NOTE: recipe iproute2-5.9.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.102-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe socat-1.7.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe btrfs-tools-5.9-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.18.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 322 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.18.1.bb:do_package_write_rpm_setscene)
NOTE: recipe libpciaccess-0.16-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libx11-1_1.6.12-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_packagedata_setscene: Started
NOTE: recipe mdadm-4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe util-macros-1_1.19.2-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 323 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.0.bb:do_package_write_rpm_setscene)
NOTE: recipe libice-1_1.0.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe grep-3.5-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.8-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 324 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 325 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 326 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.44.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 327 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 328 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_package_write_rpm_setscene)
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Started
NOTE: recipe findutils-4.7.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 329 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_package_write_rpm_setscene)
NOTE: recipe binutils-2.35-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 330 of 734 (/home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/binutils/binutils_2.35.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 331 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.0.bb:do_package_write_rpm_setscene)
NOTE: recipe kmod-27-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe procps-3.3.16-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 332 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 333 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.33.0.bb:do_package_write_rpm_setscene)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe init-system-helpers-1.58-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxfixes-1_5.0.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe perl-5.32.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-3.9.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe argp-standalone-1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpng-1.6.37-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe linux-yocto-5.8.13+gitAUTOINC+34775c20bc_5981001bf0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xorgproto-2020.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe linux-yocto-5.8.13+gitAUTOINC+34775c20bc_5981001bf0-r0: task do_deploy_setscene: Started
NOTE: recipe which-2.21-r3: task do_packagedata_setscene: Started
NOTE: recipe kmod-27-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libcap-2.44-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe linux-libc-headers-5.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pygobject-3.38.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.2.53-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe attr-2.4.48-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe db-1_5.3.28-r1: task do_package_write_rpm_setscene: Started
NOTE: recipe libcap-ng-0.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-dbus-1.2.16-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 339 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pycairo_1.20.0.bb:do_packagedata_setscene)
NOTE: recipe gmp-6.2.0-r0: task do_package_write_rpm_setscene: Started
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-src went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
NOTE: Running setscene task 342 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 343 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 344 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_packagedata_setscene)
NOTE: recipe python3-dbusmock-0.19-r0: task do_packagedata_setscene: Succeeded
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-dbg went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-staticdev went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
NOTE: recipe gdbm-1.18.1-r0: task do_package_write_rpm_setscene: Started
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-dev went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
NOTE: recipe libffi-3.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe sqlite3-3_3.33.0-r0: task do_package_write_rpm_setscene: Started
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-doc went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
NOTE: recipe btrfs-tools-5.9-r0: task do_packagedata_setscene: Succeeded
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
NOTE: recipe socat-1.7.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 351 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.9.bb:do_packagedata_setscene)
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-af went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-be went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
NOTE: recipe libpcre-8.44-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe lzo-2.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shared-mime-info-2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 358 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_packagedata_setscene)
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-bg went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
NOTE: recipe m4-1.4.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.3-r0: task do_package_write_rpm_setscene: Succeeded
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-ca went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
NOTE: recipe mdadm-4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe binutils-2.35-r0: task do_packagedata_setscene: Started
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-cs went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-da went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-de went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-el went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
NOTE: recipe libcap-2.44-r0: task do_package_write_rpm_setscene: Succeeded
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-eo went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
NOTE: recipe bc-1.07.1-r0: task do_packagedata_setscene: Succeeded
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-es went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-et went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
NOTE: recipe procps-3.3.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8-r0: task do_package_write_rpm_setscene: Succeeded
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-eu went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm_setscene: Succeeded
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-fi went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
NOTE: Running setscene task 368 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_packagedata_setscene)
NOTE: recipe iproute2-5.9.0-r0: task do_packagedata_setscene: Succeeded
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-fr went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.4.48-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Succeeded
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-ga went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
NOTE: recipe gmp-6.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe acl-2.2.53-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 371 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.181.bb:do_packagedata_setscene)
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-gl went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
NOTE: Running setscene task 376 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 378 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 380 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_packagedata_setscene)
NOTE: Running setscene task 381 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 382 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 383 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 384 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_packagedata_setscene)
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-he went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
NOTE: recipe gdbm-1.18.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 385 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_packagedata_setscene)
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-hr went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-hu went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-id went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pycairo-1.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_package_write_rpm_setscene: Succeeded
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-it went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-ja went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
NOTE: recipe libffi-3.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe lzo-2.10-r0: task do_package_write_rpm_setscene: Succeeded
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-ko went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
NOTE: Running setscene task 388 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_packagedata_setscene)
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-ky went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
NOTE: recipe libpcre-8.44-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shared-mime-info-2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 389 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 390 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_packagedata_setscene)
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-lt went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
NOTE: recipe sqlite3-3_3.33.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 391 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.0.bb:do_packagedata_setscene)
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-nb went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Started
NOTE: recipe eudev-3.2.9-r0: task do_packagedata_setscene: Started
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-nl went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_packagedata_setscene: Started
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-pa went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
NOTE: recipe which-2.21-r3: task do_packagedata_setscene: Succeeded
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-pl went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-pt went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-pt-br went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-ro went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-ru went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata_setscene: Started
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-sk went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-sl went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
NOTE: recipe mesa-2_20.2.1-r0: task do_package_write_rpm_setscene: Succeeded
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-sr went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
NOTE: recipe linux-yocto-5.8.13+gitAUTOINC+34775c20bc_5981001bf0-r0: task do_deploy_setscene: Succeeded
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-sv went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
NOTE: recipe iptables-1.8.6-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 394 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_populate_sysroot_setscene)
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-th went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
NOTE: recipe elfutils-0.181-r0: task do_packagedata_setscene: Started
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-tr went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
NOTE: recipe db-1_5.3.28-r1: task do_package_write_rpm_setscene: Succeeded
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-uk went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata_setscene: Started
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-vi went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-zh-cn went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
NOTE: recipe coreutils-8.32-r0: task do_packagedata_setscene: Started
ERROR: grep-3.5-r0 do_packagedata_setscene: QA Issue: Package version for package grep-locale-zh-tw went backwards which would break package feeds (from 0:3.6-r0 to 0:3.5-r0) [version-going-backwards]
NOTE: recipe gawk-5.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.32.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-yocto-5.8.13+gitAUTOINC+34775c20bc_5981001bf0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bash-5.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 395 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_populate_sysroot_setscene)
NOTE: recipe e2fsprogs-1.45.6-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 396 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_packagedata_setscene)
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe lzo-2.10-r0: task do_packagedata_setscene: Started
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pycairo-1.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 399 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_packagedata_setscene)
NOTE: recipe grep-3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe diffutils-3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe findutils-4.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe eudev-3.2.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 407 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_packagedata_setscene)
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-yocto-5.8.13+gitAUTOINC+34775c20bc_5981001bf0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe binutils-2.35-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gobject-introspection-1.66.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 418 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 420 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-yocto-5.8.13+gitAUTOINC+34775c20bc_5981001bf0-r0: task do_packagedata_setscene: Started
NOTE: recipe lzo-2.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe elfutils-0.181-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 426 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 428 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 431 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_packagedata_setscene)
NOTE: recipe ptest-runner-2.4.0+gitAUTOINC+834670317b-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe kmod-27-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gawk-5.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bison-3.7.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 441 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe linux-yocto-5.8.13+gitAUTOINC+34775c20bc_5981001bf0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: Running task 750 of 2295 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/man-pages/man-pages_5.09.bb:do_fetch)
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe e2fsprogs-1.45.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 450 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 452 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_20.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 454 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_packagedata_setscene)
NOTE: recipe coreutils-8.32-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 458 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_packagedata_setscene)
NOTE: Running setscene task 460 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 462 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.44.bb:do_packagedata_setscene)
NOTE: recipe diffutils-3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe man-pages-5.09-r0: task do_fetch: Started
NOTE: recipe man-pages-5.09-r0: task do_fetch: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 948 of 2295 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/man-pages/man-pages_5.09.bb:do_unpack)
NOTE: recipe kmod-27-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.44-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_20.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.2.53-r0: task do_packagedata_setscene: Started
NOTE: recipe man-pages-5.09-r0: task do_unpack: Started
NOTE: recipe shared-mime-info-2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 475 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.2.bb:do_packagedata_setscene)
NOTE: recipe iptables-1.8.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bison-3.7.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.44-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 486 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_packagedata_setscene)
NOTE: recipe man-pages-5.09-r0: task do_unpack: Succeeded
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1052 of 2295 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/man-pages/man-pages_5.09.bb:do_patch)
NOTE: recipe acl-2.2.53-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe freetype-2.10.4-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_20.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe man-pages-5.09-r0: task do_patch: Started
NOTE: Running setscene task 497 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.102.bb:do_packagedata_setscene)
NOTE: Running setscene task 500 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 502 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 504 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 506 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 508 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_packagedata_setscene)
NOTE: recipe man-pages-5.09-r0: task do_patch: Succeeded
NOTE: Running task 1067 of 2295 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/man-pages/man-pages_5.09.bb:do_deploy_source_date_epoch)
NOTE: Running task 1068 of 2295 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/man-pages/man-pages_5.09.bb:do_populate_lic)
NOTE: recipe libdrm-2.4.102-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.18.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe freetype-2.10.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 512 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_packagedata_setscene)
NOTE: recipe man-pages-5.09-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe man-pages-5.09-r0: task do_populate_lic: Started
NOTE: recipe libpng-1.6.37-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 518 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 520 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 524 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe man-pages-5.09-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/man-pages/man-pages_5.09.bb:do_populate_lic unihash changed to ded71a190009e08b88a7aed4e7e8eee58e153ae17a750d732ce97c2fd7a43960
NOTE: recipe libdrm-2.4.102-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe man-pages-5.09-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 532 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_packagedata_setscene)
NOTE: recipe libxfixes-1_5.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.37-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.66.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 537 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_packagedata_setscene)
NOTE: Running setscene task 540 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_packagedata_setscene)
NOTE: recipe libxfixes-1_5.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 545 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 548 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_packagedata_setscene)
NOTE: recipe libxml2-2.9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 552 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.0.bb:do_packagedata_setscene)
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.9.0-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 557 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 559 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_packagedata_setscene)
NOTE: Running setscene task 561 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 563 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 565 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 567 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_packagedata_setscene)
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre-8.44-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 574 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.6.12.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.2.10-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.6.12-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 582 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 584 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_packagedata_setscene)
NOTE: recipe expat-2.2.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.6.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 591 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_packagedata_setscene)
NOTE: recipe python3-3.9.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 594 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1h.bb:do_packagedata_setscene)
NOTE: Running setscene task 596 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 598 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.bb:do_packagedata_setscene)
NOTE: Running setscene task 601 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 603 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 605 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 607 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 609 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.33.0.bb:do_packagedata_setscene)
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 613 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.4.48.bb:do_packagedata_setscene)
NOTE: recipe readline-8.0-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-1.1.1h-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.33.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.36-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 617 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata_setscene)
NOTE: recipe attr-2.4.48-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.33.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 624 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 626 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 629 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 631 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_packagedata_setscene)
NOTE: recipe libnsl2-1.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 637 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb:do_packagedata_setscene)
NOTE: recipe openssl-1.1.1h-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.2.6-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.4.48-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.2.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 659 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 661 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.2.bb:do_packagedata_setscene)
NOTE: recipe xorgproto-2020.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.19.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.36-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 668 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 671 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 673 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.bb:do_packagedata_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-yocto-5.8.13+gitAUTOINC+34775c20bc_5981001bf0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 677 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe perl-5.32.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 679 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 684 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_packagedata_setscene)
NOTE: recipe linux-yocto-5.8.13+gitAUTOINC+34775c20bc_5981001bf0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 686 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.18.1.bb:do_packagedata_setscene)
NOTE: recipe linux-yocto-5.8.13+gitAUTOINC+34775c20bc_5981001bf0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.18.1-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 692 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 693 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.18.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 703 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 704 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 705 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe opkg-utils-0.4.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-runtime-10.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 707 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-10.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 708 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 709 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-10.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 711 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-10.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-1.2.1+gitAUTOINC+d91a6cf6e3-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcc-10.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 712 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 713 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe musl-1.2.1+gitAUTOINC+d91a6cf6e3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 715 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 716 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 717 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.8.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.1+gitAUTOINC+d91a6cf6e3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe linux-libc-headers-5.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.1+gitAUTOINC+d91a6cf6e3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 721 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 722 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 723 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.1+gitAUTOINC+d91a6cf6e3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-1.2.1+gitAUTOINC+d91a6cf6e3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 726 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 727 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 728 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 730 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_10.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 731 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.8.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 732 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.35.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 733 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe binutils-cross-i686-2.35-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe linux-libc-headers-5.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe binutils-cross-i686-2.35-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 734 of 734 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.35.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe binutils-cross-i686-2.35-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-cross-i686-2.35-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2032 of 2295 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/man-pages/man-pages_5.09.bb:do_prepare_recipe_sysroot)
NOTE: recipe man-pages-5.09-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe man-pages-5.09-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running noexec task 2287 of 2295 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/man-pages/man-pages_5.09.bb:do_configure)
NOTE: Running noexec task 2288 of 2295 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/man-pages/man-pages_5.09.bb:do_compile)
NOTE: Running task 2289 of 2295 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/man-pages/man-pages_5.09.bb:do_install)
NOTE: recipe man-pages-5.09-r0: task do_install: Started
NOTE: recipe man-pages-5.09-r0: task do_install: Succeeded
NOTE: Running task 2290 of 2295 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/man-pages/man-pages_5.09.bb:do_package)
NOTE: Running task 2291 of 2295 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/man-pages/man-pages_5.09.bb:do_populate_sysroot)
NOTE: recipe man-pages-5.09-r0: task do_package: Started
NOTE: recipe man-pages-5.09-r0: task do_populate_sysroot: Started
NOTE: recipe man-pages-5.09-r0: task do_populate_sysroot: Succeeded
NOTE: recipe man-pages-5.09-r0: task do_package: Succeeded
NOTE: Running task 2292 of 2295 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/man-pages/man-pages_5.09.bb:do_packagedata)
NOTE: recipe man-pages-5.09-r0: task do_packagedata: Started
NOTE: recipe man-pages-5.09-r0: task do_packagedata: Succeeded
NOTE: Running task 2293 of 2295 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/man-pages/man-pages_5.09.bb:do_package_write_rpm)
NOTE: Running task 2294 of 2295 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/man-pages/man-pages_5.09.bb:do_package_qa)
NOTE: recipe man-pages-5.09-r0: task do_package_write_rpm: Started
NOTE: recipe man-pages-5.09-r0: task do_package_qa: Started
NOTE: recipe man-pages-5.09-r0: task do_package_qa: Succeeded
NOTE: recipe man-pages-5.09-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2295 of 2295 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/man-pages/man-pages_5.09.bb:do_build)
NOTE: Tasks Summary: Attempted 2295 tasks of which 2280 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 49 ERROR messages shown, returning a non-zero exit code.

--===============4233221315054572159==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/man-pages: PKGV changed from 5.08 [default] to 5.09 [default]
packages/core2-32-poky-linux/man-pages: PV changed from "5.08" to "5.09"
packages/core2-32-poky-linux/man-pages: SRC_URI changed from "https://cdn.kernel.org/pub/linux/docs/man-pages/man-pages-5.08.tar.gz" to "https://cdn.kernel.org/pub/linux/docs/man-pages/man-pages-5.09.tar.gz"
packages/core2-32-poky-linux/man-pages/man-pages-dbg: PKGV changed from 5.08 [default] to 5.09 [default]
packages/core2-32-poky-linux/man-pages/man-pages-dbg: FILELIST: added "/usr/share/man/man3/circleq.3 /usr/share/man/man3/id_t.3 /usr/share/man/man2/getcwd.2 /usr/share/man/man3/sigdescr_np.3 /usr/share/man/man3/float_t.3 /usr/share/man/man3/uintmax_t.3 /usr/share/man/man3/siginfo_t.3 /usr/share/man/man3/aiocb.3 /usr/share/man/man3/sigset_t.3 /usr/share/man/man3/tailq.3 /usr/share/man/man3/int8_t.3 /usr/share/man/man3/double_t.3 /usr/share/man/man2/mq_unlink.2 /usr/share/man/man3/strerrordesc_np.3 /usr/share/man/man3/regmatch_t.3 /usr/share/man/man3/clock_t.3 /usr/share/man/man3/off_t.3 /usr/share/man/man3/time_t.3 /usr/share/man/man3/regoff_t.3 /usr/share/man/man3/ptrdiff_t.3 /usr/share/man/man3/ssize_t.3 /usr/share/man/man3/sigabbrev_np.3 /usr/share/man/man3/dev_t.3 /usr/share/man/man3/gid_t.3 /usr/share/man/man3/int64_t.3 /usr/share/man/man7/system_data_types.7 /usr/share/man/man3/pthread_attr_setsigmask_np.3 /usr/share/man/man3/uint64_t.3 /usr/share/man/man3/clockid_t.3 /usr/share
 /man/man3/int16_t.3 /usr/share/man/man3/slist.3 /usr/share/man/man3/timer_t.3 /usr/share/man/man7/queue.7 /usr/share/man/man3/intptr_t.3 /usr/share/man/man3/int32_t.3 /usr/share/man/man3/uintN_t.3 /usr/share/man/man3/FILE.3 /usr/share/man/man3/sigval.3 /usr/share/man/man2/mq_notify.2 /usr/share/man/man3/lldiv_t.3 /usr/share/man/man3/va_list.3 /usr/share/man/man3/regex_t.3 /usr/share/man/man3/lconv.3 /usr/share/man/man3/fexcept_t.3 /usr/share/man/man3/fenv_t.3 /usr/share/man/man3/ldiv_t.3 /usr/share/man/man3/stailq.3 /usr/share/man/man3/intN_t.3 /usr/share/man/man3/uint32_t.3 /usr/share/man/man3/size_t.3 /usr/share/man/man3/imaxdiv_t.3 /usr/share/man/man3/intmax_t.3 /usr/share/man/man3/strerrorname_np.3 /usr/share/man/man3/div_t.3 /usr/share/man/man3/list.3 /usr/share/man/man2/mq_timedsend.2 /usr/share/man/man3/uint16_t.3 /usr/share/man/man3/timespec.3 /usr/share/man/man3/pid_t.3 /usr/share/man/man3/timeval.3 /usr/share/man/man3/uint8_t.3 /usr/share/man/man7/kernel_lockdown.7 /usr/sh
 are/man/man2/mq_timedreceive.2 /usr/share/man/man3/uintptr_t.3 /usr/share/man/man3/uid_t.3 /usr/share/man/man3/sys_siglist.3 /usr/share/man/man3/void.3 /usr/share/man/man3/suseconds_t.3 /usr/share/man/man2/mq_open.2"
packages/core2-32-poky-linux/man-pages/man-pages-dbg: PV changed from "5.08" to "5.09"
packages/core2-32-poky-linux/man-pages/man-pages-dev: PKGV changed from 5.08 [default] to 5.09 [default]
packages/core2-32-poky-linux/man-pages/man-pages-dev: FILELIST: added "/usr/share/man/man3/circleq.3 /usr/share/man/man3/id_t.3 /usr/share/man/man2/getcwd.2 /usr/share/man/man3/sigdescr_np.3 /usr/share/man/man3/float_t.3 /usr/share/man/man3/uintmax_t.3 /usr/share/man/man3/siginfo_t.3 /usr/share/man/man3/aiocb.3 /usr/share/man/man3/sigset_t.3 /usr/share/man/man3/tailq.3 /usr/share/man/man3/int8_t.3 /usr/share/man/man3/double_t.3 /usr/share/man/man2/mq_unlink.2 /usr/share/man/man3/strerrordesc_np.3 /usr/share/man/man3/regmatch_t.3 /usr/share/man/man3/clock_t.3 /usr/share/man/man3/off_t.3 /usr/share/man/man3/time_t.3 /usr/share/man/man3/regoff_t.3 /usr/share/man/man3/ptrdiff_t.3 /usr/share/man/man3/ssize_t.3 /usr/share/man/man3/sigabbrev_np.3 /usr/share/man/man3/dev_t.3 /usr/share/man/man3/gid_t.3 /usr/share/man/man3/int64_t.3 /usr/share/man/man7/system_data_types.7 /usr/share/man/man3/pthread_attr_setsigmask_np.3 /usr/share/man/man3/uint64_t.3 /usr/share/man/man3/clockid_t.3 /usr/share
 /man/man3/int16_t.3 /usr/share/man/man3/slist.3 /usr/share/man/man3/timer_t.3 /usr/share/man/man7/queue.7 /usr/share/man/man3/intptr_t.3 /usr/share/man/man3/int32_t.3 /usr/share/man/man3/uintN_t.3 /usr/share/man/man3/FILE.3 /usr/share/man/man3/sigval.3 /usr/share/man/man2/mq_notify.2 /usr/share/man/man3/lldiv_t.3 /usr/share/man/man3/va_list.3 /usr/share/man/man3/regex_t.3 /usr/share/man/man3/lconv.3 /usr/share/man/man3/fexcept_t.3 /usr/share/man/man3/fenv_t.3 /usr/share/man/man3/ldiv_t.3 /usr/share/man/man3/stailq.3 /usr/share/man/man3/intN_t.3 /usr/share/man/man3/uint32_t.3 /usr/share/man/man3/size_t.3 /usr/share/man/man3/imaxdiv_t.3 /usr/share/man/man3/intmax_t.3 /usr/share/man/man3/strerrorname_np.3 /usr/share/man/man3/div_t.3 /usr/share/man/man3/list.3 /usr/share/man/man2/mq_timedsend.2 /usr/share/man/man3/uint16_t.3 /usr/share/man/man3/timespec.3 /usr/share/man/man3/pid_t.3 /usr/share/man/man3/timeval.3 /usr/share/man/man3/uint8_t.3 /usr/share/man/man7/kernel_lockdown.7 /usr/sh
 are/man/man2/mq_timedreceive.2 /usr/share/man/man3/uintptr_t.3 /usr/share/man/man3/uid_t.3 /usr/share/man/man3/sys_siglist.3 /usr/share/man/man3/void.3 /usr/share/man/man3/suseconds_t.3 /usr/share/man/man2/mq_open.2"
packages/core2-32-poky-linux/man-pages/man-pages-dev: PV changed from "5.08" to "5.09"
packages/core2-32-poky-linux/man-pages/man-pages-doc: PKGV changed from 5.08 [default] to 5.09 [default]
packages/core2-32-poky-linux/man-pages/man-pages-doc: FILELIST: added "/usr/share/man/man3/circleq.3 /usr/share/man/man3/id_t.3 /usr/share/man/man2/getcwd.2 /usr/share/man/man3/sigdescr_np.3 /usr/share/man/man3/float_t.3 /usr/share/man/man3/uintmax_t.3 /usr/share/man/man3/siginfo_t.3 /usr/share/man/man3/aiocb.3 /usr/share/man/man3/sigset_t.3 /usr/share/man/man3/tailq.3 /usr/share/man/man3/int8_t.3 /usr/share/man/man3/double_t.3 /usr/share/man/man2/mq_unlink.2 /usr/share/man/man3/strerrordesc_np.3 /usr/share/man/man3/regmatch_t.3 /usr/share/man/man3/clock_t.3 /usr/share/man/man3/off_t.3 /usr/share/man/man3/time_t.3 /usr/share/man/man3/regoff_t.3 /usr/share/man/man3/ptrdiff_t.3 /usr/share/man/man3/ssize_t.3 /usr/share/man/man3/sigabbrev_np.3 /usr/share/man/man3/dev_t.3 /usr/share/man/man3/gid_t.3 /usr/share/man/man3/int64_t.3 /usr/share/man/man7/system_data_types.7 /usr/share/man/man3/pthread_attr_setsigmask_np.3 /usr/share/man/man3/uint64_t.3 /usr/share/man/man3/clockid_t.3 /usr/share
 /man/man3/int16_t.3 /usr/share/man/man3/slist.3 /usr/share/man/man3/timer_t.3 /usr/share/man/man7/queue.7 /usr/share/man/man3/intptr_t.3 /usr/share/man/man3/int32_t.3 /usr/share/man/man3/uintN_t.3 /usr/share/man/man3/FILE.3 /usr/share/man/man3/sigval.3 /usr/share/man/man2/mq_notify.2 /usr/share/man/man3/lldiv_t.3 /usr/share/man/man3/va_list.3 /usr/share/man/man3/regex_t.3 /usr/share/man/man3/lconv.3 /usr/share/man/man3/fexcept_t.3 /usr/share/man/man3/fenv_t.3 /usr/share/man/man3/ldiv_t.3 /usr/share/man/man3/stailq.3 /usr/share/man/man3/intN_t.3 /usr/share/man/man3/uint32_t.3 /usr/share/man/man3/size_t.3 /usr/share/man/man3/imaxdiv_t.3 /usr/share/man/man3/intmax_t.3 /usr/share/man/man3/strerrorname_np.3 /usr/share/man/man3/div_t.3 /usr/share/man/man3/list.3 /usr/share/man/man2/mq_timedsend.2 /usr/share/man/man3/uint16_t.3 /usr/share/man/man3/timespec.3 /usr/share/man/man3/pid_t.3 /usr/share/man/man3/timeval.3 /usr/share/man/man3/uint8_t.3 /usr/share/man/man7/kernel_lockdown.7 /usr/sh
 are/man/man2/mq_timedreceive.2 /usr/share/man/man3/uintptr_t.3 /usr/share/man/man3/uid_t.3 /usr/share/man/man3/sys_siglist.3 /usr/share/man/man3/void.3 /usr/share/man/man3/suseconds_t.3 /usr/share/man/man2/mq_open.2"
packages/core2-32-poky-linux/man-pages/man-pages-doc: PV changed from "5.08" to "5.09"
packages/core2-32-poky-linux/man-pages/man-pages-locale: PKGV changed from 5.08 [default] to 5.09 [default]
packages/core2-32-poky-linux/man-pages/man-pages-locale: FILELIST: added "/usr/share/man/man3/circleq.3 /usr/share/man/man3/id_t.3 /usr/share/man/man2/getcwd.2 /usr/share/man/man3/sigdescr_np.3 /usr/share/man/man3/float_t.3 /usr/share/man/man3/uintmax_t.3 /usr/share/man/man3/siginfo_t.3 /usr/share/man/man3/aiocb.3 /usr/share/man/man3/sigset_t.3 /usr/share/man/man3/tailq.3 /usr/share/man/man3/int8_t.3 /usr/share/man/man3/double_t.3 /usr/share/man/man2/mq_unlink.2 /usr/share/man/man3/strerrordesc_np.3 /usr/share/man/man3/regmatch_t.3 /usr/share/man/man3/clock_t.3 /usr/share/man/man3/off_t.3 /usr/share/man/man3/time_t.3 /usr/share/man/man3/regoff_t.3 /usr/share/man/man3/ptrdiff_t.3 /usr/share/man/man3/ssize_t.3 /usr/share/man/man3/sigabbrev_np.3 /usr/share/man/man3/dev_t.3 /usr/share/man/man3/gid_t.3 /usr/share/man/man3/int64_t.3 /usr/share/man/man7/system_data_types.7 /usr/share/man/man3/pthread_attr_setsigmask_np.3 /usr/share/man/man3/uint64_t.3 /usr/share/man/man3/clockid_t.3 /usr/sh
 are/man/man3/int16_t.3 /usr/share/man/man3/slist.3 /usr/share/man/man3/timer_t.3 /usr/share/man/man7/queue.7 /usr/share/man/man3/intptr_t.3 /usr/share/man/man3/int32_t.3 /usr/share/man/man3/uintN_t.3 /usr/share/man/man3/FILE.3 /usr/share/man/man3/sigval.3 /usr/share/man/man2/mq_notify.2 /usr/share/man/man3/lldiv_t.3 /usr/share/man/man3/va_list.3 /usr/share/man/man3/regex_t.3 /usr/share/man/man3/lconv.3 /usr/share/man/man3/fexcept_t.3 /usr/share/man/man3/fenv_t.3 /usr/share/man/man3/ldiv_t.3 /usr/share/man/man3/stailq.3 /usr/share/man/man3/intN_t.3 /usr/share/man/man3/uint32_t.3 /usr/share/man/man3/size_t.3 /usr/share/man/man3/imaxdiv_t.3 /usr/share/man/man3/intmax_t.3 /usr/share/man/man3/strerrorname_np.3 /usr/share/man/man3/div_t.3 /usr/share/man/man3/list.3 /usr/share/man/man2/mq_timedsend.2 /usr/share/man/man3/uint16_t.3 /usr/share/man/man3/timespec.3 /usr/share/man/man3/pid_t.3 /usr/share/man/man3/timeval.3 /usr/share/man/man3/uint8_t.3 /usr/share/man/man7/kernel_lockdown.7 /usr
 /share/man/man2/mq_timedreceive.2 /usr/share/man/man3/uintptr_t.3 /usr/share/man/man3/uid_t.3 /usr/share/man/man3/sys_siglist.3 /usr/share/man/man3/void.3 /usr/share/man/man3/suseconds_t.3 /usr/share/man/man2/mq_open.2"
packages/core2-32-poky-linux/man-pages/man-pages-locale: PV changed from "5.08" to "5.09"
packages/core2-32-poky-linux/man-pages/man-pages-src: PKGV changed from 5.08 [default] to 5.09 [default]
packages/core2-32-poky-linux/man-pages/man-pages-src: FILELIST: added "/usr/share/man/man3/circleq.3 /usr/share/man/man3/id_t.3 /usr/share/man/man2/getcwd.2 /usr/share/man/man3/sigdescr_np.3 /usr/share/man/man3/float_t.3 /usr/share/man/man3/uintmax_t.3 /usr/share/man/man3/siginfo_t.3 /usr/share/man/man3/aiocb.3 /usr/share/man/man3/sigset_t.3 /usr/share/man/man3/tailq.3 /usr/share/man/man3/int8_t.3 /usr/share/man/man3/double_t.3 /usr/share/man/man2/mq_unlink.2 /usr/share/man/man3/strerrordesc_np.3 /usr/share/man/man3/regmatch_t.3 /usr/share/man/man3/clock_t.3 /usr/share/man/man3/off_t.3 /usr/share/man/man3/time_t.3 /usr/share/man/man3/regoff_t.3 /usr/share/man/man3/ptrdiff_t.3 /usr/share/man/man3/ssize_t.3 /usr/share/man/man3/sigabbrev_np.3 /usr/share/man/man3/dev_t.3 /usr/share/man/man3/gid_t.3 /usr/share/man/man3/int64_t.3 /usr/share/man/man7/system_data_types.7 /usr/share/man/man3/pthread_attr_setsigmask_np.3 /usr/share/man/man3/uint64_t.3 /usr/share/man/man3/clockid_t.3 /usr/share
 /man/man3/int16_t.3 /usr/share/man/man3/slist.3 /usr/share/man/man3/timer_t.3 /usr/share/man/man7/queue.7 /usr/share/man/man3/intptr_t.3 /usr/share/man/man3/int32_t.3 /usr/share/man/man3/uintN_t.3 /usr/share/man/man3/FILE.3 /usr/share/man/man3/sigval.3 /usr/share/man/man2/mq_notify.2 /usr/share/man/man3/lldiv_t.3 /usr/share/man/man3/va_list.3 /usr/share/man/man3/regex_t.3 /usr/share/man/man3/lconv.3 /usr/share/man/man3/fexcept_t.3 /usr/share/man/man3/fenv_t.3 /usr/share/man/man3/ldiv_t.3 /usr/share/man/man3/stailq.3 /usr/share/man/man3/intN_t.3 /usr/share/man/man3/uint32_t.3 /usr/share/man/man3/size_t.3 /usr/share/man/man3/imaxdiv_t.3 /usr/share/man/man3/intmax_t.3 /usr/share/man/man3/strerrorname_np.3 /usr/share/man/man3/div_t.3 /usr/share/man/man3/list.3 /usr/share/man/man2/mq_timedsend.2 /usr/share/man/man3/uint16_t.3 /usr/share/man/man3/timespec.3 /usr/share/man/man3/pid_t.3 /usr/share/man/man3/timeval.3 /usr/share/man/man3/uint8_t.3 /usr/share/man/man7/kernel_lockdown.7 /usr/sh
 are/man/man2/mq_timedreceive.2 /usr/share/man/man3/uintptr_t.3 /usr/share/man/man3/uid_t.3 /usr/share/man/man3/sys_siglist.3 /usr/share/man/man3/void.3 /usr/share/man/man3/suseconds_t.3 /usr/share/man/man2/mq_open.2"
packages/core2-32-poky-linux/man-pages/man-pages-src: PV changed from "5.08" to "5.09"
packages/core2-32-poky-linux/man-pages/man-pages-staticdev: PKGV changed from 5.08 [default] to 5.09 [default]
packages/core2-32-poky-linux/man-pages/man-pages-staticdev: FILELIST: added "/usr/share/man/man3/circleq.3 /usr/share/man/man3/id_t.3 /usr/share/man/man2/getcwd.2 /usr/share/man/man3/sigdescr_np.3 /usr/share/man/man3/float_t.3 /usr/share/man/man3/uintmax_t.3 /usr/share/man/man3/siginfo_t.3 /usr/share/man/man3/aiocb.3 /usr/share/man/man3/sigset_t.3 /usr/share/man/man3/tailq.3 /usr/share/man/man3/int8_t.3 /usr/share/man/man3/double_t.3 /usr/share/man/man2/mq_unlink.2 /usr/share/man/man3/strerrordesc_np.3 /usr/share/man/man3/regmatch_t.3 /usr/share/man/man3/clock_t.3 /usr/share/man/man3/off_t.3 /usr/share/man/man3/time_t.3 /usr/share/man/man3/regoff_t.3 /usr/share/man/man3/ptrdiff_t.3 /usr/share/man/man3/ssize_t.3 /usr/share/man/man3/sigabbrev_np.3 /usr/share/man/man3/dev_t.3 /usr/share/man/man3/gid_t.3 /usr/share/man/man3/int64_t.3 /usr/share/man/man7/system_data_types.7 /usr/share/man/man3/pthread_attr_setsigmask_np.3 /usr/share/man/man3/uint64_t.3 /usr/share/man/man3/clockid_t.3 /usr
 /share/man/man3/int16_t.3 /usr/share/man/man3/slist.3 /usr/share/man/man3/timer_t.3 /usr/share/man/man7/queue.7 /usr/share/man/man3/intptr_t.3 /usr/share/man/man3/int32_t.3 /usr/share/man/man3/uintN_t.3 /usr/share/man/man3/FILE.3 /usr/share/man/man3/sigval.3 /usr/share/man/man2/mq_notify.2 /usr/share/man/man3/lldiv_t.3 /usr/share/man/man3/va_list.3 /usr/share/man/man3/regex_t.3 /usr/share/man/man3/lconv.3 /usr/share/man/man3/fexcept_t.3 /usr/share/man/man3/fenv_t.3 /usr/share/man/man3/ldiv_t.3 /usr/share/man/man3/stailq.3 /usr/share/man/man3/intN_t.3 /usr/share/man/man3/uint32_t.3 /usr/share/man/man3/size_t.3 /usr/share/man/man3/imaxdiv_t.3 /usr/share/man/man3/intmax_t.3 /usr/share/man/man3/strerrorname_np.3 /usr/share/man/man3/div_t.3 /usr/share/man/man3/list.3 /usr/share/man/man2/mq_timedsend.2 /usr/share/man/man3/uint16_t.3 /usr/share/man/man3/timespec.3 /usr/share/man/man3/pid_t.3 /usr/share/man/man3/timeval.3 /usr/share/man/man3/uint8_t.3 /usr/share/man/man7/kernel_lockdown.7 /
 usr/share/man/man2/mq_timedreceive.2 /usr/share/man/man3/uintptr_t.3 /usr/share/man/man3/uid_t.3 /usr/share/man/man3/sys_siglist.3 /usr/share/man/man3/void.3 /usr/share/man/man3/suseconds_t.3 /usr/share/man/man2/mq_open.2"
packages/core2-32-poky-linux/man-pages/man-pages-staticdev: PV changed from "5.08" to "5.09"
packages/core2-32-poky-linux/man-pages/man-pages: PKGV changed from 5.08 [default] to 5.09 [default]
packages/core2-32-poky-linux/man-pages/man-pages: PKGSIZE changed from 8073018 to 8179134 (+1%)
packages/core2-32-poky-linux/man-pages/man-pages: FILELIST: added "/usr/share/man/man3/circleq.3 /usr/share/man/man3/id_t.3 /usr/share/man/man2/getcwd.2 /usr/share/man/man3/sigdescr_np.3 /usr/share/man/man3/float_t.3 /usr/share/man/man3/uintmax_t.3 /usr/share/man/man3/siginfo_t.3 /usr/share/man/man3/aiocb.3 /usr/share/man/man3/sigset_t.3 /usr/share/man/man3/tailq.3 /usr/share/man/man3/int8_t.3 /usr/share/man/man3/double_t.3 /usr/share/man/man2/mq_unlink.2 /usr/share/man/man3/strerrordesc_np.3 /usr/share/man/man3/regmatch_t.3 /usr/share/man/man3/clock_t.3 /usr/share/man/man3/off_t.3 /usr/share/man/man3/time_t.3 /usr/share/man/man3/regoff_t.3 /usr/share/man/man3/ptrdiff_t.3 /usr/share/man/man3/ssize_t.3 /usr/share/man/man3/sigabbrev_np.3 /usr/share/man/man3/dev_t.3 /usr/share/man/man3/gid_t.3 /usr/share/man/man3/int64_t.3 /usr/share/man/man7/system_data_types.7 /usr/share/man/man3/pthread_attr_setsigmask_np.3 /usr/share/man/man3/uint64_t.3 /usr/share/man/man3/clockid_t.3 /usr/share/man
 /man3/int16_t.3 /usr/share/man/man3/slist.3 /usr/share/man/man3/timer_t.3 /usr/share/man/man7/queue.7 /usr/share/man/man3/intptr_t.3 /usr/share/man/man3/int32_t.3 /usr/share/man/man3/uintN_t.3 /usr/share/man/man3/FILE.3 /usr/share/man/man3/sigval.3 /usr/share/man/man2/mq_notify.2 /usr/share/man/man3/lldiv_t.3 /usr/share/man/man3/va_list.3 /usr/share/man/man3/regex_t.3 /usr/share/man/man3/lconv.3 /usr/share/man/man3/fexcept_t.3 /usr/share/man/man3/fenv_t.3 /usr/share/man/man3/ldiv_t.3 /usr/share/man/man3/stailq.3 /usr/share/man/man3/intN_t.3 /usr/share/man/man3/uint32_t.3 /usr/share/man/man3/size_t.3 /usr/share/man/man3/imaxdiv_t.3 /usr/share/man/man3/intmax_t.3 /usr/share/man/man3/strerrorname_np.3 /usr/share/man/man3/div_t.3 /usr/share/man/man3/list.3 /usr/share/man/man2/mq_timedsend.2 /usr/share/man/man3/uint16_t.3 /usr/share/man/man3/timespec.3 /usr/share/man/man3/pid_t.3 /usr/share/man/man3/timeval.3 /usr/share/man/man3/uint8_t.3 /usr/share/man/man7/kernel_lockdown.7 /usr/share/
 man/man2/mq_timedreceive.2 /usr/share/man/man3/uintptr_t.3 /usr/share/man/man3/uid_t.3 /usr/share/man/man3/sys_siglist.3 /usr/share/man/man3/void.3 /usr/share/man/man3/suseconds_t.3 /usr/share/man/man2/mq_open.2"
packages/core2-32-poky-linux/man-pages/man-pages: PV changed from "5.08" to "5.09"

--===============4233221315054572159==--
