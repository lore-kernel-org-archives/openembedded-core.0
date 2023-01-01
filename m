Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AB28C46467
	for <webhook@archiver.kernel.org>; Sun,  1 Jan 2023 20:46:17 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.20173.1672605966753106553
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jan 2023 12:46:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=DbihGTbl;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101856f15aa22-95f13d05-add3-40ad-b2be-5514931a6ff8-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1672605969;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=jB+q7b5M7NhQhcKIUUpBvVXmrDjTWJVCZjSieClRPNU=;
	b=DbihGTbl70/McTYvgpUKrzsrPgJMHtl+78SoSuH3kltmxxl9c9m+JnZKiw03zGzH
	SXiE49vDfAOup84VCow1fSIk45X7ds3fUt48awo2lc0SLV96xF4RbORwq9ZxpUEZ6DQ
	LQDslLEmcJ/1AtH5nUwzTJrF6o6svMAHEL0DjNzk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1672605969;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=jB+q7b5M7NhQhcKIUUpBvVXmrDjTWJVCZjSieClRPNU=;
	b=R04jATnvWdryFZPO3ZCms0O6e+KR7+fKQleA7hk2hQW71vhmurWFsuck0b9/Nlx9
	p6Ys8GPfE9q8W3A8ItODlRsy7eocDLVeMFWJECNdFbV702yS75jiJJIAG7cLSrdF2Xe
	HfpKRzlmMtVcBe1Vhy8suOfGhiaCuxcpT+LyZxSY=
Content-Type: multipart/mixed; boundary="===============8825317349100793774=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vte: upgrading to 0.70.2 SUCCEEDED
Message-ID: <010101856f15aa22-95f13d05-add3-40ad-b2be-5514931a6ff8-000000@us-west-2.amazonses.com>
Date: Sun, 1 Jan 2023 20:46:08 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.01.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jan 2023 20:46:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175312

--===============8825317349100793774==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *vte* to *0.70.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-vte-upgrade-0.70.1-0.70.2.patch
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
--===============8825317349100793774==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/vte/libvte: FILELIST: removed "/usr/lib/libvte-2.91.so.0.7000.1", added "/usr/lib/libvte-2.91.so.0.7000.2"
Changes to packages/core2-32-poky-linux/vte (sysroot):
  /usr/lib/libvte-2.91.so.0 changed symlink target from libvte-2.91.so.0.7000.1 to libvte-2.91.so.0.7000.2
  /usr/lib/libvte-2.91.so.0.7000.1 moved to /usr/lib/libvte-2.91.so.0.7000.2
packages/core2-32-poky-linux/vte/vte-locale-be: PKGSIZE changed from 1112 to 1477 (+33%)

--===============8825317349100793774==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-vte-upgrade-0.70.1-0.70.2.patch"

RnJvbSAzN2ExM2I4MzBhNWRlMDU1NGU3YzQyYjVjNjZmODI5NmMwNTZhNzliIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBKYW4gMjAyMyAyMDo0NjowMyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHZ0
ZTogdXBncmFkZSAwLjcwLjEgLT4gMC43MC4yCgotLS0KIG1ldGEvcmVjaXBlcy1zdXBwb3J0L3Z0
ZS97dnRlXzAuNzAuMS5iYiA9PiB2dGVfMC43MC4yLmJifSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1zdXBw
b3J0L3Z0ZS97dnRlXzAuNzAuMS5iYiA9PiB2dGVfMC43MC4yLmJifSAoOTQlKQoKZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L3Z0ZS92dGVfMC43MC4xLmJiIGIvbWV0YS9yZWNpcGVz
LXN1cHBvcnQvdnRlL3Z0ZV8wLjcwLjIuYmIKc2ltaWxhcml0eSBpbmRleCA5NCUKcmVuYW1lIGZy
b20gbWV0YS9yZWNpcGVzLXN1cHBvcnQvdnRlL3Z0ZV8wLjcwLjEuYmIKcmVuYW1lIHRvIG1ldGEv
cmVjaXBlcy1zdXBwb3J0L3Z0ZS92dGVfMC43MC4yLmJiCmluZGV4IGVlNTNmY2Q3OTkuLmVjMmZi
MWY1MjIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L3Z0ZS92dGVfMC43MC4xLmJi
CisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L3Z0ZS92dGVfMC43MC4yLmJiCkBAIC0yMSw3ICsy
MSw3IEBAIGluaGVyaXQgZ25vbWViYXNlIGdpLWRvY2dlbiBmZWF0dXJlc19jaGVjayB1cHN0cmVh
bS12ZXJzaW9uLWlzLWV2ZW4gZ29iamVjdC1pbnRyCiAKICMgdmFwaWdlbi5tNCBpcyByZXF1aXJl
ZCB3aGVuIHZhbGEgaXMgbm90IHByZXNlbnQgKGJ1dCB0aGUgb25lIGZyb20gdmFsYSBzaG91bGQg
YmUgdXNlZCBub3JtYWxseSkKIFNSQ19VUkkgKz0gImZpbGU6Ly8wMDAxLUFkZC1XX0VYSVRDT0RF
LW1hY3JvLWZvci1ub24tZ2xpYmMtc3lzdGVtcy5wYXRjaCIKLVNSQ19VUklbYXJjaGl2ZS5zaGEy
NTZzdW1dID0gIjFmNDYwMWNiZmVhNTMwMmI5NjkwMjIwOGM4ZjE4NWU1YjE4YjI1OWI1MzU4YmM5
M2NmMzkyYmY1OTg3MWM1YjYiCitTUkNfVVJJW2FyY2hpdmUuc2hhMjU2c3VtXSA9ICI0ZDE1YjQz
ODBkZTNmNTY0ZDU3ZWFiZDAwNjM4OWM0MDdjNzA1ZGY1YjBjNzAwMzBmZGNjMjQ5NzFhMzM0ZDgw
IgogCiBBTllfT0ZfRElTVFJPX0ZFQVRVUkVTID0gIiR7R1RLM0RJU1RST0ZFQVRVUkVTfSIKIAot
LSAKMi4zNy4zCgo=

--===============8825317349100793774==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 893 .bb files complete (0 cached, 893 parsed). 1690 targets, 64 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:5e55d891da5c6b33ad8758634e260882a4c417dd"
workspace            = "master:c9c2b6b613bbaf7133d9c3435f3aef3fe4e38f59"

Initialising tasks...done.
Sstate summary: Wanted 32 Local 25 Mirrors 0 Missed 7 Current 580 (78% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 588 of 612 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.40.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 589 of 612 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.40.0.bb:do_populate_sysroot_setscene)
NOTE: Running task 1354 of 2141 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.70.2.bb:do_fetch)
NOTE: Running task 1371 of 2141 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.70.2.bb:do_write_config)
NOTE: recipe sqlite3-3_3.40.0-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.40.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vte-0.70.2-r0: task do_fetch: Started
NOTE: recipe vte-0.70.2-r0: task do_write_config: Started
NOTE: recipe vte-0.70.2-r0: task do_fetch: Succeeded
NOTE: Running task 1372 of 2141 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.70.2.bb:do_unpack)
NOTE: recipe vte-0.70.2-r0: task do_write_config: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/sqlite3/3_3.40.0-r0/temp/log.do_packagedata_setscene.3872602
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.40.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 604 of 612 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.40.0.bb:do_package_setscene)
NOTE: recipe sqlite3-3_3.40.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vte-0.70.2-r0: task do_unpack: Started
NOTE: recipe vte-0.70.2-r0: task do_unpack: Succeeded
NOTE: Running task 1373 of 2141 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.70.2.bb:do_patch)
NOTE: recipe vte-0.70.2-r0: task do_patch: Started
NOTE: recipe vte-0.70.2-r0: task do_patch: Succeeded
NOTE: Running task 1374 of 2141 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.70.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1375 of 2141 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.70.2.bb:do_populate_lic)
NOTE: recipe vte-0.70.2-r0: task do_populate_lic: Started
NOTE: recipe vte-0.70.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vte-0.70.2-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.70.2.bb:do_populate_lic unihash changed to 0b81ae0f992e40643a04e6dc695674a41097a359dfaf11187680370ad2ce3ce8
NOTE: recipe vte-0.70.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe sqlite3-3_3.40.0-r0: task do_package_setscene: Started
NOTE: recipe sqlite3-3_3.40.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 606 of 612 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 608 of 612 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 609 of 612 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.36.bb:do_populate_sysroot_setscene)
NOTE: recipe glibc-2.36-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glibc-2.36-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 612 of 612 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.19.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1936 of 2141 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.40.0.bb:do_packagedata)
NOTE: Running task 2091 of 2141 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.70.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe sqlite3-3_3.40.0-r0: task do_packagedata: Started
NOTE: recipe vte-0.70.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sqlite3-3_3.40.0-r0: task do_packagedata: Succeeded
NOTE: recipe vte-0.70.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2133 of 2141 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.70.2.bb:do_configure)
NOTE: recipe vte-0.70.2-r0: task do_configure: Started
NOTE: recipe vte-0.70.2-r0: task do_configure: Succeeded
NOTE: Running task 2134 of 2141 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.70.2.bb:do_compile)
NOTE: recipe vte-0.70.2-r0: task do_compile: Started
NOTE: recipe vte-0.70.2-r0: task do_compile: Succeeded
NOTE: Running task 2135 of 2141 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.70.2.bb:do_install)
NOTE: recipe vte-0.70.2-r0: task do_install: Started
NOTE: recipe vte-0.70.2-r0: task do_install: Succeeded
NOTE: Running task 2136 of 2141 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.70.2.bb:do_package)
NOTE: Running task 2137 of 2141 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.70.2.bb:do_populate_sysroot)
NOTE: recipe vte-0.70.2-r0: task do_populate_sysroot: Started
NOTE: recipe vte-0.70.2-r0: task do_package: Started
NOTE: recipe vte-0.70.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe vte-0.70.2-r0: task do_package: Succeeded
NOTE: Running task 2138 of 2141 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.70.2.bb:do_packagedata)
NOTE: recipe vte-0.70.2-r0: task do_packagedata: Started
NOTE: recipe vte-0.70.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2139 of 2141 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.70.2.bb:do_package_write_rpm)
NOTE: Running task 2140 of 2141 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.70.2.bb:do_package_qa)
NOTE: recipe vte-0.70.2-r0: task do_package_write_rpm: Started
NOTE: recipe vte-0.70.2-r0: task do_package_qa: Started
NOTE: recipe vte-0.70.2-r0: task do_package_qa: Succeeded
NOTE: recipe vte-0.70.2-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2141 of 2141 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.70.2.bb:do_build)
NOTE: Tasks Summary: Attempted 2141 tasks of which 2124 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: sqlite3-3_3.40.0-r0 do_packagedata_setscene: QA Issue: Package version for package sqlite3-src went backwards which would break package feeds (from 3:3.40.1-r0 to 3:3.40.0-r0) [version-going-backwards]
ERROR: sqlite3-3_3.40.0-r0 do_packagedata_setscene: QA Issue: Package version for package sqlite3-dbg went backwards which would break package feeds (from 3:3.40.1-r0 to 3:3.40.0-r0) [version-going-backwards]
ERROR: sqlite3-3_3.40.0-r0 do_packagedata_setscene: QA Issue: Package version for package libsqlite3 went backwards which would break package feeds (from 3:3.40.1-r0 to 3:3.40.0-r0) [version-going-backwards]
ERROR: sqlite3-3_3.40.0-r0 do_packagedata_setscene: QA Issue: Package version for package libsqlite3-dev went backwards which would break package feeds (from 3:3.40.1-r0 to 3:3.40.0-r0) [version-going-backwards]
ERROR: sqlite3-3_3.40.0-r0 do_packagedata_setscene: QA Issue: Package version for package libsqlite3-doc went backwards which would break package feeds (from 3:3.40.1-r0 to 3:3.40.0-r0) [version-going-backwards]
ERROR: sqlite3-3_3.40.0-r0 do_packagedata_setscene: QA Issue: Package version for package libsqlite3-staticdev went backwards which would break package feeds (from 3:3.40.1-r0 to 3:3.40.0-r0) [version-going-backwards]
ERROR: sqlite3-3_3.40.0-r0 do_packagedata_setscene: QA Issue: Package version for package sqlite3 went backwards which would break package feeds (from 3:3.40.1-r0 to 3:3.40.0-r0) [version-going-backwards]
ERROR: sqlite3-3_3.40.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============8825317349100793774==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 893 .bb files complete (0 cached, 893 parsed). 1691 targets, 48 skipped, 0 masked, 0 errors.
Removing 95 recipes from the core2-32 sysroot...done.
Removing 95 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:5e55d891da5c6b33ad8758634e260882a4c417dd"
workspace            = "master:c9c2b6b613bbaf7133d9c3435f3aef3fe4e38f59"

Initialising tasks...done.
Sstate summary: Wanted 389 Local 382 Mirrors 0 Missed 7 Current 206 (98% match, 98% complete)
Removing 2 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 207 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 208 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 213 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.35.bb:do_packagedata_setscene)
NOTE: Running setscene task 214 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 217 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.35.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 218 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.8.bb:do_populate_sysroot_setscene)
NOTE: Running task 943 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.70.2.bb:do_fetch)
NOTE: Running task 946 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.70.2.bb:do_write_config)
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vte-0.70.2-r0: task do_fetch: Started
NOTE: recipe vte-0.70.2-r0: task do_write_config: Started
NOTE: recipe gnutls-3.7.8-r0: task do_packagedata_setscene: Started
NOTE: recipe gtk+3-3.24.35-r0: task do_packagedata_setscene: Started
NOTE: recipe gtk+3-3.24.35-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnutls-3.7.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vte-0.70.2-r0: task do_fetch: Succeeded
NOTE: Running task 947 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.70.2.bb:do_unpack)
NOTE: recipe vte-0.70.2-r0: task do_write_config: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vte-0.70.2-r0: task do_unpack: Started
NOTE: recipe gnutls-3.7.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gnutls-3.7.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 229 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 230 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 231 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 232 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 234 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 235 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 236 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 237 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gtk+3-3.24.35-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe nettle-3.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vte-0.70.2-r0: task do_unpack: Succeeded
NOTE: Running task 956 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.70.2.bb:do_patch)
NOTE: recipe vte-0.70.2-r0: task do_patch: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-3.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 241 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe nettle-3.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 244 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 248 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 249 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe vte-0.70.2-r0: task do_patch: Succeeded
NOTE: Running task 973 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.70.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 974 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.70.2.bb:do_populate_lic)
NOTE: recipe gmp-6.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gtk+3-3.24.35-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 251 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 252 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 254 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 255 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 256 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 257 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 258 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 259 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 260 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 261 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 262 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 263 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 264 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 265 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.46.0.bb:do_populate_sysroot_setscene)
NOTE: recipe vte-0.70.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vte-0.70.2-r0: task do_populate_lic: Started
NOTE: recipe libunistring-1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pango-1.50.11-r0: task do_packagedata_setscene: Started
NOTE: recipe pango-1.50.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_packagedata_setscene: Started
NOTE: recipe at-spi2-core-2.46.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vte-0.70.2-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.70.2.bb:do_populate_lic unihash changed to 0b81ae0f992e40643a04e6dc695674a41097a359dfaf11187680370ad2ce3ce8
NOTE: recipe vte-0.70.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pango-1.50.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 272 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_5.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 273 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 274 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_packagedata_setscene)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pango-1.50.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 279 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_5.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 281 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 282 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxkbcommon-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxkbcommon-1.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 285 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.37.bb:do_packagedata_setscene)
NOTE: Running setscene task 287 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.37.bb:do_populate_sysroot_setscene)
NOTE: recipe at-spi2-core-2.46.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxft-1_2.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe harfbuzz-5.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe fribidi-1.0.12-r0: task do_packagedata_setscene: Started
NOTE: recipe fribidi-1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe harfbuzz-5.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.37-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.37-r0: task do_packagedata_setscene: Started
NOTE: recipe libxft-1_2.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fribidi-1.0.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe harfbuzz-5.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 291 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 292 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_packagedata_setscene)
NOTE: recipe libxft-1_2.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fribidi-1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe harfbuzz-5.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 295 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 297 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_72-1.bb:do_populate_sysroot_setscene)
NOTE: recipe xkeyboard-config-2.37-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe at-spi2-core-2.46.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 300 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 301 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_2.1.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 303 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 304 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 305 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 306 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 307 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 308 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 310 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 311 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_populate_sysroot_setscene)
NOTE: recipe xkeyboard-config-2.37-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe icu-72-1-r0: task do_packagedata_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-72-1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 315 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 316 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.2.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 317 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_packagedata_setscene)
NOTE: recipe icu-72-1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe dbus-1.14.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.14.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 320 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 321 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.2.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 322 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_2.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe icu-72-1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fontconfig-2.14.1-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.14.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 326 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_packagedata_setscene)
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 328 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 329 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 330 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 331 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 333 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_packagedata_setscene)
NOTE: recipe libxtst-1_1.2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mesa-2_22.2.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 335 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.bb:do_populate_sysroot_setscene)
NOTE: recipe dbus-1.14.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Started
NOTE: recipe fontconfig-2.14.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 337 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 339 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 340 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 342 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_populate_sysroot_setscene)
NOTE: recipe mesa-2_22.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fontconfig-2.14.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 345 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.12.1.bb:do_packagedata_setscene)
NOTE: recipe libxi-1_1.8-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxi-1_1.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_22.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 347 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.114.bb:do_packagedata_setscene)
NOTE: Running setscene task 348 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.236.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 349 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 350 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 351 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 352 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_packagedata_setscene)
NOTE: recipe fontconfig-2.14.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxi-1_1.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe freetype-2.12.1-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 355 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.12.1.bb:do_populate_sysroot_setscene)
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 359 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 360 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.3.bb:do_populate_sysroot_setscene)
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 366 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_packagedata_setscene)
NOTE: recipe mesa-2_22.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 367 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.114.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 369 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.236.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 370 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 371 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 372 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 373 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libxi-1_1.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.236.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe freetype-2.12.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 378 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.39.bb:do_packagedata_setscene)
NOTE: Running setscene task 379 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libdrm-2.4.114-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe freetype-2.12.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 383 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 384 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.74.3-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.74.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-loader-1.3.236.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.114-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-loader-1.3.236.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 386 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.236.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 387 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_packagedata_setscene)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 389 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_packagedata_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 392 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_packagedata_setscene)
NOTE: recipe libpng-1.6.39-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.114-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 395 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_packagedata_setscene)
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe freetype-2.12.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 398 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.39.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-headers-1.3.236.0-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-loader-1.3.236.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 399 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.236.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 401 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 403 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libdrm-2.4.114-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.74.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 406 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_populate_sysroot_setscene)
NOTE: recipe wayland-1.21.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 407 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.39-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.236.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpng-1.6.39-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-headers-1.3.236.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.21.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.21.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 416 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 417 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 419 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 420 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.3.bb:do_packagedata_setscene)
NOTE: recipe libxrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.17-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpng-1.6.39-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.21.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libpciaccess-0.17-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 425 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 426 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.10.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 428 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 430 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_populate_sysroot_setscene)
NOTE: recipe libxml2-2.10.3-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.3.236.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.74.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 435 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 436 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 437 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_packagedata_setscene)
NOTE: Running setscene task 438 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_populate_sysroot_setscene)
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 441 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.3.bb:do_packagedata_setscene)
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.10.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 444 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.1.bb:do_packagedata_setscene)
NOTE: recipe libxml2-2.10.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 446 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libxml2-2.10.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 450 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.1.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.11.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libx11-1_1.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 454 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 455 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata_setscene)
NOTE: recipe libx11-1_1.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.11.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 457 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 458 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.11.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 461 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 462 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 463 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 464 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 465 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 466 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 467 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 468 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.40.0.bb:do_packagedata_setscene)
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 470 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 471 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 472 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 473 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_packagedata_setscene)
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 475 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 477 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 478 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 479 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 480 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 481 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 482 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.0.7-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 483 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.40.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 484 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 485 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 487 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 488 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 489 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 490 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 491 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 492 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.40.0.bb:do_populate_sysroot_setscene)
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 493 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 494 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_populate_sysroot_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 496 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 498 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/sqlite3/3_3.40.0-r0/temp/log.do_packagedata_setscene.3913753
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 500 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_packagedata_setscene)
NOTE: Running setscene task 503 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.40.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 505 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.40.0.bb:do_package_setscene)
NOTE: recipe openssl-3.0.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.0.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.40.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 510 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_populate_sysroot_setscene)
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.0.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 516 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 522 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 523 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_packagedata_setscene)
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.40.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 533 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 534 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_populate_sysroot_setscene)
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 538 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2022.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.3+20220423-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2022.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2022.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 543 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 547 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 548 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 549 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 550 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.8-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cracklib-2.9.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 557 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 558 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.40.0-r0: task do_package_setscene: Started
NOTE: recipe sqlite3-3_3.40.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 562 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 564 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 568 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 570 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 572 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 573 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+dc9285ad1d-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+dc9285ad1d-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+dc9285ad1d-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 576 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 577 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 578 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.19.bb:do_packagedata_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.19-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+dc9285ad1d-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 579 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 580 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.19-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 589 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 592 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.19.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 593 of 595 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.39.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.39-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.39-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1872 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.40.0.bb:do_packagedata)
NOTE: Running task 2037 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.70.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe sqlite3-3_3.40.0-r0: task do_packagedata: Started
NOTE: recipe vte-0.70.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sqlite3-3_3.40.0-r0: task do_packagedata: Succeeded
NOTE: recipe vte-0.70.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2076 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.70.2.bb:do_configure)
NOTE: recipe vte-0.70.2-r0: task do_configure: Started
NOTE: recipe vte-0.70.2-r0: task do_configure: Succeeded
NOTE: Running task 2077 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.70.2.bb:do_compile)
NOTE: recipe vte-0.70.2-r0: task do_compile: Started
NOTE: recipe vte-0.70.2-r0: task do_compile: Succeeded
NOTE: Running task 2078 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.70.2.bb:do_install)
NOTE: recipe vte-0.70.2-r0: task do_install: Started
NOTE: recipe vte-0.70.2-r0: task do_install: Succeeded
NOTE: Running task 2079 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.70.2.bb:do_package)
NOTE: Running task 2080 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.70.2.bb:do_populate_sysroot)
NOTE: recipe vte-0.70.2-r0: task do_populate_sysroot: Started
NOTE: recipe vte-0.70.2-r0: task do_package: Started
NOTE: recipe vte-0.70.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe vte-0.70.2-r0: task do_package: Succeeded
NOTE: Running task 2081 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.70.2.bb:do_packagedata)
NOTE: recipe vte-0.70.2-r0: task do_packagedata: Started
NOTE: recipe vte-0.70.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2082 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.70.2.bb:do_package_write_rpm)
NOTE: Running task 2083 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.70.2.bb:do_package_qa)
NOTE: recipe vte-0.70.2-r0: task do_package_write_rpm: Started
NOTE: recipe vte-0.70.2-r0: task do_package_qa: Started
NOTE: recipe vte-0.70.2-r0: task do_package_qa: Succeeded
NOTE: recipe vte-0.70.2-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2084 of 2084 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.70.2.bb:do_build)
NOTE: Tasks Summary: Attempted 2084 tasks of which 2067 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: sqlite3-3_3.40.0-r0 do_packagedata_setscene: QA Issue: Package version for package sqlite3-src went backwards which would break package feeds (from 3:3.40.1-r0 to 3:3.40.0-r0) [version-going-backwards]
ERROR: sqlite3-3_3.40.0-r0 do_packagedata_setscene: QA Issue: Package version for package sqlite3-dbg went backwards which would break package feeds (from 3:3.40.1-r0 to 3:3.40.0-r0) [version-going-backwards]
ERROR: sqlite3-3_3.40.0-r0 do_packagedata_setscene: QA Issue: Package version for package libsqlite3 went backwards which would break package feeds (from 3:3.40.1-r0 to 3:3.40.0-r0) [version-going-backwards]
ERROR: sqlite3-3_3.40.0-r0 do_packagedata_setscene: QA Issue: Package version for package libsqlite3-dev went backwards which would break package feeds (from 3:3.40.1-r0 to 3:3.40.0-r0) [version-going-backwards]
ERROR: sqlite3-3_3.40.0-r0 do_packagedata_setscene: QA Issue: Package version for package libsqlite3-doc went backwards which would break package feeds (from 3:3.40.1-r0 to 3:3.40.0-r0) [version-going-backwards]
ERROR: sqlite3-3_3.40.0-r0 do_packagedata_setscene: QA Issue: Package version for package libsqlite3-staticdev went backwards which would break package feeds (from 3:3.40.1-r0 to 3:3.40.0-r0) [version-going-backwards]
ERROR: sqlite3-3_3.40.0-r0 do_packagedata_setscene: QA Issue: Package version for package sqlite3 went backwards which would break package feeds (from 3:3.40.1-r0 to 3:3.40.0-r0) [version-going-backwards]
ERROR: sqlite3-3_3.40.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============8825317349100793774==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/vte: SRC_URI changed from "https://download.gnome.org/sources//vte/0.70/vte-0.70.1.tar.xz;name=archive file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch" to "https://download.gnome.org/sources//vte/0.70/vte-0.70.2.tar.xz;name=archive file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch"
packages/core2-32-poky-linux/vte: PKGV changed from 0.70.1 [default] to 0.70.2 [default]
packages/core2-32-poky-linux/vte: PV changed from "0.70.1" to "0.70.2"
packages/core2-32-poky-linux/vte/libvte: PKGV changed from 0.70.1 [default] to 0.70.2 [default]
packages/core2-32-poky-linux/vte/libvte: FILELIST: removed "/usr/lib/libvte-2.91.so.0.7000.1", added "/usr/lib/libvte-2.91.so.0.7000.2"
packages/core2-32-poky-linux/vte/libvte: PV changed from "0.70.1" to "0.70.2"
Changes to packages/core2-32-poky-linux/vte (sysroot):
  /usr/lib/libvte-2.91.so.0 changed symlink target from libvte-2.91.so.0.7000.1 to libvte-2.91.so.0.7000.2
  /usr/lib/libvte-2.91.so.0.7000.1 moved to /usr/lib/libvte-2.91.so.0.7000.2
packages/core2-32-poky-linux/vte/vte-dbg: PKGV changed from 0.70.1 [default] to 0.70.2 [default]
packages/core2-32-poky-linux/vte/vte-dbg: PKGSIZE changed from 6361044 to 6361092 (+0%)
packages/core2-32-poky-linux/vte/vte-dbg: FILELIST: removed "/usr/lib/.debug/libvte-2.91.so.0.7000.1", added "/usr/lib/.debug/libvte-2.91.so.0.7000.2"
packages/core2-32-poky-linux/vte/vte-dbg: PV changed from "0.70.1" to "0.70.2"
packages/core2-32-poky-linux/vte/vte-dev: PKGV changed from 0.70.1 [default] to 0.70.2 [default]
packages/core2-32-poky-linux/vte/vte-dev: PV changed from "0.70.1" to "0.70.2"
packages/core2-32-poky-linux/vte/vte-doc: PKGV changed from 0.70.1 [default] to 0.70.2 [default]
packages/core2-32-poky-linux/vte/vte-doc: PV changed from "0.70.1" to "0.70.2"
packages/core2-32-poky-linux/vte/vte-locale-ab: PKGV changed from 0.70.1 [default] to 0.70.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-ab: PV changed from "0.70.1" to "0.70.2"
packages/core2-32-poky-linux/vte/vte-locale-am: PKGV changed from 0.70.1 [default] to 0.70.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-am: PV changed from "0.70.1" to "0.70.2"
packages/core2-32-poky-linux/vte/vte-locale-an: PKGV changed from 0.70.1 [default] to 0.70.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-an: PV changed from "0.70.1" to "0.70.2"
packages/core2-32-poky-linux/vte/vte-locale-ang: PKGV changed from 0.70.1 [default] to 0.70.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-ang: PV changed from "0.70.1" to "0.70.2"
packages/core2-32-poky-linux/vte/vte-locale-ar: PKGV changed from 0.70.1 [default] to 0.70.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-ar: PV changed from "0.70.1" to "0.70.2"
packages/core2-32-poky-linux/vte/vte-locale-as: PKGV changed from 0.70.1 [default] to 0.70.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-as: PV changed from "0.70.1" to "0.70.2"
packages/core2-32-poky-linux/vte/vte-locale-ast: PKGV changed from 0.70.1 [default] to 0.70.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-ast: PV changed from "0.70.1" to "0.70.2"
packages/core2-32-poky-linux/vte/vte-locale-az: PKGV changed from 0.70.1 [default] to 0.70.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-az: PV changed from "0.70.1" to "0.70.2"
packages/core2-32-poky-linux/vte/vte-locale-be+latin: PKGV changed from 0.70.1 [default] to 0.70.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-be+latin: PV changed from "0.70.1" to "0.70.2"
packages/core2-32-poky-linux/vte/vte-locale-be: PKGV changed from 0.70.1 [default] to 0.70.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-be: PKGSIZE changed from 1112 to 1477 (+33%)
packages/core2-32-poky-linux/vte/vte-locale-be: PV changed from "0.70.1" to "0.70.2"
packages/core2-32-poky-linux/vte/vte-locale-bg: PKGV changed from 0.70.1 [default] to 0.70.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-bg: PV changed from "0.70.1" to "0.70.2"
packages/core2-32-poky-linux/vte/vte-locale-bn-in: PKGV changed from 0.70.1 [default] to 0.70.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-bn-in: PV changed from "0.70.1" to "0.70.2"
packages/core2-32-poky-linux/vte/vte-locale-bn: PKGV changed from 0.70.1 [default] to 0.70.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-bn: PV changed from "0.70.1" to "0.70.2"
packages/core2-32-poky-linux/vte/vte-locale-bs: PKGV changed from 0.70.1 [default] to 0.70.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-bs: PV changed from "0.70.1" to "0.70.2"
packages/core2-32-poky-linux/vte/vte-locale-ca+valencia: PKGV changed from 0.70.1 [default] to 0.70.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-ca+valencia: PV changed from "0.70.1" to "0.70.2"
packages/core2-32-poky-linux/vte/vte-locale-ca: PKGV changed from 0.70.1 [default] to 0.70.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-ca: PV changed from "0.70.1" to "0.70.2"
packages/core2-32-poky-linux/vte/vte-locale-ckb: PKGV changed from 0.70.1 [default] to 0.70.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-ckb: PV changed from "0.70.1" to "0.70.2"
packages/core2-32-poky-linux/vte/vte-locale-cs: PKGV changed from 0.70.1 [default] to 0.70.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-cs: PV changed from "0.70.1" to "0.70.2"
packages/core2-32-poky-linux/vte/vte-locale-cy: PKGV changed from 0.70.1 [default] to 0.70.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-cy: PV changed from "0.70.1" to "0.70.2"
packages/core2-32-poky-linux/vte/vte-locale-da: PKGV changed from 0.70.1 [default] to 0.70.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-da: PV changed from "0.70.1" to "0.70.2"
packages/core2-32-poky-linux/vte/vte-locale-de: PKGV changed from 0.70.1 [default] to 0.70.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-de: PV changed from "0.70.1" to "0.70.2"
packages/core2-32-poky-linux/vte/vte-locale-dz: PKGV changed from 0.70.1 [default] to 0.70.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-dz: PV changed from "0.70.1" to "0.70.2"
packages/core2-32-poky-linux/vte/vte-locale-el: PKGV changed from 0.70.1 [default] to 0.70.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-el: PV changed from "0.70.1" to "0.70.2"
packages/core2-32-poky-linux/vte/vte-locale-en+shaw: PKGV changed from 0.70.1 [default] to 0.70.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-en+shaw: PV changed from "0.70.1" to "0.70.2"
packages/core2-32-poky-linux/vte/vte-locale-en-ca: PKGV changed from 0.70.1 [default] to 0.70.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-en-ca: PV changed from "0.70.1" to "0.70.2"
packages/core2-32-poky-linux/vte/vte-locale-en-gb: PKGV changed from 0.70.1 [default] to 0.70.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-en-gb: PV changed from "0.70.1" to "0.70.2"
packages/core2-32-poky-linux/vte/vte-locale-eo: PKGV changed from 0.70.1 [default] to 0.70.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-eo: PV changed from "0.70.1" to "0.70.2"
packages/core2-32-poky-linux/vte/vte-locale-es: PKGV changed from 0.70.1 [default] to 0.70.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-es: PV changed from "0.70.1" to "0.70.2"
packages/core2-32-poky-linux/vte/vte-locale-et: PKGV changed from 0.70.1 [default] to 0.70.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-et: PV changed from "0.70.1" to "0.70.2"
packages/core2-32-poky-linux/vte/vte-locale-eu: PKGV changed from 0.70.1 [default] to 0.70.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-eu: PV changed from "0.70.1" to "0.70.2"
packages/core2-32-poky-linux/vte/vte-locale-fa: PKGV changed from 0.70.1 [default] to 0.70.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-fa: PV changed from "0.70.1" to "0.70.2"
packages/core2-32-poky-linux/vte/vte-locale-fi: PKGV changed from 0.70.1 [default] to 0.70.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-fi: PV changed from "0.70.1" to "0.70.2"
packages/core2-32-poky-linux/vte/vte-locale-fr: PKGV changed from 0.70.1 [default] to 0.70.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-fr: PV changed from "0.70.1" to "0.70.2"
packages/core2-32-poky-linux/vte/vte-locale-fur: PKGV changed from 0.70.1 [default] to 0.70.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-fur: PV changed from "0.70.1" to "0.70.2"
packages/core2-32-poky-linux/vte/vte-locale-ga: PKGV changed from 0.70.1 [default] to 0.70.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-ga: PV changed from "0.70.1" to "0.70.2"
packages/core2-32-poky-linux/vte/vte-locale-gd: PKGV changed from 0.70.1 [default] to 0.70.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-gd: PV changed from "0.70.1" to "0.70.2"
packages/core2-32-poky-linux/vte/vte-locale-gl: PKGV changed from 0.70.1 [default] to 0.70.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-gl: PV changed from "0.70.1" to "0.70.2"
packages/core2-32-poky-linux/vte/vte-locale-gu: PKGV changed from 0.70.1 [default] to 0.70.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-gu: PV changed from "0.70.1" to "0.70.2"
packages/core2-32-poky-linux/vte/vte-locale-he: PKGV changed from 0.70.1 [default] to 0.70.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-he: PV changed from "0.70.1" to "0.70.2"
packages/core2-32-poky-linux/vte/vte-locale-hi: PKGV changed from 0.70.1 [default] to 0.70.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-hi: PV changed from "0.70.1" to "0.70.2"
packages/core2-32-poky-linux/vte/vte-locale-hr: PKGV changed from 0.70.1 [default] to 0.70.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-hr: PV changed from "0.70.1" to "0.70.2"
packages/core2-32-poky-linux/vte/vte-locale-hu: PKGV changed from 0.70.1 [default] to 0.70.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-hu: PV changed from "0.70.1" to "0.70.2"
packages/core2-32-poky-linux/vte/vte-locale-id: PKGV changed from 0.70.1 [default] to 0.70.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-id: PV changed from "0.70.1" to "0.70.2"
packages/core2-32-poky-linux/vte/vte-locale-is: PKGV changed from 0.70.1 [default] to 0.70.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-is: PV changed from "0.70.1" to "0.70.2"
packages/core2-32-poky-linux/vte/vte-locale-it: PKGV changed from 0.70.1 [default] to 0.70.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-it: PV changed from "0.70.1" to "0.70.2"
packages/core2-32-poky-linux/vte/vte-locale-ja: PKGV changed from 0.70.1 [default] to 0.70.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-ja: PV changed from "0.70.1" to "0.70.2"
packages/core2-32-poky-linux/vte/vte-locale-ka: PKGV changed from 0.70.1 [default] to 0.70.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-ka: PV changed from "0.70.1" to "0.70.2"
packages/core2-32-poky-linux/vte/vte-locale-kk: PKGV changed from 0.70.1 [default] to 0.70.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-kk: PV changed from "0.70.1" to "0.70.2"
packages/core2-32-poky-linux/vte/vte-locale-kn: PKGV changed from 0.70.1 [default] to 0.70.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-kn: PV changed from "0.70.1" to "0.70.2"
packages/core2-32-poky-linux/vte/vte-locale-ko: PKGV changed from 0.70.1 [default] to 0.70.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-ko: PV changed from "0.70.1" to "0.70.2"
packages/core2-32-poky-linux/vte/vte-locale-ku: PKGV changed from 0.70.1 [default] to 0.70.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-ku: PV changed from "0.70.1" to "0.70.2"
packages/core2-32-poky-linux/vte/vte-locale-ky: PKGV changed from 0.70.1 [default] to 0.70.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-ky: PV changed from "0.70.1" to "0.70.2"
packages/core2-32-poky-linux/vte/vte-locale-li: PKGV changed from 0.70.1 [default] to 0.70.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-li: PV changed from "0.70.1" to "0.70.2"
packages/core2-32-poky-linux/vte/vte-locale-lt: PKGV changed from 0.70.1 [default] to 0.70.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-lt: PV changed from "0.70.1" to "0.70.2"
packages/core2-32-poky-linux/vte/vte-locale-lv: PKGV changed from 0.70.1 [default] to 0.70.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-lv: PV changed from "0.70.1" to "0.70.2"
packages/core2-32-poky-linux/vte/vte-locale-mai: PKGV changed from 0.70.1 [default] to 0.70.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-mai: PV changed from "0.70.1" to "0.70.2"
packages/core2-32-poky-linux/vte/vte-locale-mi: PKGV changed from 0.70.1 [default] to 0.70.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-mi: PV changed from "0.70.1" to "0.70.2"
packages/core2-32-poky-linux/vte/vte-locale-mjw: PKGV changed from 0.70.1 [default] to 0.70.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-mjw: PV changed from "0.70.1" to "0.70.2"
packages/core2-32-poky-linux/vte/vte-locale-mk: PKGV changed from 0.70.1 [default] to 0.70.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-mk: PV changed from "0.70.1" to "0.70.2"
packages/core2-32-poky-linux/vte/vte-locale-ml: PKGV changed from 0.70.1 [default] to 0.70.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-ml: PV changed from "0.70.1" to "0.70.2"
packages/core2-32-poky-linux/vte/vte-locale-mn: PKGV changed from 0.70.1 [default] to 0.70.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-mn: PV changed from "0.70.1" to "0.70.2"
packages/core2-32-poky-linux/vte/vte-locale-mr: PKGV changed from 0.70.1 [default] to 0.70.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-mr: PV changed from "0.70.1" to "0.70.2"
packages/core2-32-poky-linux/vte/vte-locale-ms: PKGV changed from 0.70.1 [default] to 0.70.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-ms: PV changed from "0.70.1" to "0.70.2"
packages/core2-32-poky-linux/vte/vte-locale-nb: PKGV changed from 0.70.1 [default] to 0.70.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-nb: PV changed from "0.70.1" to "0.70.2"
packages/core2-32-poky-linux/vte/vte-locale-nds: PKGV changed from 0.70.1 [default] to 0.70.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-nds: PV changed from "0.70.1" to "0.70.2"
packages/core2-32-poky-linux/vte/vte-locale-ne: PKGV changed from 0.70.1 [default] to 0.70.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-ne: PV changed from "0.70.1" to "0.70.2"
packages/core2-32-poky-linux/vte/vte-locale-nl: PKGV changed from 0.70.1 [default] to 0.70.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-nl: PV changed from "0.70.1" to "0.70.2"
packages/core2-32-poky-linux/vte/vte-locale-nn: PKGV changed from 0.70.1 [default] to 0.70.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-nn: PV changed from "0.70.1" to "0.70.2"
packages/core2-32-poky-linux/vte/vte-locale-oc: PKGV changed from 0.70.1 [default] to 0.70.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-oc: PV changed from "0.70.1" to "0.70.2"
packages/core2-32-poky-linux/vte/vte-locale-or: PKGV changed from 0.70.1 [default] to 0.70.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-or: PV changed from "0.70.1" to "0.70.2"
packages/core2-32-poky-linux/vte/vte-locale-pa: PKGV changed from 0.70.1 [default] to 0.70.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-pa: PV changed from "0.70.1" to "0.70.2"
packages/core2-32-poky-linux/vte/vte-locale-pl: PKGV changed from 0.70.1 [default] to 0.70.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-pl: PV changed from "0.70.1" to "0.70.2"
packages/core2-32-poky-linux/vte/vte-locale-pt-br: PKGV changed from 0.70.1 [default] to 0.70.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-pt-br: PV changed from "0.70.1" to "0.70.2"
packages/core2-32-poky-linux/vte/vte-locale-pt: PKGV changed from 0.70.1 [default] to 0.70.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-pt: PV changed from "0.70.1" to "0.70.2"
packages/core2-32-poky-linux/vte/vte-locale-ro: PKGV changed from 0.70.1 [default] to 0.70.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-ro: PV changed from "0.70.1" to "0.70.2"
packages/core2-32-poky-linux/vte/vte-locale-ru: PKGV changed from 0.70.1 [default] to 0.70.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-ru: PV changed from "0.70.1" to "0.70.2"
packages/core2-32-poky-linux/vte/vte-locale-rw: PKGV changed from 0.70.1 [default] to 0.70.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-rw: PV changed from "0.70.1" to "0.70.2"
packages/core2-32-poky-linux/vte/vte-locale-si: PKGV changed from 0.70.1 [default] to 0.70.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-si: PV changed from "0.70.1" to "0.70.2"
packages/core2-32-poky-linux/vte/vte-locale-sk: PKGV changed from 0.70.1 [default] to 0.70.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-sk: PV changed from "0.70.1" to "0.70.2"
packages/core2-32-poky-linux/vte/vte-locale-sl: PKGV changed from 0.70.1 [default] to 0.70.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-sl: PV changed from "0.70.1" to "0.70.2"
packages/core2-32-poky-linux/vte/vte-locale-sq: PKGV changed from 0.70.1 [default] to 0.70.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-sq: PV changed from "0.70.1" to "0.70.2"
packages/core2-32-poky-linux/vte/vte-locale-sr+latin: PKGV changed from 0.70.1 [default] to 0.70.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-sr+latin: PV changed from "0.70.1" to "0.70.2"
packages/core2-32-poky-linux/vte/vte-locale-sr: PKGV changed from 0.70.1 [default] to 0.70.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-sr: PV changed from "0.70.1" to "0.70.2"
packages/core2-32-poky-linux/vte/vte-locale-sv: PKGV changed from 0.70.1 [default] to 0.70.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-sv: PV changed from "0.70.1" to "0.70.2"
packages/core2-32-poky-linux/vte/vte-locale-ta: PKGV changed from 0.70.1 [default] to 0.70.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-ta: PV changed from "0.70.1" to "0.70.2"
packages/core2-32-poky-linux/vte/vte-locale-te: PKGV changed from 0.70.1 [default] to 0.70.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-te: PV changed from "0.70.1" to "0.70.2"
packages/core2-32-poky-linux/vte/vte-locale-tg: PKGV changed from 0.70.1 [default] to 0.70.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-tg: PV changed from "0.70.1" to "0.70.2"
packages/core2-32-poky-linux/vte/vte-locale-th: PKGV changed from 0.70.1 [default] to 0.70.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-th: PV changed from "0.70.1" to "0.70.2"
packages/core2-32-poky-linux/vte/vte-locale-tr: PKGV changed from 0.70.1 [default] to 0.70.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-tr: PV changed from "0.70.1" to "0.70.2"
packages/core2-32-poky-linux/vte/vte-locale-ug: PKGV changed from 0.70.1 [default] to 0.70.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-ug: PV changed from "0.70.1" to "0.70.2"
packages/core2-32-poky-linux/vte/vte-locale-uk: PKGV changed from 0.70.1 [default] to 0.70.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-uk: PV changed from "0.70.1" to "0.70.2"
packages/core2-32-poky-linux/vte/vte-locale-uz+cyrillic: PKGV changed from 0.70.1 [default] to 0.70.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-uz+cyrillic: PV changed from "0.70.1" to "0.70.2"
packages/core2-32-poky-linux/vte/vte-locale-vi: PKGV changed from 0.70.1 [default] to 0.70.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-vi: PV changed from "0.70.1" to "0.70.2"
packages/core2-32-poky-linux/vte/vte-locale-wa: PKGV changed from 0.70.1 [default] to 0.70.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-wa: PV changed from "0.70.1" to "0.70.2"
packages/core2-32-poky-linux/vte/vte-locale-xh: PKGV changed from 0.70.1 [default] to 0.70.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-xh: PV changed from "0.70.1" to "0.70.2"
packages/core2-32-poky-linux/vte/vte-locale-zh-cn: PKGV changed from 0.70.1 [default] to 0.70.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-zh-cn: PV changed from "0.70.1" to "0.70.2"
packages/core2-32-poky-linux/vte/vte-locale-zh-hk: PKGV changed from 0.70.1 [default] to 0.70.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-zh-hk: PV changed from "0.70.1" to "0.70.2"
packages/core2-32-poky-linux/vte/vte-locale-zh-tw: PKGV changed from 0.70.1 [default] to 0.70.2 [default]
packages/core2-32-poky-linux/vte/vte-locale-zh-tw: PV changed from "0.70.1" to "0.70.2"
packages/core2-32-poky-linux/vte/vte-prompt: PKGV changed from 0.70.1 [default] to 0.70.2 [default]
packages/core2-32-poky-linux/vte/vte-prompt: PV changed from "0.70.1" to "0.70.2"
packages/core2-32-poky-linux/vte/vte-src: PKGV changed from 0.70.1 [default] to 0.70.2 [default]
packages/core2-32-poky-linux/vte/vte-src: PKGSIZE changed from 2196600 to 2197632 (+0%)
packages/core2-32-poky-linux/vte/vte-src: PV changed from "0.70.1" to "0.70.2"
packages/core2-32-poky-linux/vte/vte-staticdev: PKGV changed from 0.70.1 [default] to 0.70.2 [default]
packages/core2-32-poky-linux/vte/vte-staticdev: PV changed from "0.70.1" to "0.70.2"
packages/core2-32-poky-linux/vte/vte: PKGV changed from 0.70.1 [default] to 0.70.2 [default]
packages/core2-32-poky-linux/vte/vte: PV changed from "0.70.1" to "0.70.2"

--===============8825317349100793774==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 893 .bb files complete (0 cached, 893 parsed). 1690 targets, 54 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:5e55d891da5c6b33ad8758634e260882a4c417dd"
workspace            = "master:c9c2b6b613bbaf7133d9c3435f3aef3fe4e38f59"

Initialising tasks...done.
Sstate summary: Wanted 32 Local 25 Mirrors 0 Missed 7 Current 580 (78% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 588 of 612 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.40.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 589 of 612 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.40.0.bb:do_populate_sysroot_setscene)
NOTE: Running task 1354 of 2141 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.70.2.bb:do_fetch)
NOTE: Running task 1371 of 2141 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.70.2.bb:do_write_config)
NOTE: recipe sqlite3-3_3.40.0-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.40.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vte-0.70.2-r0: task do_fetch: Started
NOTE: recipe vte-0.70.2-r0: task do_write_config: Started
NOTE: recipe vte-0.70.2-r0: task do_fetch: Succeeded
NOTE: Running task 1372 of 2141 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.70.2.bb:do_unpack)
NOTE: recipe vte-0.70.2-r0: task do_write_config: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/sqlite3/3_3.40.0-r0/temp/log.do_packagedata_setscene.3856659
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.40.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 604 of 612 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.40.0.bb:do_package_setscene)
NOTE: recipe sqlite3-3_3.40.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vte-0.70.2-r0: task do_unpack: Started
NOTE: recipe vte-0.70.2-r0: task do_unpack: Succeeded
NOTE: Running task 1373 of 2141 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.70.2.bb:do_patch)
NOTE: recipe vte-0.70.2-r0: task do_patch: Started
NOTE: recipe vte-0.70.2-r0: task do_patch: Succeeded
NOTE: Running task 1374 of 2141 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.70.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1375 of 2141 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.70.2.bb:do_populate_lic)
NOTE: recipe vte-0.70.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vte-0.70.2-r0: task do_populate_lic: Started
NOTE: recipe vte-0.70.2-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.70.2.bb:do_populate_lic unihash changed to 0b81ae0f992e40643a04e6dc695674a41097a359dfaf11187680370ad2ce3ce8
NOTE: recipe vte-0.70.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe sqlite3-3_3.40.0-r0: task do_package_setscene: Started
NOTE: recipe sqlite3-3_3.40.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 606 of 612 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 608 of 612 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 609 of 612 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.36.bb:do_populate_sysroot_setscene)
NOTE: recipe glibc-2.36-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glibc-2.36-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 612 of 612 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.19.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1940 of 2141 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.40.0.bb:do_packagedata)
NOTE: Running task 2092 of 2141 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.70.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe sqlite3-3_3.40.0-r0: task do_packagedata: Started
NOTE: recipe vte-0.70.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sqlite3-3_3.40.0-r0: task do_packagedata: Succeeded
NOTE: recipe vte-0.70.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2133 of 2141 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.70.2.bb:do_configure)
NOTE: recipe vte-0.70.2-r0: task do_configure: Started
NOTE: recipe vte-0.70.2-r0: task do_configure: Succeeded
NOTE: Running task 2134 of 2141 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.70.2.bb:do_compile)
NOTE: recipe vte-0.70.2-r0: task do_compile: Started
NOTE: recipe vte-0.70.2-r0: task do_compile: Succeeded
NOTE: Running task 2135 of 2141 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.70.2.bb:do_install)
NOTE: recipe vte-0.70.2-r0: task do_install: Started
NOTE: recipe vte-0.70.2-r0: task do_install: Succeeded
NOTE: Running task 2136 of 2141 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.70.2.bb:do_package)
NOTE: Running task 2137 of 2141 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.70.2.bb:do_populate_sysroot)
NOTE: recipe vte-0.70.2-r0: task do_populate_sysroot: Started
NOTE: recipe vte-0.70.2-r0: task do_package: Started
NOTE: recipe vte-0.70.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe vte-0.70.2-r0: task do_package: Succeeded
NOTE: Running task 2138 of 2141 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.70.2.bb:do_packagedata)
NOTE: recipe vte-0.70.2-r0: task do_packagedata: Started
NOTE: recipe vte-0.70.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2139 of 2141 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.70.2.bb:do_package_write_rpm)
NOTE: Running task 2140 of 2141 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.70.2.bb:do_package_qa)
NOTE: recipe vte-0.70.2-r0: task do_package_write_rpm: Started
NOTE: recipe vte-0.70.2-r0: task do_package_qa: Started
NOTE: recipe vte-0.70.2-r0: task do_package_qa: Succeeded
NOTE: recipe vte-0.70.2-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2141 of 2141 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.70.2.bb:do_build)
NOTE: Tasks Summary: Attempted 2141 tasks of which 2124 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: sqlite3-3_3.40.0-r0 do_packagedata_setscene: QA Issue: Package version for package sqlite3-src went backwards which would break package feeds (from 3:3.40.1-r0 to 3:3.40.0-r0) [version-going-backwards]
ERROR: sqlite3-3_3.40.0-r0 do_packagedata_setscene: QA Issue: Package version for package sqlite3-dbg went backwards which would break package feeds (from 3:3.40.1-r0 to 3:3.40.0-r0) [version-going-backwards]
ERROR: sqlite3-3_3.40.0-r0 do_packagedata_setscene: QA Issue: Package version for package libsqlite3 went backwards which would break package feeds (from 3:3.40.1-r0 to 3:3.40.0-r0) [version-going-backwards]
ERROR: sqlite3-3_3.40.0-r0 do_packagedata_setscene: QA Issue: Package version for package libsqlite3-dev went backwards which would break package feeds (from 3:3.40.1-r0 to 3:3.40.0-r0) [version-going-backwards]
ERROR: sqlite3-3_3.40.0-r0 do_packagedata_setscene: QA Issue: Package version for package libsqlite3-doc went backwards which would break package feeds (from 3:3.40.1-r0 to 3:3.40.0-r0) [version-going-backwards]
ERROR: sqlite3-3_3.40.0-r0 do_packagedata_setscene: QA Issue: Package version for package libsqlite3-staticdev went backwards which would break package feeds (from 3:3.40.1-r0 to 3:3.40.0-r0) [version-going-backwards]
ERROR: sqlite3-3_3.40.0-r0 do_packagedata_setscene: QA Issue: Package version for package sqlite3 went backwards which would break package feeds (from 3:3.40.1-r0 to 3:3.40.0-r0) [version-going-backwards]
ERROR: sqlite3-3_3.40.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============8825317349100793774==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1692 entries from dependency cache.
Parsing recipes...done.
Parsing of 893 .bb files complete (892 cached, 1 parsed). 1690 targets, 36 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:5e55d891da5c6b33ad8758634e260882a4c417dd"
workspace            = "master:c9c2b6b613bbaf7133d9c3435f3aef3fe4e38f59"

Initialising tasks...done.
Sstate summary: Wanted 32 Local 25 Mirrors 0 Missed 7 Current 584 (78% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 592 of 616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.40.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 593 of 616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.40.0.bb:do_populate_sysroot_setscene)
NOTE: Running task 1372 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.70.2.bb:do_fetch)
NOTE: Running task 1389 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.70.2.bb:do_write_config)
NOTE: recipe sqlite3-3_3.40.0-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.40.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vte-0.70.2-r0: task do_fetch: Started
NOTE: recipe vte-0.70.2-r0: task do_write_config: Started
NOTE: recipe vte-0.70.2-r0: task do_write_config: Succeeded
NOTE: recipe vte-0.70.2-r0: task do_fetch: Succeeded
NOTE: Running task 1390 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.70.2.bb:do_unpack)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/sqlite3/3_3.40.0-r0/temp/log.do_packagedata_setscene.3840578
NOTE: recipe vte-0.70.2-r0: task do_unpack: Started
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.40.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 608 of 616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.40.0.bb:do_package_setscene)
NOTE: recipe sqlite3-3_3.40.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vte-0.70.2-r0: task do_unpack: Succeeded
NOTE: Running task 1391 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.70.2.bb:do_patch)
NOTE: recipe vte-0.70.2-r0: task do_patch: Started
NOTE: recipe vte-0.70.2-r0: task do_patch: Succeeded
NOTE: Running task 1392 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.70.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1393 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.70.2.bb:do_populate_lic)
NOTE: recipe vte-0.70.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vte-0.70.2-r0: task do_populate_lic: Started
NOTE: recipe vte-0.70.2-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.70.2.bb:do_populate_lic unihash changed to 0b81ae0f992e40643a04e6dc695674a41097a359dfaf11187680370ad2ce3ce8
NOTE: recipe vte-0.70.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe sqlite3-3_3.40.0-r0: task do_package_setscene: Started
NOTE: recipe sqlite3-3_3.40.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 610 of 616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 612 of 616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 613 of 616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.36.bb:do_populate_sysroot_setscene)
NOTE: recipe glibc-2.36-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glibc-2.36-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 616 of 616 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.19.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1959 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.40.0.bb:do_packagedata)
NOTE: Running task 2110 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.70.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe sqlite3-3_3.40.0-r0: task do_packagedata: Started
NOTE: recipe vte-0.70.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sqlite3-3_3.40.0-r0: task do_packagedata: Succeeded
NOTE: recipe vte-0.70.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2151 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.70.2.bb:do_configure)
NOTE: recipe vte-0.70.2-r0: task do_configure: Started
NOTE: recipe vte-0.70.2-r0: task do_configure: Succeeded
NOTE: Running task 2152 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.70.2.bb:do_compile)
NOTE: recipe vte-0.70.2-r0: task do_compile: Started
NOTE: recipe vte-0.70.2-r0: task do_compile: Succeeded
NOTE: Running task 2153 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.70.2.bb:do_install)
NOTE: recipe vte-0.70.2-r0: task do_install: Started
NOTE: recipe vte-0.70.2-r0: task do_install: Succeeded
NOTE: Running task 2154 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.70.2.bb:do_package)
NOTE: Running task 2155 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.70.2.bb:do_populate_sysroot)
NOTE: recipe vte-0.70.2-r0: task do_populate_sysroot: Started
NOTE: recipe vte-0.70.2-r0: task do_package: Started
NOTE: recipe vte-0.70.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe vte-0.70.2-r0: task do_package: Succeeded
NOTE: Running task 2156 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.70.2.bb:do_packagedata)
NOTE: recipe vte-0.70.2-r0: task do_packagedata: Started
NOTE: recipe vte-0.70.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2157 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.70.2.bb:do_package_write_rpm)
NOTE: Running task 2158 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.70.2.bb:do_package_qa)
NOTE: recipe vte-0.70.2-r0: task do_package_write_rpm: Started
NOTE: recipe vte-0.70.2-r0: task do_package_qa: Started
NOTE: recipe vte-0.70.2-r0: task do_package_qa: Succeeded
NOTE: recipe vte-0.70.2-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2159 of 2159 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.70.2.bb:do_build)
NOTE: Tasks Summary: Attempted 2159 tasks of which 2142 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: sqlite3-3_3.40.0-r0 do_packagedata_setscene: QA Issue: Package version for package sqlite3-src went backwards which would break package feeds (from 3:3.40.1-r0 to 3:3.40.0-r0) [version-going-backwards]
ERROR: sqlite3-3_3.40.0-r0 do_packagedata_setscene: QA Issue: Package version for package sqlite3-dbg went backwards which would break package feeds (from 3:3.40.1-r0 to 3:3.40.0-r0) [version-going-backwards]
ERROR: sqlite3-3_3.40.0-r0 do_packagedata_setscene: QA Issue: Package version for package libsqlite3 went backwards which would break package feeds (from 3:3.40.1-r0 to 3:3.40.0-r0) [version-going-backwards]
ERROR: sqlite3-3_3.40.0-r0 do_packagedata_setscene: QA Issue: Package version for package libsqlite3-dev went backwards which would break package feeds (from 3:3.40.1-r0 to 3:3.40.0-r0) [version-going-backwards]
ERROR: sqlite3-3_3.40.0-r0 do_packagedata_setscene: QA Issue: Package version for package libsqlite3-doc went backwards which would break package feeds (from 3:3.40.1-r0 to 3:3.40.0-r0) [version-going-backwards]
ERROR: sqlite3-3_3.40.0-r0 do_packagedata_setscene: QA Issue: Package version for package libsqlite3-staticdev went backwards which would break package feeds (from 3:3.40.1-r0 to 3:3.40.0-r0) [version-going-backwards]
ERROR: sqlite3-3_3.40.0-r0 do_packagedata_setscene: QA Issue: Package version for package sqlite3 went backwards which would break package feeds (from 3:3.40.1-r0 to 3:3.40.0-r0) [version-going-backwards]
ERROR: sqlite3-3_3.40.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============8825317349100793774==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 893 .bb files complete (0 cached, 893 parsed). 1690 targets, 71 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:5e55d891da5c6b33ad8758634e260882a4c417dd"
workspace            = "master:c9c2b6b613bbaf7133d9c3435f3aef3fe4e38f59"

Initialising tasks...done.
Sstate summary: Wanted 32 Local 25 Mirrors 0 Missed 7 Current 580 (78% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 588 of 612 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.40.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 589 of 612 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.40.0.bb:do_populate_sysroot_setscene)
NOTE: Running task 1354 of 2141 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.70.2.bb:do_fetch)
NOTE: Running task 1371 of 2141 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.70.2.bb:do_write_config)
NOTE: recipe sqlite3-3_3.40.0-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.40.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vte-0.70.2-r0: task do_fetch: Started
NOTE: recipe vte-0.70.2-r0: task do_write_config: Started
NOTE: recipe vte-0.70.2-r0: task do_fetch: Succeeded
NOTE: Running task 1372 of 2141 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.70.2.bb:do_unpack)
NOTE: recipe vte-0.70.2-r0: task do_write_config: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/sqlite3/3_3.40.0-r0/temp/log.do_packagedata_setscene.3888624
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.40.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 604 of 612 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.40.0.bb:do_package_setscene)
NOTE: recipe vte-0.70.2-r0: task do_unpack: Started
NOTE: recipe sqlite3-3_3.40.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vte-0.70.2-r0: task do_unpack: Succeeded
NOTE: Running task 1373 of 2141 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.70.2.bb:do_patch)
NOTE: recipe vte-0.70.2-r0: task do_patch: Started
NOTE: recipe vte-0.70.2-r0: task do_patch: Succeeded
NOTE: Running task 1374 of 2141 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.70.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1375 of 2141 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.70.2.bb:do_populate_lic)
NOTE: recipe vte-0.70.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vte-0.70.2-r0: task do_populate_lic: Started
NOTE: recipe vte-0.70.2-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.70.2.bb:do_populate_lic unihash changed to 0b81ae0f992e40643a04e6dc695674a41097a359dfaf11187680370ad2ce3ce8
NOTE: recipe vte-0.70.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe sqlite3-3_3.40.0-r0: task do_package_setscene: Started
NOTE: recipe sqlite3-3_3.40.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 606 of 612 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 608 of 612 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 609 of 612 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.36.bb:do_populate_sysroot_setscene)
NOTE: recipe glibc-2.36-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glibc-2.36-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 612 of 612 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.19.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1943 of 2141 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.40.0.bb:do_packagedata)
NOTE: Running task 2092 of 2141 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.70.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe sqlite3-3_3.40.0-r0: task do_packagedata: Started
NOTE: recipe vte-0.70.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sqlite3-3_3.40.0-r0: task do_packagedata: Succeeded
NOTE: recipe vte-0.70.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2133 of 2141 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.70.2.bb:do_configure)
NOTE: recipe vte-0.70.2-r0: task do_configure: Started
NOTE: recipe vte-0.70.2-r0: task do_configure: Succeeded
NOTE: Running task 2134 of 2141 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.70.2.bb:do_compile)
NOTE: recipe vte-0.70.2-r0: task do_compile: Started
NOTE: recipe vte-0.70.2-r0: task do_compile: Succeeded
NOTE: Running task 2135 of 2141 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.70.2.bb:do_install)
NOTE: recipe vte-0.70.2-r0: task do_install: Started
NOTE: recipe vte-0.70.2-r0: task do_install: Succeeded
NOTE: Running task 2136 of 2141 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.70.2.bb:do_package)
NOTE: Running task 2137 of 2141 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.70.2.bb:do_populate_sysroot)
NOTE: recipe vte-0.70.2-r0: task do_populate_sysroot: Started
NOTE: recipe vte-0.70.2-r0: task do_package: Started
NOTE: recipe vte-0.70.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe vte-0.70.2-r0: task do_package: Succeeded
NOTE: Running task 2138 of 2141 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.70.2.bb:do_packagedata)
NOTE: recipe vte-0.70.2-r0: task do_packagedata: Started
NOTE: recipe vte-0.70.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2139 of 2141 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.70.2.bb:do_package_write_rpm)
NOTE: Running task 2140 of 2141 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.70.2.bb:do_package_qa)
NOTE: recipe vte-0.70.2-r0: task do_package_write_rpm: Started
NOTE: recipe vte-0.70.2-r0: task do_package_qa: Started
NOTE: recipe vte-0.70.2-r0: task do_package_qa: Succeeded
NOTE: recipe vte-0.70.2-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2141 of 2141 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vte/vte_0.70.2.bb:do_build)
NOTE: Tasks Summary: Attempted 2141 tasks of which 2124 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: sqlite3-3_3.40.0-r0 do_packagedata_setscene: QA Issue: Package version for package sqlite3-src went backwards which would break package feeds (from 3:3.40.1-r0 to 3:3.40.0-r0) [version-going-backwards]
ERROR: sqlite3-3_3.40.0-r0 do_packagedata_setscene: QA Issue: Package version for package sqlite3-dbg went backwards which would break package feeds (from 3:3.40.1-r0 to 3:3.40.0-r0) [version-going-backwards]
ERROR: sqlite3-3_3.40.0-r0 do_packagedata_setscene: QA Issue: Package version for package libsqlite3 went backwards which would break package feeds (from 3:3.40.1-r0 to 3:3.40.0-r0) [version-going-backwards]
ERROR: sqlite3-3_3.40.0-r0 do_packagedata_setscene: QA Issue: Package version for package libsqlite3-dev went backwards which would break package feeds (from 3:3.40.1-r0 to 3:3.40.0-r0) [version-going-backwards]
ERROR: sqlite3-3_3.40.0-r0 do_packagedata_setscene: QA Issue: Package version for package libsqlite3-doc went backwards which would break package feeds (from 3:3.40.1-r0 to 3:3.40.0-r0) [version-going-backwards]
ERROR: sqlite3-3_3.40.0-r0 do_packagedata_setscene: QA Issue: Package version for package libsqlite3-staticdev went backwards which would break package feeds (from 3:3.40.1-r0 to 3:3.40.0-r0) [version-going-backwards]
ERROR: sqlite3-3_3.40.0-r0 do_packagedata_setscene: QA Issue: Package version for package sqlite3 went backwards which would break package feeds (from 3:3.40.1-r0 to 3:3.40.0-r0) [version-going-backwards]
ERROR: sqlite3-3_3.40.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============8825317349100793774==--

