Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0C6CC25B6A
	for <webhook@archiver.kernel.org>; Fri,  1 Dec 2023 13:15:00 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.22199.1701436491944568414
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Dec 2023 05:14:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=faHav2s7;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=VSjjpET6;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018c25848444-775dcd73-c435-4cc2-b879-fbe182a2a88c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1701436490;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=iNjjmCxxn8NzDinnVAmK+tn5a2hkpem9MMSqIy17UBE=;
	b=faHav2s7rqSPfdl2O8N/N12N43MuoLqjb2oVT9eAs8mPmJmUhK3ptegDjOXXEiw8
	CjTPP9IL35LB2MVYPHabfsfvbuOn32kEdcOSbn8XLHurqBaz/ZoIDnaxyRDFedxwtmi
	HImUWci+wOjrOd+y82fcvmssMNhQVkkeXKZdDVsY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1701436490;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=iNjjmCxxn8NzDinnVAmK+tn5a2hkpem9MMSqIy17UBE=;
	b=VSjjpET6pmKKkFqQQQVfQZ8S0KEHQQi0OMtPfLCGUlbcC74Bpe/O3mEmdv9jeweZ
	W7dRkWy2rih7uc0eZdyRz8ISW+1D35OYBvYqMymf9aaADNNYWOX4xbxac1jqwwUdyeV
	IG9nXbeBKRHQ2heAO9zhL8uFdqvbYQ4w2GZz9/ag=
Content-Type: multipart/mixed; boundary="===============1821156768334847070=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] llvm: upgrading to 17.0.6 SUCCEEDED
Message-ID: <0101018c25848444-775dcd73-c435-4cc2-b879-fbe182a2a88c-000000@us-west-2.amazonses.com>
Date: Fri, 1 Dec 2023 13:14:50 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.12.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Dec 2023 13:15:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191610

--===============1821156768334847070==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *llvm* to *17.0.6* has Succeeded.

Next steps:
    - apply the patch: git am 0001-llvm-upgrade-17.0.5-17.0.6.patch
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
From 41b24b029592254b3fae431db9332ebdc9e05722 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Dec 2023 08:08:59 +0000
Subject: [PATCH] llvm: upgrade 17.0.5 -> 17.0.6

---
 meta/recipes-devtools/llvm/llvm_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/llvm/llvm_git.bb b/meta/recipes-devtools/llvm/llvm_git.bb
index de8d411686..9a88549260 100644
--- a/meta/recipes-devtools/llvm/llvm_git.bb
+++ b/meta/recipes-devtools/llvm/llvm_git.bb
@@ -14,14 +14,14 @@ RDEPENDS:${PN}:append:class-target = " ncurses-terminfo"
 
 inherit cmake pkgconfig
 
-PV = "17.0.5"
+PV = "17.0.6"
 
 MAJOR_VERSION = "${@oe.utils.trim_version("${PV}", 1)}"
 
 LLVM_RELEASE = "${PV}"
 
 BRANCH = "release/${MAJOR_VERSION}.x"
-SRCREV = "98bfdac5ce82d1679f8af9a57501471812ab68d7"
+SRCREV = "6009708b4367171ccdbf4b5905cb6a803753fe18"
 SRC_URI = "git://github.com/llvm/llvm-project.git;branch=${BRANCH};protocol=https \
            file://0007-llvm-allow-env-override-of-exe-path.patch;striplevel=2 \
            file://0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch;striplevel=2 \
-- 
2.39.2


--===============1821156768334847070==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 912 .bb files complete (0 cached, 912 parsed). 1845 targets, 50 skipped, 0 masked, 0 errors.
Removing 44 recipes from the core2-64 sysroot...done.
Removing 66 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-daecc68d29be1ef0aeda9e3c3453cc2162384bb9"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:daecc68d29be1ef0aeda9e3c3453cc2162384bb9"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 210 Local 198 Mirrors 0 Missed 12 Current 221 (94% match, 97% complete)
Removing 5 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 223 of 431 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 224 of 431 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 225 of 431 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 229 of 431 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 238 of 431 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 244 of 431 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 245 of 431 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_populate_sysroot_setscene)
NOTE: recipe zstd-1.5.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe zstd-1.5.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_package_write_deb_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_package_write_rpm_setscene: Started
NOTE: Running task 317 of 1228 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/llvm/llvm_git.bb:do_recipe_qa)
NOTE: recipe libxml2-2.11.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxml2-2.11.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zstd-1.5.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 274 of 431 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_packagedata_setscene)
NOTE: recipe libxml2-2.11.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 275 of 431 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_packagedata_setscene)
NOTE: recipe llvm-17.0.6-r0: task do_recipe_qa: Started
NOTE: Running setscene task 280 of 431 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 281 of 431 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 287 of 431 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_create_spdx_setscene)
NOTE: recipe zstd-1.5.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zstd-1.5.5-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxml2-2.11.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxml2-2.11.5-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe llvm-17.0.6-r0: task do_recipe_qa: Succeeded
NOTE: Running task 340 of 1228 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/llvm/llvm_git.bb:do_fetch)
NOTE: recipe zstd-1.5.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 291 of 431 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.4.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 292 of 431 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_create_spdx_setscene)
NOTE: recipe llvm-17.0.6-r0: task do_fetch: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/libxml2/2.11.5/temp/log.do_packagedata_setscene.1785438
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 293 of 431 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_package_setscene)
NOTE: recipe zstd-1.5.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe zstd-1.5.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe llvm-17.0.6-r0: task do_fetch: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 296 of 431 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: Running task 344 of 1228 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/llvm/llvm_git.bb:do_unpack)
NOTE: recipe llvm-17.0.6-r0: task do_unpack: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 298 of 431 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxml2-2.11.5-r0: task do_package_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 302 of 431 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxml2-2.11.5-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 310 of 431 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 311 of 431 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 312 of 431 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libxml2-2.11.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.11.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.11.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 314 of 431 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.1.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 315 of 431 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 316 of 431 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 317 of 431 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 318 of 431 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 319 of 431 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 320 of 431 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 321 of 431 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 322 of 431 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 323 of 431 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 324 of 431 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.44.0.bb:do_packagedata_setscene)
NOTE: recipe python3-3.11.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 325 of 431 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.1.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 326 of 431 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 327 of 431 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 328 of 431 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.44.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.44.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 330 of 431 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 332 of 431 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 334 of 431 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 335 of 431 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 337 of 431 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 340 of 431 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 341 of 431 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 343 of 431 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 346 of 431 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 349 of 431 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.5.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 350 of 431 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 352 of 431 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 355 of 431 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.44.0.bb:do_populate_sysroot_setscene)
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 358 of 431 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.1.4.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.44.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.11.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 361 of 431 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 363 of 431 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20230828-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 364 of 431 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 366 of 431 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.1.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 368 of 431 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 369 of 431 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 371 of 431 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 373 of 431 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 375 of 431 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.44.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 377 of 431 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.44.0.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.1.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.44.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.4.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 379 of 431 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.44.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 381 of 431 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 383 of 431 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 387 of 431 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 388 of 431 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 390 of 431 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 392 of 431 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 394 of 431 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 396 of 431 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 397 of 431 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 399 of 431 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 400 of 431 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 401 of 431 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.5.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 405 of 431 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 407 of 431 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 408 of 431 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 409 of 431 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 411 of 431 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 416 of 431 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 418 of 431 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 419 of 431 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 422 of 431 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 424 of 431 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.5.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 426 of 431 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 428 of 431 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.5.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 430 of 431 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1171 of 1228 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_packagedata)
NOTE: Running task 1175 of 1228 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/llvm/llvm_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxml2-2.11.5-r0: task do_packagedata: Started
NOTE: recipe llvm-17.0.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxml2-2.11.5-r0: task do_packagedata: Succeeded
NOTE: recipe llvm-17.0.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe llvm-17.0.6-r0: task do_unpack: Succeeded
NOTE: Running task 1211 of 1228 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/llvm/llvm_git.bb:do_patch)
NOTE: Running task 1212 of 1228 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/llvm/llvm_git.bb:do_collect_spdx_deps)
NOTE: recipe llvm-17.0.6-r0: task do_patch: Started
NOTE: recipe llvm-17.0.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe llvm-17.0.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe llvm-17.0.6-r0: task do_patch: Succeeded
NOTE: Running task 1213 of 1228 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/llvm/llvm_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 1214 of 1228 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/llvm/llvm_git.bb:do_generate_toolchain_file)
NOTE: Running task 1215 of 1228 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/llvm/llvm_git.bb:do_populate_lic)
NOTE: recipe llvm-17.0.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe llvm-17.0.6-r0: task do_generate_toolchain_file: Started
NOTE: recipe llvm-17.0.6-r0: task do_populate_lic: Started
NOTE: recipe llvm-17.0.6-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe llvm-17.0.6-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/llvm/llvm_git.bb:do_populate_lic unihash changed to cd30edeb4680a8cc1a08c29c439f69631e63bfa7b6ef87de4ad2f77ae89613e5
NOTE: recipe llvm-17.0.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1216 of 1228 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/llvm/llvm_git.bb:do_configure)
NOTE: recipe llvm-17.0.6-r0: task do_configure: Started
NOTE: recipe llvm-17.0.6-r0: task do_configure: Succeeded
NOTE: Running task 1217 of 1228 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/llvm/llvm_git.bb:do_compile)
NOTE: recipe llvm-17.0.6-r0: task do_compile: Started
Bitbake still alive (no events for 600s). Active tasks:
/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/llvm/llvm_git.bb:do_compile
NOTE: recipe llvm-17.0.6-r0: task do_compile: Succeeded
NOTE: Running task 1218 of 1228 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/llvm/llvm_git.bb:do_install)
NOTE: recipe llvm-17.0.6-r0: task do_install: Started
NOTE: recipe llvm-17.0.6-r0: task do_install: Succeeded
NOTE: Running task 1219 of 1228 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/llvm/llvm_git.bb:do_package)
NOTE: Running task 1220 of 1228 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/llvm/llvm_git.bb:do_populate_sysroot)
NOTE: recipe llvm-17.0.6-r0: task do_package: Started
NOTE: recipe llvm-17.0.6-r0: task do_populate_sysroot: Started
NOTE: recipe llvm-17.0.6-r0: task do_populate_sysroot: Succeeded
NOTE: recipe llvm-17.0.6-r0: task do_package: Succeeded
NOTE: Running task 1221 of 1228 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/llvm/llvm_git.bb:do_packagedata)
NOTE: recipe llvm-17.0.6-r0: task do_packagedata: Started
NOTE: recipe llvm-17.0.6-r0: task do_packagedata: Succeeded
NOTE: Running task 1222 of 1228 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/llvm/llvm_git.bb:do_create_spdx)
NOTE: Running task 1223 of 1228 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/llvm/llvm_git.bb:do_package_write_ipk)
NOTE: Running task 1224 of 1228 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/llvm/llvm_git.bb:do_package_write_deb)
NOTE: Running task 1225 of 1228 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/llvm/llvm_git.bb:do_package_write_rpm)
NOTE: Running task 1226 of 1228 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/llvm/llvm_git.bb:do_package_qa)
NOTE: recipe llvm-17.0.6-r0: task do_create_spdx: Started
NOTE: recipe llvm-17.0.6-r0: task do_package_write_ipk: Started
NOTE: recipe llvm-17.0.6-r0: task do_package_write_deb: Started
NOTE: recipe llvm-17.0.6-r0: task do_package_write_rpm: Started
NOTE: recipe llvm-17.0.6-r0: task do_package_qa: Started
NOTE: recipe llvm-17.0.6-r0: task do_package_qa: Succeeded
NOTE: recipe llvm-17.0.6-r0: task do_create_spdx: Succeeded
NOTE: Running task 1227 of 1228 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/llvm/llvm_git.bb:do_create_runtime_spdx)
NOTE: recipe llvm-17.0.6-r0: task do_create_runtime_spdx: Started
NOTE: recipe llvm-17.0.6-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe llvm-17.0.6-r0: task do_package_write_ipk: Succeeded
NOTE: recipe llvm-17.0.6-r0: task do_package_write_deb: Succeeded
NOTE: recipe llvm-17.0.6-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1228 of 1228 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/llvm/llvm_git.bb:do_build)
NOTE: Tasks Summary: Attempted 1228 tasks of which 1205 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: There were 11 ERROR messages, returning a non-zero exit code.
ERROR: libxml2-2.11.5-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-src went backwards which would break package feeds (from 0:2.12.1-r0 to 0:2.11.5-r0) [version-going-backwards]
ERROR: libxml2-2.11.5-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-dbg went backwards which would break package feeds (from 0:2.12.1-r0 to 0:2.11.5-r0) [version-going-backwards]
ERROR: libxml2-2.11.5-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-ptest went backwards which would break package feeds (from 0:2.12.1-r0 to 0:2.11.5-r0) [version-going-backwards]
ERROR: libxml2-2.11.5-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-staticdev went backwards which would break package feeds (from 0:2.12.1-r0 to 0:2.11.5-r0) [version-going-backwards]
ERROR: libxml2-2.11.5-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-dev went backwards which would break package feeds (from 0:2.12.1-r0 to 0:2.11.5-r0) [version-going-backwards]
ERROR: libxml2-2.11.5-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-doc went backwards which would break package feeds (from 0:2.12.1-r0 to 0:2.11.5-r0) [version-going-backwards]
ERROR: libxml2-2.11.5-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-locale went backwards which would break package feeds (from 0:2.12.1-r0 to 0:2.11.5-r0) [version-going-backwards]
ERROR: libxml2-2.11.5-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-utils went backwards which would break package feeds (from 0:2.12.1-r0 to 0:2.11.5-r0) [version-going-backwards]
ERROR: libxml2-2.11.5-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2 went backwards which would break package feeds (from 0:2.12.1-r0 to 0:2.11.5-r0) [version-going-backwards]
ERROR: libxml2-2.11.5-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-python went backwards which would break package feeds (from 0:2.12.1-r0 to 0:2.11.5-r0) [version-going-backwards]
ERROR: libxml2-2.11.5-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============1821156768334847070==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/llvm: PV changed from "17.0.5" to "17.0.6"
packages/core2-64-poky-linux/llvm: PKGV changed from 17.0.5 [default] to 17.0.6 [default]
packages/core2-64-poky-linux/llvm/llvm-bugpointpasses: PV changed from "17.0.5" to "17.0.6"
packages/core2-64-poky-linux/llvm/llvm-bugpointpasses: PKGV changed from 17.0.5 [default] to 17.0.6 [default]
packages/core2-64-poky-linux/llvm/llvm-dbg: PV changed from "17.0.5" to "17.0.6"
packages/core2-64-poky-linux/llvm/llvm-dbg: PKGV changed from 17.0.5 [default] to 17.0.6 [default]
packages/core2-64-poky-linux/llvm/llvm-dev: PV changed from "17.0.5" to "17.0.6"
packages/core2-64-poky-linux/llvm/llvm-dev: FILELIST: removed "/usr/lib/libLLVM-17.0.5.so", added "/usr/lib/libLLVM-17.0.6.so"
packages/core2-64-poky-linux/llvm/llvm-dev: PKGV changed from 17.0.5 [default] to 17.0.6 [default]
packages/core2-64-poky-linux/llvm/llvm-dev: FILES: removed "/usr/lib/libLLVM-17.0.5.so", added "/usr/lib/libLLVM-17.0.6.so"
packages/core2-64-poky-linux/llvm/llvm-doc: PV changed from "17.0.5" to "17.0.6"
packages/core2-64-poky-linux/llvm/llvm-doc: PKGV changed from 17.0.5 [default] to 17.0.6 [default]
packages/core2-64-poky-linux/llvm/llvm-libllvm: PV changed from "17.0.5" to "17.0.6"
packages/core2-64-poky-linux/llvm/llvm-libllvm: PKGV changed from 17.0.5 [default] to 17.0.6 [default]
packages/core2-64-poky-linux/llvm/llvm-liblto: PV changed from "17.0.5" to "17.0.6"
packages/core2-64-poky-linux/llvm/llvm-liblto: PKGV changed from 17.0.5 [default] to 17.0.6 [default]
packages/core2-64-poky-linux/llvm/llvm-liboptremarks: PV changed from "17.0.5" to "17.0.6"
packages/core2-64-poky-linux/llvm/llvm-liboptremarks: PKGV changed from 17.0.5 [default] to 17.0.6 [default]
packages/core2-64-poky-linux/llvm/llvm-llvmhello: PV changed from "17.0.5" to "17.0.6"
packages/core2-64-poky-linux/llvm/llvm-llvmhello: PKGV changed from 17.0.5 [default] to 17.0.6 [default]
packages/core2-64-poky-linux/llvm/llvm-locale: PV changed from "17.0.5" to "17.0.6"
packages/core2-64-poky-linux/llvm/llvm-locale: PKGV changed from 17.0.5 [default] to 17.0.6 [default]
packages/core2-64-poky-linux/llvm/llvm-src: PV changed from "17.0.5" to "17.0.6"
packages/core2-64-poky-linux/llvm/llvm-src: PKGV changed from 17.0.5 [default] to 17.0.6 [default]
packages/core2-64-poky-linux/llvm/llvm-staticdev: PV changed from "17.0.5" to "17.0.6"
packages/core2-64-poky-linux/llvm/llvm-staticdev: PKGSIZE changed from 3723707836 to 3723707444 (-0%)
packages/core2-64-poky-linux/llvm/llvm-staticdev: PKGV changed from 17.0.5 [default] to 17.0.6 [default]
packages/core2-64-poky-linux/llvm/llvm: PV changed from "17.0.5" to "17.0.6"
packages/core2-64-poky-linux/llvm/llvm: PKGV changed from 17.0.5 [default] to 17.0.6 [default]
Changes to packages/core2-64-poky-linux/llvm (sysroot):
  /usr/bin/crossscripts/llvm-config17.0.5 moved to /usr/bin/crossscripts/llvm-config17.0.6
  /usr/lib/libLLVM-17.0.5.so moved to /usr/lib/libLLVM-17.0.6.so
Changes to packages/x86_64-linux/llvm-native (sysroot):
  /usr/bin/llvm-config changed symlink target from llvm-config17.0.5 to llvm-config17.0.6
  /usr/bin/llvm-config17.0.5 moved to /usr/bin/llvm-config17.0.6
  /usr/bin/llvm-tblgen17.0.5 moved to /usr/bin/llvm-tblgen17.0.6
  /usr/lib/libLLVM-17.0.5.so moved to /usr/lib/libLLVM-17.0.6.so

--===============1821156768334847070==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/llvm/llvm-dev: FILELIST: removed "/usr/lib/libLLVM-17.0.5.so", added "/usr/lib/libLLVM-17.0.6.so"
Changes to packages/core2-64-poky-linux/llvm (sysroot):
  /usr/bin/crossscripts/llvm-config17.0.5 moved to /usr/bin/crossscripts/llvm-config17.0.6
  /usr/lib/libLLVM-17.0.5.so moved to /usr/lib/libLLVM-17.0.6.so
Changes to packages/x86_64-linux/llvm-native (sysroot):
  /usr/bin/llvm-config changed symlink target from llvm-config17.0.5 to llvm-config17.0.6
  /usr/bin/llvm-config17.0.5 moved to /usr/bin/llvm-config17.0.6
  /usr/bin/llvm-tblgen17.0.5 moved to /usr/bin/llvm-tblgen17.0.6
  /usr/lib/libLLVM-17.0.5.so moved to /usr/lib/libLLVM-17.0.6.so

--===============1821156768334847070==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-llvm-upgrade-17.0.5-17.0.6.patch"

RnJvbSA0MWIyNGIwMjk1OTIyNTRiM2ZhZTQzMWRiOTMzMmViZGM5ZTA1NzIyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBEZWMgMjAyMyAwODowODo1OSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxs
dm06IHVwZ3JhZGUgMTcuMC41IC0+IDE3LjAuNgoKLS0tCiBtZXRhL3JlY2lwZXMtZGV2dG9vbHMv
bGx2bS9sbHZtX2dpdC5iYiB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygr
KSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbGx2
bS9sbHZtX2dpdC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9sbHZtL2xsdm1fZ2l0LmJiCmlu
ZGV4IGRlOGQ0MTE2ODYuLjlhODg1NDkyNjAgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9sbHZtL2xsdm1fZ2l0LmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9sbHZtL2xs
dm1fZ2l0LmJiCkBAIC0xNCwxNCArMTQsMTQgQEAgUkRFUEVORFM6JHtQTn06YXBwZW5kOmNsYXNz
LXRhcmdldCA9ICIgbmN1cnNlcy10ZXJtaW5mbyIKIAogaW5oZXJpdCBjbWFrZSBwa2djb25maWcK
IAotUFYgPSAiMTcuMC41IgorUFYgPSAiMTcuMC42IgogCiBNQUpPUl9WRVJTSU9OID0gIiR7QG9l
LnV0aWxzLnRyaW1fdmVyc2lvbigiJHtQVn0iLCAxKX0iCiAKIExMVk1fUkVMRUFTRSA9ICIke1BW
fSIKIAogQlJBTkNIID0gInJlbGVhc2UvJHtNQUpPUl9WRVJTSU9OfS54IgotU1JDUkVWID0gIjk4
YmZkYWM1Y2U4MmQxNjc5ZjhhZjlhNTc1MDE0NzE4MTJhYjY4ZDciCitTUkNSRVYgPSAiNjAwOTcw
OGI0MzY3MTcxY2NkYmY0YjU5MDVjYjZhODAzNzUzZmUxOCIKIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0
aHViLmNvbS9sbHZtL2xsdm0tcHJvamVjdC5naXQ7YnJhbmNoPSR7QlJBTkNIfTtwcm90b2NvbD1o
dHRwcyBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDA3LWxsdm0tYWxsb3ctZW52LW92ZXJyaWRlLW9m
LWV4ZS1wYXRoLnBhdGNoO3N0cmlwbGV2ZWw9MiBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLUFz
bU1hdGNoZXJFbWl0dGVyLXNvcnQtQ2xhc3NJbmZvLWxpc3RzLWJ5LW5hbWUtYXMtd2UucGF0Y2g7
c3RyaXBsZXZlbD0yIFwKLS0gCjIuMzkuMgoK

--===============1821156768334847070==--

