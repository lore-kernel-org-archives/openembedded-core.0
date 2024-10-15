Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82D12D1F9A6
	for <webhook@archiver.kernel.org>; Tue, 15 Oct 2024 12:16:02 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.11798.1728994553876413362
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Oct 2024 05:15:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=C4YxorgH;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=A/ZrDKhr;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 01010192901b2d22-510eac73-0c56-49b1-81a4-3fa5a9b8456a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1728994553;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=TrPkqyoIfghyqM33Q/WyQBQrrQbYGD+2+eqddI+r1HU=;
	b=C4YxorgH6QvQfSfaz6IsycWDYIf6P/E/zaMA3sWPRpEYBJd3XNA4l+B+DeblHWxH
	EV3SdDKw8PkTLBDn4WODCWicSn6Yhers0DGBwMCR5pxDQGUpW6sM63Kq0tv5+A2Lwed
	dqNJPIHYkrTC20OybDbW5tpPaFVsVeAl3AIxK+Rg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1728994553;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=TrPkqyoIfghyqM33Q/WyQBQrrQbYGD+2+eqddI+r1HU=;
	b=A/ZrDKhrwXSsFOGX3tfWJVCh5kOjHua0iVkKnKhDFzwgKHhIRcvey0A4Bahty8fv
	6gThN66uvk5bUl7+ltEUg7b5Z+ybXWeyzvp5oUa16lRAfifiq9r/ADifurwkcen8DCp
	XeEVuWvYOYZpZ+ddi7gdg4hW9qR0ac9l6wfi9dTs=
Content-Type: multipart/mixed; boundary="===============0161529239939766618=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] llvm: upgrading to 19.1.1 SUCCEEDED
Message-ID: <01010192901b2d22-510eac73-0c56-49b1-81a4-3fa5a9b8456a-000000@us-west-2.amazonses.com>
Date: Tue, 15 Oct 2024 12:15:53 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.10.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Oct 2024 12:16:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205833

--===============0161529239939766618==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *llvm* to *19.1.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-llvm-upgrade-19.1.0-19.1.1.patch
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
From fb07c89d0b261bc7b0fc816520a73530509ef1d8 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 15 Oct 2024 08:07:55 +0000
Subject: [PATCH] llvm: upgrade 19.1.0 -> 19.1.1

---
 ...tcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch | 4 ++--
 .../llvm/0007-llvm-allow-env-override-of-exe-path.patch  | 9 ++++-----
 .../llvm/{llvm_19.1.0.bb => llvm_19.1.1.bb}              | 4 +++-
 3 files changed, 9 insertions(+), 8 deletions(-)
 rename meta/recipes-devtools/llvm/{llvm_19.1.0.bb => llvm_19.1.1.bb} (98%)

diff --git a/meta/recipes-devtools/llvm/llvm/0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch b/meta/recipes-devtools/llvm/llvm/0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch
index a5c53b6657..d83462b7b3 100644
--- a/meta/recipes-devtools/llvm/llvm/0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch
+++ b/meta/recipes-devtools/llvm/llvm/0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch
@@ -1,4 +1,4 @@
-From 3b30a9bda88374e8f03bf96e972aee5bd214b98b Mon Sep 17 00:00:00 2001
+From 8b399ec0c2184b5e8791882f83790aa80635189a Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 27 Nov 2020 10:11:08 +0000
 Subject: [PATCH] AsmMatcherEmitter: sort ClassInfo lists by name as well
@@ -14,7 +14,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 4 insertions(+), 1 deletion(-)
 
 diff --git a/llvm/utils/TableGen/AsmMatcherEmitter.cpp b/llvm/utils/TableGen/AsmMatcherEmitter.cpp
-index 73724e662f9e..1ca9c73415db 100644
+index 5035ef527..03fc84203 100644
 --- a/llvm/utils/TableGen/AsmMatcherEmitter.cpp
 +++ b/llvm/utils/TableGen/AsmMatcherEmitter.cpp
 @@ -361,7 +361,10 @@ public:
diff --git a/meta/recipes-devtools/llvm/llvm/0007-llvm-allow-env-override-of-exe-path.patch b/meta/recipes-devtools/llvm/llvm/0007-llvm-allow-env-override-of-exe-path.patch
index add38b3bb4..8d8f1a9d16 100644
--- a/meta/recipes-devtools/llvm/llvm/0007-llvm-allow-env-override-of-exe-path.patch
+++ b/meta/recipes-devtools/llvm/llvm/0007-llvm-allow-env-override-of-exe-path.patch
@@ -1,4 +1,4 @@
-From 588a8694c6540e31140c7e242bfb5e279d6ca08c Mon Sep 17 00:00:00 2001
+From 6621b8c534979cdb2a700055abd5b0e50df56431 Mon Sep 17 00:00:00 2001
 From: Martin Kelly <mkelly@xevo.com>
 Date: Fri, 19 May 2017 00:22:57 -0700
 Subject: [PATCH] llvm: allow env override of exe and libdir path
@@ -13,11 +13,11 @@ Upstream-Status: Inappropriate [OE-specific]
 Signed-off-by: Martin Kelly <mkelly@xevo.com>
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- llvm/tools/llvm-config/llvm-config.cpp | 25 +++++++++++++++++++------
- 1 file changed, 19 insertions(+), 6 deletions(-)
+ llvm/tools/llvm-config/llvm-config.cpp | 7 +++++++
+ 1 file changed, 7 insertions(+)
 
 diff --git a/llvm/tools/llvm-config/llvm-config.cpp b/llvm/tools/llvm-config/llvm-config.cpp
-index e86eb2b44b10..7b2abf318dbe 100644
+index d5b76b1bb..6c28c34bc 100644
 --- a/llvm/tools/llvm-config/llvm-config.cpp
 +++ b/llvm/tools/llvm-config/llvm-config.cpp
 @@ -246,6 +246,13 @@ Typical components:\n\
@@ -34,4 +34,3 @@ index e86eb2b44b10..7b2abf318dbe 100644
    // This just needs to be some symbol in the binary; C++ doesn't
    // allow taking the address of ::main however.
    void *P = (void *)(intptr_t)GetExecutablePath;
- 
diff --git a/meta/recipes-devtools/llvm/llvm_19.1.0.bb b/meta/recipes-devtools/llvm/llvm_19.1.1.bb
similarity index 98%
rename from meta/recipes-devtools/llvm/llvm_19.1.0.bb
rename to meta/recipes-devtools/llvm/llvm_19.1.1.bb
index 35e7f4c07f..8bbadb25ea 100644
--- a/meta/recipes-devtools/llvm/llvm_19.1.0.bb
+++ b/meta/recipes-devtools/llvm/llvm_19.1.1.bb
@@ -27,7 +27,7 @@ SRC_URI = "https://github.com/llvm/llvm-project/releases/download/llvmorg-${PV}/
            file://0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch;striplevel=2 \
            file://llvm-config \
            "
-SRC_URI[sha256sum] = "5042522b49945bc560ff9206f25fb87980a9b89b914193ca00d961511ff0673c"
+SRC_URI[sha256sum] = "d40e933e2a208ee142898f85d886423a217e991abbcd42dd8211f507c93e1266"
 UPSTREAM_CHECK_URI = "https://github.com/llvm/llvm-project"
 UPSTREAM_CHECK_REGEX = "llvmorg-(?P<pver>\d+(\.\d+)+)"
 
@@ -177,3 +177,5 @@ FILES:${PN}-staticdev += "\
 INSANE_SKIP:${PN}-libllvm += "dev-so"
 
 BBCLASSEXTEND = "native nativesdk"
+
+PV = "19.1.1"
-- 
2.44.1


--===============0161529239939766618==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 919 .bb files complete (0 cached, 919 parsed). 1876 targets, 52 skipped, 0 masked, 0 errors.
Removing 23 recipes from the core2-64 sysroot...done.
Removing 23 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:b273141c3925349e23fb5599e1a2ddc8fda3c5b4"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 242 Local 232 Mirrors 0 Missed 10 Current 192 (95% match, 97% complete)
Removing 3 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 194 of 434 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 195 of 434 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 196 of 434 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 201 of 434 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 208 of 434 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/llvm/llvm_19.1.1.bb:do_populate_lic_setscene)
NOTE: Running setscene task 214 of 434 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_create_spdx_setscene)
NOTE: recipe ncurses-6.5-r0: task do_package_write_deb_setscene: Started
NOTE: recipe zstd-1.5.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe llvm-19.1.1-r0: task do_populate_lic_setscene: Started
NOTE: recipe libxml2-2.13.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe zstd-1.5.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 276 of 434 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_packagedata_setscene)
NOTE: recipe llvm-19.1.1-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 277 of 434 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_populate_sysroot_setscene)
NOTE: recipe ncurses-6.5-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 278 of 434 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/llvm/llvm_19.1.1.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.5-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxml2-2.13.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 279 of 434 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 280 of 434 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 285 of 434 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 286 of 434 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240808-3.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 292 of 434 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_create_spdx_setscene)
NOTE: recipe zstd-1.5.6-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe llvm-19.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libedit-20240808-3.1-r1: task do_create_spdx_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxml2-2.13.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.13.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe llvm-19.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 761 of 1242 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/llvm/llvm_19.1.1.bb:do_fetch)
NOTE: recipe zstd-1.5.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libedit-20240808-3.1-r1: task do_create_spdx_setscene: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 295 of 434 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_create_spdx_setscene)
NOTE: recipe zstd-1.5.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 297 of 434 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_recipe_qa_setscene)
NOTE: recipe llvm-19.1.1-r0: task do_fetch: Started
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/libxml2/2.13.3/temp/log.do_packagedata_setscene.3886213
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.3.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 298 of 434 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.3.bb:do_package_setscene)
NOTE: recipe llvm-19.1.1-r0: task do_fetch: Succeeded
NOTE: recipe libxml2-2.13.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe zstd-1.5.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 301 of 434 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_create_spdx_setscene)
NOTE: Running task 766 of 1242 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/llvm/llvm_19.1.1.bb:do_unpack)
NOTE: recipe llvm-19.1.1-r0: task do_unpack: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 303 of 434 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 307 of 434 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_create_spdx_setscene)
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxml2-2.13.3-r0: task do_package_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxml2-2.13.3-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 317 of 434 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 318 of 434 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 319 of 434 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libxml2-2.13.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.12.6-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.12.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.13.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.12.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 321 of 434 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 322 of 434 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 323 of 434 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 324 of 434 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 325 of 434 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240808-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 326 of 434 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 327 of 434 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 328 of 434 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 329 of 434 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_packagedata_setscene)
NOTE: Running setscene task 330 of 434 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 331 of 434 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.46.1.bb:do_packagedata_setscene)
NOTE: recipe python3-3.12.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 332 of 434 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 333 of 434 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 334 of 434 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 335 of 434 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20240808-3.1-r1: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.46.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.6.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 337 of 434 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240808-3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20240808-3.1-r1: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 340 of 434 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.6.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 342 of 434 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 344 of 434 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.46.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 346 of 434 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 347 of 434 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.5.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 348 of 434 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 350 of 434 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 353 of 434 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20240808-3.1-r1: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 356 of 434 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.46.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.6.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 359 of 434 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.2.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 361 of 434 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 363 of 434 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe libtirpc-1.3.5-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.6.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.12.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.46.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.6.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.12.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20240808-3.1-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 365 of 434 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 366 of 434 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 368 of 434 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240808-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe libtirpc-1.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 371 of 434 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 372 of 434 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.5.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 374 of 434 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.40.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.6.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.6.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 376 of 434 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.3.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 379 of 434 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 380 of 434 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 382 of 434 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20240808-3.1-r1: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.46.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 384 of 434 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.46.1.bb:do_recipe_qa_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.6.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20240808-3.1-r1: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.46.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.6.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 386 of 434 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_packagedata_setscene)
NOTE: recipe libtirpc-1.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.46.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 389 of 434 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 393 of 434 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 394 of 434 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.5.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.3.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 395 of 434 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 397 of 434 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 399 of 434 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-14.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 401 of 434 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 403 of 434 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 404 of 434 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 405 of 434 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 407 of 434 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 408 of 434 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-runtime-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 412 of 434 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 414 of 434 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.2.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 415 of 434 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 416 of 434 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 418 of 434 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 423 of 434 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 424 of 434 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 426 of 434 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 430 of 434 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 431 of 434 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.43.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 433 of 434 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.10.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.43.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.43.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1188 of 1242 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.13.3.bb:do_packagedata)
NOTE: Running task 1189 of 1242 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/llvm/llvm_19.1.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe llvm-19.1.1-r0: task do_unpack: Succeeded
NOTE: Running task 1224 of 1242 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/llvm/llvm_19.1.1.bb:do_patch)
NOTE: recipe libxml2-2.13.3-r0: task do_packagedata: Started
NOTE: recipe llvm-19.1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe llvm-19.1.1-r0: task do_patch: Started
NOTE: recipe libxml2-2.13.3-r0: task do_packagedata: Succeeded
NOTE: Running task 1226 of 1242 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/llvm/llvm_19.1.1.bb:do_collect_spdx_deps)
NOTE: recipe llvm-19.1.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe llvm-19.1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe llvm-19.1.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe llvm-19.1.1-r0: task do_patch: Succeeded
NOTE: Running task 1227 of 1242 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/llvm/llvm_19.1.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1228 of 1242 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/llvm/llvm_19.1.1.bb:do_generate_toolchain_file)
NOTE: recipe llvm-19.1.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe llvm-19.1.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe llvm-19.1.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe llvm-19.1.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/llvm/llvm_19.1.1.bb:do_deploy_source_date_epoch unihash changed to 8a1780e8f36dcd951acfc3272951c9dbb66f6810e79c54becb1509920190f96c
NOTE: Setscene tasks completed
NOTE: Running task 1230 of 1242 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/llvm/llvm_19.1.1.bb:do_configure)
NOTE: recipe llvm-19.1.1-r0: task do_configure: Started
NOTE: recipe llvm-19.1.1-r0: task do_configure: Succeeded
NOTE: Running task 1231 of 1242 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/llvm/llvm_19.1.1.bb:do_compile)
NOTE: recipe llvm-19.1.1-r0: task do_compile: Started
NOTE: recipe llvm-19.1.1-r0: task do_compile: Succeeded
NOTE: Running task 1232 of 1242 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/llvm/llvm_19.1.1.bb:do_install)
NOTE: recipe llvm-19.1.1-r0: task do_install: Started
NOTE: recipe llvm-19.1.1-r0: task do_install: Succeeded
NOTE: Running task 1233 of 1242 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/llvm/llvm_19.1.1.bb:do_package)
NOTE: Running task 1234 of 1242 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/llvm/llvm_19.1.1.bb:do_populate_sysroot)
NOTE: recipe llvm-19.1.1-r0: task do_populate_sysroot: Started
NOTE: recipe llvm-19.1.1-r0: task do_package: Started
NOTE: recipe llvm-19.1.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe llvm-19.1.1-r0: task do_package: Succeeded
NOTE: Running task 1235 of 1242 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/llvm/llvm_19.1.1.bb:do_packagedata)
NOTE: recipe llvm-19.1.1-r0: task do_packagedata: Started
NOTE: recipe llvm-19.1.1-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/llvm/llvm_19.1.1.bb:do_packagedata unihash changed to 514b0daf0d2c14ab87cf519a8e65696df0eeffbc1334e8e24b50a180992e39ff
NOTE: Setscene tasks completed
NOTE: Running task 1236 of 1242 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/llvm/llvm_19.1.1.bb:do_create_spdx)
NOTE: Running task 1237 of 1242 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/llvm/llvm_19.1.1.bb:do_package_write_ipk)
NOTE: Running task 1238 of 1242 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/llvm/llvm_19.1.1.bb:do_package_write_deb)
NOTE: Running task 1239 of 1242 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/llvm/llvm_19.1.1.bb:do_package_write_rpm)
NOTE: Running task 1240 of 1242 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/llvm/llvm_19.1.1.bb:do_package_qa)
NOTE: recipe llvm-19.1.1-r0: task do_create_spdx: Started
NOTE: recipe llvm-19.1.1-r0: task do_package_write_ipk: Started
NOTE: recipe llvm-19.1.1-r0: task do_package_write_deb: Started
NOTE: recipe llvm-19.1.1-r0: task do_package_write_rpm: Started
NOTE: recipe llvm-19.1.1-r0: task do_package_qa: Started
NOTE: recipe llvm-19.1.1-r0: task do_package_write_ipk: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/llvm/llvm_19.1.1.bb:do_package_write_ipk unihash changed to cac498d15b4b1626e02e318044cd8a31e8bd5d32d307b6bd8310353d5ea1e6b2
NOTE: recipe llvm-19.1.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 1241 of 1242 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/llvm/llvm_19.1.1.bb:do_create_package_spdx)
NOTE: recipe llvm-19.1.1-r0: task do_create_package_spdx: Started
NOTE: recipe llvm-19.1.1-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/llvm/llvm_19.1.1.bb:do_package_qa unihash changed to 7ca2012ab523a841bf4c1a45950e7c80d76f652fdbdb859e4c25c2e6b4f34092
NOTE: recipe llvm-19.1.1-r0: task do_create_package_spdx: Succeeded
NOTE: recipe llvm-19.1.1-r0: task do_package_write_deb: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/llvm/llvm_19.1.1.bb:do_package_write_deb unihash changed to f68bb8523aa689986f72814454710b8200e1cdd11fa1e1079ef933c43b4266bb
NOTE: recipe llvm-19.1.1-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/llvm/llvm_19.1.1.bb:do_package_write_rpm unihash changed to 81deb94916baf817d9ea693a63096f7b43be492b4392b57d00bb08015571910b
NOTE: Running noexec task 1242 of 1242 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/llvm/llvm_19.1.1.bb:do_build)
NOTE: Tasks Summary: Attempted 1242 tasks of which 1221 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 11 ERROR messages, returning a non-zero exit code.
ERROR: libxml2-2.13.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-src went backwards which would break package feeds (from 0:2.13.4-r0 to 0:2.13.3-r0) [version-going-backwards]
ERROR: libxml2-2.13.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-dbg went backwards which would break package feeds (from 0:2.13.4-r0 to 0:2.13.3-r0) [version-going-backwards]
ERROR: libxml2-2.13.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-ptest went backwards which would break package feeds (from 0:2.13.4-r0 to 0:2.13.3-r0) [version-going-backwards]
ERROR: libxml2-2.13.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-staticdev went backwards which would break package feeds (from 0:2.13.4-r0 to 0:2.13.3-r0) [version-going-backwards]
ERROR: libxml2-2.13.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-dev went backwards which would break package feeds (from 0:2.13.4-r0 to 0:2.13.3-r0) [version-going-backwards]
ERROR: libxml2-2.13.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-doc went backwards which would break package feeds (from 0:2.13.4-r0 to 0:2.13.3-r0) [version-going-backwards]
ERROR: libxml2-2.13.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-locale went backwards which would break package feeds (from 0:2.13.4-r0 to 0:2.13.3-r0) [version-going-backwards]
ERROR: libxml2-2.13.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-utils went backwards which would break package feeds (from 0:2.13.4-r0 to 0:2.13.3-r0) [version-going-backwards]
ERROR: libxml2-2.13.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2 went backwards which would break package feeds (from 0:2.13.4-r0 to 0:2.13.3-r0) [version-going-backwards]
ERROR: libxml2-2.13.3-r0 do_packagedata_setscene: QA Issue: Package version for package libxml2-python went backwards which would break package feeds (from 0:2.13.4-r0 to 0:2.13.3-r0) [version-going-backwards]
ERROR: libxml2-2.13.3-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============0161529239939766618==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-llvm-upgrade-19.1.0-19.1.1.patch"

RnJvbSBmYjA3Yzg5ZDBiMjYxYmM3YjBmYzgxNjUyMGE3MzUzMDUwOWVmMWQ4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTUgT2N0IDIwMjQgMDg6MDc6NTUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
bHZtOiB1cGdyYWRlIDE5LjEuMCAtPiAxOS4xLjEKCi0tLQogLi4udGNoZXJFbWl0dGVyLXNvcnQt
Q2xhc3NJbmZvLWxpc3RzLWJ5LW5hbWUtYXMtd2UucGF0Y2ggfCA0ICsrLS0KIC4uLi9sbHZtLzAw
MDctbGx2bS1hbGxvdy1lbnYtb3ZlcnJpZGUtb2YtZXhlLXBhdGgucGF0Y2ggIHwgOSArKysrLS0t
LS0KIC4uLi9sbHZtL3tsbHZtXzE5LjEuMC5iYiA9PiBsbHZtXzE5LjEuMS5iYn0gICAgICAgICAg
ICAgIHwgNCArKystCiAzIGZpbGVzIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlv
bnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvbGx2bS97bGx2bV8xOS4xLjAuYmIg
PT4gbGx2bV8xOS4xLjEuYmJ9ICg5OCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL2xsdm0vbGx2bS8wMDAxLUFzbU1hdGNoZXJFbWl0dGVyLXNvcnQtQ2xhc3NJbmZvLWxpc3Rz
LWJ5LW5hbWUtYXMtd2UucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbGx2bS9sbHZtLzAw
MDEtQXNtTWF0Y2hlckVtaXR0ZXItc29ydC1DbGFzc0luZm8tbGlzdHMtYnktbmFtZS1hcy13ZS5w
YXRjaAppbmRleCBhNWM1M2I2NjU3Li5kODM0NjJiN2IzIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvbGx2bS9sbHZtLzAwMDEtQXNtTWF0Y2hlckVtaXR0ZXItc29ydC1DbGFzc0lu
Zm8tbGlzdHMtYnktbmFtZS1hcy13ZS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
bGx2bS9sbHZtLzAwMDEtQXNtTWF0Y2hlckVtaXR0ZXItc29ydC1DbGFzc0luZm8tbGlzdHMtYnkt
bmFtZS1hcy13ZS5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gM2IzMGE5YmRhODgzNzRlOGYw
M2JmOTZlOTcyYWVlNWJkMjE0Yjk4YiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gOGIz
OTllYzBjMjE4NGI1ZTg3OTE4ODJmODM3OTBhYTgwNjM1MTg5YSBNb24gU2VwIDE3IDAwOjAwOjAw
IDIwMDEKIEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21haWwuY29tPgog
RGF0ZTogRnJpLCAyNyBOb3YgMjAyMCAxMDoxMTowOCArMDAwMAogU3ViamVjdDogW1BBVENIXSBB
c21NYXRjaGVyRW1pdHRlcjogc29ydCBDbGFzc0luZm8gbGlzdHMgYnkgbmFtZSBhcyB3ZWxsCkBA
IC0xNCw3ICsxNCw3IEBAIFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4Lmth
bmF2aW5AZ21haWwuY29tPgogIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDEgZGVs
ZXRpb24oLSkKIAogZGlmZiAtLWdpdCBhL2xsdm0vdXRpbHMvVGFibGVHZW4vQXNtTWF0Y2hlckVt
aXR0ZXIuY3BwIGIvbGx2bS91dGlscy9UYWJsZUdlbi9Bc21NYXRjaGVyRW1pdHRlci5jcHAKLWlu
ZGV4IDczNzI0ZTY2MmY5ZS4uMWNhOWM3MzQxNWRiIDEwMDY0NAoraW5kZXggNTAzNWVmNTI3Li4w
M2ZjODQyMDMgMTAwNjQ0CiAtLS0gYS9sbHZtL3V0aWxzL1RhYmxlR2VuL0FzbU1hdGNoZXJFbWl0
dGVyLmNwcAogKysrIGIvbGx2bS91dGlscy9UYWJsZUdlbi9Bc21NYXRjaGVyRW1pdHRlci5jcHAK
IEBAIC0zNjEsNyArMzYxLDEwIEBAIHB1YmxpYzoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9sbHZtL2xsdm0vMDAwNy1sbHZtLWFsbG93LWVudi1vdmVycmlkZS1vZi1leGUtcGF0
aC5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9sbHZtL2xsdm0vMDAwNy1sbHZtLWFsbG93
LWVudi1vdmVycmlkZS1vZi1leGUtcGF0aC5wYXRjaAppbmRleCBhZGQzOGIzYmI0Li44ZDhmMWE5
ZDE2IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbGx2bS9sbHZtLzAwMDctbGx2
bS1hbGxvdy1lbnYtb3ZlcnJpZGUtb2YtZXhlLXBhdGgucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL2xsdm0vbGx2bS8wMDA3LWxsdm0tYWxsb3ctZW52LW92ZXJyaWRlLW9mLWV4ZS1w
YXRoLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA1ODhhODY5NGM2NTQwZTMxMTQwYzdlMjQy
YmZiNWUyNzlkNmNhMDhjIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA2NjIxYjhjNTM0
OTc5Y2RiMmE3MDAwNTVhYmQ1YjBlNTBkZjU2NDMxIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQog
RnJvbTogTWFydGluIEtlbGx5IDxta2VsbHlAeGV2by5jb20+CiBEYXRlOiBGcmksIDE5IE1heSAy
MDE3IDAwOjIyOjU3IC0wNzAwCiBTdWJqZWN0OiBbUEFUQ0hdIGxsdm06IGFsbG93IGVudiBvdmVy
cmlkZSBvZiBleGUgYW5kIGxpYmRpciBwYXRoCkBAIC0xMywxMSArMTMsMTEgQEAgVXBzdHJlYW0t
U3RhdHVzOiBJbmFwcHJvcHJpYXRlIFtPRS1zcGVjaWZpY10KIFNpZ25lZC1vZmYtYnk6IE1hcnRp
biBLZWxseSA8bWtlbGx5QHhldm8uY29tPgogU2lnbmVkLW9mZi1ieTogS2hlbSBSYWogPHJhai5r
aGVtQGdtYWlsLmNvbT4KIC0tLQotIGxsdm0vdG9vbHMvbGx2bS1jb25maWcvbGx2bS1jb25maWcu
Y3BwIHwgMjUgKysrKysrKysrKysrKysrKysrKy0tLS0tLQotIDEgZmlsZSBjaGFuZ2VkLCAxOSBp
bnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQorIGxsdm0vdG9vbHMvbGx2bS1jb25maWcvbGx2
bS1jb25maWcuY3BwIHwgNyArKysrKysrCisgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygr
KQogCiBkaWZmIC0tZ2l0IGEvbGx2bS90b29scy9sbHZtLWNvbmZpZy9sbHZtLWNvbmZpZy5jcHAg
Yi9sbHZtL3Rvb2xzL2xsdm0tY29uZmlnL2xsdm0tY29uZmlnLmNwcAotaW5kZXggZTg2ZWIyYjQ0
YjEwLi43YjJhYmYzMThkYmUgMTAwNjQ0CitpbmRleCBkNWI3NmIxYmIuLjZjMjhjMzRiYyAxMDA2
NDQKIC0tLSBhL2xsdm0vdG9vbHMvbGx2bS1jb25maWcvbGx2bS1jb25maWcuY3BwCiArKysgYi9s
bHZtL3Rvb2xzL2xsdm0tY29uZmlnL2xsdm0tY29uZmlnLmNwcAogQEAgLTI0Niw2ICsyNDYsMTMg
QEAgVHlwaWNhbCBjb21wb25lbnRzOlxuXApAQCAtMzQsNCArMzQsMyBAQCBpbmRleCBlODZlYjJi
NDRiMTAuLjdiMmFiZjMxOGRiZSAxMDA2NDQKICAgIC8vIFRoaXMganVzdCBuZWVkcyB0byBiZSBz
b21lIHN5bWJvbCBpbiB0aGUgYmluYXJ5OyBDKysgZG9lc24ndAogICAgLy8gYWxsb3cgdGFraW5n
IHRoZSBhZGRyZXNzIG9mIDo6bWFpbiBob3dldmVyLgogICAgdm9pZCAqUCA9ICh2b2lkICopKGlu
dHB0cl90KUdldEV4ZWN1dGFibGVQYXRoOwotIApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL2xsdm0vbGx2bV8xOS4xLjAuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbGx2bS9s
bHZtXzE5LjEuMS5iYgpzaW1pbGFyaXR5IGluZGV4IDk4JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvbGx2bS9sbHZtXzE5LjEuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL2xsdm0vbGx2bV8xOS4xLjEuYmIKaW5kZXggMzVlN2Y0YzA3Zi4uOGJiYWRiMjVlYSAx
MDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2xsdm0vbGx2bV8xOS4xLjAuYmIKKysr
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2xsdm0vbGx2bV8xOS4xLjEuYmIKQEAgLTI3LDcgKzI3
LDcgQEAgU1JDX1VSSSA9ICJodHRwczovL2dpdGh1Yi5jb20vbGx2bS9sbHZtLXByb2plY3QvcmVs
ZWFzZXMvZG93bmxvYWQvbGx2bW9yZy0ke1BWfS8KICAgICAgICAgICAgZmlsZTovLzAwMDEtQXNt
TWF0Y2hlckVtaXR0ZXItc29ydC1DbGFzc0luZm8tbGlzdHMtYnktbmFtZS1hcy13ZS5wYXRjaDtz
dHJpcGxldmVsPTIgXAogICAgICAgICAgICBmaWxlOi8vbGx2bS1jb25maWcgXAogICAgICAgICAg
ICAiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiNTA0MjUyMmI0OTk0NWJjNTYwZmY5MjA2ZjI1ZmI4
Nzk4MGE5Yjg5YjkxNDE5M2NhMDBkOTYxNTExZmYwNjczYyIKK1NSQ19VUklbc2hhMjU2c3VtXSA9
ICJkNDBlOTMzZTJhMjA4ZWUxNDI4OThmODVkODg2NDIzYTIxN2U5OTFhYmJjZDQyZGQ4MjExZjUw
N2M5M2UxMjY2IgogVVBTVFJFQU1fQ0hFQ0tfVVJJID0gImh0dHBzOi8vZ2l0aHViLmNvbS9sbHZt
L2xsdm0tcHJvamVjdCIKIFVQU1RSRUFNX0NIRUNLX1JFR0VYID0gImxsdm1vcmctKD9QPHB2ZXI+
XGQrKFwuXGQrKSspIgogCkBAIC0xNzcsMyArMTc3LDUgQEAgRklMRVM6JHtQTn0tc3RhdGljZGV2
ICs9ICJcCiBJTlNBTkVfU0tJUDoke1BOfS1saWJsbHZtICs9ICJkZXYtc28iCiAKIEJCQ0xBU1NF
WFRFTkQgPSAibmF0aXZlIG5hdGl2ZXNkayIKKworUFYgPSAiMTkuMS4xIgotLSAKMi40NC4xCgo=

--===============0161529239939766618==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/llvm (sysroot):
  /usr/bin/crossscripts/llvm-config19.1.0 moved to /usr/bin/crossscripts/llvm-config19.1.1
Changes to packages/x86_64-linux/llvm-native (sysroot):
  /usr/bin/llvm-config changed symlink target from llvm-config19.1.0 to llvm-config19.1.1
  /usr/bin/llvm-config19.1.0 moved to /usr/bin/llvm-config19.1.1
  /usr/bin/llvm-tblgen19.1.0 moved to /usr/bin/llvm-tblgen19.1.1

--===============0161529239939766618==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/llvm: PV changed from "19.1.0" to "19.1.1"
packages/core2-64-poky-linux/llvm: PKGV changed from 19.1.0 [default] to 19.1.1 [default]
packages/core2-64-poky-linux/llvm: SRC_URI changed from "https://github.com/llvm/llvm-project/releases/download/llvmorg-19.1.0/llvm-project-19.1.0.src.tar.xz file://0007-llvm-allow-env-override-of-exe-path.patch;striplevel=2 file://0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch;striplevel=2 file://llvm-config" to "https://github.com/llvm/llvm-project/releases/download/llvmorg-19.1.1/llvm-project-19.1.1.src.tar.xz file://0007-llvm-allow-env-override-of-exe-path.patch;striplevel=2 file://0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch;striplevel=2 file://llvm-config"
packages/core2-64-poky-linux/llvm/llvm-bugpointpasses: PV changed from "19.1.0" to "19.1.1"
packages/core2-64-poky-linux/llvm/llvm-bugpointpasses: PKGV changed from 19.1.0 [default] to 19.1.1 [default]
packages/core2-64-poky-linux/llvm/llvm-dbg: PV changed from "19.1.0" to "19.1.1"
packages/core2-64-poky-linux/llvm/llvm-dbg: PKGV changed from 19.1.0 [default] to 19.1.1 [default]
packages/core2-64-poky-linux/llvm/llvm-dbg: PKGSIZE changed from 25830080 to 25832072 (+0%)
packages/core2-64-poky-linux/llvm/llvm-dev: PV changed from "19.1.0" to "19.1.1"
packages/core2-64-poky-linux/llvm/llvm-dev: PKGV changed from 19.1.0 [default] to 19.1.1 [default]
packages/core2-64-poky-linux/llvm/llvm-dev: PKGSIZE changed from 26269498 to 26269485 (-0%)
packages/core2-64-poky-linux/llvm/llvm-dev: FILES: removed "/usr/lib/libLLVM-19.1.0.so", added "/usr/lib/libLLVM-19.1.1.so"
packages/core2-64-poky-linux/llvm/llvm-doc: PV changed from "19.1.0" to "19.1.1"
packages/core2-64-poky-linux/llvm/llvm-doc: PKGV changed from 19.1.0 [default] to 19.1.1 [default]
packages/core2-64-poky-linux/llvm/llvm-libllvm: PV changed from "19.1.0" to "19.1.1"
packages/core2-64-poky-linux/llvm/llvm-libllvm: PKGV changed from 19.1.0 [default] to 19.1.1 [default]
packages/core2-64-poky-linux/llvm/llvm-liblto: PV changed from "19.1.0" to "19.1.1"
packages/core2-64-poky-linux/llvm/llvm-liblto: PKGV changed from 19.1.0 [default] to 19.1.1 [default]
packages/core2-64-poky-linux/llvm/llvm-liboptremarks: PV changed from "19.1.0" to "19.1.1"
packages/core2-64-poky-linux/llvm/llvm-liboptremarks: PKGV changed from 19.1.0 [default] to 19.1.1 [default]
packages/core2-64-poky-linux/llvm/llvm-llvmhello: PV changed from "19.1.0" to "19.1.1"
packages/core2-64-poky-linux/llvm/llvm-llvmhello: PKGV changed from 19.1.0 [default] to 19.1.1 [default]
packages/core2-64-poky-linux/llvm/llvm-locale: PV changed from "19.1.0" to "19.1.1"
packages/core2-64-poky-linux/llvm/llvm-locale: PKGV changed from 19.1.0 [default] to 19.1.1 [default]
packages/core2-64-poky-linux/llvm/llvm-src: PV changed from "19.1.0" to "19.1.1"
packages/core2-64-poky-linux/llvm/llvm-src: PKGV changed from 19.1.0 [default] to 19.1.1 [default]
packages/core2-64-poky-linux/llvm/llvm-staticdev: PV changed from "19.1.0" to "19.1.1"
packages/core2-64-poky-linux/llvm/llvm-staticdev: PKGV changed from 19.1.0 [default] to 19.1.1 [default]
packages/core2-64-poky-linux/llvm/llvm-staticdev: PKGSIZE changed from 226430642 to 226436648 (+0%)
packages/core2-64-poky-linux/llvm/llvm: PV changed from "19.1.0" to "19.1.1"
packages/core2-64-poky-linux/llvm/llvm: PKGV changed from 19.1.0 [default] to 19.1.1 [default]
packages/core2-64-poky-linux/llvm/llvm: PKGSIZE changed from 142971231 to 142975327 (+0%)
Changes to packages/core2-64-poky-linux/llvm (sysroot):
  /usr/bin/crossscripts/llvm-config19.1.0 moved to /usr/bin/crossscripts/llvm-config19.1.1
Changes to packages/x86_64-linux/llvm-native (sysroot):
  /usr/bin/llvm-config changed symlink target from llvm-config19.1.0 to llvm-config19.1.1
  /usr/bin/llvm-config19.1.0 moved to /usr/bin/llvm-config19.1.1
  /usr/bin/llvm-tblgen19.1.0 moved to /usr/bin/llvm-tblgen19.1.1

--===============0161529239939766618==--

