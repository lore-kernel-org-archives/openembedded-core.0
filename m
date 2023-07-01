Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 156A5C3DA41
	for <webhook@archiver.kernel.org>; Sat,  1 Jul 2023 16:02:07 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.10495.1688227322864681781
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Jul 2023 09:02:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=M6BSpbYw;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101018912309ee6-4d6e22a7-ae89-485f-a837-58cb48073cfd-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1688227323;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=LnZpegn4BVHOJFjKcmij7pjAe8keTvRMnNChOf1bATg=;
	b=M6BSpbYw70zofznve4CNwnQTQzlpzYZ6ToMitnLTlrTMHI2WZyRyRNqpGHFwyk8l
	u7ecvWqVv9X5ZCueFWgPDVmAY4v9JtonbqWPtn4pczsGfTssMOhIfx/nO1Q71afL5Z6
	mJHB00k+4nKS6vgbdh2qHVWjCvjctNGKbNIbLx2s=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1688227323;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=LnZpegn4BVHOJFjKcmij7pjAe8keTvRMnNChOf1bATg=;
	b=Ezspe2eSYUwO2evkiCIG5K2XDYWYYOgQ29ed140wHnexWsIvdUjUmf2P+lAqsyQz
	5YERkwDEZhPwqBiiSsJTYsns4QjGjXNhIWyHafwMxNpgFpNVN13DWsK/rSb11qywtaM
	TurvYFOtwsChMcZYsH1hFV2tLQuRD7epbA9j8QMc=
Content-Type: multipart/mixed; boundary="===============3344231370161178360=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-tools: upgrading to 1.3.250.1 SUCCEEDED
Message-ID: <0101018912309ee6-4d6e22a7-ae89-485f-a837-58cb48073cfd-000000@us-west-2.amazonses.com>
Date: Sat, 1 Jul 2023 16:02:03 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.07.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Jul 2023 16:02:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183753

--===============3344231370161178360==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *vulkan-tools* to *1.3.250.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-vulkan-tools-upgrade-1.3.250.0-1.3.250.1.patch
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
From a3e2939246555c6fc2b6f782afd222a1a1685cde Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 1 Jul 2023 13:22:27 +0000
Subject: [PATCH] vulkan-tools: upgrade 1.3.250.0 -> 1.3.250.1

---
 .../{vulkan-tools_1.3.250.0.bb => vulkan-tools_1.3.250.1.bb}      | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta/recipes-graphics/vulkan/{vulkan-tools_1.3.250.0.bb => vulkan-tools_1.3.250.1.bb} (100%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.0.bb b/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.1.bb
similarity index 100%
rename from meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.1.bb
-- 
2.39.2


--===============3344231370161178360==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-vulkan-tools-upgrade-1.3.250.0-1.3.250.1.patch"

RnJvbSBhM2UyOTM5MjQ2NTU1YzZmYzJiNmY3ODJhZmQyMjJhMWExNjg1Y2RlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBKdWwgMjAyMyAxMzoyMjoyNyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHZ1
bGthbi10b29sczogdXBncmFkZSAxLjMuMjUwLjAgLT4gMS4zLjI1MC4xCgotLS0KIC4uLi97dnVs
a2FuLXRvb2xzXzEuMy4yNTAuMC5iYiA9PiB2dWxrYW4tdG9vbHNfMS4zLjI1MC4xLmJifSAgICAg
IHwgMAogMSBmaWxlIGNoYW5nZWQsIDAgaW5zZXJ0aW9ucygrKSwgMCBkZWxldGlvbnMoLSkKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVsa2FuL3t2dWxrYW4tdG9vbHNfMS4zLjI1MC4w
LmJiID0+IHZ1bGthbi10b29sc18xLjMuMjUwLjEuYmJ9ICgxMDAlKQoKZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1ncmFwaGljcy92dWxrYW4vdnVsa2FuLXRvb2xzXzEuMy4yNTAuMC5iYiBiL21l
dGEvcmVjaXBlcy1ncmFwaGljcy92dWxrYW4vdnVsa2FuLXRvb2xzXzEuMy4yNTAuMS5iYgpzaW1p
bGFyaXR5IGluZGV4IDEwMCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Z1bGth
bi92dWxrYW4tdG9vbHNfMS4zLjI1MC4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZ3JhcGhp
Y3MvdnVsa2FuL3Z1bGthbi10b29sc18xLjMuMjUwLjEuYmIKLS0gCjIuMzkuMgoK

--===============3344231370161178360==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 896 .bb files complete (0 cached, 896 parsed). 1799 targets, 61 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:74ae22635684873440bfabf52809e2fec8518995"
workspace            = "master:d221e59a5067266c3f620259a1e56a56823df1fb"

Initialising tasks...done.
Sstate summary: Wanted 30 Local 21 Mirrors 0 Missed 9 Current 398 (70% match, 97% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 405 of 428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 412 of 428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 426 of 428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_packagedata_setscene)
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 1308 of 1425 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.1.bb:do_fetch)
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_fetch: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/vulkan-headers/1.3.250.0-r0/temp/log.do_packagedata_setscene.3063818
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 427 of 428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_package_setscene)
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_fetch: Succeeded
NOTE: Running task 1385 of 1425 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.1.bb:do_unpack)
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_unpack: Started
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_unpack: Succeeded
NOTE: Running task 1386 of 1425 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.1.bb:do_patch)
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_package_setscene: Started
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_patch: Started
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_patch: Succeeded
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_package_setscene: Succeeded
NOTE: Running task 1387 of 1425 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1388 of 1425 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.1.bb:do_generate_toolchain_file)
NOTE: Running task 1389 of 1425 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.1.bb:do_populate_lic)
NOTE: Setscene tasks completed
NOTE: Running task 1401 of 1425 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_packagedata)
NOTE: Running task 1407 of 1425 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_populate_lic: Started
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_packagedata: Started
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.1.bb:do_populate_lic unihash changed to d734560fc781825199b0de43bc4153f4a36c4e4e25955f62d60a9f42813e0022
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1414 of 1425 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.1.bb:do_collect_spdx_deps)
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1415 of 1425 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.1.bb:do_configure)
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_configure: Started
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_configure: Succeeded
NOTE: Running task 1416 of 1425 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.1.bb:do_compile)
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_compile: Started
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_compile: Succeeded
NOTE: Running task 1417 of 1425 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.1.bb:do_install)
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_install: Started
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_install: Succeeded
NOTE: Running task 1418 of 1425 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.1.bb:do_package)
NOTE: Running task 1419 of 1425 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.1.bb:do_populate_sysroot)
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_populate_sysroot: Started
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_package: Started
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_package: Succeeded
NOTE: Running task 1420 of 1425 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.1.bb:do_packagedata)
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_packagedata: Started
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1421 of 1425 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.1.bb:do_create_spdx)
NOTE: Running task 1422 of 1425 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.1.bb:do_package_write_rpm)
NOTE: Running task 1423 of 1425 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.1.bb:do_package_qa)
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_create_spdx: Started
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_package_write_rpm: Started
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_package_qa: Started
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 1424 of 1425 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.1.bb:do_create_runtime_spdx)
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_package_qa: Succeeded
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_create_runtime_spdx: Started
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1425 of 1425 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.1.bb:do_build)
NOTE: Tasks Summary: Attempted 1425 tasks of which 1405 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: vulkan-headers-1.3.250.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-src went backwards which would break package feeds (from 0:1.3.250.1-r0 to 0:1.3.250.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.250.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-dbg went backwards which would break package feeds (from 0:1.3.250.1-r0 to 0:1.3.250.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.250.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-staticdev went backwards which would break package feeds (from 0:1.3.250.1-r0 to 0:1.3.250.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.250.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-dev went backwards which would break package feeds (from 0:1.3.250.1-r0 to 0:1.3.250.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.250.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-doc went backwards which would break package feeds (from 0:1.3.250.1-r0 to 0:1.3.250.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.250.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-locale went backwards which would break package feeds (from 0:1.3.250.1-r0 to 0:1.3.250.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.250.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers went backwards which would break package feeds (from 0:1.3.250.1-r0 to 0:1.3.250.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.250.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============3344231370161178360==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1799 entries from dependency cache.
Parsing recipes...done.
Parsing of 896 .bb files complete (895 cached, 1 parsed). 1799 targets, 34 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:74ae22635684873440bfabf52809e2fec8518995"
workspace            = "master:d221e59a5067266c3f620259a1e56a56823df1fb"

Initialising tasks...done.
Sstate summary: Wanted 30 Local 21 Mirrors 0 Missed 9 Current 398 (70% match, 97% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 405 of 428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 412 of 428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 426 of 428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_packagedata_setscene)
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 1308 of 1425 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.1.bb:do_fetch)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/vulkan-headers/1.3.250.0-r0/temp/log.do_packagedata_setscene.3057090
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 427 of 428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_package_setscene)
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_fetch: Started
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_fetch: Succeeded
NOTE: Running task 1385 of 1425 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.1.bb:do_unpack)
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_unpack: Started
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_unpack: Succeeded
NOTE: Running task 1386 of 1425 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.1.bb:do_patch)
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_package_setscene: Started
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_patch: Started
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_patch: Succeeded
NOTE: Running task 1387 of 1425 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1388 of 1425 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.1.bb:do_generate_toolchain_file)
NOTE: Running task 1389 of 1425 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.1.bb:do_populate_lic)
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1401 of 1425 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_packagedata)
NOTE: Running task 1407 of 1425 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_populate_lic: Started
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_packagedata: Started
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.1.bb:do_populate_lic unihash changed to d734560fc781825199b0de43bc4153f4a36c4e4e25955f62d60a9f42813e0022
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1414 of 1425 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.1.bb:do_collect_spdx_deps)
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1415 of 1425 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.1.bb:do_configure)
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_configure: Started
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_configure: Succeeded
NOTE: Running task 1416 of 1425 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.1.bb:do_compile)
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_compile: Started
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_compile: Succeeded
NOTE: Running task 1417 of 1425 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.1.bb:do_install)
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_install: Started
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_install: Succeeded
NOTE: Running task 1418 of 1425 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.1.bb:do_package)
NOTE: Running task 1419 of 1425 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.1.bb:do_populate_sysroot)
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_package: Started
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_populate_sysroot: Started
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_package: Succeeded
NOTE: Running task 1420 of 1425 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.1.bb:do_packagedata)
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_packagedata: Started
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1421 of 1425 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.1.bb:do_create_spdx)
NOTE: Running task 1422 of 1425 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.1.bb:do_package_write_rpm)
NOTE: Running task 1423 of 1425 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.1.bb:do_package_qa)
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_create_spdx: Started
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_package_write_rpm: Started
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_package_qa: Started
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_create_spdx: Succeeded
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_package_qa: Succeeded
NOTE: Running task 1424 of 1425 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.1.bb:do_create_runtime_spdx)
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_create_runtime_spdx: Started
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1425 of 1425 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.1.bb:do_build)
NOTE: Tasks Summary: Attempted 1425 tasks of which 1405 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: vulkan-headers-1.3.250.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-src went backwards which would break package feeds (from 0:1.3.250.1-r0 to 0:1.3.250.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.250.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-dbg went backwards which would break package feeds (from 0:1.3.250.1-r0 to 0:1.3.250.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.250.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-staticdev went backwards which would break package feeds (from 0:1.3.250.1-r0 to 0:1.3.250.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.250.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-dev went backwards which would break package feeds (from 0:1.3.250.1-r0 to 0:1.3.250.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.250.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-doc went backwards which would break package feeds (from 0:1.3.250.1-r0 to 0:1.3.250.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.250.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-locale went backwards which would break package feeds (from 0:1.3.250.1-r0 to 0:1.3.250.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.250.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers went backwards which would break package feeds (from 0:1.3.250.1-r0 to 0:1.3.250.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.250.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============3344231370161178360==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/vulkan-tools: PV changed from "1.3.250.0" to "1.3.250.1"
packages/core2-32-poky-linux/vulkan-tools: PKGV changed from 1.3.250.0 [default] to 1.3.250.1 [default]
packages/core2-32-poky-linux/vulkan-tools/vulkan-tools-dbg: PV changed from "1.3.250.0" to "1.3.250.1"
packages/core2-32-poky-linux/vulkan-tools/vulkan-tools-dbg: PKGV changed from 1.3.250.0 [default] to 1.3.250.1 [default]
packages/core2-32-poky-linux/vulkan-tools/vulkan-tools-dev: PV changed from "1.3.250.0" to "1.3.250.1"
packages/core2-32-poky-linux/vulkan-tools/vulkan-tools-dev: PKGV changed from 1.3.250.0 [default] to 1.3.250.1 [default]
packages/core2-32-poky-linux/vulkan-tools/vulkan-tools-doc: PV changed from "1.3.250.0" to "1.3.250.1"
packages/core2-32-poky-linux/vulkan-tools/vulkan-tools-doc: PKGV changed from 1.3.250.0 [default] to 1.3.250.1 [default]
packages/core2-32-poky-linux/vulkan-tools/vulkan-tools-locale: PV changed from "1.3.250.0" to "1.3.250.1"
packages/core2-32-poky-linux/vulkan-tools/vulkan-tools-locale: PKGV changed from 1.3.250.0 [default] to 1.3.250.1 [default]
packages/core2-32-poky-linux/vulkan-tools/vulkan-tools-src: PV changed from "1.3.250.0" to "1.3.250.1"
packages/core2-32-poky-linux/vulkan-tools/vulkan-tools-src: PKGV changed from 1.3.250.0 [default] to 1.3.250.1 [default]
packages/core2-32-poky-linux/vulkan-tools/vulkan-tools-staticdev: PV changed from "1.3.250.0" to "1.3.250.1"
packages/core2-32-poky-linux/vulkan-tools/vulkan-tools-staticdev: PKGV changed from 1.3.250.0 [default] to 1.3.250.1 [default]
packages/core2-32-poky-linux/vulkan-tools/vulkan-tools: PV changed from "1.3.250.0" to "1.3.250.1"
packages/core2-32-poky-linux/vulkan-tools/vulkan-tools: PKGV changed from 1.3.250.0 [default] to 1.3.250.1 [default]

--===============3344231370161178360==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 896 .bb files complete (0 cached, 896 parsed). 1799 targets, 67 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:74ae22635684873440bfabf52809e2fec8518995"
workspace            = "master:d221e59a5067266c3f620259a1e56a56823df1fb"

Initialising tasks...done.
Sstate summary: Wanted 30 Local 21 Mirrors 0 Missed 9 Current 398 (70% match, 97% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 405 of 428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 412 of 428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 426 of 428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_packagedata_setscene)
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1308 of 1425 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.1.bb:do_fetch)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/vulkan-headers/1.3.250.0-r0/temp/log.do_packagedata_setscene.3067150
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 427 of 428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_package_setscene)
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_fetch: Started
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_fetch: Succeeded
NOTE: Running task 1385 of 1425 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.1.bb:do_unpack)
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_unpack: Started
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_unpack: Succeeded
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_package_setscene: Started
NOTE: Running task 1386 of 1425 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.1.bb:do_patch)
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_patch: Started
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_patch: Succeeded
NOTE: Running task 1398 of 1425 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_packagedata)
NOTE: Running task 1403 of 1425 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1405 of 1425 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.1.bb:do_generate_toolchain_file)
NOTE: Running task 1406 of 1425 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1408 of 1425 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.1.bb:do_populate_lic)
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_packagedata: Started
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_populate_lic: Started
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.1.bb:do_populate_lic unihash changed to d734560fc781825199b0de43bc4153f4a36c4e4e25955f62d60a9f42813e0022
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1414 of 1425 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.1.bb:do_collect_spdx_deps)
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1415 of 1425 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.1.bb:do_configure)
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_configure: Started
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_configure: Succeeded
NOTE: Running task 1416 of 1425 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.1.bb:do_compile)
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_compile: Started
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_compile: Succeeded
NOTE: Running task 1417 of 1425 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.1.bb:do_install)
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_install: Started
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_install: Succeeded
NOTE: Running task 1418 of 1425 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.1.bb:do_package)
NOTE: Running task 1419 of 1425 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.1.bb:do_populate_sysroot)
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_package: Started
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_populate_sysroot: Started
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_package: Succeeded
NOTE: Running task 1420 of 1425 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.1.bb:do_packagedata)
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_packagedata: Started
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1421 of 1425 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.1.bb:do_create_spdx)
NOTE: Running task 1422 of 1425 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.1.bb:do_package_write_rpm)
NOTE: Running task 1423 of 1425 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.1.bb:do_package_qa)
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_create_spdx: Started
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_package_write_rpm: Started
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_package_qa: Started
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_package_qa: Succeeded
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 1424 of 1425 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.1.bb:do_create_runtime_spdx)
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_create_runtime_spdx: Started
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1425 of 1425 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.1.bb:do_build)
NOTE: Tasks Summary: Attempted 1425 tasks of which 1405 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: vulkan-headers-1.3.250.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-src went backwards which would break package feeds (from 0:1.3.250.1-r0 to 0:1.3.250.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.250.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-dbg went backwards which would break package feeds (from 0:1.3.250.1-r0 to 0:1.3.250.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.250.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-staticdev went backwards which would break package feeds (from 0:1.3.250.1-r0 to 0:1.3.250.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.250.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-dev went backwards which would break package feeds (from 0:1.3.250.1-r0 to 0:1.3.250.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.250.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-doc went backwards which would break package feeds (from 0:1.3.250.1-r0 to 0:1.3.250.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.250.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-locale went backwards which would break package feeds (from 0:1.3.250.1-r0 to 0:1.3.250.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.250.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers went backwards which would break package feeds (from 0:1.3.250.1-r0 to 0:1.3.250.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.250.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============3344231370161178360==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 896 .bb files complete (0 cached, 896 parsed). 1799 targets, 45 skipped, 0 masked, 0 errors.
Removing 39 recipes from the core2-32 sysroot...done.
Removing 46 recipes from the qemux86 sysroot...done.
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
meta-yocto-bsp       = "tmp-auh-upgrades:74ae22635684873440bfabf52809e2fec8518995"
workspace            = "master:d221e59a5067266c3f620259a1e56a56823df1fb"

Initialising tasks...done.
Sstate summary: Wanted 218 Local 209 Mirrors 0 Missed 9 Current 210 (95% match, 97% complete)
Removing 3 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 214 of 428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.250.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 221 of 428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.250.0.bb:do_populate_sysroot_setscene)
NOTE: Running task 319 of 1424 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.1.bb:do_fetch)
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_fetch: Started
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_fetch: Succeeded
NOTE: Running task 320 of 1424 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.1.bb:do_unpack)
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 232 of 428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 233 of 428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.250.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 234 of 428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 235 of 428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_create_spdx_setscene)
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_unpack: Started
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 238 of 428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb:do_create_spdx_setscene)
NOTE: recipe wayland-1.22.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 256 of 428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 257 of 428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 259 of 428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 260 of 428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 261 of 428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 262 of 428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libx11-1_1.8.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 263 of 428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_create_spdx_setscene)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 266 of 428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 267 of 428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_packagedata_setscene)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/vulkan-headers/1.3.250.0-r0/temp/log.do_packagedata_setscene.3070953
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 268 of 428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_package_setscene)
NOTE: recipe wayland-1.22.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_unpack: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_create_spdx_setscene: Started
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 270 of 428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 271 of 428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 277 of 428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 280 of 428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 281 of 428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 286 of 428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.1.bb:do_create_spdx_setscene)
NOTE: recipe libx11-1_1.8.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.11.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.11.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-13.1.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-runtime-13.1.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 288 of 428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe libx11-1_1.8.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 290 of 428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 291 of 428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_packagedata_setscene)
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.11.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 293 of 428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 296 of 428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_packagedata_setscene)
NOTE: recipe libxml2-2.11.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 298 of 428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.11.4-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 302 of 428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.1.bb:do_create_spdx_setscene)
NOTE: recipe python3-3.11.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.8.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_package_setscene: Started
NOTE: Running setscene task 305 of 428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 306 of 428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-13.1.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 308 of 428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 309 of 428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 310 of 428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 311 of 428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_packagedata_setscene)
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-13.1.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: Running task 874 of 1424 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.1.bb:do_patch)
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_package_setscene: Succeeded
NOTE: recipe xtrans-1_1.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 317 of 428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 318 of 428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 320 of 428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 321 of 428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 326 of 428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 327 of 428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_packagedata_setscene)
NOTE: recipe python3-3.11.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 329 of 428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 330 of 428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 331 of 428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 332 of 428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 333 of 428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 334 of 428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 335 of 428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 336 of 428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 337 of 428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 338 of 428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 339 of 428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.41.2.bb:do_packagedata_setscene)
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_patch: Started
NOTE: recipe python3-3.11.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 340 of 428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 341 of 428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 342 of 428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 343 of 428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 344 of 428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 346 of 428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 347 of 428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 348 of 428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 349 of 428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 350 of 428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 351 of 428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.41.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2023.2-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20221030-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.41.2-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20221030-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_patch: Succeeded
NOTE: Running task 900 of 1424 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 901 of 1424 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.1.bb:do_generate_toolchain_file)
NOTE: Running task 902 of 1424 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.1.bb:do_populate_lic)
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.41.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2023.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20221030-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 357 of 428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.41.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 361 of 428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 368 of 428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 369 of 428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe openssl-3.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_populate_lic: Started
NOTE: recipe libedit-20221030-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 372 of 428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 374 of 428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.4.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe openssl-3.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2023.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.41.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_populate_lic: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.1.bb:do_populate_lic unihash changed to d734560fc781825199b0de43bc4153f4a36c4e4e25955f62d60a9f42813e0022
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 391 of 428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 395 of 428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 397 of 428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.1.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 398 of 428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-13.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-13.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 401 of 428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.1.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 403 of 428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-13.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 405 of 428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 406 of 428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 409 of 428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 410 of 428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 411 of 428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 412 of 428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 413 of 428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 422 of 428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-13.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-13.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 425 of 428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 426 of 428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.40.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1348 of 1424 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_packagedata)
NOTE: Running task 1368 of 1424 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_packagedata: Started
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1413 of 1424 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.1.bb:do_collect_spdx_deps)
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1414 of 1424 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.1.bb:do_configure)
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_configure: Started
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_configure: Succeeded
NOTE: Running task 1415 of 1424 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.1.bb:do_compile)
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_compile: Started
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_compile: Succeeded
NOTE: Running task 1416 of 1424 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.1.bb:do_install)
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_install: Started
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_install: Succeeded
NOTE: Running task 1417 of 1424 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.1.bb:do_package)
NOTE: Running task 1418 of 1424 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.1.bb:do_populate_sysroot)
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_package: Started
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_populate_sysroot: Started
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_package: Succeeded
NOTE: Running task 1419 of 1424 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.1.bb:do_packagedata)
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_packagedata: Started
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1420 of 1424 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.1.bb:do_create_spdx)
NOTE: Running task 1421 of 1424 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.1.bb:do_package_write_rpm)
NOTE: Running task 1422 of 1424 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.1.bb:do_package_qa)
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_create_spdx: Started
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_package_write_rpm: Started
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_package_qa: Started
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 1423 of 1424 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.1.bb:do_create_runtime_spdx)
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_package_qa: Succeeded
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_create_runtime_spdx: Started
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1424 of 1424 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.1.bb:do_build)
NOTE: Tasks Summary: Attempted 1424 tasks of which 1404 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: vulkan-headers-1.3.250.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-src went backwards which would break package feeds (from 0:1.3.250.1-r0 to 0:1.3.250.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.250.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-dbg went backwards which would break package feeds (from 0:1.3.250.1-r0 to 0:1.3.250.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.250.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-staticdev went backwards which would break package feeds (from 0:1.3.250.1-r0 to 0:1.3.250.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.250.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-dev went backwards which would break package feeds (from 0:1.3.250.1-r0 to 0:1.3.250.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.250.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-doc went backwards which would break package feeds (from 0:1.3.250.1-r0 to 0:1.3.250.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.250.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-locale went backwards which would break package feeds (from 0:1.3.250.1-r0 to 0:1.3.250.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.250.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers went backwards which would break package feeds (from 0:1.3.250.1-r0 to 0:1.3.250.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.250.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============3344231370161178360==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 896 .bb files complete (0 cached, 896 parsed). 1799 targets, 51 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:74ae22635684873440bfabf52809e2fec8518995"
workspace            = "master:d221e59a5067266c3f620259a1e56a56823df1fb"

Initialising tasks...done.
Sstate summary: Wanted 30 Local 21 Mirrors 0 Missed 9 Current 398 (70% match, 97% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 405 of 428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 412 of 428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 426 of 428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_packagedata_setscene)
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1308 of 1425 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.1.bb:do_fetch)
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_fetch: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/vulkan-headers/1.3.250.0-r0/temp/log.do_packagedata_setscene.3060431
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 427 of 428 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_package_setscene)
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_fetch: Succeeded
NOTE: Running task 1385 of 1425 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.1.bb:do_unpack)
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_unpack: Started
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_unpack: Succeeded
NOTE: Running task 1386 of 1425 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.1.bb:do_patch)
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_package_setscene: Started
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_patch: Started
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_patch: Succeeded
NOTE: Running task 1387 of 1425 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1388 of 1425 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.1.bb:do_generate_toolchain_file)
NOTE: Running task 1389 of 1425 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.1.bb:do_populate_lic)
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1401 of 1425 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_packagedata)
NOTE: Running task 1407 of 1425 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_populate_lic: Started
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_packagedata: Started
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.1.bb:do_populate_lic unihash changed to d734560fc781825199b0de43bc4153f4a36c4e4e25955f62d60a9f42813e0022
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1414 of 1425 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.1.bb:do_collect_spdx_deps)
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1415 of 1425 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.1.bb:do_configure)
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_configure: Started
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_configure: Succeeded
NOTE: Running task 1416 of 1425 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.1.bb:do_compile)
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_compile: Started
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_compile: Succeeded
NOTE: Running task 1417 of 1425 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.1.bb:do_install)
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_install: Started
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_install: Succeeded
NOTE: Running task 1418 of 1425 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.1.bb:do_package)
NOTE: Running task 1419 of 1425 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.1.bb:do_populate_sysroot)
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_populate_sysroot: Started
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_package: Started
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_package: Succeeded
NOTE: Running task 1420 of 1425 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.1.bb:do_packagedata)
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_packagedata: Started
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1421 of 1425 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.1.bb:do_create_spdx)
NOTE: Running task 1422 of 1425 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.1.bb:do_package_write_rpm)
NOTE: Running task 1423 of 1425 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.1.bb:do_package_qa)
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_create_spdx: Started
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_package_write_rpm: Started
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_package_qa: Started
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 1424 of 1425 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.1.bb:do_create_runtime_spdx)
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_package_qa: Succeeded
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_create_runtime_spdx: Started
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe vulkan-tools-1.3.250.1-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1425 of 1425 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-tools_1.3.250.1.bb:do_build)
NOTE: Tasks Summary: Attempted 1425 tasks of which 1405 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: vulkan-headers-1.3.250.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-src went backwards which would break package feeds (from 0:1.3.250.1-r0 to 0:1.3.250.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.250.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-dbg went backwards which would break package feeds (from 0:1.3.250.1-r0 to 0:1.3.250.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.250.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-staticdev went backwards which would break package feeds (from 0:1.3.250.1-r0 to 0:1.3.250.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.250.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-dev went backwards which would break package feeds (from 0:1.3.250.1-r0 to 0:1.3.250.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.250.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-doc went backwards which would break package feeds (from 0:1.3.250.1-r0 to 0:1.3.250.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.250.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers-locale went backwards which would break package feeds (from 0:1.3.250.1-r0 to 0:1.3.250.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.250.0-r0 do_packagedata_setscene: QA Issue: Package version for package vulkan-headers went backwards which would break package feeds (from 0:1.3.250.1-r0 to 0:1.3.250.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.3.250.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============3344231370161178360==--

