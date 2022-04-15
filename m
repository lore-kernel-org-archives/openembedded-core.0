Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81892C4727C
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:25:54 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com
 (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web09.11567.1650052688281558100
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Apr 2022 12:58:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=ynbkfkyF;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192,
 mailfrom: 010101802ecdea5f-7f6ad6ec-7a57-4501-9db1-64a0a4096cc4-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1650052688;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=w0hd6vx/WuYnEXemXFFizhXGZYXhcILLeRdFSIcd4nA=;
	b=ynbkfkyFx68VbXNE3m8UuxlyXtkb2vLZcAQe2Oih4eZyGMoM+pJDmlWtiUctK4sd
	hsAW88LlmMDRIPXBrZHy3y+vW7IBudu0HA2zDDuOKUMKN8F//w68f+CeV/zPJm3tXsP
	5CyWLJMHhBxdKaOikiwz3KgUettXgERoGGQ4PR1U=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1650052688;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=w0hd6vx/WuYnEXemXFFizhXGZYXhcILLeRdFSIcd4nA=;
	b=Ikgddo8ScuJSiIruQfCZYADKUQY9lt+izkvucc/SEJEcBn01ph+lF9YnSJ2VigJw
	IsOKhrCErwxJdIqzS9cgm1BD+R7V47bhulmtUA8X5lJEX9dDXUNyYkd+kEHekYfzw/f
	4LWUy/O9XTO+JiTputZHdjK0JddLN+fyle0Jvsok=
Content-Type: multipart/mixed; boundary="===============9210297231179095090=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] harfbuzz: upgrading to 4.2.0 SUCCEEDED
Message-ID: 
 <010101802ecdea5f-7f6ad6ec-7a57-4501-9db1-64a0a4096cc4-000000@us-west-2.amazonses.com>
Date: Fri, 15 Apr 2022 19:58:08 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.04.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Apr 2022 14:25:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164491

--===============9210297231179095090==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *harfbuzz* to *4.2.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-harfbuzz-upgrade-4.0.1-4.2.0.patch
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
--===============9210297231179095090==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-harfbuzz-upgrade-4.0.1-4.2.0.patch"

From 221d570ec89fcd8d94eab4c8ad484404f97bfe82 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Apr 2022 16:47:14 +0000
Subject: [PATCH] harfbuzz: upgrade 4.0.1 -> 4.2.0

---
 .../harfbuzz/{harfbuzz_4.0.1.bb => harfbuzz_4.2.0.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_4.0.1.bb => harfbuzz_4.2.0.bb} (95%)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_4.0.1.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.0.bb
similarity index 95%
rename from meta/recipes-graphics/harfbuzz/harfbuzz_4.0.1.bb
rename to meta/recipes-graphics/harfbuzz/harfbuzz_4.2.0.bb
index bf77a5e56c..44d42e6904 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_4.0.1.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.0.bb
@@ -12,7 +12,7 @@ UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/releases"
 UPSTREAM_CHECK_REGEX = "harfbuzz-(?P<pver>\d+(\.\d+)+).tar"
 
 SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "98f68777272db6cd7a3d5152bac75083cd52a26176d87bc04c8b3929d33bce49"
+SRC_URI[sha256sum] = "f2200f177768bdc21445aa09703326f3bbe8114ac083d081fe1a79d305c7ae73"
 
 inherit meson pkgconfig lib_package gtk-doc gobject-introspection
 
-- 
2.27.0


--===============9210297231179095090==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 882 .bb files complete (0 cached, 882 parsed). 1640 targets, 62 skipped, 0 masked, 0 errors.
Removing 2 recipes from the mips32r2 sysroot...done.
Removing 2 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "4.0"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:9f041a5dd76d4bbf0a704e134e10f6b049cdd145"
workspace            = "master:81b4d8bc6bdc47a731a1f7ed741d7336559a1348"

Initialising tasks...done.
Sstate summary: Wanted 26 Local 19 Mirrors 0 Missed 7 Current 407 (73% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 410 of 433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 411 of 433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_populate_sysroot_setscene)
NOTE: Running task 1385 of 1554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.0.bb:do_fetch)
NOTE: Running task 1504 of 1554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.0.bb:do_write_config)
NOTE: recipe fontconfig-2.13.1-r0: task do_packagedata_setscene: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe harfbuzz-4.2.0-r0: task do_fetch: Started
NOTE: recipe harfbuzz-4.2.0-r0: task do_write_config: Started
NOTE: recipe harfbuzz-4.2.0-r0: task do_fetch: Succeeded
NOTE: Running task 1512 of 1554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.0.bb:do_unpack)
NOTE: recipe harfbuzz-4.2.0-r0: task do_write_config: Succeeded
NOTE: recipe harfbuzz-4.2.0-r0: task do_unpack: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/fontconfig/2.13.1-r0/temp/log.do_packagedata_setscene.448975
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 428 of 433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_package_setscene)
NOTE: recipe fontconfig-2.13.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe harfbuzz-4.2.0-r0: task do_unpack: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_package_setscene: Started
NOTE: Running task 1513 of 1554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.0.bb:do_patch)
NOTE: recipe harfbuzz-4.2.0-r0: task do_patch: Started
NOTE: recipe harfbuzz-4.2.0-r0: task do_patch: Succeeded
NOTE: Running task 1514 of 1554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1515 of 1554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.0.bb:do_populate_lic)
NOTE: recipe fontconfig-2.13.1-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 430 of 433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.11.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 431 of 433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.11.1.bb:do_populate_sysroot_setscene)
NOTE: recipe harfbuzz-4.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe harfbuzz-4.2.0-r0: task do_populate_lic: Started
NOTE: recipe freetype-2.11.1-r0: task do_packagedata_setscene: Started
NOTE: recipe freetype-2.11.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe harfbuzz-4.2.0-r0: task do_populate_lic: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/freetype/2.11.1-r0/temp/log.do_packagedata_setscene.449242
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.0.bb:do_populate_lic unihash changed to a4503a663adf3826266d2fa03a6b15bfdb467e0b8764c822e9b75a53663f2da9
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.11.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe freetype-2.11.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 432 of 433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.11.1.bb:do_package_setscene)
NOTE: recipe harfbuzz-4.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe freetype-2.11.1-r0: task do_package_setscene: Started
NOTE: recipe freetype-2.11.1-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1539 of 1554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.11.1.bb:do_packagedata)
NOTE: Running task 1541 of 1554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe freetype-2.11.1-r0: task do_packagedata: Started
NOTE: recipe harfbuzz-4.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe freetype-2.11.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1543 of 1554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_packagedata)
NOTE: recipe fontconfig-2.13.1-r0: task do_packagedata: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_packagedata: Succeeded
NOTE: recipe harfbuzz-4.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1546 of 1554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.0.bb:do_configure)
NOTE: recipe harfbuzz-4.2.0-r0: task do_configure: Started
NOTE: recipe harfbuzz-4.2.0-r0: task do_configure: Succeeded
NOTE: Running task 1547 of 1554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.0.bb:do_compile)
NOTE: recipe harfbuzz-4.2.0-r0: task do_compile: Started
NOTE: recipe harfbuzz-4.2.0-r0: task do_compile: Succeeded
NOTE: Running task 1548 of 1554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.0.bb:do_install)
NOTE: recipe harfbuzz-4.2.0-r0: task do_install: Started
NOTE: recipe harfbuzz-4.2.0-r0: task do_install: Succeeded
NOTE: Running task 1549 of 1554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.0.bb:do_package)
NOTE: Running task 1550 of 1554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.0.bb:do_populate_sysroot)
NOTE: recipe harfbuzz-4.2.0-r0: task do_package: Started
NOTE: recipe harfbuzz-4.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe harfbuzz-4.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe harfbuzz-4.2.0-r0: task do_package: Succeeded
NOTE: Running task 1551 of 1554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.0.bb:do_packagedata)
NOTE: recipe harfbuzz-4.2.0-r0: task do_packagedata: Started
NOTE: recipe harfbuzz-4.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1552 of 1554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.0.bb:do_package_write_rpm)
NOTE: Running task 1553 of 1554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.0.bb:do_package_qa)
NOTE: recipe harfbuzz-4.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe harfbuzz-4.2.0-r0: task do_package_qa: Started
NOTE: recipe harfbuzz-4.2.0-r0: task do_package_qa: Succeeded
NOTE: recipe harfbuzz-4.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1554 of 1554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.0.bb:do_build)
NOTE: Tasks Summary: Attempted 1554 tasks of which 1536 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 17 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: fontconfig-2.13.1-r0 do_packagedata_setscene: QA Issue: Package version for package fontconfig-src went backwards which would break package feeds (from 0:2.14.0-r0 to 0:2.13.1-r0) [version-going-backwards]
ERROR: fontconfig-2.13.1-r0 do_packagedata_setscene: QA Issue: Package version for package fontconfig-dbg went backwards which would break package feeds (from 0:2.14.0-r0 to 0:2.13.1-r0) [version-going-backwards]
ERROR: fontconfig-2.13.1-r0 do_packagedata_setscene: QA Issue: Package version for package fontconfig-utils went backwards which would break package feeds (from 0:2.14.0-r0 to 0:2.13.1-r0) [version-going-backwards]
ERROR: fontconfig-2.13.1-r0 do_packagedata_setscene: QA Issue: Package version for package fontconfig-staticdev went backwards which would break package feeds (from 0:2.14.0-r0 to 0:2.13.1-r0) [version-going-backwards]
ERROR: fontconfig-2.13.1-r0 do_packagedata_setscene: QA Issue: Package version for package fontconfig-dev went backwards which would break package feeds (from 0:2.14.0-r0 to 0:2.13.1-r0) [version-going-backwards]
ERROR: fontconfig-2.13.1-r0 do_packagedata_setscene: QA Issue: Package version for package fontconfig-doc went backwards which would break package feeds (from 0:2.14.0-r0 to 0:2.13.1-r0) [version-going-backwards]
ERROR: fontconfig-2.13.1-r0 do_packagedata_setscene: QA Issue: Package version for package fontconfig went backwards which would break package feeds (from 0:2.14.0-r0 to 0:2.13.1-r0) [version-going-backwards]
ERROR: fontconfig-2.13.1-r0 do_packagedata_setscene: QA Issue: Package version for package fontconfig-locale-zh-cn went backwards which would break package feeds (from 0:2.14.0-r0 to 0:2.13.1-r0) [version-going-backwards]
ERROR: fontconfig-2.13.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: freetype-2.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package freetype-src went backwards which would break package feeds (from 0:2.12.0-r0 to 0:2.11.1-r0) [version-going-backwards]
ERROR: freetype-2.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package freetype-dbg went backwards which would break package feeds (from 0:2.12.0-r0 to 0:2.11.1-r0) [version-going-backwards]
ERROR: freetype-2.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package freetype-staticdev went backwards which would break package feeds (from 0:2.12.0-r0 to 0:2.11.1-r0) [version-going-backwards]
ERROR: freetype-2.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package freetype-dev went backwards which would break package feeds (from 0:2.12.0-r0 to 0:2.11.1-r0) [version-going-backwards]
ERROR: freetype-2.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package freetype-doc went backwards which would break package feeds (from 0:2.12.0-r0 to 0:2.11.1-r0) [version-going-backwards]
ERROR: freetype-2.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package freetype-locale went backwards which would break package feeds (from 0:2.12.0-r0 to 0:2.11.1-r0) [version-going-backwards]
ERROR: freetype-2.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package freetype went backwards which would break package feeds (from 0:2.12.0-r0 to 0:2.11.1-r0) [version-going-backwards]
ERROR: freetype-2.11.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============9210297231179095090==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 882 .bb files complete (0 cached, 882 parsed). 1640 targets, 52 skipped, 0 masked, 0 errors.
Removing 2 recipes from the cortexa15t2hf-neon sysroot...done.
Removing 2 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "4.0"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:9f041a5dd76d4bbf0a704e134e10f6b049cdd145"
workspace            = "master:81b4d8bc6bdc47a731a1f7ed741d7336559a1348"

Initialising tasks...done.
Sstate summary: Wanted 26 Local 19 Mirrors 0 Missed 7 Current 407 (73% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 410 of 433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 411 of 433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_populate_sysroot_setscene)
NOTE: Running task 1385 of 1554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.0.bb:do_fetch)
NOTE: Running task 1504 of 1554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.0.bb:do_write_config)
NOTE: recipe fontconfig-2.13.1-r0: task do_packagedata_setscene: Started
NOTE: recipe harfbuzz-4.2.0-r0: task do_write_config: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe harfbuzz-4.2.0-r0: task do_fetch: Started
NOTE: recipe harfbuzz-4.2.0-r0: task do_fetch: Succeeded
NOTE: recipe harfbuzz-4.2.0-r0: task do_write_config: Succeeded
NOTE: Running task 1512 of 1554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.0.bb:do_unpack)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/fontconfig/2.13.1-r0/temp/log.do_packagedata_setscene.441566
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 428 of 433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_package_setscene)
NOTE: recipe harfbuzz-4.2.0-r0: task do_unpack: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe harfbuzz-4.2.0-r0: task do_unpack: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_package_setscene: Started
NOTE: Running task 1513 of 1554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.0.bb:do_patch)
NOTE: recipe harfbuzz-4.2.0-r0: task do_patch: Started
NOTE: recipe harfbuzz-4.2.0-r0: task do_patch: Succeeded
NOTE: Running task 1514 of 1554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1515 of 1554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.0.bb:do_populate_lic)
NOTE: recipe harfbuzz-4.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe harfbuzz-4.2.0-r0: task do_populate_lic: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 430 of 433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.11.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 431 of 433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.11.1.bb:do_populate_sysroot_setscene)
NOTE: recipe freetype-2.11.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe freetype-2.11.1-r0: task do_packagedata_setscene: Started
NOTE: recipe harfbuzz-4.2.0-r0: task do_populate_lic: Succeeded
NOTE: recipe harfbuzz-4.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.0.bb:do_populate_lic unihash changed to a4503a663adf3826266d2fa03a6b15bfdb467e0b8764c822e9b75a53663f2da9
NOTE: recipe freetype-2.11.1-r0: task do_populate_sysroot_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/freetype/2.11.1-r0/temp/log.do_packagedata_setscene.441867
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.11.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 432 of 433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.11.1.bb:do_package_setscene)
NOTE: recipe freetype-2.11.1-r0: task do_package_setscene: Started
NOTE: recipe freetype-2.11.1-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1539 of 1554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.11.1.bb:do_packagedata)
NOTE: Running task 1541 of 1554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe harfbuzz-4.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe freetype-2.11.1-r0: task do_packagedata: Started
NOTE: recipe freetype-2.11.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1543 of 1554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_packagedata)
NOTE: recipe fontconfig-2.13.1-r0: task do_packagedata: Started
NOTE: recipe harfbuzz-4.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1544 of 1554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.0.bb:do_configure)
NOTE: recipe fontconfig-2.13.1-r0: task do_packagedata: Succeeded
NOTE: recipe harfbuzz-4.2.0-r0: task do_configure: Started
NOTE: recipe harfbuzz-4.2.0-r0: task do_configure: Succeeded
NOTE: Running task 1547 of 1554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.0.bb:do_compile)
NOTE: recipe harfbuzz-4.2.0-r0: task do_compile: Started
NOTE: recipe harfbuzz-4.2.0-r0: task do_compile: Succeeded
NOTE: Running task 1548 of 1554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.0.bb:do_install)
NOTE: recipe harfbuzz-4.2.0-r0: task do_install: Started
NOTE: recipe harfbuzz-4.2.0-r0: task do_install: Succeeded
NOTE: Running task 1549 of 1554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.0.bb:do_package)
NOTE: Running task 1550 of 1554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.0.bb:do_populate_sysroot)
NOTE: recipe harfbuzz-4.2.0-r0: task do_package: Started
NOTE: recipe harfbuzz-4.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe harfbuzz-4.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe harfbuzz-4.2.0-r0: task do_package: Succeeded
NOTE: Running task 1551 of 1554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.0.bb:do_packagedata)
NOTE: recipe harfbuzz-4.2.0-r0: task do_packagedata: Started
NOTE: recipe harfbuzz-4.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1552 of 1554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.0.bb:do_package_write_rpm)
NOTE: Running task 1553 of 1554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.0.bb:do_package_qa)
NOTE: recipe harfbuzz-4.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe harfbuzz-4.2.0-r0: task do_package_qa: Started
NOTE: recipe harfbuzz-4.2.0-r0: task do_package_qa: Succeeded
NOTE: recipe harfbuzz-4.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1554 of 1554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.0.bb:do_build)
NOTE: Tasks Summary: Attempted 1554 tasks of which 1536 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 17 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: fontconfig-2.13.1-r0 do_packagedata_setscene: QA Issue: Package version for package fontconfig-src went backwards which would break package feeds (from 0:2.14.0-r0 to 0:2.13.1-r0) [version-going-backwards]
ERROR: fontconfig-2.13.1-r0 do_packagedata_setscene: QA Issue: Package version for package fontconfig-dbg went backwards which would break package feeds (from 0:2.14.0-r0 to 0:2.13.1-r0) [version-going-backwards]
ERROR: fontconfig-2.13.1-r0 do_packagedata_setscene: QA Issue: Package version for package fontconfig-utils went backwards which would break package feeds (from 0:2.14.0-r0 to 0:2.13.1-r0) [version-going-backwards]
ERROR: fontconfig-2.13.1-r0 do_packagedata_setscene: QA Issue: Package version for package fontconfig-staticdev went backwards which would break package feeds (from 0:2.14.0-r0 to 0:2.13.1-r0) [version-going-backwards]
ERROR: fontconfig-2.13.1-r0 do_packagedata_setscene: QA Issue: Package version for package fontconfig-dev went backwards which would break package feeds (from 0:2.14.0-r0 to 0:2.13.1-r0) [version-going-backwards]
ERROR: fontconfig-2.13.1-r0 do_packagedata_setscene: QA Issue: Package version for package fontconfig-doc went backwards which would break package feeds (from 0:2.14.0-r0 to 0:2.13.1-r0) [version-going-backwards]
ERROR: fontconfig-2.13.1-r0 do_packagedata_setscene: QA Issue: Package version for package fontconfig went backwards which would break package feeds (from 0:2.14.0-r0 to 0:2.13.1-r0) [version-going-backwards]
ERROR: fontconfig-2.13.1-r0 do_packagedata_setscene: QA Issue: Package version for package fontconfig-locale-zh-cn went backwards which would break package feeds (from 0:2.14.0-r0 to 0:2.13.1-r0) [version-going-backwards]
ERROR: fontconfig-2.13.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: freetype-2.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package freetype-src went backwards which would break package feeds (from 0:2.12.0-r0 to 0:2.11.1-r0) [version-going-backwards]
ERROR: freetype-2.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package freetype-dbg went backwards which would break package feeds (from 0:2.12.0-r0 to 0:2.11.1-r0) [version-going-backwards]
ERROR: freetype-2.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package freetype-staticdev went backwards which would break package feeds (from 0:2.12.0-r0 to 0:2.11.1-r0) [version-going-backwards]
ERROR: freetype-2.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package freetype-dev went backwards which would break package feeds (from 0:2.12.0-r0 to 0:2.11.1-r0) [version-going-backwards]
ERROR: freetype-2.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package freetype-doc went backwards which would break package feeds (from 0:2.12.0-r0 to 0:2.11.1-r0) [version-going-backwards]
ERROR: freetype-2.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package freetype-locale went backwards which would break package feeds (from 0:2.12.0-r0 to 0:2.11.1-r0) [version-going-backwards]
ERROR: freetype-2.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package freetype went backwards which would break package feeds (from 0:2.12.0-r0 to 0:2.11.1-r0) [version-going-backwards]
ERROR: freetype-2.11.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============9210297231179095090==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/harfbuzz/harfbuzz-icu: FILELIST: removed "/usr/lib/libharfbuzz-icu.so.0.40001.0", added "/usr/lib/libharfbuzz-icu.so.0.40200.0"
packages/core2-32-poky-linux/harfbuzz/harfbuzz-subset: FILELIST: removed "/usr/lib/libharfbuzz-subset.so.0.40001.0", added "/usr/lib/libharfbuzz-subset.so.0.40200.0"
packages/core2-32-poky-linux/harfbuzz/harfbuzz: FILELIST: removed "/usr/lib/libharfbuzz-gobject.so.0.40001.0 /usr/lib/libharfbuzz.so.0.40001.0", added "/usr/lib/libharfbuzz.so.0.40200.0 /usr/lib/libharfbuzz-gobject.so.0.40200.0"
Changes to packages/core2-32-poky-linux/harfbuzz (sysroot):
  /usr/lib/libharfbuzz-gobject.so.0 changed symlink target from libharfbuzz-gobject.so.0.40001.0 to libharfbuzz-gobject.so.0.40200.0
  /usr/lib/libharfbuzz-icu.so.0 changed symlink target from libharfbuzz-icu.so.0.40001.0 to libharfbuzz-icu.so.0.40200.0
  /usr/lib/libharfbuzz.so.0 changed symlink target from libharfbuzz.so.0.40001.0 to libharfbuzz.so.0.40200.0
  /usr/lib/libharfbuzz-subset.so.0 changed symlink target from libharfbuzz-subset.so.0.40001.0 to libharfbuzz-subset.so.0.40200.0
  /usr/lib/libharfbuzz-gobject.so.0.40001.0 moved to /usr/lib/libharfbuzz-gobject.so.0.40200.0
  /usr/lib/libharfbuzz-icu.so.0.40001.0 moved to /usr/lib/libharfbuzz-icu.so.0.40200.0
  /usr/lib/libharfbuzz.so.0.40001.0 moved to /usr/lib/libharfbuzz.so.0.40200.0
  /usr/lib/libharfbuzz-subset.so.0.40001.0 moved to /usr/lib/libharfbuzz-subset.so.0.40200.0
Changes to packages/x86_64-linux/gcc-cross-i686 (sysroot):
  /sysroot-providers/virtual_i686-poky-linux-g++ was added
  /sysroot-providers/virtual_i686-poky-linux-gcc was added
  /usr/bin/i686-poky-linux was added
  /usr/bin/i686-poky-linux/i686-poky-linux-c++ was added
  /usr/bin/i686-poky-linux/i686-poky-linux-cpp was added
  /usr/bin/i686-poky-linux/i686-poky-linux-g++ was added
  /usr/bin/i686-poky-linux/i686-poky-linux-gcc was added
  /usr/bin/i686-poky-linux/i686-poky-linux-gcc-11.2.0 was added
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
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.2.0 was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.2.0/ar was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.2.0/as was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.2.0/cc1 was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.2.0/cc1plus was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.2.0/collect2 was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.2.0/cpp was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.2.0/gcc was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.2.0/g++-mapper-server was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.2.0/i686-poky-linux-ar was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.2.0/i686-poky-linux-as was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.2.0/i686-poky-linux-cpp was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.2.0/i686-poky-linux-gcc was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.2.0/i686-poky-linux-ld.bfd was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.2.0/i686-poky-linux-ld was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.2.0/i686-poky-linux-ld.gold was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.2.0/i686-poky-linux-nm was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.2.0/i686-poky-linux-objcopy was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.2.0/i686-poky-linux-objdump was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.2.0/i686-poky-linux-ranlib was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.2.0/i686-poky-linux-strip was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.2.0/install-tools was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.2.0/install-tools/fixincl was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.2.0/install-tools/fixinc.sh was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.2.0/install-tools/mkheaders was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.2.0/install-tools/mkinstalldirs was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.2.0/ld.bfd was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.2.0/ld was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.2.0/ld.gold was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.2.0/libcc1plugin.so.0.0.0 was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.2.0/libcc1plugin.so.0 was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.2.0/libcc1plugin.so was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.2.0/libcc1.so.0.0.0 was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.2.0/libcc1.so.0 was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.2.0/libcc1.so was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.2.0/libcp1plugin.so.0.0.0 was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.2.0/libcp1plugin.so.0 was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.2.0/libcp1plugin.so was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.2.0/liblto_plugin.so was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.2.0/lto1 was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.2.0/lto-wrapper was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.2.0/nm was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.2.0/objcopy was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.2.0/objdump was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/gengtype was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.2.0/ranlib was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.2.0/strip was added
  /usr/lib/i686-poky-linux was added
  /usr/lib/i686-poky-linux/bfd-plugins was added
  /usr/lib/i686-poky-linux/bfd-plugins/liblto_plugin.so was added
  /usr/lib/i686-poky-linux/gcc was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0 was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/adxintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/ammintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/amxbf16intrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/amxint8intrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/amxtileintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/avx2intrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/avx5124fmapsintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/avx5124vnniwintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/avx512bf16intrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/avx512bf16vlintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/avx512bitalgintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/avx512bwintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/avx512cdintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/avx512dqintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/avx512erintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/avx512fintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/avx512ifmaintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/avx512ifmavlintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/avx512pfintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/avx512vbmi2intrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/avx512vbmi2vlintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/avx512vbmiintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/avx512vbmivlintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/avx512vlbwintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/avx512vldqintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/avx512vlintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/avx512vnniintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/avx512vnnivlintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/avx512vp2intersectintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/avx512vp2intersectvlintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/avx512vpopcntdqintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/avx512vpopcntdqvlintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/avxintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/avxvnniintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/bmi2intrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/bmiintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/bmmintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/cet.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/cetintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/cldemoteintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/clflushoptintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/clwbintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/clzerointrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/cpuid.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/cross-stdarg.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/emmintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/enqcmdintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/f16cintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include-fixed was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include-fixed/limits.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include-fixed/README was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include-fixed/syslimits.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/float.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/fma4intrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/fmaintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/fxsrintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/gfniintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/hresetintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/ia32intrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/immintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/iso646.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/keylockerintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/lwpintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/lzcntintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/mm3dnow.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/mmintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/mm_malloc.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/movdirintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/mwaitxintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/nmmintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/pconfigintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/pkuintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/pmmintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/popcntintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/prfchwintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/quadmath.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/quadmath_weak.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/rdseedintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/rtmintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/serializeintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/sgxintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/shaintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/smmintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/stdalign.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/stdarg.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/stdatomic.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/stdbool.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/stddef.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/stdfix.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/stdint-gcc.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/stdint.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/stdnoreturn.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/tbmintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/tmmintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/tsxldtrkintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/uintrintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/unwind.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/vaesintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/varargs.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/vpclmulqdqintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/waitpkgintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/wbnoinvdintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/wmmintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/x86gprintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/x86intrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/xmmintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/xopintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/xsavecintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/xsaveintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/xsaveoptintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/xsavesintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/xtestintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/install-tools was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/install-tools/fixinc_list was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/install-tools/gsyslimits.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/install-tools/include was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/install-tools/include/limits.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/install-tools/include/README was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/install-tools/macro_list was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/install-tools/mkheaders.conf was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/gtype.state was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/ada was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/ada/gcc-interface was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/ada/gcc-interface/ada-tree.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/addresses.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/alias.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/align.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/alloc-pool.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/all-tree.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/ansidecl.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/array-traits.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/asan.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/attr-fnspec.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/attribs.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/auto-host.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/auto-profile.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/backend.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/basic-block.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/bb-reorder.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/b-header-vars was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/bitmap.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/brig-builtins.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/builtin-attrs.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/builtins.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/builtins.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/builtin-types.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/bversion.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/calls.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/ccmp.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/c-family was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/c-family/c-common.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/c-family/c-common.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/c-family/c-objc.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/c-family/c-pragma.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/c-family/c-pretty-print.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/cfganal.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/cfgbuild.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/cfgcleanup.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/cfgexpand.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/cfg-flags.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/cfg.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/cfghooks.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/cfgloop.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/cfgloopmanip.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/cfgrtl.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/cgraph.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/cif-code.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/collect2-aix.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/collect2.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/collect-utils.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/color-macros.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/common was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/common/config was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/common/config/i386 was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/common/config/i386/i386-cpuinfo.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/conditions.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/config was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/configargs.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/config/dbxelf.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/config/elfos.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/config/glibc-stdint.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/config/gnu-user.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/config.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/config/i386 was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/config/i386/att.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/config/i386/gnu-user64.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/config/i386/gnu-user-common.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/config/i386/i386.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/config/i386/i386-opts.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/config/i386/i386-protos.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/config/i386/linux64.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/config/i386/linux-common.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/config/i386/stringop.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/config/i386/unix.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/config/i386/x86-64.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/config/i386/x86-tune.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/config/initfini-array.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/config/linux-android.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/config/linux.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/config/linux-protos.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/config/vxworks-dummy.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/context.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/convert.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/coretypes.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/coroutine-builtins.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/coverage.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/cp was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/cp/cp-tree.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/cp/cp-tree.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/cp/cxx-pretty-print.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/cp/name-lookup.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/cp/operators.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/cppbuiltin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/cppdefault.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/cpplib.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/cp/type-utils.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/cselib.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/c-tree.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/d was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/data-streamer.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/dbgcnt.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/dbgcnt.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/dbxout.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/dce.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/ddg.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/d/d-tree.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/debug.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/defaults.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/df.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/dfp.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/diagnostic-color.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/diagnostic-core.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/diagnostic.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/diagnostic-event-id.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/diagnostic.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/diagnostic-metadata.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/diagnostic-path.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/diagnostic-url.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/digraph.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/dojump.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/dominance.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/domwalk.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/double-int.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/dump-context.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/dumpfile.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/dwarf2asm.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/dwarf2out.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/edit-context.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/emit-rtl.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/errors.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/escaped_string.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/et-forest.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/except.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/explow.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/expmed.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/expr.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/fibonacci_heap.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/file-find.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/filenames.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/file-prefix-map.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/fixed-value.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/flags.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/flag-types.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/fold-const-call.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/fold-const.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/function-abi.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/function.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/gcc.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/gcc-plugin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/gcc-rich-location.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/gcc-symtab.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/gcov-counter.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/gcov-io.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/gcse-common.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/gcse.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/generic-match.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/gengtype.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/genrtl.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/gensupport.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/ggc.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/ggc-internal.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/gimple-array-bounds.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/gimple-builder.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/gimple.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/gimple-expr.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/gimple-fold.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/gimple.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/gimple-iterator.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/gimple-low.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/gimple-match.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/gimple-predict.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/gimple-pretty-print.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/gimple-range-cache.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/gimple-range-edge.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/gimple-range-gori.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/gimple-range.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/gimple-ssa-evrp-analyze.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/gimple-ssa.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/gimple-ssa-warn-restrict.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/gimple-streamer.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/gimple-walk.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/gimplify.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/gimplify-me.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/glimits.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/gomp-constants.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/graphds.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/graph.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/graphite.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/graphviz.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/gsstruct.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/gstab.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/gsyms.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/gsyslimits.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/gtm-builtins.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/gtype-desc.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/hard-reg-set.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/hash-map.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/hash-map-traits.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/hash-set.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/hashtab.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/hash-table.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/hash-traits.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/highlev-plugin-common.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/hooks.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/hosthooks-def.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/hosthooks.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/hw-doloop.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/hwint.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/ifcvt.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/inchash.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/incpath.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/input.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/insn-addr.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/insn-attr-common.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/insn-attr.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/insn-codes.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/insn-config.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/insn-constants.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/insn-flags.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/insn-modes.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/insn-modes-inline.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/insn-notes.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/internal-fn.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/internal-fn.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/intl.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/int-vector-builder.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/ipa-fnsummary.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/ipa-icf-gimple.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/ipa-icf.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/ipa-inline.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/ipa-modref.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/ipa-modref-tree.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/ipa-param-manipulation.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/ipa-predicate.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/ipa-prop.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/ipa-reference.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/ipa-ref.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/ipa-utils.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/ira.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/ira-int.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/is-a.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/iterator-utils.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/json.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/langhooks-def.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/langhooks.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/lcm.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/libfuncs.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/libiberty.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/limitx.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/limity.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/line-map.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/linux.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/loop-unroll.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/lower-subreg.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/lra.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/lra-int.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/lto-compress.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/lto-section-names.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/lto-streamer.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/machmode.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/machmode.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/md5.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/memmodel.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/memory-block.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/mem-stats.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/mem-stats-traits.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/mode-classes.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/mux-utils.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/objc was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/objc/objc-tree.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/obstack.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/obstack-utils.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/omp-builtins.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/omp-expand.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/omp-general.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/omp-low.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/omp-offload.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/omp-simd-clone.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/optabs.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/optabs.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/optabs-libfuncs.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/optabs-query.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/optabs-tree.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/optinfo-emit-json.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/optinfo.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/options.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/opt-problem.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/opts-diagnostic.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/opts.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/opt-suggestions.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/ordered-hash-map.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/output.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/passes.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/pass-instances.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/pass_manager.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/plugin-api.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/plugin.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/plugin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/plugin-version.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/poly-int.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/poly-int-types.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/predict.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/predict.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/prefix.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/pretty-print.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/print-rtl.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/print-tree.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/profile-count.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/profile.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/range.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/range-op.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/read-md.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/read-rtl-function.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/real.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/realmpfr.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/recog.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/regcprop.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/reg-notes.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/regrename.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/regset.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/regs.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/reload.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/resource.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/rtlanal.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/rtl.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/rtl-error.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/rtl.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/rtlhash.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/rtlhooks-def.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/rtl-iter.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/rtl-ssa.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/rtx-vector-builder.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/run-rtl-passes.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/safe-ctype.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/sanitizer.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/sbitmap.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/sched-int.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/selftest-diagnostic.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/selftest.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/selftest-rtl.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/sel-sched-dump.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/sel-sched.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/sel-sched-ir.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/sese.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/shortest-paths.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/shrink-wrap.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/signop.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/sparseset.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/spellcheck.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/spellcheck-tree.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/splay-tree.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/splay-tree-utils.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/sreal.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/ssa.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/ssa-iterators.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/stab.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/statistics.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/stmt.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/stor-layout.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/streamer-hooks.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/stringpool.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/substring-locations.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/symbol-summary.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/symtab-clones.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/symtab.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/symtab-thunks.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/sync-builtins.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/system.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/target.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/target-def.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/target-globals.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/target.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/target-hooks-macros.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/target-insns.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/targhooks.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/timevar.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/timevar.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/tm.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/tm_p.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/tm-preds.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/toplev.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/tracer.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/trans-mem.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/tree-affine.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/tree-cfgcleanup.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/tree-cfg.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/tree-check.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/tree-chrec.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/tree-core.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/tree-data-ref.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/tree.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/tree-dfa.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/tree-diagnostic.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/tree-dump.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/tree-eh.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/tree.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/tree-hasher.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/tree-hash-traits.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/tree-if-conv.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/tree-inline.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/tree-into-ssa.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/tree-iterator.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/tree-nested.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/tree-object-size.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/tree-outof-ssa.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/tree-parloops.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/tree-pass.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/tree-phinodes.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/tree-pretty-print.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/tree-scalar-evolution.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/tree-sra.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/tree-ssa-address.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/tree-ssa-alias-compare.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/tree-ssa-alias.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/tree-ssa-ccp.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/tree-ssa-coalesce.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/tree-ssa-dce.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/tree-ssa-dom.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/tree-ssa-dse.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/tree-ssa.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/tree-ssa-live.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/tree-ssa-loop.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/tree-ssa-loop-ivopts.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/tree-ssa-loop-manip.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/tree-ssa-loop-niter.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/tree-ssa-math-opts.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/tree-ssanames.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/tree-ssa-operands.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/tree-ssa-propagate.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/tree-ssa-reassoc.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/tree-ssa-sccvn.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/tree-ssa-scopedtables.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/tree-ssa-strlen.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/tree-ssa-ter.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/tree-ssa-threadedge.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/tree-ssa-threadupdate.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/tree-stdarg.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/tree-streamer.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/treestruct.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/tree-switch-conversion.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/tree-vector-builder.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/tree-vectorizer.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/tree-vrp.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/tristate.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/tsan.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/tsystem.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/typeclass.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/typed-splay-tree.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/ubsan.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/valtrack.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/value-prof.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/value-query.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/value-range-equiv.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/value-range.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/varasm.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/vec.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/vec-perm-indices.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/vector-builder.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/version.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/vmsdbg.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/vr-values.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/vtable-verify.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/wide-int-bitmask.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/wide-int.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/wide-int-print.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/xcoff.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/xcoffout.h was added
  /sysroot-providers/virtual_i686-poky-linux-musl-g++ was removed
  /sysroot-providers/virtual_i686-poky-linux-musl-gcc was removed
  /usr/bin/i686-poky-linux-musl was removed
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-c++ was removed
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-cpp was removed
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-g++ was removed
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-gcc was removed
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-gcc-11.2.0 was removed
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
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0 was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/ar was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/as was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/cc1 was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/cc1plus was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/collect2 was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/cpp was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/gcc was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/g++-mapper-server was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/i686-poky-linux-musl-ar was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/i686-poky-linux-musl-as was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/i686-poky-linux-musl-cpp was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/i686-poky-linux-musl-gcc was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/i686-poky-linux-musl-ld.bfd was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/i686-poky-linux-musl-ld was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/i686-poky-linux-musl-ld.gold was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/i686-poky-linux-musl-nm was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/i686-poky-linux-musl-objcopy was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/i686-poky-linux-musl-objdump was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/i686-poky-linux-musl-ranlib was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/i686-poky-linux-musl-strip was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/install-tools was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/install-tools/fixincl was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/install-tools/fixinc.sh was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/install-tools/mkheaders was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/install-tools/mkinstalldirs was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/ld.bfd was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/ld was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/ld.gold was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/libcc1plugin.so.0.0.0 was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/libcc1plugin.so.0 was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/libcc1plugin.so was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/libcc1.so.0.0.0 was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/libcc1.so.0 was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/libcc1.so was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/libcp1plugin.so.0.0.0 was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/libcp1plugin.so.0 was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/libcp1plugin.so was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/liblto_plugin.so was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/lto1 was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/lto-wrapper was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/nm was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/objcopy was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/objdump was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/gengtype was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/ranlib was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/strip was removed
  /usr/lib/i686-poky-linux-musl was removed
  /usr/lib/i686-poky-linux-musl/bfd-plugins was removed
  /usr/lib/i686-poky-linux-musl/bfd-plugins/liblto_plugin.so was removed
  /usr/lib/i686-poky-linux-musl/gcc was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0 was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/adxintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/ammintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/amxbf16intrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/amxint8intrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/amxtileintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/avx2intrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/avx5124fmapsintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/avx5124vnniwintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/avx512bf16intrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/avx512bf16vlintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/avx512bitalgintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/avx512bwintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/avx512cdintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/avx512dqintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/avx512erintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/avx512fintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/avx512ifmaintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/avx512ifmavlintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/avx512pfintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/avx512vbmi2intrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/avx512vbmi2vlintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/avx512vbmiintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/avx512vbmivlintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/avx512vlbwintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/avx512vldqintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/avx512vlintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/avx512vnniintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/avx512vnnivlintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/avx512vp2intersectintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/avx512vp2intersectvlintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/avx512vpopcntdqintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/avx512vpopcntdqvlintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/avxintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/avxvnniintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/bmi2intrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/bmiintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/bmmintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/cet.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/cetintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/cldemoteintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/clflushoptintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/clwbintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/clzerointrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/cpuid.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/cross-stdarg.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/emmintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/enqcmdintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/f16cintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include-fixed was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include-fixed/limits.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include-fixed/README was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include-fixed/syslimits.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/float.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/fma4intrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/fmaintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/fxsrintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/gfniintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/hresetintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/ia32intrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/immintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/iso646.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/keylockerintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/lwpintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/lzcntintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/mm3dnow.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/mmintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/mm_malloc.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/movdirintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/mwaitxintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/nmmintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/pconfigintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/pkuintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/pmmintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/popcntintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/prfchwintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/quadmath.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/quadmath_weak.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/rdseedintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/rtmintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/serializeintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/sgxintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/shaintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/smmintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/stdalign.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/stdarg.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/stdatomic.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/stdbool.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/stddef.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/stdfix.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/stdint-gcc.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/stdint.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/stdnoreturn.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/tbmintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/tmmintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/tsxldtrkintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/uintrintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/unwind.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/vaesintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/varargs.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/vpclmulqdqintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/waitpkgintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/wbnoinvdintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/wmmintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/x86gprintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/x86intrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/xmmintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/xopintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/xsavecintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/xsaveintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/xsaveoptintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/xsavesintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/xtestintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/install-tools was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/install-tools/fixinc_list was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/install-tools/gsyslimits.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/install-tools/include was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/install-tools/include/limits.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/install-tools/include/README was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/install-tools/macro_list was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/install-tools/mkheaders.conf was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/gtype.state was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/ada was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/ada/gcc-interface was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/ada/gcc-interface/ada-tree.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/addresses.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/alias.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/align.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/alloc-pool.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/all-tree.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/ansidecl.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/array-traits.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/asan.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/attr-fnspec.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/attribs.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/auto-host.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/auto-profile.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/backend.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/basic-block.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/bb-reorder.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/b-header-vars was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/bitmap.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/brig-builtins.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/builtin-attrs.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/builtins.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/builtins.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/builtin-types.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/bversion.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/calls.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/ccmp.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/c-family was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/c-family/c-common.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/c-family/c-common.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/c-family/c-objc.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/c-family/c-pragma.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/c-family/c-pretty-print.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/cfganal.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/cfgbuild.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/cfgcleanup.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/cfgexpand.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/cfg-flags.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/cfg.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/cfghooks.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/cfgloop.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/cfgloopmanip.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/cfgrtl.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/cgraph.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/cif-code.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/collect2-aix.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/collect2.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/collect-utils.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/color-macros.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/common was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/common/config was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/common/config/i386 was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/common/config/i386/i386-cpuinfo.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/conditions.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/config was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/configargs.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/config/dbxelf.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/config/elfos.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/config/glibc-stdint.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/config/gnu-user.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/config.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/config/i386 was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/config/i386/att.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/config/i386/gnu-user64.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/config/i386/gnu-user-common.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/config/i386/i386.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/config/i386/i386-opts.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/config/i386/i386-protos.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/config/i386/linux64.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/config/i386/linux-common.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/config/i386/stringop.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/config/i386/unix.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/config/i386/x86-64.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/config/i386/x86-tune.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/config/initfini-array.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/config/linux-android.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/config/linux.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/config/linux-protos.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/config/vxworks-dummy.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/context.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/convert.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/coretypes.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/coroutine-builtins.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/coverage.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/cp was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/cp/cp-tree.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/cp/cp-tree.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/cp/cxx-pretty-print.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/cp/name-lookup.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/cp/operators.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/cppbuiltin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/cppdefault.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/cpplib.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/cp/type-utils.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/cselib.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/c-tree.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/d was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/data-streamer.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/dbgcnt.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/dbgcnt.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/dbxout.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/dce.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/ddg.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/d/d-tree.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/debug.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/defaults.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/df.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/dfp.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/diagnostic-color.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/diagnostic-core.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/diagnostic.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/diagnostic-event-id.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/diagnostic.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/diagnostic-metadata.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/diagnostic-path.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/diagnostic-url.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/digraph.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/dojump.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/dominance.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/domwalk.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/double-int.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/dump-context.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/dumpfile.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/dwarf2asm.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/dwarf2out.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/edit-context.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/emit-rtl.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/errors.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/escaped_string.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/et-forest.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/except.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/explow.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/expmed.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/expr.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/fibonacci_heap.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/file-find.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/filenames.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/file-prefix-map.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/fixed-value.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/flags.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/flag-types.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/fold-const-call.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/fold-const.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/function-abi.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/function.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/gcc.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/gcc-plugin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/gcc-rich-location.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/gcc-symtab.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/gcov-counter.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/gcov-io.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/gcse-common.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/gcse.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/generic-match.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/gengtype.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/genrtl.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/gensupport.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/ggc.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/ggc-internal.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/gimple-array-bounds.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/gimple-builder.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/gimple.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/gimple-expr.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/gimple-fold.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/gimple.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/gimple-iterator.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/gimple-low.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/gimple-match.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/gimple-predict.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/gimple-pretty-print.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/gimple-range-cache.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/gimple-range-edge.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/gimple-range-gori.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/gimple-range.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/gimple-ssa-evrp-analyze.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/gimple-ssa.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/gimple-ssa-warn-restrict.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/gimple-streamer.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/gimple-walk.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/gimplify.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/gimplify-me.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/glimits.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/gomp-constants.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/graphds.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/graph.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/graphite.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/graphviz.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/gsstruct.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/gstab.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/gsyms.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/gsyslimits.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/gtm-builtins.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/gtype-desc.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/hard-reg-set.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/hash-map.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/hash-map-traits.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/hash-set.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/hashtab.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/hash-table.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/hash-traits.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/highlev-plugin-common.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/hooks.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/hosthooks-def.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/hosthooks.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/hw-doloop.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/hwint.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/ifcvt.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/inchash.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/incpath.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/input.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/insn-addr.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/insn-attr-common.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/insn-attr.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/insn-codes.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/insn-config.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/insn-constants.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/insn-flags.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/insn-modes.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/insn-modes-inline.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/insn-notes.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/internal-fn.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/internal-fn.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/intl.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/int-vector-builder.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/ipa-fnsummary.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/ipa-icf-gimple.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/ipa-icf.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/ipa-inline.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/ipa-modref.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/ipa-modref-tree.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/ipa-param-manipulation.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/ipa-predicate.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/ipa-prop.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/ipa-reference.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/ipa-ref.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/ipa-utils.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/ira.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/ira-int.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/is-a.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/iterator-utils.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/json.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/langhooks-def.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/langhooks.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/lcm.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/libfuncs.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/libiberty.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/limitx.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/limity.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/line-map.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/linux.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/loop-unroll.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/lower-subreg.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/lra.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/lra-int.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/lto-compress.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/lto-section-names.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/lto-streamer.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/machmode.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/machmode.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/md5.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/memmodel.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/memory-block.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/mem-stats.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/mem-stats-traits.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/mode-classes.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/mux-utils.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/objc was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/objc/objc-tree.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/obstack.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/obstack-utils.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/omp-builtins.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/omp-expand.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/omp-general.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/omp-low.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/omp-offload.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/omp-simd-clone.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/optabs.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/optabs.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/optabs-libfuncs.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/optabs-query.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/optabs-tree.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/optinfo-emit-json.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/optinfo.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/options.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/opt-problem.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/opts-diagnostic.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/opts.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/opt-suggestions.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/ordered-hash-map.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/output.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/passes.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/pass-instances.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/pass_manager.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/plugin-api.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/plugin.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/plugin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/plugin-version.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/poly-int.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/poly-int-types.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/predict.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/predict.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/prefix.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/pretty-print.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/print-rtl.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/print-tree.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/profile-count.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/profile.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/range.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/range-op.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/read-md.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/read-rtl-function.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/real.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/realmpfr.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/recog.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/regcprop.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/reg-notes.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/regrename.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/regset.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/regs.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/reload.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/resource.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/rtlanal.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/rtl.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/rtl-error.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/rtl.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/rtlhash.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/rtlhooks-def.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/rtl-iter.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/rtl-ssa.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/rtx-vector-builder.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/run-rtl-passes.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/safe-ctype.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/sanitizer.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/sbitmap.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/sched-int.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/selftest-diagnostic.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/selftest.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/selftest-rtl.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/sel-sched-dump.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/sel-sched.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/sel-sched-ir.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/sese.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/shortest-paths.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/shrink-wrap.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/signop.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/sparseset.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/spellcheck.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/spellcheck-tree.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/splay-tree.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/splay-tree-utils.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/sreal.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/ssa.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/ssa-iterators.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/stab.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/statistics.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/stmt.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/stor-layout.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/streamer-hooks.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/stringpool.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/substring-locations.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/symbol-summary.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/symtab-clones.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/symtab.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/symtab-thunks.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/sync-builtins.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/system.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/target.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/target-def.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/target-globals.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/target.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/target-hooks-macros.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/target-insns.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/targhooks.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/timevar.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/timevar.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/tm.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/tm_p.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/tm-preds.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/toplev.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/tracer.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/trans-mem.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/tree-affine.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/tree-cfgcleanup.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/tree-cfg.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/tree-check.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/tree-chrec.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/tree-core.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/tree-data-ref.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/tree.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/tree-dfa.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/tree-diagnostic.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/tree-dump.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/tree-eh.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/tree.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/tree-hasher.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/tree-hash-traits.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/tree-if-conv.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/tree-inline.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/tree-into-ssa.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/tree-iterator.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/tree-nested.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/tree-object-size.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/tree-outof-ssa.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/tree-parloops.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/tree-pass.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/tree-phinodes.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/tree-pretty-print.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/tree-scalar-evolution.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/tree-sra.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/tree-ssa-address.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/tree-ssa-alias-compare.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/tree-ssa-alias.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/tree-ssa-ccp.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/tree-ssa-coalesce.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/tree-ssa-dce.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/tree-ssa-dom.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/tree-ssa-dse.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/tree-ssa.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/tree-ssa-live.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/tree-ssa-loop.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/tree-ssa-loop-ivopts.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/tree-ssa-loop-manip.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/tree-ssa-loop-niter.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/tree-ssa-math-opts.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/tree-ssanames.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/tree-ssa-operands.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/tree-ssa-propagate.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/tree-ssa-reassoc.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/tree-ssa-sccvn.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/tree-ssa-scopedtables.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/tree-ssa-strlen.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/tree-ssa-ter.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/tree-ssa-threadedge.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/tree-ssa-threadupdate.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/tree-stdarg.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/tree-streamer.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/treestruct.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/tree-switch-conversion.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/tree-vector-builder.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/tree-vectorizer.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/tree-vrp.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/tristate.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/tsan.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/tsystem.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/typeclass.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/typed-splay-tree.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/ubsan.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/valtrack.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/value-prof.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/value-query.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/value-range-equiv.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/value-range.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/varasm.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/vec.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/vec-perm-indices.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/vector-builder.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/version.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/vmsdbg.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/vr-values.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/vtable-verify.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/wide-int-bitmask.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/wide-int.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/wide-int-print.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/xcoff.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/xcoffout.h was removed

--===============9210297231179095090==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 882 .bb files complete (0 cached, 882 parsed). 1641 targets, 50 skipped, 0 masked, 0 errors.
Removing 60 recipes from the core2-32 sysroot...done.
Removing 60 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.0"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:9f041a5dd76d4bbf0a704e134e10f6b049cdd145"
workspace            = "master:81b4d8bc6bdc47a731a1f7ed741d7336559a1348"

Initialising tasks...done.
Sstate summary: Wanted 267 Local 260 Mirrors 0 Missed 7 Current 165 (97% match, 98% complete)
Removing 2 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 172 of 432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 173 of 432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 176 of 432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 177 of 432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 180 of 432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_70.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 181 of 432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_70.1.bb:do_populate_sysroot_setscene)
NOTE: Running task 755 of 1546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.0.bb:do_fetch)
NOTE: Running task 778 of 1546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.0.bb:do_write_config)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_packagedata_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe icu-70.1-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-70.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe harfbuzz-4.2.0-r0: task do_fetch: Started
NOTE: recipe harfbuzz-4.2.0-r0: task do_write_config: Started
NOTE: recipe harfbuzz-4.2.0-r0: task do_fetch: Succeeded
NOTE: Running task 779 of 1546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.0.bb:do_unpack)
NOTE: recipe harfbuzz-4.2.0-r0: task do_write_config: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe harfbuzz-4.2.0-r0: task do_unpack: Started
NOTE: recipe icu-70.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 191 of 432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 192 of 432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 193 of 432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.0.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 194 of 432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 195 of 432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_packagedata_setscene)
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 197 of 432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 198 of 432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.0.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 199 of 432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 200 of 432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 201 of 432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.0.bb:do_populate_sysroot_setscene)
NOTE: recipe icu-70.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_packagedata_setscene: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_22.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_22.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 205 of 432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_packagedata_setscene)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/fontconfig/2.13.1-r0/temp/log.do_packagedata_setscene.460515
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 206 of 432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_package_setscene)
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 207 of 432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_populate_sysroot_setscene)
NOTE: recipe mesa-2_22.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mesa-2_22.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 209 of 432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.110.bb:do_packagedata_setscene)
NOTE: Running setscene task 210 of 432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.110.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 212 of 432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 213 of 432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 214 of 432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 215 of 432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 218 of 432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 219 of 432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 220 of 432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 221 of 432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 222 of 432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 223 of 432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.110-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.20.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.110-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 230 of 432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_packagedata_setscene)
NOTE: Running setscene task 231 of 432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 233 of 432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_packagedata_setscene)
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libdrm-2.4.110-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.20.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 238 of 432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 239 of 432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe wayland-1.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 241 of 432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.13.bb:do_packagedata_setscene)
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 242 of 432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 245 of 432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.110-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 250 of 432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_packagedata_setscene)
NOTE: Running setscene task 251 of 432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_populate_sysroot_setscene)
NOTE: recipe libxshmfence-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre-8.45-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxml2-2.9.13-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.9.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre-8.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata_setscene: Started
NOTE: recipe libpciaccess-0.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 257 of 432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 258 of 432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 260 of 432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 261 of 432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_populate_sysroot_setscene)
NOTE: recipe libxml2-2.9.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 263 of 432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.4.bb:do_packagedata_setscene)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxml2-2.9.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 267 of 432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libpciaccess-0.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata_setscene: Started
NOTE: recipe harfbuzz-4.2.0-r0: task do_unpack: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 871 of 1546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.0.bb:do_patch)
NOTE: recipe python3-3.10.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.10.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe harfbuzz-4.2.0-r0: task do_patch: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 271 of 432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.3.1.bb:do_packagedata_setscene)
NOTE: recipe libxrender-1_0.9.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 273 of 432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe harfbuzz-4.2.0-r0: task do_patch: Succeeded
NOTE: Running task 880 of 1546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 881 of 1546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.0.bb:do_populate_lic)
NOTE: recipe libx11-1_1.7.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.7.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe harfbuzz-4.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe harfbuzz-4.2.0-r0: task do_populate_lic: Started
NOTE: recipe libx11-1_1.7.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 276 of 432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 277 of 432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata_setscene)
NOTE: recipe fontconfig-2.13.1-r0: task do_package_setscene: Started
NOTE: recipe libx11-1_1.7.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 279 of 432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 280 of 432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.10.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe harfbuzz-4.2.0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.0.bb:do_populate_lic unihash changed to a4503a663adf3826266d2fa03a6b15bfdb467e0b8764c822e9b75a53663f2da9
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe harfbuzz-4.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-3.10.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 282 of 432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 283 of 432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 284 of 432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 285 of 432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 287 of 432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 288 of 432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 289 of 432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 290 of 432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 291 of 432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 292 of 432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 293 of 432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 294 of 432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 295 of 432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 296 of 432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 297 of 432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.38.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 298 of 432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.38.2.bb:do_populate_sysroot_setscene)
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.0.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.38.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.38.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 301 of 432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 302 of 432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 303 of 432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.37.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 304 of 432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.37.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 306 of 432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.11.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 307 of 432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.11.1.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 310 of 432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 311 of 432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 312 of 432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 313 of 432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 314 of 432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 316 of 432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 317 of 432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 318 of 432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 319 of 432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.0.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe readline-8.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.38.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.4.7-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe freetype-2.11.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.37.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe freetype-2.11.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.37.4-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.38.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 330 of 432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.37.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/freetype/2.11.1-r0/temp/log.do_packagedata_setscene.465022
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.11.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe expat-2.4.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 339 of 432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.11.1.bb:do_package_setscene)
NOTE: recipe freetype-2.11.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 345 of 432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 347 of 432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_packagedata_setscene)
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 350 of 432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 352 of 432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_populate_sysroot_setscene)
NOTE: recipe freetype-2.11.1-r0: task do_package_setscene: Started
NOTE: recipe xorgproto-2021.5-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2021.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2021.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2021.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe freetype-2.11.1-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 358 of 432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_packagedata_setscene)
NOTE: Running setscene task 359 of 432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-2.37.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 361 of 432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 362 of 432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 363 of 432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.37.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 364 of 432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.37.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 366 of 432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 367 of 432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 368 of 432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 369 of 432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 370 of 432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 371 of 432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libpng-1.6.37-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpng-1.6.37-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.37.4-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.37.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.37-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpng-1.6.37-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.37.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.37.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 380 of 432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 381 of 432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 387 of 432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 388 of 432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 389 of 432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 390 of 432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.7.bb:do_populate_sysroot_setscene)
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.7-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cracklib-2.9.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 395 of 432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 396 of 432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 401 of 432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_11.2.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 403 of 432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_11.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-11.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-11.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-11.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 405 of 432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_11.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-11.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-11.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 407 of 432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_11.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-11.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 409 of 432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-11.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+7a43f6fea9-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-11.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 410 of 432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+7a43f6fea9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 413 of 432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 414 of 432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 415 of 432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.16.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+7a43f6fea9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.16-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+7a43f6fea9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 417 of 432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 418 of 432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 425 of 432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_11.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-11.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-11.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 429 of 432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.16.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 430 of 432 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.38.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.38-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.38-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1499 of 1546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.11.1.bb:do_packagedata)
NOTE: Running task 1526 of 1546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe freetype-2.11.1-r0: task do_packagedata: Started
NOTE: recipe harfbuzz-4.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe freetype-2.11.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1535 of 1546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_packagedata)
NOTE: recipe fontconfig-2.13.1-r0: task do_packagedata: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_packagedata: Succeeded
NOTE: recipe harfbuzz-4.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1538 of 1546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.0.bb:do_configure)
NOTE: recipe harfbuzz-4.2.0-r0: task do_configure: Started
NOTE: recipe harfbuzz-4.2.0-r0: task do_configure: Succeeded
NOTE: Running task 1539 of 1546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.0.bb:do_compile)
NOTE: recipe harfbuzz-4.2.0-r0: task do_compile: Started
NOTE: recipe harfbuzz-4.2.0-r0: task do_compile: Succeeded
NOTE: Running task 1540 of 1546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.0.bb:do_install)
NOTE: recipe harfbuzz-4.2.0-r0: task do_install: Started
NOTE: recipe harfbuzz-4.2.0-r0: task do_install: Succeeded
NOTE: Running task 1541 of 1546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.0.bb:do_package)
NOTE: Running task 1542 of 1546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.0.bb:do_populate_sysroot)
NOTE: recipe harfbuzz-4.2.0-r0: task do_package: Started
NOTE: recipe harfbuzz-4.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe harfbuzz-4.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe harfbuzz-4.2.0-r0: task do_package: Succeeded
NOTE: Running task 1543 of 1546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.0.bb:do_packagedata)
NOTE: recipe harfbuzz-4.2.0-r0: task do_packagedata: Started
NOTE: recipe harfbuzz-4.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1544 of 1546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.0.bb:do_package_write_rpm)
NOTE: Running task 1545 of 1546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.0.bb:do_package_qa)
NOTE: recipe harfbuzz-4.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe harfbuzz-4.2.0-r0: task do_package_qa: Started
NOTE: recipe harfbuzz-4.2.0-r0: task do_package_qa: Succeeded
NOTE: recipe harfbuzz-4.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1546 of 1546 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.0.bb:do_build)
NOTE: Tasks Summary: Attempted 1546 tasks of which 1528 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: There were 17 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: fontconfig-2.13.1-r0 do_packagedata_setscene: QA Issue: Package version for package fontconfig-src went backwards which would break package feeds (from 0:2.14.0-r0 to 0:2.13.1-r0) [version-going-backwards]
ERROR: fontconfig-2.13.1-r0 do_packagedata_setscene: QA Issue: Package version for package fontconfig-dbg went backwards which would break package feeds (from 0:2.14.0-r0 to 0:2.13.1-r0) [version-going-backwards]
ERROR: fontconfig-2.13.1-r0 do_packagedata_setscene: QA Issue: Package version for package fontconfig-utils went backwards which would break package feeds (from 0:2.14.0-r0 to 0:2.13.1-r0) [version-going-backwards]
ERROR: fontconfig-2.13.1-r0 do_packagedata_setscene: QA Issue: Package version for package fontconfig-staticdev went backwards which would break package feeds (from 0:2.14.0-r0 to 0:2.13.1-r0) [version-going-backwards]
ERROR: fontconfig-2.13.1-r0 do_packagedata_setscene: QA Issue: Package version for package fontconfig-dev went backwards which would break package feeds (from 0:2.14.0-r0 to 0:2.13.1-r0) [version-going-backwards]
ERROR: fontconfig-2.13.1-r0 do_packagedata_setscene: QA Issue: Package version for package fontconfig-doc went backwards which would break package feeds (from 0:2.14.0-r0 to 0:2.13.1-r0) [version-going-backwards]
ERROR: fontconfig-2.13.1-r0 do_packagedata_setscene: QA Issue: Package version for package fontconfig went backwards which would break package feeds (from 0:2.14.0-r0 to 0:2.13.1-r0) [version-going-backwards]
ERROR: fontconfig-2.13.1-r0 do_packagedata_setscene: QA Issue: Package version for package fontconfig-locale-zh-cn went backwards which would break package feeds (from 0:2.14.0-r0 to 0:2.13.1-r0) [version-going-backwards]
ERROR: fontconfig-2.13.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: freetype-2.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package freetype-src went backwards which would break package feeds (from 0:2.12.0-r0 to 0:2.11.1-r0) [version-going-backwards]
ERROR: freetype-2.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package freetype-dbg went backwards which would break package feeds (from 0:2.12.0-r0 to 0:2.11.1-r0) [version-going-backwards]
ERROR: freetype-2.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package freetype-staticdev went backwards which would break package feeds (from 0:2.12.0-r0 to 0:2.11.1-r0) [version-going-backwards]
ERROR: freetype-2.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package freetype-dev went backwards which would break package feeds (from 0:2.12.0-r0 to 0:2.11.1-r0) [version-going-backwards]
ERROR: freetype-2.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package freetype-doc went backwards which would break package feeds (from 0:2.12.0-r0 to 0:2.11.1-r0) [version-going-backwards]
ERROR: freetype-2.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package freetype-locale went backwards which would break package feeds (from 0:2.12.0-r0 to 0:2.11.1-r0) [version-going-backwards]
ERROR: freetype-2.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package freetype went backwards which would break package feeds (from 0:2.12.0-r0 to 0:2.11.1-r0) [version-going-backwards]
ERROR: freetype-2.11.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============9210297231179095090==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1642 entries from dependency cache.
Parsing recipes...done.
Parsing of 882 .bb files complete (881 cached, 1 parsed). 1640 targets, 34 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.0"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:9f041a5dd76d4bbf0a704e134e10f6b049cdd145"
workspace            = "master:81b4d8bc6bdc47a731a1f7ed741d7336559a1348"

Initialising tasks...done.
Sstate summary: Wanted 26 Local 19 Mirrors 0 Missed 7 Current 407 (73% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 410 of 433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 411 of 433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_populate_sysroot_setscene)
NOTE: Running task 1385 of 1554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.0.bb:do_fetch)
NOTE: Running task 1504 of 1554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.0.bb:do_write_config)
NOTE: recipe harfbuzz-4.2.0-r0: task do_fetch: Started
NOTE: recipe harfbuzz-4.2.0-r0: task do_fetch: Succeeded
NOTE: Running task 1512 of 1554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.0.bb:do_unpack)
NOTE: recipe fontconfig-2.13.1-r0: task do_packagedata_setscene: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe harfbuzz-4.2.0-r0: task do_write_config: Started
NOTE: recipe harfbuzz-4.2.0-r0: task do_unpack: Started
NOTE: recipe harfbuzz-4.2.0-r0: task do_write_config: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/fontconfig/2.13.1-r0/temp/log.do_packagedata_setscene.436110
NOTE: recipe fontconfig-2.13.1-r0: task do_populate_sysroot_setscene: Succeeded
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 428 of 433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_package_setscene)
NOTE: recipe harfbuzz-4.2.0-r0: task do_unpack: Succeeded
NOTE: Running task 1513 of 1554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.0.bb:do_patch)
NOTE: recipe harfbuzz-4.2.0-r0: task do_patch: Started
NOTE: recipe harfbuzz-4.2.0-r0: task do_patch: Succeeded
NOTE: Running task 1514 of 1554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1515 of 1554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.0.bb:do_populate_lic)
NOTE: recipe harfbuzz-4.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe harfbuzz-4.2.0-r0: task do_populate_lic: Started
NOTE: recipe harfbuzz-4.2.0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.0.bb:do_populate_lic unihash changed to a4503a663adf3826266d2fa03a6b15bfdb467e0b8764c822e9b75a53663f2da9
NOTE: recipe harfbuzz-4.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_package_setscene: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 430 of 433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.11.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 431 of 433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.11.1.bb:do_populate_sysroot_setscene)
NOTE: recipe freetype-2.11.1-r0: task do_packagedata_setscene: Started
NOTE: recipe freetype-2.11.1-r0: task do_populate_sysroot_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/freetype/2.11.1-r0/temp/log.do_packagedata_setscene.436534
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.11.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 432 of 433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.11.1.bb:do_package_setscene)
NOTE: recipe freetype-2.11.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe freetype-2.11.1-r0: task do_package_setscene: Started
NOTE: recipe freetype-2.11.1-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1539 of 1554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.11.1.bb:do_packagedata)
NOTE: Running task 1541 of 1554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe freetype-2.11.1-r0: task do_packagedata: Started
NOTE: recipe harfbuzz-4.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe freetype-2.11.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1543 of 1554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_packagedata)
NOTE: recipe fontconfig-2.13.1-r0: task do_packagedata: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_packagedata: Succeeded
NOTE: recipe harfbuzz-4.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1546 of 1554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.0.bb:do_configure)
NOTE: recipe harfbuzz-4.2.0-r0: task do_configure: Started
NOTE: recipe harfbuzz-4.2.0-r0: task do_configure: Succeeded
NOTE: Running task 1547 of 1554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.0.bb:do_compile)
NOTE: recipe harfbuzz-4.2.0-r0: task do_compile: Started
NOTE: recipe harfbuzz-4.2.0-r0: task do_compile: Succeeded
NOTE: Running task 1548 of 1554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.0.bb:do_install)
NOTE: recipe harfbuzz-4.2.0-r0: task do_install: Started
NOTE: recipe harfbuzz-4.2.0-r0: task do_install: Succeeded
NOTE: Running task 1549 of 1554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.0.bb:do_package)
NOTE: Running task 1550 of 1554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.0.bb:do_populate_sysroot)
NOTE: recipe harfbuzz-4.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe harfbuzz-4.2.0-r0: task do_package: Started
NOTE: recipe harfbuzz-4.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe harfbuzz-4.2.0-r0: task do_package: Succeeded
NOTE: Running task 1551 of 1554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.0.bb:do_packagedata)
NOTE: recipe harfbuzz-4.2.0-r0: task do_packagedata: Started
NOTE: recipe harfbuzz-4.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1552 of 1554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.0.bb:do_package_write_rpm)
NOTE: Running task 1553 of 1554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.0.bb:do_package_qa)
NOTE: recipe harfbuzz-4.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe harfbuzz-4.2.0-r0: task do_package_qa: Started
NOTE: recipe harfbuzz-4.2.0-r0: task do_package_qa: Succeeded
NOTE: recipe harfbuzz-4.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1554 of 1554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.0.bb:do_build)
NOTE: Tasks Summary: Attempted 1554 tasks of which 1536 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 17 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: fontconfig-2.13.1-r0 do_packagedata_setscene: QA Issue: Package version for package fontconfig-src went backwards which would break package feeds (from 0:2.14.0-r0 to 0:2.13.1-r0) [version-going-backwards]
ERROR: fontconfig-2.13.1-r0 do_packagedata_setscene: QA Issue: Package version for package fontconfig-dbg went backwards which would break package feeds (from 0:2.14.0-r0 to 0:2.13.1-r0) [version-going-backwards]
ERROR: fontconfig-2.13.1-r0 do_packagedata_setscene: QA Issue: Package version for package fontconfig-utils went backwards which would break package feeds (from 0:2.14.0-r0 to 0:2.13.1-r0) [version-going-backwards]
ERROR: fontconfig-2.13.1-r0 do_packagedata_setscene: QA Issue: Package version for package fontconfig-staticdev went backwards which would break package feeds (from 0:2.14.0-r0 to 0:2.13.1-r0) [version-going-backwards]
ERROR: fontconfig-2.13.1-r0 do_packagedata_setscene: QA Issue: Package version for package fontconfig-dev went backwards which would break package feeds (from 0:2.14.0-r0 to 0:2.13.1-r0) [version-going-backwards]
ERROR: fontconfig-2.13.1-r0 do_packagedata_setscene: QA Issue: Package version for package fontconfig-doc went backwards which would break package feeds (from 0:2.14.0-r0 to 0:2.13.1-r0) [version-going-backwards]
ERROR: fontconfig-2.13.1-r0 do_packagedata_setscene: QA Issue: Package version for package fontconfig went backwards which would break package feeds (from 0:2.14.0-r0 to 0:2.13.1-r0) [version-going-backwards]
ERROR: fontconfig-2.13.1-r0 do_packagedata_setscene: QA Issue: Package version for package fontconfig-locale-zh-cn went backwards which would break package feeds (from 0:2.14.0-r0 to 0:2.13.1-r0) [version-going-backwards]
ERROR: fontconfig-2.13.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: freetype-2.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package freetype-src went backwards which would break package feeds (from 0:2.12.0-r0 to 0:2.11.1-r0) [version-going-backwards]
ERROR: freetype-2.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package freetype-dbg went backwards which would break package feeds (from 0:2.12.0-r0 to 0:2.11.1-r0) [version-going-backwards]
ERROR: freetype-2.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package freetype-staticdev went backwards which would break package feeds (from 0:2.12.0-r0 to 0:2.11.1-r0) [version-going-backwards]
ERROR: freetype-2.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package freetype-dev went backwards which would break package feeds (from 0:2.12.0-r0 to 0:2.11.1-r0) [version-going-backwards]
ERROR: freetype-2.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package freetype-doc went backwards which would break package feeds (from 0:2.12.0-r0 to 0:2.11.1-r0) [version-going-backwards]
ERROR: freetype-2.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package freetype-locale went backwards which would break package feeds (from 0:2.12.0-r0 to 0:2.11.1-r0) [version-going-backwards]
ERROR: freetype-2.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package freetype went backwards which would break package feeds (from 0:2.12.0-r0 to 0:2.11.1-r0) [version-going-backwards]
ERROR: freetype-2.11.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============9210297231179095090==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 882 .bb files complete (0 cached, 882 parsed). 1640 targets, 69 skipped, 0 masked, 0 errors.
Removing 2 recipes from the ppc7400 sysroot...done.
Removing 2 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "4.0"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:9f041a5dd76d4bbf0a704e134e10f6b049cdd145"
workspace            = "master:81b4d8bc6bdc47a731a1f7ed741d7336559a1348"

Initialising tasks...done.
Sstate summary: Wanted 26 Local 19 Mirrors 0 Missed 7 Current 407 (73% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 410 of 433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 411 of 433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_populate_sysroot_setscene)
NOTE: Running task 1385 of 1554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.0.bb:do_fetch)
NOTE: Running task 1504 of 1554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.0.bb:do_write_config)
NOTE: recipe fontconfig-2.13.1-r0: task do_packagedata_setscene: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe harfbuzz-4.2.0-r0: task do_fetch: Started
NOTE: recipe harfbuzz-4.2.0-r0: task do_write_config: Started
NOTE: recipe harfbuzz-4.2.0-r0: task do_fetch: Succeeded
NOTE: Running task 1512 of 1554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.0.bb:do_unpack)
NOTE: recipe harfbuzz-4.2.0-r0: task do_write_config: Succeeded
NOTE: recipe harfbuzz-4.2.0-r0: task do_unpack: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/fontconfig/2.13.1-r0/temp/log.do_packagedata_setscene.454199
NOTE: recipe fontconfig-2.13.1-r0: task do_populate_sysroot_setscene: Succeeded
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 428 of 433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_package_setscene)
NOTE: recipe harfbuzz-4.2.0-r0: task do_unpack: Succeeded
NOTE: Running task 1513 of 1554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.0.bb:do_patch)
NOTE: recipe fontconfig-2.13.1-r0: task do_package_setscene: Started
NOTE: recipe harfbuzz-4.2.0-r0: task do_patch: Started
NOTE: recipe harfbuzz-4.2.0-r0: task do_patch: Succeeded
NOTE: Running task 1514 of 1554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1515 of 1554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.0.bb:do_populate_lic)
NOTE: recipe harfbuzz-4.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_package_setscene: Succeeded
NOTE: recipe harfbuzz-4.2.0-r0: task do_populate_lic: Started
NOTE: Running setscene task 430 of 433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.11.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 431 of 433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.11.1.bb:do_populate_sysroot_setscene)
NOTE: recipe freetype-2.11.1-r0: task do_packagedata_setscene: Started
NOTE: recipe freetype-2.11.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe harfbuzz-4.2.0-r0: task do_populate_lic: Succeeded
NOTE: recipe harfbuzz-4.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.0.bb:do_populate_lic unihash changed to a4503a663adf3826266d2fa03a6b15bfdb467e0b8764c822e9b75a53663f2da9
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/freetype/2.11.1-r0/temp/log.do_packagedata_setscene.454461
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.11.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 432 of 433 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.11.1.bb:do_package_setscene)
NOTE: recipe freetype-2.11.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe freetype-2.11.1-r0: task do_package_setscene: Started
NOTE: recipe freetype-2.11.1-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1539 of 1554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.11.1.bb:do_packagedata)
NOTE: Running task 1541 of 1554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe freetype-2.11.1-r0: task do_packagedata: Started
NOTE: recipe harfbuzz-4.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe freetype-2.11.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1543 of 1554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_packagedata)
NOTE: recipe fontconfig-2.13.1-r0: task do_packagedata: Started
NOTE: recipe harfbuzz-4.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1544 of 1554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.0.bb:do_configure)
NOTE: recipe harfbuzz-4.2.0-r0: task do_configure: Started
NOTE: recipe harfbuzz-4.2.0-r0: task do_configure: Succeeded
NOTE: Running task 1547 of 1554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.0.bb:do_compile)
NOTE: recipe harfbuzz-4.2.0-r0: task do_compile: Started
NOTE: recipe harfbuzz-4.2.0-r0: task do_compile: Succeeded
NOTE: Running task 1548 of 1554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.0.bb:do_install)
NOTE: recipe harfbuzz-4.2.0-r0: task do_install: Started
NOTE: recipe harfbuzz-4.2.0-r0: task do_install: Succeeded
NOTE: Running task 1549 of 1554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.0.bb:do_package)
NOTE: Running task 1550 of 1554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.0.bb:do_populate_sysroot)
NOTE: recipe harfbuzz-4.2.0-r0: task do_package: Started
NOTE: recipe harfbuzz-4.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe harfbuzz-4.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe harfbuzz-4.2.0-r0: task do_package: Succeeded
NOTE: Running task 1551 of 1554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.0.bb:do_packagedata)
NOTE: recipe harfbuzz-4.2.0-r0: task do_packagedata: Started
NOTE: recipe harfbuzz-4.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1552 of 1554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.0.bb:do_package_write_rpm)
NOTE: Running task 1553 of 1554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.0.bb:do_package_qa)
NOTE: recipe harfbuzz-4.2.0-r0: task do_package_write_rpm: Started
NOTE: recipe harfbuzz-4.2.0-r0: task do_package_qa: Started
NOTE: recipe harfbuzz-4.2.0-r0: task do_package_qa: Succeeded
NOTE: recipe harfbuzz-4.2.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1554 of 1554 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_4.2.0.bb:do_build)
NOTE: Tasks Summary: Attempted 1554 tasks of which 1536 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 17 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: fontconfig-2.13.1-r0 do_packagedata_setscene: QA Issue: Package version for package fontconfig-src went backwards which would break package feeds (from 0:2.14.0-r0 to 0:2.13.1-r0) [version-going-backwards]
ERROR: fontconfig-2.13.1-r0 do_packagedata_setscene: QA Issue: Package version for package fontconfig-dbg went backwards which would break package feeds (from 0:2.14.0-r0 to 0:2.13.1-r0) [version-going-backwards]
ERROR: fontconfig-2.13.1-r0 do_packagedata_setscene: QA Issue: Package version for package fontconfig-utils went backwards which would break package feeds (from 0:2.14.0-r0 to 0:2.13.1-r0) [version-going-backwards]
ERROR: fontconfig-2.13.1-r0 do_packagedata_setscene: QA Issue: Package version for package fontconfig-staticdev went backwards which would break package feeds (from 0:2.14.0-r0 to 0:2.13.1-r0) [version-going-backwards]
ERROR: fontconfig-2.13.1-r0 do_packagedata_setscene: QA Issue: Package version for package fontconfig-dev went backwards which would break package feeds (from 0:2.14.0-r0 to 0:2.13.1-r0) [version-going-backwards]
ERROR: fontconfig-2.13.1-r0 do_packagedata_setscene: QA Issue: Package version for package fontconfig-doc went backwards which would break package feeds (from 0:2.14.0-r0 to 0:2.13.1-r0) [version-going-backwards]
ERROR: fontconfig-2.13.1-r0 do_packagedata_setscene: QA Issue: Package version for package fontconfig went backwards which would break package feeds (from 0:2.14.0-r0 to 0:2.13.1-r0) [version-going-backwards]
ERROR: fontconfig-2.13.1-r0 do_packagedata_setscene: QA Issue: Package version for package fontconfig-locale-zh-cn went backwards which would break package feeds (from 0:2.14.0-r0 to 0:2.13.1-r0) [version-going-backwards]
ERROR: fontconfig-2.13.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: freetype-2.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package freetype-src went backwards which would break package feeds (from 0:2.12.0-r0 to 0:2.11.1-r0) [version-going-backwards]
ERROR: freetype-2.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package freetype-dbg went backwards which would break package feeds (from 0:2.12.0-r0 to 0:2.11.1-r0) [version-going-backwards]
ERROR: freetype-2.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package freetype-staticdev went backwards which would break package feeds (from 0:2.12.0-r0 to 0:2.11.1-r0) [version-going-backwards]
ERROR: freetype-2.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package freetype-dev went backwards which would break package feeds (from 0:2.12.0-r0 to 0:2.11.1-r0) [version-going-backwards]
ERROR: freetype-2.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package freetype-doc went backwards which would break package feeds (from 0:2.12.0-r0 to 0:2.11.1-r0) [version-going-backwards]
ERROR: freetype-2.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package freetype-locale went backwards which would break package feeds (from 0:2.12.0-r0 to 0:2.11.1-r0) [version-going-backwards]
ERROR: freetype-2.11.1-r0 do_packagedata_setscene: QA Issue: Package version for package freetype went backwards which would break package feeds (from 0:2.12.0-r0 to 0:2.11.1-r0) [version-going-backwards]
ERROR: freetype-2.11.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============9210297231179095090==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/harfbuzz/harfbuzz-bin: PKGV changed from 4.0.1 [default] to 4.2.0 [default]
packages/core2-32-poky-linux/harfbuzz/harfbuzz-bin: PV changed from "4.0.1" to "4.2.0"
packages/core2-32-poky-linux/harfbuzz/harfbuzz-dbg: PKGV changed from 4.0.1 [default] to 4.2.0 [default]
packages/core2-32-poky-linux/harfbuzz/harfbuzz-dbg: FILELIST: removed "/usr/lib/.debug/libharfbuzz-gobject.so.0.40001.0 /usr/lib/.debug/libharfbuzz-icu.so.0.40001.0 /usr/lib/.debug/libharfbuzz.so.0.40001.0 /usr/lib/.debug/libharfbuzz-subset.so.0.40001.0", added "/usr/lib/.debug/libharfbuzz-subset.so.0.40200.0 /usr/lib/.debug/libharfbuzz-gobject.so.0.40200.0 /usr/lib/.debug/libharfbuzz-icu.so.0.40200.0 /usr/lib/.debug/libharfbuzz.so.0.40200.0"
packages/core2-32-poky-linux/harfbuzz/harfbuzz-dbg: PKGSIZE changed from 38542780 to 38664264 (+0%)
packages/core2-32-poky-linux/harfbuzz/harfbuzz-dbg: PV changed from "4.0.1" to "4.2.0"
packages/core2-32-poky-linux/harfbuzz/harfbuzz-dev: PKGV changed from 4.0.1 [default] to 4.2.0 [default]
packages/core2-32-poky-linux/harfbuzz/harfbuzz-dev: PKGSIZE changed from 1437091 to 1441023 (+0%)
packages/core2-32-poky-linux/harfbuzz/harfbuzz-dev: PV changed from "4.0.1" to "4.2.0"
packages/core2-32-poky-linux/harfbuzz/harfbuzz-doc: PKGV changed from 4.0.1 [default] to 4.2.0 [default]
packages/core2-32-poky-linux/harfbuzz/harfbuzz-doc: PV changed from "4.0.1" to "4.2.0"
packages/core2-32-poky-linux/harfbuzz/harfbuzz-icu-dev: PKGV changed from 4.0.1 [default] to 4.2.0 [default]
packages/core2-32-poky-linux/harfbuzz/harfbuzz-icu-dev: PV changed from "4.0.1" to "4.2.0"
packages/core2-32-poky-linux/harfbuzz/harfbuzz-icu: PKGV changed from 4.0.1 [default] to 4.2.0 [default]
packages/core2-32-poky-linux/harfbuzz/harfbuzz-icu: FILELIST: removed "/usr/lib/libharfbuzz-icu.so.0.40001.0", added "/usr/lib/libharfbuzz-icu.so.0.40200.0"
packages/core2-32-poky-linux/harfbuzz/harfbuzz-icu: PV changed from "4.0.1" to "4.2.0"
packages/core2-32-poky-linux/harfbuzz/harfbuzz-locale: PKGV changed from 4.0.1 [default] to 4.2.0 [default]
packages/core2-32-poky-linux/harfbuzz/harfbuzz-locale: PV changed from "4.0.1" to "4.2.0"
packages/core2-32-poky-linux/harfbuzz/harfbuzz-src: PKGV changed from 4.0.1 [default] to 4.2.0 [default]
packages/core2-32-poky-linux/harfbuzz/harfbuzz-src: FILELIST: directory renamed /usr/src/debug/harfbuzz/4.0.1-r0/build/src -> /usr/src/debug/harfbuzz/4.2.0-r0/build/src, directory renamed /usr/src/debug/harfbuzz/4.0.1-r0/harfbuzz-4.0.1/src -> /usr/src/debug/harfbuzz/4.2.0-r0/harfbuzz-4.2.0/src, directory renamed /usr/src/debug/harfbuzz/4.0.1-r0/harfbuzz-4.0.1/util -> /usr/src/debug/harfbuzz/4.2.0-r0/harfbuzz-4.2.0/util, added "/usr/src/debug/harfbuzz/4.2.0-r0/harfbuzz-4.2.0/src/OT/Layout/GSUB/LigatureSet.hh /usr/src/debug/harfbuzz/4.2.0-r0/harfbuzz-4.2.0/src/OT/Layout/GSUB/Sequence.hh /usr/src/debug/harfbuzz/4.2.0-r0/harfbuzz-4.2.0/src/OT/Layout/GSUB/MultipleSubst.hh /usr/src/debug/harfbuzz/4.2.0-r0/harfbuzz-4.2.0/src/OT/Layout/GSUB/ReverseChainSingleSubstFormat1.hh /usr/src/debug/harfbuzz/4.2.0-r0/harfbuzz-4.2.0/src/OT/Layout/GSUB/SubstLookup.hh /usr/src/debug/harfbuzz/4.2.0-r0/harfbuzz-4.2.0/src/OT/Layout/GSUB/MultipleSubstFormat1.hh /usr/src/debug/harfbuzz/4.2.0-r0/harfbuzz-4.2.0/
 src/OT/Layout/GSUB/SubstLookupSubTable.hh /usr/src/debug/harfbuzz/4.2.0-r0/harfbuzz-4.2.0/src/OT/Layout/GSUB/ChainContextSubst.hh /usr/src/debug/harfbuzz/4.2.0-r0/harfbuzz-4.2.0/src/OT/Layout/GSUB/SingleSubstFormat1.hh /usr/src/debug/harfbuzz/4.2.0-r0/harfbuzz-4.2.0/src/OT/Layout/GSUB/AlternateSet.hh /usr/src/debug/harfbuzz/4.2.0-r0/harfbuzz-4.2.0/src/OT/Layout/GSUB/SingleSubst.hh /usr/src/debug/harfbuzz/4.2.0-r0/harfbuzz-4.2.0/src/OT/Layout/GSUB/ContextSubst.hh /usr/src/debug/harfbuzz/4.2.0-r0/harfbuzz-4.2.0/src/OT/Layout/GSUB/Ligature.hh /usr/src/debug/harfbuzz/4.2.0-r0/harfbuzz-4.2.0/src/OT/Layout/GSUB/AlternateSubstFormat1.hh /usr/src/debug/harfbuzz/4.2.0-r0/harfbuzz-4.2.0/src/OT/Layout/GSUB/AlternateSubst.hh /usr/src/debug/harfbuzz/4.2.0-r0/harfbuzz-4.2.0/src/OT/Layout/GSUB/ExtensionSubst.hh /usr/src/debug/harfbuzz/4.2.0-r0/harfbuzz-4.2.0/src/OT/Layout/GSUB/ReverseChainSingleSubst.hh /usr/src/debug/harfbuzz/4.2.0-r0/harfbuzz-4.2.0/src/OT/Layout/GSUB/GSUB.hh /usr/src/debug/harfb
 uzz/4.2.0-r0/harfbuzz-4.2.0/src/OT/Layout/GSUB/LigatureSubst.hh /usr/src/debug/harfbuzz/4.2.0-r0/harfbuzz-4.2.0/src/OT/Layout/GSUB/LigatureSubstFormat1.hh /usr/src/debug/harfbuzz/4.2.0-r0/harfbuzz-4.2.0/src/OT/Layout/GSUB/Common.hh /usr/src/debug/harfbuzz/4.2.0-r0/harfbuzz-4.2.0/src/OT/Layout/GSUB/SingleSubstFormat2.hh"
packages/core2-32-poky-linux/harfbuzz/harfbuzz-src: PKGSIZE changed from 3985493 to 4003543 (+0%)
packages/core2-32-poky-linux/harfbuzz/harfbuzz-src: PV changed from "4.0.1" to "4.2.0"
packages/core2-32-poky-linux/harfbuzz/harfbuzz-staticdev: PKGV changed from 4.0.1 [default] to 4.2.0 [default]
packages/core2-32-poky-linux/harfbuzz/harfbuzz-staticdev: PV changed from "4.0.1" to "4.2.0"
packages/core2-32-poky-linux/harfbuzz/harfbuzz-subset: PKGV changed from 4.0.1 [default] to 4.2.0 [default]
packages/core2-32-poky-linux/harfbuzz/harfbuzz-subset: FILELIST: removed "/usr/lib/libharfbuzz-subset.so.0.40001.0", added "/usr/lib/libharfbuzz-subset.so.0.40200.0"
packages/core2-32-poky-linux/harfbuzz/harfbuzz-subset: PV changed from "4.0.1" to "4.2.0"
packages/core2-32-poky-linux/harfbuzz/harfbuzz: PKGV changed from 4.0.1 [default] to 4.2.0 [default]
packages/core2-32-poky-linux/harfbuzz/harfbuzz: FILELIST: removed "/usr/lib/libharfbuzz.so.0.40001.0 /usr/lib/libharfbuzz-gobject.so.0.40001.0", added "/usr/lib/libharfbuzz-gobject.so.0.40200.0 /usr/lib/libharfbuzz.so.0.40200.0"
packages/core2-32-poky-linux/harfbuzz/harfbuzz: PKGSIZE changed from 1417988 to 1426496 (+1%)
packages/core2-32-poky-linux/harfbuzz/harfbuzz: PV changed from "4.0.1" to "4.2.0"
packages/core2-32-poky-linux/harfbuzz: PKGV changed from 4.0.1 [default] to 4.2.0 [default]
packages/core2-32-poky-linux/harfbuzz: SRC_URI changed from "https://github.com/harfbuzz/harfbuzz/releases/download/4.0.1/harfbuzz-4.0.1.tar.xz" to "https://github.com/harfbuzz/harfbuzz/releases/download/4.2.0/harfbuzz-4.2.0.tar.xz"
packages/core2-32-poky-linux/harfbuzz: PV changed from "4.0.1" to "4.2.0"
Changes to packages/core2-32-poky-linux/harfbuzz (sysroot):
  /usr/lib/libharfbuzz-gobject.so.0 changed symlink target from libharfbuzz-gobject.so.0.40001.0 to libharfbuzz-gobject.so.0.40200.0
  /usr/lib/libharfbuzz-icu.so.0 changed symlink target from libharfbuzz-icu.so.0.40001.0 to libharfbuzz-icu.so.0.40200.0
  /usr/lib/libharfbuzz.so.0 changed symlink target from libharfbuzz.so.0.40001.0 to libharfbuzz.so.0.40200.0
  /usr/lib/libharfbuzz-subset.so.0 changed symlink target from libharfbuzz-subset.so.0.40001.0 to libharfbuzz-subset.so.0.40200.0
  /usr/lib/libharfbuzz-gobject.so.0.40001.0 moved to /usr/lib/libharfbuzz-gobject.so.0.40200.0
  /usr/lib/libharfbuzz-icu.so.0.40001.0 moved to /usr/lib/libharfbuzz-icu.so.0.40200.0
  /usr/lib/libharfbuzz.so.0.40001.0 moved to /usr/lib/libharfbuzz.so.0.40200.0
  /usr/lib/libharfbuzz-subset.so.0.40001.0 moved to /usr/lib/libharfbuzz-subset.so.0.40200.0
Changes to packages/x86_64-linux/gcc-cross-i686 (sysroot):
  /sysroot-providers/virtual_i686-poky-linux-g++ was added
  /sysroot-providers/virtual_i686-poky-linux-gcc was added
  /usr/bin/i686-poky-linux was added
  /usr/bin/i686-poky-linux/i686-poky-linux-c++ was added
  /usr/bin/i686-poky-linux/i686-poky-linux-cpp was added
  /usr/bin/i686-poky-linux/i686-poky-linux-g++ was added
  /usr/bin/i686-poky-linux/i686-poky-linux-gcc was added
  /usr/bin/i686-poky-linux/i686-poky-linux-gcc-11.2.0 was added
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
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.2.0 was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.2.0/ar was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.2.0/as was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.2.0/cc1 was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.2.0/cc1plus was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.2.0/collect2 was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.2.0/cpp was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.2.0/gcc was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.2.0/g++-mapper-server was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.2.0/i686-poky-linux-ar was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.2.0/i686-poky-linux-as was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.2.0/i686-poky-linux-cpp was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.2.0/i686-poky-linux-gcc was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.2.0/i686-poky-linux-ld.bfd was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.2.0/i686-poky-linux-ld was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.2.0/i686-poky-linux-ld.gold was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.2.0/i686-poky-linux-nm was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.2.0/i686-poky-linux-objcopy was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.2.0/i686-poky-linux-objdump was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.2.0/i686-poky-linux-ranlib was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.2.0/i686-poky-linux-strip was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.2.0/install-tools was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.2.0/install-tools/fixincl was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.2.0/install-tools/fixinc.sh was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.2.0/install-tools/mkheaders was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.2.0/install-tools/mkinstalldirs was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.2.0/ld.bfd was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.2.0/ld was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.2.0/ld.gold was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.2.0/libcc1plugin.so.0.0.0 was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.2.0/libcc1plugin.so.0 was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.2.0/libcc1plugin.so was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.2.0/libcc1.so.0.0.0 was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.2.0/libcc1.so.0 was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.2.0/libcc1.so was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.2.0/libcp1plugin.so.0.0.0 was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.2.0/libcp1plugin.so.0 was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.2.0/libcp1plugin.so was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.2.0/liblto_plugin.so was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.2.0/lto1 was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.2.0/lto-wrapper was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.2.0/nm was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.2.0/objcopy was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.2.0/objdump was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/gengtype was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.2.0/ranlib was added
  /usr/libexec/i686-poky-linux/gcc/i686-poky-linux/11.2.0/strip was added
  /usr/lib/i686-poky-linux was added
  /usr/lib/i686-poky-linux/bfd-plugins was added
  /usr/lib/i686-poky-linux/bfd-plugins/liblto_plugin.so was added
  /usr/lib/i686-poky-linux/gcc was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0 was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/adxintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/ammintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/amxbf16intrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/amxint8intrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/amxtileintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/avx2intrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/avx5124fmapsintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/avx5124vnniwintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/avx512bf16intrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/avx512bf16vlintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/avx512bitalgintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/avx512bwintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/avx512cdintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/avx512dqintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/avx512erintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/avx512fintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/avx512ifmaintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/avx512ifmavlintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/avx512pfintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/avx512vbmi2intrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/avx512vbmi2vlintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/avx512vbmiintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/avx512vbmivlintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/avx512vlbwintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/avx512vldqintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/avx512vlintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/avx512vnniintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/avx512vnnivlintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/avx512vp2intersectintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/avx512vp2intersectvlintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/avx512vpopcntdqintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/avx512vpopcntdqvlintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/avxintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/avxvnniintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/bmi2intrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/bmiintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/bmmintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/cet.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/cetintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/cldemoteintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/clflushoptintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/clwbintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/clzerointrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/cpuid.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/cross-stdarg.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/emmintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/enqcmdintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/f16cintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include-fixed was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include-fixed/limits.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include-fixed/README was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include-fixed/syslimits.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/float.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/fma4intrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/fmaintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/fxsrintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/gfniintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/hresetintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/ia32intrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/immintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/iso646.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/keylockerintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/lwpintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/lzcntintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/mm3dnow.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/mmintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/mm_malloc.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/movdirintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/mwaitxintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/nmmintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/pconfigintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/pkuintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/pmmintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/popcntintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/prfchwintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/quadmath.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/quadmath_weak.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/rdseedintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/rtmintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/serializeintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/sgxintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/shaintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/smmintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/stdalign.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/stdarg.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/stdatomic.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/stdbool.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/stddef.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/stdfix.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/stdint-gcc.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/stdint.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/stdnoreturn.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/tbmintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/tmmintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/tsxldtrkintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/uintrintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/unwind.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/vaesintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/varargs.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/vpclmulqdqintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/waitpkgintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/wbnoinvdintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/wmmintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/x86gprintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/x86intrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/xmmintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/xopintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/xsavecintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/xsaveintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/xsaveoptintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/xsavesintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/include/xtestintrin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/install-tools was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/install-tools/fixinc_list was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/install-tools/gsyslimits.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/install-tools/include was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/install-tools/include/limits.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/install-tools/include/README was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/install-tools/macro_list was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/install-tools/mkheaders.conf was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/gtype.state was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/ada was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/ada/gcc-interface was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/ada/gcc-interface/ada-tree.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/addresses.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/alias.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/align.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/alloc-pool.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/all-tree.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/ansidecl.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/array-traits.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/asan.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/attr-fnspec.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/attribs.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/auto-host.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/auto-profile.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/backend.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/basic-block.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/bb-reorder.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/b-header-vars was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/bitmap.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/brig-builtins.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/builtin-attrs.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/builtins.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/builtins.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/builtin-types.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/bversion.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/calls.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/ccmp.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/c-family was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/c-family/c-common.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/c-family/c-common.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/c-family/c-objc.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/c-family/c-pragma.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/c-family/c-pretty-print.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/cfganal.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/cfgbuild.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/cfgcleanup.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/cfgexpand.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/cfg-flags.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/cfg.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/cfghooks.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/cfgloop.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/cfgloopmanip.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/cfgrtl.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/cgraph.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/cif-code.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/collect2-aix.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/collect2.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/collect-utils.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/color-macros.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/common was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/common/config was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/common/config/i386 was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/common/config/i386/i386-cpuinfo.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/conditions.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/config was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/configargs.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/config/dbxelf.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/config/elfos.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/config/glibc-stdint.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/config/gnu-user.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/config.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/config/i386 was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/config/i386/att.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/config/i386/gnu-user64.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/config/i386/gnu-user-common.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/config/i386/i386.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/config/i386/i386-opts.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/config/i386/i386-protos.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/config/i386/linux64.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/config/i386/linux-common.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/config/i386/stringop.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/config/i386/unix.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/config/i386/x86-64.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/config/i386/x86-tune.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/config/initfini-array.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/config/linux-android.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/config/linux.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/config/linux-protos.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/config/vxworks-dummy.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/context.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/convert.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/coretypes.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/coroutine-builtins.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/coverage.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/cp was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/cp/cp-tree.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/cp/cp-tree.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/cp/cxx-pretty-print.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/cp/name-lookup.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/cp/operators.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/cppbuiltin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/cppdefault.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/cpplib.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/cp/type-utils.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/cselib.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/c-tree.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/d was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/data-streamer.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/dbgcnt.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/dbgcnt.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/dbxout.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/dce.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/ddg.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/d/d-tree.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/debug.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/defaults.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/df.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/dfp.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/diagnostic-color.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/diagnostic-core.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/diagnostic.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/diagnostic-event-id.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/diagnostic.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/diagnostic-metadata.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/diagnostic-path.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/diagnostic-url.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/digraph.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/dojump.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/dominance.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/domwalk.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/double-int.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/dump-context.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/dumpfile.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/dwarf2asm.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/dwarf2out.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/edit-context.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/emit-rtl.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/errors.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/escaped_string.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/et-forest.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/except.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/explow.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/expmed.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/expr.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/fibonacci_heap.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/file-find.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/filenames.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/file-prefix-map.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/fixed-value.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/flags.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/flag-types.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/fold-const-call.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/fold-const.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/function-abi.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/function.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/gcc.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/gcc-plugin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/gcc-rich-location.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/gcc-symtab.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/gcov-counter.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/gcov-io.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/gcse-common.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/gcse.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/generic-match.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/gengtype.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/genrtl.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/gensupport.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/ggc.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/ggc-internal.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/gimple-array-bounds.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/gimple-builder.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/gimple.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/gimple-expr.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/gimple-fold.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/gimple.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/gimple-iterator.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/gimple-low.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/gimple-match.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/gimple-predict.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/gimple-pretty-print.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/gimple-range-cache.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/gimple-range-edge.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/gimple-range-gori.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/gimple-range.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/gimple-ssa-evrp-analyze.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/gimple-ssa.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/gimple-ssa-warn-restrict.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/gimple-streamer.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/gimple-walk.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/gimplify.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/gimplify-me.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/glimits.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/gomp-constants.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/graphds.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/graph.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/graphite.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/graphviz.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/gsstruct.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/gstab.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/gsyms.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/gsyslimits.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/gtm-builtins.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/gtype-desc.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/hard-reg-set.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/hash-map.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/hash-map-traits.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/hash-set.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/hashtab.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/hash-table.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/hash-traits.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/highlev-plugin-common.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/hooks.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/hosthooks-def.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/hosthooks.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/hw-doloop.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/hwint.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/ifcvt.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/inchash.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/incpath.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/input.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/insn-addr.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/insn-attr-common.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/insn-attr.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/insn-codes.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/insn-config.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/insn-constants.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/insn-flags.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/insn-modes.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/insn-modes-inline.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/insn-notes.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/internal-fn.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/internal-fn.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/intl.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/int-vector-builder.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/ipa-fnsummary.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/ipa-icf-gimple.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/ipa-icf.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/ipa-inline.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/ipa-modref.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/ipa-modref-tree.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/ipa-param-manipulation.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/ipa-predicate.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/ipa-prop.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/ipa-reference.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/ipa-ref.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/ipa-utils.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/ira.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/ira-int.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/is-a.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/iterator-utils.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/json.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/langhooks-def.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/langhooks.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/lcm.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/libfuncs.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/libiberty.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/limitx.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/limity.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/line-map.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/linux.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/loop-unroll.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/lower-subreg.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/lra.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/lra-int.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/lto-compress.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/lto-section-names.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/lto-streamer.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/machmode.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/machmode.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/md5.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/memmodel.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/memory-block.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/mem-stats.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/mem-stats-traits.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/mode-classes.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/mux-utils.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/objc was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/objc/objc-tree.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/obstack.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/obstack-utils.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/omp-builtins.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/omp-expand.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/omp-general.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/omp-low.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/omp-offload.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/omp-simd-clone.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/optabs.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/optabs.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/optabs-libfuncs.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/optabs-query.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/optabs-tree.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/optinfo-emit-json.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/optinfo.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/options.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/opt-problem.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/opts-diagnostic.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/opts.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/opt-suggestions.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/ordered-hash-map.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/output.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/passes.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/pass-instances.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/pass_manager.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/plugin-api.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/plugin.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/plugin.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/plugin-version.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/poly-int.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/poly-int-types.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/predict.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/predict.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/prefix.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/pretty-print.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/print-rtl.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/print-tree.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/profile-count.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/profile.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/range.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/range-op.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/read-md.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/read-rtl-function.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/real.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/realmpfr.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/recog.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/regcprop.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/reg-notes.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/regrename.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/regset.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/regs.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/reload.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/resource.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/rtlanal.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/rtl.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/rtl-error.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/rtl.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/rtlhash.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/rtlhooks-def.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/rtl-iter.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/rtl-ssa.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/rtx-vector-builder.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/run-rtl-passes.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/safe-ctype.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/sanitizer.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/sbitmap.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/sched-int.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/selftest-diagnostic.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/selftest.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/selftest-rtl.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/sel-sched-dump.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/sel-sched.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/sel-sched-ir.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/sese.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/shortest-paths.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/shrink-wrap.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/signop.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/sparseset.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/spellcheck.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/spellcheck-tree.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/splay-tree.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/splay-tree-utils.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/sreal.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/ssa.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/ssa-iterators.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/stab.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/statistics.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/stmt.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/stor-layout.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/streamer-hooks.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/stringpool.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/substring-locations.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/symbol-summary.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/symtab-clones.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/symtab.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/symtab-thunks.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/sync-builtins.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/system.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/target.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/target-def.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/target-globals.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/target.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/target-hooks-macros.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/target-insns.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/targhooks.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/timevar.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/timevar.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/tm.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/tm_p.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/tm-preds.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/toplev.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/tracer.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/trans-mem.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/tree-affine.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/tree-cfgcleanup.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/tree-cfg.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/tree-check.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/tree-chrec.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/tree-core.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/tree-data-ref.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/tree.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/tree-dfa.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/tree-diagnostic.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/tree-dump.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/tree-eh.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/tree.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/tree-hasher.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/tree-hash-traits.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/tree-if-conv.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/tree-inline.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/tree-into-ssa.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/tree-iterator.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/tree-nested.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/tree-object-size.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/tree-outof-ssa.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/tree-parloops.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/tree-pass.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/tree-phinodes.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/tree-pretty-print.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/tree-scalar-evolution.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/tree-sra.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/tree-ssa-address.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/tree-ssa-alias-compare.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/tree-ssa-alias.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/tree-ssa-ccp.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/tree-ssa-coalesce.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/tree-ssa-dce.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/tree-ssa-dom.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/tree-ssa-dse.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/tree-ssa.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/tree-ssa-live.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/tree-ssa-loop.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/tree-ssa-loop-ivopts.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/tree-ssa-loop-manip.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/tree-ssa-loop-niter.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/tree-ssa-math-opts.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/tree-ssanames.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/tree-ssa-operands.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/tree-ssa-propagate.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/tree-ssa-reassoc.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/tree-ssa-sccvn.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/tree-ssa-scopedtables.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/tree-ssa-strlen.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/tree-ssa-ter.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/tree-ssa-threadedge.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/tree-ssa-threadupdate.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/tree-stdarg.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/tree-streamer.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/treestruct.def was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/tree-switch-conversion.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/tree-vector-builder.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/tree-vectorizer.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/tree-vrp.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/tristate.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/tsan.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/tsystem.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/typeclass.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/typed-splay-tree.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/ubsan.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/valtrack.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/value-prof.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/value-query.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/value-range-equiv.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/value-range.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/varasm.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/vec.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/vec-perm-indices.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/vector-builder.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/version.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/vmsdbg.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/vr-values.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/vtable-verify.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/wide-int-bitmask.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/wide-int.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/wide-int-print.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/xcoff.h was added
  /usr/lib/i686-poky-linux/gcc/i686-poky-linux/11.2.0/plugin/include/xcoffout.h was added
  /sysroot-providers/virtual_i686-poky-linux-musl-g++ was removed
  /sysroot-providers/virtual_i686-poky-linux-musl-gcc was removed
  /usr/bin/i686-poky-linux-musl was removed
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-c++ was removed
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-cpp was removed
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-g++ was removed
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-gcc was removed
  /usr/bin/i686-poky-linux-musl/i686-poky-linux-musl-gcc-11.2.0 was removed
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
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0 was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/ar was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/as was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/cc1 was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/cc1plus was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/collect2 was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/cpp was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/gcc was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/g++-mapper-server was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/i686-poky-linux-musl-ar was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/i686-poky-linux-musl-as was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/i686-poky-linux-musl-cpp was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/i686-poky-linux-musl-gcc was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/i686-poky-linux-musl-ld.bfd was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/i686-poky-linux-musl-ld was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/i686-poky-linux-musl-ld.gold was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/i686-poky-linux-musl-nm was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/i686-poky-linux-musl-objcopy was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/i686-poky-linux-musl-objdump was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/i686-poky-linux-musl-ranlib was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/i686-poky-linux-musl-strip was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/install-tools was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/install-tools/fixincl was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/install-tools/fixinc.sh was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/install-tools/mkheaders was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/install-tools/mkinstalldirs was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/ld.bfd was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/ld was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/ld.gold was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/libcc1plugin.so.0.0.0 was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/libcc1plugin.so.0 was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/libcc1plugin.so was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/libcc1.so.0.0.0 was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/libcc1.so.0 was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/libcc1.so was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/libcp1plugin.so.0.0.0 was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/libcp1plugin.so.0 was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/libcp1plugin.so was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/liblto_plugin.so was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/lto1 was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/lto-wrapper was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/nm was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/objcopy was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/objdump was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/gengtype was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/ranlib was removed
  /usr/libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/strip was removed
  /usr/lib/i686-poky-linux-musl was removed
  /usr/lib/i686-poky-linux-musl/bfd-plugins was removed
  /usr/lib/i686-poky-linux-musl/bfd-plugins/liblto_plugin.so was removed
  /usr/lib/i686-poky-linux-musl/gcc was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0 was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/adxintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/ammintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/amxbf16intrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/amxint8intrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/amxtileintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/avx2intrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/avx5124fmapsintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/avx5124vnniwintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/avx512bf16intrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/avx512bf16vlintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/avx512bitalgintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/avx512bwintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/avx512cdintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/avx512dqintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/avx512erintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/avx512fintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/avx512ifmaintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/avx512ifmavlintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/avx512pfintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/avx512vbmi2intrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/avx512vbmi2vlintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/avx512vbmiintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/avx512vbmivlintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/avx512vlbwintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/avx512vldqintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/avx512vlintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/avx512vnniintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/avx512vnnivlintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/avx512vp2intersectintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/avx512vp2intersectvlintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/avx512vpopcntdqintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/avx512vpopcntdqvlintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/avxintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/avxvnniintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/bmi2intrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/bmiintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/bmmintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/cet.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/cetintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/cldemoteintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/clflushoptintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/clwbintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/clzerointrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/cpuid.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/cross-stdarg.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/emmintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/enqcmdintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/f16cintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include-fixed was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include-fixed/limits.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include-fixed/README was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include-fixed/syslimits.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/float.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/fma4intrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/fmaintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/fxsrintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/gfniintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/hresetintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/ia32intrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/immintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/iso646.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/keylockerintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/lwpintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/lzcntintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/mm3dnow.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/mmintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/mm_malloc.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/movdirintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/mwaitxintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/nmmintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/pconfigintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/pkuintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/pmmintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/popcntintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/prfchwintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/quadmath.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/quadmath_weak.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/rdseedintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/rtmintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/serializeintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/sgxintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/shaintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/smmintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/stdalign.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/stdarg.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/stdatomic.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/stdbool.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/stddef.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/stdfix.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/stdint-gcc.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/stdint.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/stdnoreturn.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/tbmintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/tmmintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/tsxldtrkintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/uintrintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/unwind.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/vaesintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/varargs.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/vpclmulqdqintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/waitpkgintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/wbnoinvdintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/wmmintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/x86gprintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/x86intrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/xmmintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/xopintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/xsavecintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/xsaveintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/xsaveoptintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/xsavesintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/include/xtestintrin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/install-tools was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/install-tools/fixinc_list was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/install-tools/gsyslimits.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/install-tools/include was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/install-tools/include/limits.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/install-tools/include/README was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/install-tools/macro_list was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/install-tools/mkheaders.conf was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/gtype.state was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/ada was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/ada/gcc-interface was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/ada/gcc-interface/ada-tree.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/addresses.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/alias.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/align.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/alloc-pool.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/all-tree.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/ansidecl.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/array-traits.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/asan.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/attr-fnspec.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/attribs.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/auto-host.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/auto-profile.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/backend.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/basic-block.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/bb-reorder.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/b-header-vars was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/bitmap.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/brig-builtins.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/builtin-attrs.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/builtins.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/builtins.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/builtin-types.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/bversion.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/calls.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/ccmp.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/c-family was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/c-family/c-common.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/c-family/c-common.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/c-family/c-objc.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/c-family/c-pragma.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/c-family/c-pretty-print.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/cfganal.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/cfgbuild.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/cfgcleanup.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/cfgexpand.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/cfg-flags.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/cfg.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/cfghooks.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/cfgloop.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/cfgloopmanip.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/cfgrtl.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/cgraph.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/cif-code.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/collect2-aix.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/collect2.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/collect-utils.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/color-macros.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/common was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/common/config was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/common/config/i386 was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/common/config/i386/i386-cpuinfo.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/conditions.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/config was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/configargs.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/config/dbxelf.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/config/elfos.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/config/glibc-stdint.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/config/gnu-user.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/config.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/config/i386 was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/config/i386/att.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/config/i386/gnu-user64.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/config/i386/gnu-user-common.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/config/i386/i386.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/config/i386/i386-opts.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/config/i386/i386-protos.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/config/i386/linux64.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/config/i386/linux-common.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/config/i386/stringop.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/config/i386/unix.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/config/i386/x86-64.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/config/i386/x86-tune.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/config/initfini-array.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/config/linux-android.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/config/linux.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/config/linux-protos.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/config/vxworks-dummy.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/context.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/convert.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/coretypes.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/coroutine-builtins.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/coverage.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/cp was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/cp/cp-tree.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/cp/cp-tree.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/cp/cxx-pretty-print.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/cp/name-lookup.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/cp/operators.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/cppbuiltin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/cppdefault.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/cpplib.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/cp/type-utils.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/cselib.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/c-tree.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/d was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/data-streamer.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/dbgcnt.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/dbgcnt.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/dbxout.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/dce.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/ddg.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/d/d-tree.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/debug.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/defaults.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/df.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/dfp.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/diagnostic-color.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/diagnostic-core.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/diagnostic.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/diagnostic-event-id.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/diagnostic.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/diagnostic-metadata.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/diagnostic-path.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/diagnostic-url.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/digraph.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/dojump.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/dominance.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/domwalk.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/double-int.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/dump-context.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/dumpfile.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/dwarf2asm.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/dwarf2out.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/edit-context.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/emit-rtl.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/errors.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/escaped_string.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/et-forest.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/except.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/explow.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/expmed.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/expr.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/fibonacci_heap.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/file-find.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/filenames.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/file-prefix-map.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/fixed-value.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/flags.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/flag-types.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/fold-const-call.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/fold-const.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/function-abi.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/function.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/gcc.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/gcc-plugin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/gcc-rich-location.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/gcc-symtab.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/gcov-counter.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/gcov-io.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/gcse-common.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/gcse.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/generic-match.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/gengtype.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/genrtl.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/gensupport.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/ggc.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/ggc-internal.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/gimple-array-bounds.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/gimple-builder.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/gimple.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/gimple-expr.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/gimple-fold.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/gimple.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/gimple-iterator.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/gimple-low.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/gimple-match.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/gimple-predict.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/gimple-pretty-print.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/gimple-range-cache.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/gimple-range-edge.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/gimple-range-gori.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/gimple-range.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/gimple-ssa-evrp-analyze.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/gimple-ssa.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/gimple-ssa-warn-restrict.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/gimple-streamer.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/gimple-walk.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/gimplify.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/gimplify-me.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/glimits.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/gomp-constants.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/graphds.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/graph.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/graphite.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/graphviz.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/gsstruct.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/gstab.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/gsyms.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/gsyslimits.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/gtm-builtins.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/gtype-desc.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/hard-reg-set.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/hash-map.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/hash-map-traits.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/hash-set.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/hashtab.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/hash-table.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/hash-traits.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/highlev-plugin-common.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/hooks.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/hosthooks-def.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/hosthooks.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/hw-doloop.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/hwint.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/ifcvt.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/inchash.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/incpath.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/input.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/insn-addr.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/insn-attr-common.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/insn-attr.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/insn-codes.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/insn-config.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/insn-constants.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/insn-flags.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/insn-modes.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/insn-modes-inline.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/insn-notes.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/internal-fn.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/internal-fn.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/intl.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/int-vector-builder.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/ipa-fnsummary.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/ipa-icf-gimple.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/ipa-icf.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/ipa-inline.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/ipa-modref.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/ipa-modref-tree.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/ipa-param-manipulation.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/ipa-predicate.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/ipa-prop.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/ipa-reference.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/ipa-ref.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/ipa-utils.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/ira.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/ira-int.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/is-a.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/iterator-utils.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/json.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/langhooks-def.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/langhooks.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/lcm.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/libfuncs.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/libiberty.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/limitx.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/limity.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/line-map.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/linux.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/loop-unroll.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/lower-subreg.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/lra.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/lra-int.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/lto-compress.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/lto-section-names.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/lto-streamer.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/machmode.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/machmode.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/md5.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/memmodel.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/memory-block.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/mem-stats.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/mem-stats-traits.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/mode-classes.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/mux-utils.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/objc was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/objc/objc-tree.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/obstack.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/obstack-utils.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/omp-builtins.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/omp-expand.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/omp-general.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/omp-low.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/omp-offload.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/omp-simd-clone.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/optabs.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/optabs.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/optabs-libfuncs.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/optabs-query.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/optabs-tree.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/optinfo-emit-json.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/optinfo.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/options.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/opt-problem.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/opts-diagnostic.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/opts.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/opt-suggestions.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/ordered-hash-map.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/output.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/passes.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/pass-instances.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/pass_manager.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/plugin-api.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/plugin.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/plugin.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/plugin-version.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/poly-int.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/poly-int-types.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/predict.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/predict.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/prefix.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/pretty-print.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/print-rtl.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/print-tree.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/profile-count.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/profile.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/range.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/range-op.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/read-md.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/read-rtl-function.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/real.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/realmpfr.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/recog.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/regcprop.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/reg-notes.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/regrename.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/regset.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/regs.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/reload.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/resource.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/rtlanal.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/rtl.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/rtl-error.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/rtl.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/rtlhash.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/rtlhooks-def.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/rtl-iter.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/rtl-ssa.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/rtx-vector-builder.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/run-rtl-passes.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/safe-ctype.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/sanitizer.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/sbitmap.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/sched-int.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/selftest-diagnostic.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/selftest.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/selftest-rtl.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/sel-sched-dump.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/sel-sched.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/sel-sched-ir.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/sese.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/shortest-paths.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/shrink-wrap.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/signop.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/sparseset.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/spellcheck.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/spellcheck-tree.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/splay-tree.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/splay-tree-utils.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/sreal.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/ssa.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/ssa-iterators.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/stab.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/statistics.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/stmt.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/stor-layout.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/streamer-hooks.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/stringpool.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/substring-locations.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/symbol-summary.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/symtab-clones.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/symtab.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/symtab-thunks.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/sync-builtins.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/system.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/target.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/target-def.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/target-globals.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/target.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/target-hooks-macros.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/target-insns.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/targhooks.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/timevar.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/timevar.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/tm.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/tm_p.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/tm-preds.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/toplev.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/tracer.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/trans-mem.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/tree-affine.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/tree-cfgcleanup.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/tree-cfg.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/tree-check.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/tree-chrec.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/tree-core.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/tree-data-ref.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/tree.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/tree-dfa.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/tree-diagnostic.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/tree-dump.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/tree-eh.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/tree.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/tree-hasher.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/tree-hash-traits.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/tree-if-conv.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/tree-inline.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/tree-into-ssa.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/tree-iterator.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/tree-nested.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/tree-object-size.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/tree-outof-ssa.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/tree-parloops.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/tree-pass.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/tree-phinodes.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/tree-pretty-print.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/tree-scalar-evolution.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/tree-sra.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/tree-ssa-address.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/tree-ssa-alias-compare.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/tree-ssa-alias.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/tree-ssa-ccp.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/tree-ssa-coalesce.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/tree-ssa-dce.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/tree-ssa-dom.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/tree-ssa-dse.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/tree-ssa.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/tree-ssa-live.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/tree-ssa-loop.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/tree-ssa-loop-ivopts.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/tree-ssa-loop-manip.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/tree-ssa-loop-niter.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/tree-ssa-math-opts.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/tree-ssanames.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/tree-ssa-operands.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/tree-ssa-propagate.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/tree-ssa-reassoc.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/tree-ssa-sccvn.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/tree-ssa-scopedtables.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/tree-ssa-strlen.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/tree-ssa-ter.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/tree-ssa-threadedge.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/tree-ssa-threadupdate.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/tree-stdarg.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/tree-streamer.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/treestruct.def was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/tree-switch-conversion.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/tree-vector-builder.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/tree-vectorizer.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/tree-vrp.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/tristate.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/tsan.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/tsystem.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/typeclass.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/typed-splay-tree.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/ubsan.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/valtrack.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/value-prof.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/value-query.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/value-range-equiv.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/value-range.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/varasm.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/vec.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/vec-perm-indices.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/vector-builder.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/version.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/vmsdbg.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/vr-values.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/vtable-verify.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/wide-int-bitmask.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/wide-int.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/wide-int-print.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/xcoff.h was removed
  /usr/lib/i686-poky-linux-musl/gcc/i686-poky-linux-musl/11.2.0/plugin/include/xcoffout.h was removed

--===============9210297231179095090==--

