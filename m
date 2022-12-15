Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23FB5C54EBF
	for <webhook@archiver.kernel.org>; Thu, 15 Dec 2022 20:32:35 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.145447.1671136353089415659
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Dec 2022 12:32:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=XQri9O5g;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 01010185177d1940-96d87060-f02c-4651-a53f-1fc20b4f4b3d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1671136352;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=asG2AzZOscmuPEEJDfh+pLtKDcNYJfOZjBj6Tep/K04=;
	b=XQri9O5gaAM8vYNtlINUs93yFidVQsv98JvXQA1oD85RRYzL8Gyq0fJ1SH+wzOzf
	sMz3XJHZO3FPOSWYMcBwuYvpBWlMhNC6HJF2XSsoOeVrtYOojrxGgOwqSp0+QmJSerV
	oXpHCaigqH4+LSz0a0yAhvgGVK6h6j/VVoTuFFFA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1671136352;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=asG2AzZOscmuPEEJDfh+pLtKDcNYJfOZjBj6Tep/K04=;
	b=RJPc7KjxecCYaL3H5Ox9TWEmfZDLj1m1F7pYegmeFKbxqYVQfuuwKsoS7xRbRW5S
	S7zTgQRwQFHIB9f+qiwVluk2PWT9Q7SR+E7+Wv5Lz3tT7lkbnsxk4Q/5MKWxyQvja+p
	E1e6vyCN8I/LJBx3DTjNqW/wfM5VOO3HAxs7fZjc=
Content-Type: multipart/mixed; boundary="===============0949245654989792861=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gobject-introspection: upgrading to 1.74.0 SUCCEEDED
Message-ID: <01010185177d1940-96d87060-f02c-4651-a53f-1fc20b4f4b3d-000000@us-west-2.amazonses.com>
Date: Thu, 15 Dec 2022 20:32:32 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.12.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 20:32:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174681

--===============0949245654989792861==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gobject-introspection* to *1.74.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gobject-introspection-upgrade-1.72.0-1.74.0.patch
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
--===============0949245654989792861==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 888 .bb files complete (0 cached, 888 parsed). 1672 targets, 71 skipped, 0 masked, 0 errors.
Removing 2 recipes from the ppc7400 sysroot...done.
Removing 2 recipes from the qemuppc sysroot...done.
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
meta-yocto-bsp       = "tmp-auh-upgrades:dbb87fd6f40de787b99fdecf12ca92f57f4b1ea0"
workspace            = "master:46fd76aa07bd431f0ba73bdafeb7bf5aa31cef25"

Initialising tasks...done.
Sstate summary: Wanted 55 Local 48 Mirrors 0 Missed 7 Current 274 (87% match, 97% complete)
Removing 1 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 283 of 329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: Running setscene task 284 of 329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 285 of 329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.9.bb:do_populate_sysroot_setscene)
NOTE: Running task 779 of 1241 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_fetch)
NOTE: Running task 802 of 1241 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_write_config)
NOTE: recipe tzdata-2022d-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.9-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_write_config: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_fetch: Succeeded
NOTE: Running task 841 of 1241 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_unpack)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_write_config: Succeeded
NOTE: recipe tzdata-2022d-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_unpack: Started
NOTE: recipe xz-5.2.9-r0: task do_populate_sysroot_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/xz/5.2.9-r0/temp/log.do_packagedata_setscene.1439567
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.9.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 314 of 329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.9.bb:do_package_setscene)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_unpack: Succeeded
NOTE: Running task 861 of 1241 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_patch)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_patch: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_patch: Succeeded
NOTE: Running task 862 of 1241 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 863 of 1241 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_populate_lic)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_populate_lic: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_populate_lic unihash changed to 94bdd2d75190dea090a911c127a93c06dd68f4273a990eda51fe7d6420a04078
NOTE: recipe gobject-introspection-1.74.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xz-5.2.9-r0: task do_package_setscene: Started
NOTE: recipe xz-5.2.9-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 316 of 329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 318 of 329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 319 of 329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 320 of 329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.36.bb:do_populate_sysroot_setscene)
NOTE: recipe glibc-2.36-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glibc-2.36-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 323 of 329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-powerpc-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-powerpc-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 325 of 329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.19.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 326 of 329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.39.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-powerpc-2.39-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-powerpc-2.39-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1164 of 1241 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.9.bb:do_packagedata)
NOTE: Running task 1178 of 1241 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe xz-5.2.9-r0: task do_packagedata: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xz-5.2.9-r0: task do_packagedata: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1233 of 1241 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_configure)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_configure: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_configure: Succeeded
NOTE: Running task 1234 of 1241 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_compile)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_compile: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_compile: Succeeded
NOTE: Running task 1235 of 1241 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_install)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_install: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_install: Succeeded
NOTE: Running task 1236 of 1241 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_package)
NOTE: Running task 1237 of 1241 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_populate_sysroot)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_populate_sysroot: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_package: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_package: Succeeded
NOTE: Running task 1238 of 1241 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_packagedata)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_packagedata: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1239 of 1241 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_package_write_rpm)
NOTE: Running task 1240 of 1241 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_package_qa)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_package_write_rpm: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_package_qa: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_package_qa: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1241 of 1241 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_build)
NOTE: Tasks Summary: Attempted 1241 tasks of which 1224 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 31 ERROR messages, returning a non-zero exit code.
ERROR: xz-5.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package xz-src went backwards which would break package feeds (from 0:5.4.0-r0 to 0:5.2.9-r0) [version-going-backwards]
ERROR: xz-5.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package xz-dbg went backwards which would break package feeds (from 0:5.4.0-r0 to 0:5.2.9-r0) [version-going-backwards]
ERROR: xz-5.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package liblzma went backwards which would break package feeds (from 0:5.4.0-r0 to 0:5.2.9-r0) [version-going-backwards]
ERROR: xz-5.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package xz-staticdev went backwards which would break package feeds (from 0:5.4.0-r0 to 0:5.2.9-r0) [version-going-backwards]
ERROR: xz-5.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package xz-dev went backwards which would break package feeds (from 0:5.4.0-r0 to 0:5.2.9-r0) [version-going-backwards]
ERROR: xz-5.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package xz-doc went backwards which would break package feeds (from 0:5.4.0-r0 to 0:5.2.9-r0) [version-going-backwards]
ERROR: xz-5.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package xz went backwards which would break package feeds (from 0:5.4.0-r0 to 0:5.2.9-r0) [version-going-backwards]
ERROR: xz-5.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-ca went backwards which would break package feeds (from 0:5.4.0-r0 to 0:5.2.9-r0) [version-going-backwards]
ERROR: xz-5.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-cs went backwards which would break package feeds (from 0:5.4.0-r0 to 0:5.2.9-r0) [version-going-backwards]
ERROR: xz-5.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-da went backwards which would break package feeds (from 0:5.4.0-r0 to 0:5.2.9-r0) [version-going-backwards]
ERROR: xz-5.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-de went backwards which would break package feeds (from 0:5.4.0-r0 to 0:5.2.9-r0) [version-going-backwards]
ERROR: xz-5.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-eo went backwards which would break package feeds (from 0:5.4.0-r0 to 0:5.2.9-r0) [version-going-backwards]
ERROR: xz-5.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-es went backwards which would break package feeds (from 0:5.4.0-r0 to 0:5.2.9-r0) [version-going-backwards]
ERROR: xz-5.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-fi went backwards which would break package feeds (from 0:5.4.0-r0 to 0:5.2.9-r0) [version-going-backwards]
ERROR: xz-5.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-fr went backwards which would break package feeds (from 0:5.4.0-r0 to 0:5.2.9-r0) [version-going-backwards]
ERROR: xz-5.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-hr went backwards which would break package feeds (from 0:5.4.0-r0 to 0:5.2.9-r0) [version-going-backwards]
ERROR: xz-5.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-hu went backwards which would break package feeds (from 0:5.4.0-r0 to 0:5.2.9-r0) [version-going-backwards]
ERROR: xz-5.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-it went backwards which would break package feeds (from 0:5.4.0-r0 to 0:5.2.9-r0) [version-going-backwards]
ERROR: xz-5.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-ko went backwards which would break package feeds (from 0:5.4.0-r0 to 0:5.2.9-r0) [version-going-backwards]
ERROR: xz-5.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-pl went backwards which would break package feeds (from 0:5.4.0-r0 to 0:5.2.9-r0) [version-going-backwards]
ERROR: xz-5.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-pt went backwards which would break package feeds (from 0:5.4.0-r0 to 0:5.2.9-r0) [version-going-backwards]
ERROR: xz-5.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-pt-br went backwards which would break package feeds (from 0:5.4.0-r0 to 0:5.2.9-r0) [version-going-backwards]
ERROR: xz-5.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-ro went backwards which would break package feeds (from 0:5.4.0-r0 to 0:5.2.9-r0) [version-going-backwards]
ERROR: xz-5.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-sr went backwards which would break package feeds (from 0:5.4.0-r0 to 0:5.2.9-r0) [version-going-backwards]
ERROR: xz-5.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-sv went backwards which would break package feeds (from 0:5.4.0-r0 to 0:5.2.9-r0) [version-going-backwards]
ERROR: xz-5.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-tr went backwards which would break package feeds (from 0:5.4.0-r0 to 0:5.2.9-r0) [version-going-backwards]
ERROR: xz-5.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-uk went backwards which would break package feeds (from 0:5.4.0-r0 to 0:5.2.9-r0) [version-going-backwards]
ERROR: xz-5.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-vi went backwards which would break package feeds (from 0:5.4.0-r0 to 0:5.2.9-r0) [version-going-backwards]
ERROR: xz-5.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-zh-cn went backwards which would break package feeds (from 0:5.4.0-r0 to 0:5.2.9-r0) [version-going-backwards]
ERROR: xz-5.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-zh-tw went backwards which would break package feeds (from 0:5.4.0-r0 to 0:5.2.9-r0) [version-going-backwards]
ERROR: xz-5.2.9-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============0949245654989792861==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1672 entries from dependency cache.
Parsing recipes...done.
Parsing of 888 .bb files complete (887 cached, 1 parsed). 1672 targets, 36 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
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
meta-yocto-bsp       = "tmp-auh-upgrades:dbb87fd6f40de787b99fdecf12ca92f57f4b1ea0"
workspace            = "master:46fd76aa07bd431f0ba73bdafeb7bf5aa31cef25"

Initialising tasks...done.
Sstate summary: Wanted 55 Local 48 Mirrors 0 Missed 7 Current 274 (87% match, 97% complete)
Removing 1 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 283 of 329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: Running setscene task 284 of 329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 285 of 329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.9.bb:do_populate_sysroot_setscene)
NOTE: Running task 779 of 1241 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_fetch)
NOTE: Running task 802 of 1241 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_write_config)
NOTE: recipe tzdata-2022d-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.9-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_write_config: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_fetch: Succeeded
NOTE: Running task 841 of 1241 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_unpack)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_write_config: Succeeded
NOTE: recipe tzdata-2022d-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_unpack: Started
NOTE: recipe xz-5.2.9-r0: task do_populate_sysroot_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/xz/5.2.9-r0/temp/log.do_packagedata_setscene.1426761
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.9.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 314 of 329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.9.bb:do_package_setscene)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_unpack: Succeeded
NOTE: Running task 861 of 1241 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_patch)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_patch: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_patch: Succeeded
NOTE: Running task 862 of 1241 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 863 of 1241 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_populate_lic)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_populate_lic: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_populate_lic unihash changed to 94bdd2d75190dea090a911c127a93c06dd68f4273a990eda51fe7d6420a04078
NOTE: recipe gobject-introspection-1.74.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xz-5.2.9-r0: task do_package_setscene: Started
NOTE: recipe xz-5.2.9-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 316 of 329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 318 of 329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 319 of 329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 320 of 329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.36.bb:do_populate_sysroot_setscene)
NOTE: recipe glibc-2.36-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glibc-2.36-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 323 of 329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 325 of 329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.19.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 326 of 329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.39.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-x86_64-2.39-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.39-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1164 of 1241 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.9.bb:do_packagedata)
NOTE: Running task 1178 of 1241 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe xz-5.2.9-r0: task do_packagedata: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xz-5.2.9-r0: task do_packagedata: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1233 of 1241 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_configure)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_configure: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_configure: Succeeded
NOTE: Running task 1234 of 1241 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_compile)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_compile: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_compile: Succeeded
NOTE: Running task 1235 of 1241 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_install)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_install: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_install: Succeeded
NOTE: Running task 1236 of 1241 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_package)
NOTE: Running task 1237 of 1241 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_populate_sysroot)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_populate_sysroot: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_package: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_package: Succeeded
NOTE: Running task 1238 of 1241 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_packagedata)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_packagedata: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1239 of 1241 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_package_write_rpm)
NOTE: Running task 1240 of 1241 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_package_qa)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_package_write_rpm: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_package_qa: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_package_qa: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1241 of 1241 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_build)
NOTE: Tasks Summary: Attempted 1241 tasks of which 1224 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 31 ERROR messages, returning a non-zero exit code.
ERROR: xz-5.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package xz-src went backwards which would break package feeds (from 0:5.4.0-r0 to 0:5.2.9-r0) [version-going-backwards]
ERROR: xz-5.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package xz-dbg went backwards which would break package feeds (from 0:5.4.0-r0 to 0:5.2.9-r0) [version-going-backwards]
ERROR: xz-5.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package liblzma went backwards which would break package feeds (from 0:5.4.0-r0 to 0:5.2.9-r0) [version-going-backwards]
ERROR: xz-5.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package xz-staticdev went backwards which would break package feeds (from 0:5.4.0-r0 to 0:5.2.9-r0) [version-going-backwards]
ERROR: xz-5.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package xz-dev went backwards which would break package feeds (from 0:5.4.0-r0 to 0:5.2.9-r0) [version-going-backwards]
ERROR: xz-5.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package xz-doc went backwards which would break package feeds (from 0:5.4.0-r0 to 0:5.2.9-r0) [version-going-backwards]
ERROR: xz-5.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package xz went backwards which would break package feeds (from 0:5.4.0-r0 to 0:5.2.9-r0) [version-going-backwards]
ERROR: xz-5.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-ca went backwards which would break package feeds (from 0:5.4.0-r0 to 0:5.2.9-r0) [version-going-backwards]
ERROR: xz-5.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-cs went backwards which would break package feeds (from 0:5.4.0-r0 to 0:5.2.9-r0) [version-going-backwards]
ERROR: xz-5.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-da went backwards which would break package feeds (from 0:5.4.0-r0 to 0:5.2.9-r0) [version-going-backwards]
ERROR: xz-5.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-de went backwards which would break package feeds (from 0:5.4.0-r0 to 0:5.2.9-r0) [version-going-backwards]
ERROR: xz-5.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-eo went backwards which would break package feeds (from 0:5.4.0-r0 to 0:5.2.9-r0) [version-going-backwards]
ERROR: xz-5.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-es went backwards which would break package feeds (from 0:5.4.0-r0 to 0:5.2.9-r0) [version-going-backwards]
ERROR: xz-5.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-fi went backwards which would break package feeds (from 0:5.4.0-r0 to 0:5.2.9-r0) [version-going-backwards]
ERROR: xz-5.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-fr went backwards which would break package feeds (from 0:5.4.0-r0 to 0:5.2.9-r0) [version-going-backwards]
ERROR: xz-5.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-hr went backwards which would break package feeds (from 0:5.4.0-r0 to 0:5.2.9-r0) [version-going-backwards]
ERROR: xz-5.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-hu went backwards which would break package feeds (from 0:5.4.0-r0 to 0:5.2.9-r0) [version-going-backwards]
ERROR: xz-5.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-it went backwards which would break package feeds (from 0:5.4.0-r0 to 0:5.2.9-r0) [version-going-backwards]
ERROR: xz-5.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-ko went backwards which would break package feeds (from 0:5.4.0-r0 to 0:5.2.9-r0) [version-going-backwards]
ERROR: xz-5.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-pl went backwards which would break package feeds (from 0:5.4.0-r0 to 0:5.2.9-r0) [version-going-backwards]
ERROR: xz-5.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-pt went backwards which would break package feeds (from 0:5.4.0-r0 to 0:5.2.9-r0) [version-going-backwards]
ERROR: xz-5.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-pt-br went backwards which would break package feeds (from 0:5.4.0-r0 to 0:5.2.9-r0) [version-going-backwards]
ERROR: xz-5.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-ro went backwards which would break package feeds (from 0:5.4.0-r0 to 0:5.2.9-r0) [version-going-backwards]
ERROR: xz-5.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-sr went backwards which would break package feeds (from 0:5.4.0-r0 to 0:5.2.9-r0) [version-going-backwards]
ERROR: xz-5.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-sv went backwards which would break package feeds (from 0:5.4.0-r0 to 0:5.2.9-r0) [version-going-backwards]
ERROR: xz-5.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-tr went backwards which would break package feeds (from 0:5.4.0-r0 to 0:5.2.9-r0) [version-going-backwards]
ERROR: xz-5.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-uk went backwards which would break package feeds (from 0:5.4.0-r0 to 0:5.2.9-r0) [version-going-backwards]
ERROR: xz-5.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-vi went backwards which would break package feeds (from 0:5.4.0-r0 to 0:5.2.9-r0) [version-going-backwards]
ERROR: xz-5.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-zh-cn went backwards which would break package feeds (from 0:5.4.0-r0 to 0:5.2.9-r0) [version-going-backwards]
ERROR: xz-5.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-zh-tw went backwards which would break package feeds (from 0:5.4.0-r0 to 0:5.2.9-r0) [version-going-backwards]
ERROR: xz-5.2.9-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============0949245654989792861==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gobject-introspection-upgrade-1.72.0-1.74.0.patch"

RnJvbSAxY2I5NGM2ZTg4YmNmZmFjN2YyNDVkNzcxODNkOGU1NjA5NTQ0YmM2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgRGVjIDIwMjIgMTQ6NTA6NDEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
b2JqZWN0LWludHJvc3BlY3Rpb246IHVwZ3JhZGUgMS43Mi4wIC0+IDEuNzQuMAoKLS0tCiAuLi4t
UmVsb2NhdGUtdGhlLXJlcG9zaXRvcnktZGlyZWN0b3J5LWZvci1uYXRpdmUtYnVpbGRzLnBhdGNo
IHwgNCArKy0tCiAuLi5udHJvc3BlY3Rpb25fMS43Mi4wLmJiID0+IGdvYmplY3QtaW50cm9zcGVj
dGlvbl8xLjc0LjAuYmJ9IHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyks
IDMgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWdub21lL2dvYmplY3QtaW50cm9z
cGVjdGlvbi97Z29iamVjdC1pbnRyb3NwZWN0aW9uXzEuNzIuMC5iYiA9PiBnb2JqZWN0LWludHJv
c3BlY3Rpb25fMS43NC4wLmJifSAoOTklKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1nbm9t
ZS9nb2JqZWN0LWludHJvc3BlY3Rpb24vZ29iamVjdC1pbnRyb3NwZWN0aW9uLzAwMDEtUmVsb2Nh
dGUtdGhlLXJlcG9zaXRvcnktZGlyZWN0b3J5LWZvci1uYXRpdmUtYnVpbGRzLnBhdGNoIGIvbWV0
YS9yZWNpcGVzLWdub21lL2dvYmplY3QtaW50cm9zcGVjdGlvbi9nb2JqZWN0LWludHJvc3BlY3Rp
b24vMDAwMS1SZWxvY2F0ZS10aGUtcmVwb3NpdG9yeS1kaXJlY3RvcnktZm9yLW5hdGl2ZS1idWls
ZHMucGF0Y2gKaW5kZXggYmE5NjUwOTJlMS4uMWVjOTFjZTEzYiAxMDA2NDQKLS0tIGEvbWV0YS9y
ZWNpcGVzLWdub21lL2dvYmplY3QtaW50cm9zcGVjdGlvbi9nb2JqZWN0LWludHJvc3BlY3Rpb24v
MDAwMS1SZWxvY2F0ZS10aGUtcmVwb3NpdG9yeS1kaXJlY3RvcnktZm9yLW5hdGl2ZS1idWlsZHMu
cGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWdub21lL2dvYmplY3QtaW50cm9zcGVjdGlvbi9nb2Jq
ZWN0LWludHJvc3BlY3Rpb24vMDAwMS1SZWxvY2F0ZS10aGUtcmVwb3NpdG9yeS1kaXJlY3Rvcnkt
Zm9yLW5hdGl2ZS1idWlsZHMucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDc0YTBmZWU4OTIy
MzVjNzIyYWM2MGRkZWE2ZWU3OWJjM2Q3YTkzZjUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitG
cm9tIGFkYTA1NmJlNDBiMGYwYzNlNTQwOWNlY2QyYWMxY2Y1MzVjOTQ3ZjcgTW9uIFNlcCAxNyAw
MDowMDowMCAyMDAxCiBGcm9tOiBTYXNjaGEgU2lsYmUgPHgteW8xN0BzZS1zaWxiZS5kZT4KIERh
dGU6IEZyaSwgOCBKdW4gMjAxOCAxMzo1NToxMCArMDIwMAogU3ViamVjdDogW1BBVENIXSBSZWxv
Y2F0ZSB0aGUgcmVwb3NpdG9yeSBkaXJlY3RvcnkgZm9yIG5hdGl2ZSBidWlsZHMKQEAgLTIxLDcg
KzIxLDcgQEAgU2lnbmVkLW9mZi1ieTogU2FzY2hhIFNpbGJlIDx4LXlvMTdAc2Utc2lsYmUuZGU+
CiAgMiBmaWxlcyBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQogCiBk
aWZmIC0tZ2l0IGEvZ2lyZXBvc2l0b3J5L2dpcmVwb3NpdG9yeS5jIGIvZ2lyZXBvc2l0b3J5L2dp
cmVwb3NpdG9yeS5jCi1pbmRleCA3ZDAzNDg1Li4yMGY0ODEzIDEwMDY0NAoraW5kZXggYTA3NTRm
NC4uMmQ0NTZmOSAxMDA2NDQKIC0tLSBhL2dpcmVwb3NpdG9yeS9naXJlcG9zaXRvcnkuYwogKysr
IGIvZ2lyZXBvc2l0b3J5L2dpcmVwb3NpdG9yeS5jCiBAQCAtMjEsNiArMjEsOCBAQApkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWdub21lL2dvYmplY3QtaW50cm9zcGVjdGlvbi9nb2JqZWN0LWlu
dHJvc3BlY3Rpb25fMS43Mi4wLmJiIGIvbWV0YS9yZWNpcGVzLWdub21lL2dvYmplY3QtaW50cm9z
cGVjdGlvbi9nb2JqZWN0LWludHJvc3BlY3Rpb25fMS43NC4wLmJiCnNpbWlsYXJpdHkgaW5kZXgg
OTklCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1nbm9tZS9nb2JqZWN0LWludHJvc3BlY3Rpb24v
Z29iamVjdC1pbnRyb3NwZWN0aW9uXzEuNzIuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdu
b21lL2dvYmplY3QtaW50cm9zcGVjdGlvbi9nb2JqZWN0LWludHJvc3BlY3Rpb25fMS43NC4wLmJi
CmluZGV4IGQ5MzVjYmQ5MDUuLmFiOWQyZDM1ZDkgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1n
bm9tZS9nb2JqZWN0LWludHJvc3BlY3Rpb24vZ29iamVjdC1pbnRyb3NwZWN0aW9uXzEuNzIuMC5i
YgorKysgYi9tZXRhL3JlY2lwZXMtZ25vbWUvZ29iamVjdC1pbnRyb3NwZWN0aW9uL2dvYmplY3Qt
aW50cm9zcGVjdGlvbl8xLjc0LjAuYmIKQEAgLTE3LDcgKzE3LDcgQEAgU1JDX1VSSSA9ICIke0dO
T01FX01JUlJPUn0vJHtCUE59LyR7QG9lLnV0aWxzLnRyaW1fdmVyc2lvbigiJHtQVn0iLCAyKX0v
JHtCUE59LSQKICAgICAgICAgICAgZmlsZTovLzAwMDEtZy1pci10b29sLXRlbXBsYXRlLmluLWZp
eC1naXJkaXItcGF0aC5wYXRjaCBcCiAgICAgICAgICAgICIKIAotU1JDX1VSSVtzaGEyNTZzdW1d
ID0gIjAyZmU4ZTU5MDg2MWQ4OGY4MzA2MGRkMzljZGE1Y2NhYTYwYjJkYTFkMjFkMGY5NTQ5OTMw
MWIxODZiZWFhYmMiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiMzQ3YjNhNzE5ZTY4YmE0YzY5ZmYy
ZDU3ZWUyNjg5MjMzZWE4YzA3ZmM0OTIyMDVlNTczMzg2Nzc5ZTQyZDY1MyIKIAogU1JDX1VSSTph
cHBlbmQ6Y2xhc3MtbmF0aXZlID0gIiBmaWxlOi8vMDAwMS1SZWxvY2F0ZS10aGUtcmVwb3NpdG9y
eS1kaXJlY3RvcnktZm9yLW5hdGl2ZS1idWlsZHMucGF0Y2giCiAKLS0gCjIuMzcuMwoK

--===============0949245654989792861==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 888 .bb files complete (0 cached, 888 parsed). 1672 targets, 64 skipped, 0 masked, 0 errors.
Removing 2 recipes from the mips32r2 sysroot...done.
Removing 2 recipes from the qemumips sysroot...done.
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
meta-yocto-bsp       = "tmp-auh-upgrades:dbb87fd6f40de787b99fdecf12ca92f57f4b1ea0"
workspace            = "master:46fd76aa07bd431f0ba73bdafeb7bf5aa31cef25"

Initialising tasks...done.
Sstate summary: Wanted 55 Local 48 Mirrors 0 Missed 7 Current 274 (87% match, 97% complete)
Removing 1 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 283 of 329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: Running setscene task 284 of 329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 285 of 329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.9.bb:do_populate_sysroot_setscene)
NOTE: Running task 779 of 1241 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_fetch)
NOTE: Running task 802 of 1241 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_write_config)
NOTE: recipe tzdata-2022d-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.9-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_write_config: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_fetch: Succeeded
NOTE: Running task 841 of 1241 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_unpack)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_write_config: Succeeded
NOTE: recipe xz-5.2.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_unpack: Started
NOTE: recipe tzdata-2022d-r0: task do_packagedata_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/xz/5.2.9-r0/temp/log.do_packagedata_setscene.1435287
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.9.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 314 of 329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.9.bb:do_package_setscene)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_unpack: Succeeded
NOTE: Running task 861 of 1241 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_patch)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_patch: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_patch: Succeeded
NOTE: Running task 862 of 1241 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 863 of 1241 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_populate_lic)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_populate_lic: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_populate_lic unihash changed to 94bdd2d75190dea090a911c127a93c06dd68f4273a990eda51fe7d6420a04078
NOTE: recipe gobject-introspection-1.74.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xz-5.2.9-r0: task do_package_setscene: Started
NOTE: recipe xz-5.2.9-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 316 of 329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 318 of 329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 319 of 329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 320 of 329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.36.bb:do_populate_sysroot_setscene)
NOTE: recipe glibc-2.36-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glibc-2.36-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 323 of 329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-mips-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-mips-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 325 of 329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.19.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 326 of 329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.39.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-mips-2.39-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-mips-2.39-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1164 of 1241 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.9.bb:do_packagedata)
NOTE: Running task 1178 of 1241 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe xz-5.2.9-r0: task do_packagedata: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xz-5.2.9-r0: task do_packagedata: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1233 of 1241 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_configure)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_configure: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_configure: Succeeded
NOTE: Running task 1234 of 1241 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_compile)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_compile: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_compile: Succeeded
NOTE: Running task 1235 of 1241 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_install)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_install: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_install: Succeeded
NOTE: Running task 1236 of 1241 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_package)
NOTE: Running task 1237 of 1241 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_populate_sysroot)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_package: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_populate_sysroot: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_package: Succeeded
NOTE: Running task 1238 of 1241 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_packagedata)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_packagedata: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1239 of 1241 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_package_write_rpm)
NOTE: Running task 1240 of 1241 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_package_qa)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_package_write_rpm: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_package_qa: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_package_qa: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1241 of 1241 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_build)
NOTE: Tasks Summary: Attempted 1241 tasks of which 1224 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 31 ERROR messages, returning a non-zero exit code.
ERROR: xz-5.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package xz-src went backwards which would break package feeds (from 0:5.4.0-r0 to 0:5.2.9-r0) [version-going-backwards]
ERROR: xz-5.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package xz-dbg went backwards which would break package feeds (from 0:5.4.0-r0 to 0:5.2.9-r0) [version-going-backwards]
ERROR: xz-5.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package liblzma went backwards which would break package feeds (from 0:5.4.0-r0 to 0:5.2.9-r0) [version-going-backwards]
ERROR: xz-5.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package xz-staticdev went backwards which would break package feeds (from 0:5.4.0-r0 to 0:5.2.9-r0) [version-going-backwards]
ERROR: xz-5.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package xz-dev went backwards which would break package feeds (from 0:5.4.0-r0 to 0:5.2.9-r0) [version-going-backwards]
ERROR: xz-5.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package xz-doc went backwards which would break package feeds (from 0:5.4.0-r0 to 0:5.2.9-r0) [version-going-backwards]
ERROR: xz-5.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package xz went backwards which would break package feeds (from 0:5.4.0-r0 to 0:5.2.9-r0) [version-going-backwards]
ERROR: xz-5.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-ca went backwards which would break package feeds (from 0:5.4.0-r0 to 0:5.2.9-r0) [version-going-backwards]
ERROR: xz-5.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-cs went backwards which would break package feeds (from 0:5.4.0-r0 to 0:5.2.9-r0) [version-going-backwards]
ERROR: xz-5.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-da went backwards which would break package feeds (from 0:5.4.0-r0 to 0:5.2.9-r0) [version-going-backwards]
ERROR: xz-5.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-de went backwards which would break package feeds (from 0:5.4.0-r0 to 0:5.2.9-r0) [version-going-backwards]
ERROR: xz-5.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-eo went backwards which would break package feeds (from 0:5.4.0-r0 to 0:5.2.9-r0) [version-going-backwards]
ERROR: xz-5.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-es went backwards which would break package feeds (from 0:5.4.0-r0 to 0:5.2.9-r0) [version-going-backwards]
ERROR: xz-5.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-fi went backwards which would break package feeds (from 0:5.4.0-r0 to 0:5.2.9-r0) [version-going-backwards]
ERROR: xz-5.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-fr went backwards which would break package feeds (from 0:5.4.0-r0 to 0:5.2.9-r0) [version-going-backwards]
ERROR: xz-5.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-hr went backwards which would break package feeds (from 0:5.4.0-r0 to 0:5.2.9-r0) [version-going-backwards]
ERROR: xz-5.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-hu went backwards which would break package feeds (from 0:5.4.0-r0 to 0:5.2.9-r0) [version-going-backwards]
ERROR: xz-5.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-it went backwards which would break package feeds (from 0:5.4.0-r0 to 0:5.2.9-r0) [version-going-backwards]
ERROR: xz-5.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-ko went backwards which would break package feeds (from 0:5.4.0-r0 to 0:5.2.9-r0) [version-going-backwards]
ERROR: xz-5.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-pl went backwards which would break package feeds (from 0:5.4.0-r0 to 0:5.2.9-r0) [version-going-backwards]
ERROR: xz-5.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-pt went backwards which would break package feeds (from 0:5.4.0-r0 to 0:5.2.9-r0) [version-going-backwards]
ERROR: xz-5.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-pt-br went backwards which would break package feeds (from 0:5.4.0-r0 to 0:5.2.9-r0) [version-going-backwards]
ERROR: xz-5.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-ro went backwards which would break package feeds (from 0:5.4.0-r0 to 0:5.2.9-r0) [version-going-backwards]
ERROR: xz-5.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-sr went backwards which would break package feeds (from 0:5.4.0-r0 to 0:5.2.9-r0) [version-going-backwards]
ERROR: xz-5.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-sv went backwards which would break package feeds (from 0:5.4.0-r0 to 0:5.2.9-r0) [version-going-backwards]
ERROR: xz-5.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-tr went backwards which would break package feeds (from 0:5.4.0-r0 to 0:5.2.9-r0) [version-going-backwards]
ERROR: xz-5.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-uk went backwards which would break package feeds (from 0:5.4.0-r0 to 0:5.2.9-r0) [version-going-backwards]
ERROR: xz-5.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-vi went backwards which would break package feeds (from 0:5.4.0-r0 to 0:5.2.9-r0) [version-going-backwards]
ERROR: xz-5.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-zh-cn went backwards which would break package feeds (from 0:5.4.0-r0 to 0:5.2.9-r0) [version-going-backwards]
ERROR: xz-5.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-zh-tw went backwards which would break package feeds (from 0:5.4.0-r0 to 0:5.2.9-r0) [version-going-backwards]
ERROR: xz-5.2.9-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============0949245654989792861==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/gobject-introspection/gobject-introspection-dbg: PV changed from "1.72.0" to "1.74.0"
packages/core2-32-poky-linux/gobject-introspection/gobject-introspection-dbg: PKGSIZE changed from 1412832 to 1413784 (+0%)
packages/core2-32-poky-linux/gobject-introspection/gobject-introspection-dbg: PKGV changed from 1.72.0 [default] to 1.74.0 [default]
packages/core2-32-poky-linux/gobject-introspection/gobject-introspection-dev: PV changed from "1.72.0" to "1.74.0"
packages/core2-32-poky-linux/gobject-introspection/gobject-introspection-dev: PKGSIZE changed from 12560702 to 12642508 (+1%)
packages/core2-32-poky-linux/gobject-introspection/gobject-introspection-dev: PKGV changed from 1.72.0 [default] to 1.74.0 [default]
packages/core2-32-poky-linux/gobject-introspection/gobject-introspection-doc: PV changed from "1.72.0" to "1.74.0"
packages/core2-32-poky-linux/gobject-introspection/gobject-introspection-doc: PKGV changed from 1.72.0 [default] to 1.74.0 [default]
packages/core2-32-poky-linux/gobject-introspection/gobject-introspection-locale: PV changed from "1.72.0" to "1.74.0"
packages/core2-32-poky-linux/gobject-introspection/gobject-introspection-locale: PKGV changed from 1.72.0 [default] to 1.74.0 [default]
packages/core2-32-poky-linux/gobject-introspection/gobject-introspection-src: PV changed from "1.72.0" to "1.74.0"
packages/core2-32-poky-linux/gobject-introspection/gobject-introspection-src: PKGSIZE changed from 1464573 to 1469418 (+0%)
packages/core2-32-poky-linux/gobject-introspection/gobject-introspection-src: PKGV changed from 1.72.0 [default] to 1.74.0 [default]
packages/core2-32-poky-linux/gobject-introspection/gobject-introspection-staticdev: PV changed from "1.72.0" to "1.74.0"
packages/core2-32-poky-linux/gobject-introspection/gobject-introspection-staticdev: PKGV changed from 1.72.0 [default] to 1.74.0 [default]
packages/core2-32-poky-linux/gobject-introspection/gobject-introspection: PV changed from "1.72.0" to "1.74.0"
packages/core2-32-poky-linux/gobject-introspection/gobject-introspection: PKGSIZE changed from 1969578 to 1972164 (+0%)
packages/core2-32-poky-linux/gobject-introspection/gobject-introspection: PKGV changed from 1.72.0 [default] to 1.74.0 [default]
packages/core2-32-poky-linux/gobject-introspection: PV changed from "1.72.0" to "1.74.0"
packages/core2-32-poky-linux/gobject-introspection: PKGV changed from 1.72.0 [default] to 1.74.0 [default]
packages/core2-32-poky-linux/gobject-introspection: SRC_URI changed from "https://download.gnome.org/sources//gobject-introspection/1.72/gobject-introspection-1.72.0.tar.xz file://0001-g-ir-tool-template.in-fix-girdir-path.patch" to "https://download.gnome.org/sources//gobject-introspection/1.74/gobject-introspection-1.74.0.tar.xz file://0001-g-ir-tool-template.in-fix-girdir-path.patch"

--===============0949245654989792861==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 888 .bb files complete (0 cached, 888 parsed). 1673 targets, 49 skipped, 0 masked, 0 errors.
Removing 125 recipes from the core2-32 sysroot...done.
Removing 131 recipes from the qemux86 sysroot...done.
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
meta-yocto-bsp       = "tmp-auh-upgrades:dbb87fd6f40de787b99fdecf12ca92f57f4b1ea0"
workspace            = "master:46fd76aa07bd431f0ba73bdafeb7bf5aa31cef25"

Initialising tasks...done.
Sstate summary: Wanted 183 Local 176 Mirrors 0 Missed 7 Current 142 (96% match, 97% complete)
Removing 2 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 143 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 152 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 155 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 156 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.0.bb:do_populate_sysroot_setscene)
NOTE: Running task 662 of 1226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_fetch)
NOTE: Running task 680 of 1226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_write_config)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_fetch: Started
NOTE: recipe glib-2.0-1_2.74.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_write_config: Started
NOTE: recipe glib-2.0-1_2.74.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_fetch: Succeeded
NOTE: Running task 720 of 1226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_unpack)
NOTE: recipe python3-3.11.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-3.11.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_write_config: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_unpack: Started
NOTE: recipe glib-2.0-1_2.74.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.11.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 174 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 175 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 176 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 177 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 178 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 179 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_unpack: Succeeded
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.2.9-r0: task do_packagedata_setscene: Started
NOTE: Running task 721 of 1226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_patch)
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_patch: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_patch: Succeeded
NOTE: Running task 730 of 1226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 731 of 1226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_populate_lic)
NOTE: recipe glib-2.0-1_2.74.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 186 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 187 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 188 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.41.bb:do_packagedata_setscene)
NOTE: Running setscene task 189 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.41.bb:do_populate_sysroot_setscene)
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.2.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_populate_lic: Started
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 196 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 198 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 200 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.66.bb:do_packagedata_setscene)
NOTE: recipe libpcre2-10.41-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.66-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_populate_lic unihash changed to 94bdd2d75190dea090a911c127a93c06dd68f4273a990eda51fe7d6420a04078
NOTE: recipe gobject-introspection-1.74.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-3.11.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 203 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 204 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 205 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 206 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 208 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 209 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 210 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 211 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 212 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 213 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 214 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 215 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 216 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.40.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 217 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.40.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libpcre2-10.41-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre2-10.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 219 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 220 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.66-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.0.7-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.0.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.2.9-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 228 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe xz-5.2.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.40.0-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.40.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 231 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.40.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.2.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.40.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.0.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 240 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.0.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/xz/5.2.9-r0/temp/log.do_packagedata_setscene.1445494
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.9.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 248 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.9.bb:do_package_setscene)
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 252 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_packagedata_setscene)
NOTE: Running setscene task 253 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 254 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 255 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 257 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 258 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 259 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 260 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 261 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 262 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.3+20220423-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 272 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 273 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 274 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 275 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_populate_sysroot_setscene)
NOTE: recipe cracklib-2.9.8-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.2.9-r0: task do_package_setscene: Started
NOTE: recipe cracklib-2.9.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cracklib-2.9.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 280 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 281 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.2.9-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 285 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 286 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 291 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 292 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 295 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 297 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 299 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+dc9285ad1d-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 300 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+dc9285ad1d-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+dc9285ad1d-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 303 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 304 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 305 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.19.bb:do_packagedata_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.19-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+dc9285ad1d-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 306 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 307 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.19-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 315 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 320 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.19.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 321 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.39.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.39-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.39-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1155 of 1226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.9.bb:do_packagedata)
NOTE: Running task 1169 of 1226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe xz-5.2.9-r0: task do_packagedata: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xz-5.2.9-r0: task do_packagedata: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1218 of 1226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_configure)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_configure: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_configure: Succeeded
NOTE: Running task 1219 of 1226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_compile)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_compile: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_compile: Succeeded
NOTE: Running task 1220 of 1226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_install)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_install: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_install: Succeeded
NOTE: Running task 1221 of 1226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_package)
NOTE: Running task 1222 of 1226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_populate_sysroot)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_populate_sysroot: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_package: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_package: Succeeded
NOTE: Running task 1223 of 1226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_packagedata)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_packagedata: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1224 of 1226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_package_write_rpm)
NOTE: Running task 1225 of 1226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_package_qa)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_package_write_rpm: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_package_qa: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_package_qa: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1226 of 1226 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_build)
NOTE: Tasks Summary: Attempted 1226 tasks of which 1209 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 31 ERROR messages, returning a non-zero exit code.
ERROR: xz-5.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package xz-src went backwards which would break package feeds (from 0:5.4.0-r0 to 0:5.2.9-r0) [version-going-backwards]
ERROR: xz-5.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package xz-dbg went backwards which would break package feeds (from 0:5.4.0-r0 to 0:5.2.9-r0) [version-going-backwards]
ERROR: xz-5.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package liblzma went backwards which would break package feeds (from 0:5.4.0-r0 to 0:5.2.9-r0) [version-going-backwards]
ERROR: xz-5.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package xz-staticdev went backwards which would break package feeds (from 0:5.4.0-r0 to 0:5.2.9-r0) [version-going-backwards]
ERROR: xz-5.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package xz-dev went backwards which would break package feeds (from 0:5.4.0-r0 to 0:5.2.9-r0) [version-going-backwards]
ERROR: xz-5.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package xz-doc went backwards which would break package feeds (from 0:5.4.0-r0 to 0:5.2.9-r0) [version-going-backwards]
ERROR: xz-5.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package xz went backwards which would break package feeds (from 0:5.4.0-r0 to 0:5.2.9-r0) [version-going-backwards]
ERROR: xz-5.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-ca went backwards which would break package feeds (from 0:5.4.0-r0 to 0:5.2.9-r0) [version-going-backwards]
ERROR: xz-5.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-cs went backwards which would break package feeds (from 0:5.4.0-r0 to 0:5.2.9-r0) [version-going-backwards]
ERROR: xz-5.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-da went backwards which would break package feeds (from 0:5.4.0-r0 to 0:5.2.9-r0) [version-going-backwards]
ERROR: xz-5.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-de went backwards which would break package feeds (from 0:5.4.0-r0 to 0:5.2.9-r0) [version-going-backwards]
ERROR: xz-5.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-eo went backwards which would break package feeds (from 0:5.4.0-r0 to 0:5.2.9-r0) [version-going-backwards]
ERROR: xz-5.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-es went backwards which would break package feeds (from 0:5.4.0-r0 to 0:5.2.9-r0) [version-going-backwards]
ERROR: xz-5.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-fi went backwards which would break package feeds (from 0:5.4.0-r0 to 0:5.2.9-r0) [version-going-backwards]
ERROR: xz-5.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-fr went backwards which would break package feeds (from 0:5.4.0-r0 to 0:5.2.9-r0) [version-going-backwards]
ERROR: xz-5.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-hr went backwards which would break package feeds (from 0:5.4.0-r0 to 0:5.2.9-r0) [version-going-backwards]
ERROR: xz-5.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-hu went backwards which would break package feeds (from 0:5.4.0-r0 to 0:5.2.9-r0) [version-going-backwards]
ERROR: xz-5.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-it went backwards which would break package feeds (from 0:5.4.0-r0 to 0:5.2.9-r0) [version-going-backwards]
ERROR: xz-5.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-ko went backwards which would break package feeds (from 0:5.4.0-r0 to 0:5.2.9-r0) [version-going-backwards]
ERROR: xz-5.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-pl went backwards which would break package feeds (from 0:5.4.0-r0 to 0:5.2.9-r0) [version-going-backwards]
ERROR: xz-5.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-pt went backwards which would break package feeds (from 0:5.4.0-r0 to 0:5.2.9-r0) [version-going-backwards]
ERROR: xz-5.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-pt-br went backwards which would break package feeds (from 0:5.4.0-r0 to 0:5.2.9-r0) [version-going-backwards]
ERROR: xz-5.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-ro went backwards which would break package feeds (from 0:5.4.0-r0 to 0:5.2.9-r0) [version-going-backwards]
ERROR: xz-5.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-sr went backwards which would break package feeds (from 0:5.4.0-r0 to 0:5.2.9-r0) [version-going-backwards]
ERROR: xz-5.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-sv went backwards which would break package feeds (from 0:5.4.0-r0 to 0:5.2.9-r0) [version-going-backwards]
ERROR: xz-5.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-tr went backwards which would break package feeds (from 0:5.4.0-r0 to 0:5.2.9-r0) [version-going-backwards]
ERROR: xz-5.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-uk went backwards which would break package feeds (from 0:5.4.0-r0 to 0:5.2.9-r0) [version-going-backwards]
ERROR: xz-5.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-vi went backwards which would break package feeds (from 0:5.4.0-r0 to 0:5.2.9-r0) [version-going-backwards]
ERROR: xz-5.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-zh-cn went backwards which would break package feeds (from 0:5.4.0-r0 to 0:5.2.9-r0) [version-going-backwards]
ERROR: xz-5.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-zh-tw went backwards which would break package feeds (from 0:5.4.0-r0 to 0:5.2.9-r0) [version-going-backwards]
ERROR: xz-5.2.9-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============0949245654989792861==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 888 .bb files complete (0 cached, 888 parsed). 1672 targets, 54 skipped, 0 masked, 0 errors.
Removing 2 recipes from the cortexa15t2hf-neon sysroot...done.
Removing 2 recipes from the qemuarm sysroot...done.
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
meta-yocto-bsp       = "tmp-auh-upgrades:dbb87fd6f40de787b99fdecf12ca92f57f4b1ea0"
workspace            = "master:46fd76aa07bd431f0ba73bdafeb7bf5aa31cef25"

Initialising tasks...done.
Sstate summary: Wanted 55 Local 48 Mirrors 0 Missed 7 Current 274 (87% match, 97% complete)
Removing 1 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 283 of 329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: Running setscene task 284 of 329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 285 of 329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.9.bb:do_populate_sysroot_setscene)
NOTE: Running task 779 of 1241 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_fetch)
NOTE: Running task 802 of 1241 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_write_config)
NOTE: recipe tzdata-2022d-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.9-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_write_config: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_fetch: Succeeded
NOTE: Running task 841 of 1241 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_unpack)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_write_config: Succeeded
NOTE: recipe tzdata-2022d-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_unpack: Started
NOTE: recipe xz-5.2.9-r0: task do_populate_sysroot_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/xz/5.2.9-r0/temp/log.do_packagedata_setscene.1431010
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.9.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 314 of 329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.9.bb:do_package_setscene)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_unpack: Succeeded
NOTE: Running task 861 of 1241 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_patch)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_patch: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_patch: Succeeded
NOTE: Running task 862 of 1241 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 863 of 1241 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_populate_lic)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_populate_lic: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_populate_lic unihash changed to 94bdd2d75190dea090a911c127a93c06dd68f4273a990eda51fe7d6420a04078
NOTE: recipe gobject-introspection-1.74.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xz-5.2.9-r0: task do_package_setscene: Started
NOTE: recipe xz-5.2.9-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 316 of 329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 318 of 329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 319 of 329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 320 of 329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.36.bb:do_populate_sysroot_setscene)
NOTE: recipe glibc-2.36-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glibc-2.36-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 323 of 329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-arm-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-arm-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 325 of 329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.19.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 326 of 329 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.39.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-arm-2.39-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-arm-2.39-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1164 of 1241 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.9.bb:do_packagedata)
NOTE: Running task 1178 of 1241 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe xz-5.2.9-r0: task do_packagedata: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xz-5.2.9-r0: task do_packagedata: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1233 of 1241 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_configure)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_configure: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_configure: Succeeded
NOTE: Running task 1234 of 1241 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_compile)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_compile: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_compile: Succeeded
NOTE: Running task 1235 of 1241 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_install)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_install: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_install: Succeeded
NOTE: Running task 1236 of 1241 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_package)
NOTE: Running task 1237 of 1241 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_populate_sysroot)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_populate_sysroot: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_package: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_package: Succeeded
NOTE: Running task 1238 of 1241 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_packagedata)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_packagedata: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1239 of 1241 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_package_write_rpm)
NOTE: Running task 1240 of 1241 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_package_qa)
NOTE: recipe gobject-introspection-1.74.0-r0: task do_package_write_rpm: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_package_qa: Started
NOTE: recipe gobject-introspection-1.74.0-r0: task do_package_qa: Succeeded
NOTE: recipe gobject-introspection-1.74.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1241 of 1241 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb:do_build)
NOTE: Tasks Summary: Attempted 1241 tasks of which 1224 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 31 ERROR messages, returning a non-zero exit code.
ERROR: xz-5.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package xz-src went backwards which would break package feeds (from 0:5.4.0-r0 to 0:5.2.9-r0) [version-going-backwards]
ERROR: xz-5.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package xz-dbg went backwards which would break package feeds (from 0:5.4.0-r0 to 0:5.2.9-r0) [version-going-backwards]
ERROR: xz-5.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package liblzma went backwards which would break package feeds (from 0:5.4.0-r0 to 0:5.2.9-r0) [version-going-backwards]
ERROR: xz-5.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package xz-staticdev went backwards which would break package feeds (from 0:5.4.0-r0 to 0:5.2.9-r0) [version-going-backwards]
ERROR: xz-5.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package xz-dev went backwards which would break package feeds (from 0:5.4.0-r0 to 0:5.2.9-r0) [version-going-backwards]
ERROR: xz-5.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package xz-doc went backwards which would break package feeds (from 0:5.4.0-r0 to 0:5.2.9-r0) [version-going-backwards]
ERROR: xz-5.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package xz went backwards which would break package feeds (from 0:5.4.0-r0 to 0:5.2.9-r0) [version-going-backwards]
ERROR: xz-5.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-ca went backwards which would break package feeds (from 0:5.4.0-r0 to 0:5.2.9-r0) [version-going-backwards]
ERROR: xz-5.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-cs went backwards which would break package feeds (from 0:5.4.0-r0 to 0:5.2.9-r0) [version-going-backwards]
ERROR: xz-5.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-da went backwards which would break package feeds (from 0:5.4.0-r0 to 0:5.2.9-r0) [version-going-backwards]
ERROR: xz-5.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-de went backwards which would break package feeds (from 0:5.4.0-r0 to 0:5.2.9-r0) [version-going-backwards]
ERROR: xz-5.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-eo went backwards which would break package feeds (from 0:5.4.0-r0 to 0:5.2.9-r0) [version-going-backwards]
ERROR: xz-5.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-es went backwards which would break package feeds (from 0:5.4.0-r0 to 0:5.2.9-r0) [version-going-backwards]
ERROR: xz-5.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-fi went backwards which would break package feeds (from 0:5.4.0-r0 to 0:5.2.9-r0) [version-going-backwards]
ERROR: xz-5.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-fr went backwards which would break package feeds (from 0:5.4.0-r0 to 0:5.2.9-r0) [version-going-backwards]
ERROR: xz-5.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-hr went backwards which would break package feeds (from 0:5.4.0-r0 to 0:5.2.9-r0) [version-going-backwards]
ERROR: xz-5.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-hu went backwards which would break package feeds (from 0:5.4.0-r0 to 0:5.2.9-r0) [version-going-backwards]
ERROR: xz-5.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-it went backwards which would break package feeds (from 0:5.4.0-r0 to 0:5.2.9-r0) [version-going-backwards]
ERROR: xz-5.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-ko went backwards which would break package feeds (from 0:5.4.0-r0 to 0:5.2.9-r0) [version-going-backwards]
ERROR: xz-5.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-pl went backwards which would break package feeds (from 0:5.4.0-r0 to 0:5.2.9-r0) [version-going-backwards]
ERROR: xz-5.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-pt went backwards which would break package feeds (from 0:5.4.0-r0 to 0:5.2.9-r0) [version-going-backwards]
ERROR: xz-5.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-pt-br went backwards which would break package feeds (from 0:5.4.0-r0 to 0:5.2.9-r0) [version-going-backwards]
ERROR: xz-5.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-ro went backwards which would break package feeds (from 0:5.4.0-r0 to 0:5.2.9-r0) [version-going-backwards]
ERROR: xz-5.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-sr went backwards which would break package feeds (from 0:5.4.0-r0 to 0:5.2.9-r0) [version-going-backwards]
ERROR: xz-5.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-sv went backwards which would break package feeds (from 0:5.4.0-r0 to 0:5.2.9-r0) [version-going-backwards]
ERROR: xz-5.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-tr went backwards which would break package feeds (from 0:5.4.0-r0 to 0:5.2.9-r0) [version-going-backwards]
ERROR: xz-5.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-uk went backwards which would break package feeds (from 0:5.4.0-r0 to 0:5.2.9-r0) [version-going-backwards]
ERROR: xz-5.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-vi went backwards which would break package feeds (from 0:5.4.0-r0 to 0:5.2.9-r0) [version-going-backwards]
ERROR: xz-5.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-zh-cn went backwards which would break package feeds (from 0:5.4.0-r0 to 0:5.2.9-r0) [version-going-backwards]
ERROR: xz-5.2.9-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-zh-tw went backwards which would break package feeds (from 0:5.4.0-r0 to 0:5.2.9-r0) [version-going-backwards]
ERROR: xz-5.2.9-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============0949245654989792861==--

