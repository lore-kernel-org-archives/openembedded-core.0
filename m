Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26E24C2BA12
	for <webhook@archiver.kernel.org>; Wed,  1 May 2024 16:00:22 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.1129.1714579216322115076
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 May 2024 09:00:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=QD8ezwsP;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=S099JJjP;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101018f34e29500-abfd7d09-fd44-4013-b329-726b51b0dbe8-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1714579215;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=8i7Tkp2eZHDOhTLqdbS8HvB1u920ywDRx0ZvrstH89k=;
	b=QD8ezwsPG5q/N11VC6hDqKqoqyI+hUc8PElnc9NoyQW+2CQBOc7wT+BMfNaA2L4M
	ZAlNBBsGNk/07W11LEe5LlvVHJr34oAO1223USpxyoMPhgTF4kvuQxXEsqRw0X58Ktr
	TmY33fKKtX97KxoM3yffSsHyWGdNmwjHyO7EyW3c=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1714579215;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=8i7Tkp2eZHDOhTLqdbS8HvB1u920ywDRx0ZvrstH89k=;
	b=S099JJjPmtmP+lzwvh+gIwv/KcaAqzAna4q/bNhwQah6cYdh1pP6RiFMH1DUjCJw
	k+t9L1RpHgO//Ozxnv9s1QrnUHDxGhx3TuO4H8ZTQsS+y1sciL/f7O32huiBO8GGkCn
	DgXqXWSbpH7YJbhfwUQB1UBhelkfKUMcQg9lsUzw=
Content-Type: multipart/mixed; boundary="===============2104464696846693626=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] zstd: upgrading to 1.5.6 FAILED
Message-ID: <0101018f34e29500-abfd7d09-fd44-4013-b329-726b51b0dbe8-000000@us-west-2.amazonses.com>
Date: Wed, 1 May 2024 16:00:15 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.05.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 May 2024 16:00:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198839

--===============2104464696846693626==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *zstd* to *1.5.6* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-zstd-upgrade-1.5.5-1.5.6.patch
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
From 50a295b82a3ef8b45bf6cfbfa1496144952be617 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 May 2024 09:16:38 +0000
Subject: [PATCH] zstd: upgrade 1.5.5 -> 1.5.6

---
 meta/recipes-extended/zstd/{zstd_1.5.5.bb => zstd_1.5.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/zstd/{zstd_1.5.5.bb => zstd_1.5.6.bb} (96%)

diff --git a/meta/recipes-extended/zstd/zstd_1.5.5.bb b/meta/recipes-extended/zstd/zstd_1.5.6.bb
similarity index 96%
rename from meta/recipes-extended/zstd/zstd_1.5.5.bb
rename to meta/recipes-extended/zstd/zstd_1.5.6.bb
index 2d72af50a4..b65ab84efd 100644
--- a/meta/recipes-extended/zstd/zstd_1.5.5.bb
+++ b/meta/recipes-extended/zstd/zstd_1.5.6.bb
@@ -13,7 +13,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=0822a32f7acdbe013606746641746ee8 \
 SRC_URI = "git://github.com/facebook/zstd.git;branch=release;protocol=https \
            file://0001-pzstd-use-directly-for-the-test-c-snippet.patch"
 
-SRCREV = "63779c798237346c2b245c546c40b72a5a5913fe"
+SRCREV = "794ea1b0afca0f020f4e57b6732332231fb23c70"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
 CVE_PRODUCT = "zstandard"
-- 
2.44.0


--===============2104464696846693626==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-zstd-upgrade-1.5.5-1.5.6.patch"

RnJvbSA1MGEyOTViODJhM2VmOGI0NWJmNmNmYmZhMTQ5NjE0NDk1MmJlNjE3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBNYXkgMjAyNCAwOToxNjozOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHpz
dGQ6IHVwZ3JhZGUgMS41LjUgLT4gMS41LjYKCi0tLQogbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3pz
dGQve3pzdGRfMS41LjUuYmIgPT4genN0ZF8xLjUuNi5iYn0gfCAyICstCiAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZXh0
ZW5kZWQvenN0ZC97enN0ZF8xLjUuNS5iYiA9PiB6c3RkXzEuNS42LmJifSAoOTYlKQoKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC96c3RkL3pzdGRfMS41LjUuYmIgYi9tZXRhL3Jl
Y2lwZXMtZXh0ZW5kZWQvenN0ZC96c3RkXzEuNS42LmJiCnNpbWlsYXJpdHkgaW5kZXggOTYlCnJl
bmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1leHRlbmRlZC96c3RkL3pzdGRfMS41LjUuYmIKcmVuYW1l
IHRvIG1ldGEvcmVjaXBlcy1leHRlbmRlZC96c3RkL3pzdGRfMS41LjYuYmIKaW5kZXggMmQ3MmFm
NTBhNC4uYjY1YWI4NGVmZCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3pzdGQv
enN0ZF8xLjUuNS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvenN0ZC96c3RkXzEuNS42
LmJiCkBAIC0xMyw3ICsxMyw3IEBAIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7
bWQ1PTA4MjJhMzJmN2FjZGJlMDEzNjA2NzQ2NjQxNzQ2ZWU4IFwKIFNSQ19VUkkgPSAiZ2l0Oi8v
Z2l0aHViLmNvbS9mYWNlYm9vay96c3RkLmdpdDticmFuY2g9cmVsZWFzZTtwcm90b2NvbD1odHRw
cyBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLXB6c3RkLXVzZS1kaXJlY3RseS1mb3ItdGhlLXRl
c3QtYy1zbmlwcGV0LnBhdGNoIgogCi1TUkNSRVYgPSAiNjM3NzljNzk4MjM3MzQ2YzJiMjQ1YzU0
NmM0MGI3MmE1YTU5MTNmZSIKK1NSQ1JFViA9ICI3OTRlYTFiMGFmY2EwZjAyMGY0ZTU3YjY3MzIz
MzIyMzFmYjIzYzcwIgogVVBTVFJFQU1fQ0hFQ0tfR0lUVEFHUkVHRVggPSAidig/UDxwdmVyPlxk
KyhcLlxkKykrKSIKIAogQ1ZFX1BST0RVQ1QgPSAienN0YW5kYXJkIgotLSAKMi40NC4wCgo=

--===============2104464696846693626==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1878 entries from dependency cache.
Parsing recipes...done.
Parsing of 920 .bb files complete (919 cached, 1 parsed). 1876 targets, 35 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-0207a7ab659b25e422f18e4864f29592e10780cd"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:0207a7ab659b25e422f18e4864f29592e10780cd"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 128 Local 77 Mirrors 0 Missed 51 Current 163 (60% match, 82% complete)
Removing 5 stale sstate objects for arch core2-64...done.
Removing 16 stale sstate objects for arch x86_64...done.
Removing 4 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 178 of 291 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.42.bb:do_create_spdx_setscene)
NOTE: Running setscene task 194 of 291 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 198 of 291 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.39.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 202 of 291 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 203 of 291 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_13.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 204 of 291 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 205 of 291 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 211 of 291 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 241 of 291 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 249 of 291 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 275 of 291 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake-native_3.28.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 279 of 291 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_create_spdx_setscene)
NOTE: Running task 160 of 885 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_recipe_qa)
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcc-initial-13.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running noexec task 280 of 885 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_fetch)
NOTE: recipe libgcc-initial-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glibc-2.39+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe cmake-native-3.28.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe file-native-5.45-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcc-initial-13.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcc-initial-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 451 of 885 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_fetch)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running noexec task 459 of 885 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_13.2.bb:do_fetch)
NOTE: recipe libarchive-native-3.7.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 467 of 885 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-source_13.2.bb:do_patch)
NOTE: recipe glibc-2.39+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 478 of 885 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.39.bb:do_fetch)
NOTE: recipe zstd-native-1.5.6-r0: task do_recipe_qa: Started
NOTE: recipe file-native-5.45-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 517 of 885 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_fetch)
NOTE: recipe cmake-native-3.28.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 536 of 885 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake-native_3.28.3.bb:do_fetch)
NOTE: recipe libmpc-native-1.3.1-r0: task do_create_spdx_setscene: Started
NOTE: Running noexec task 599 of 885 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_fetch)
NOTE: recipe libarchive-native-3.7.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 608 of 885 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_recipe_qa)
NOTE: Running noexec task 614 of 885 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_fetch)
NOTE: Running task 619 of 885 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.3.bb:do_fetch)
NOTE: recipe gcc-source-13.2.0-13.2.0-r0: task do_patch: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_fetch: Started
NOTE: recipe libmpc-native-1.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe cmake-native-3.28.3-r0: task do_fetch: Started
NOTE: Running setscene task 290 of 291 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.1.bb:do_create_spdx_setscene)
NOTE: recipe linux-libc-headers-6.6-r0: task do_fetch: Succeeded
NOTE: Running task 674 of 885 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_unpack)
NOTE: Running task 675 of 885 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe cmake-native-3.28.3-r0: task do_fetch: Succeeded
NOTE: recipe glibc-2.39+git-r0: task do_fetch: Started
NOTE: Running task 676 of 885 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake-native_3.28.3.bb:do_unpack)
NOTE: recipe zstd-1.5.6-r0: task do_recipe_qa: Started
NOTE: recipe file-native-5.45-r0: task do_fetch: Started
NOTE: recipe cmake-native-3.28.3-r0: task do_unpack: Started
NOTE: recipe libarchive-native-3.7.3-r0: task do_fetch: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_unpack: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mpfr-native-4.2.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libarchive-native-3.7.3-r0: task do_fetch: Succeeded
NOTE: Running task 677 of 885 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.3.bb:do_unpack)
NOTE: recipe zstd-native-1.5.6-r0: task do_recipe_qa: Succeeded
NOTE: Running task 678 of 885 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_fetch)
NOTE: recipe linux-libc-headers-6.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe mpfr-native-4.2.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 291 of 291 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_create_spdx_setscene)
NOTE: recipe file-native-5.45-r0: task do_fetch: Succeeded
NOTE: recipe glibc-2.39+git-r0: task do_fetch: Succeeded
NOTE: Running task 683 of 885 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_unpack)
NOTE: Running task 684 of 885 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.39.bb:do_unpack)
NOTE: recipe libarchive-native-3.7.3-r0: task do_unpack: Started
NOTE: recipe zstd-native-1.5.6-r0: task do_fetch: Started
NOTE: recipe zstd-1.5.6-r0: task do_recipe_qa: Succeeded
NOTE: Running task 685 of 885 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_fetch)
NOTE: recipe gmp-native-6.3.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe glibc-2.39+git-r0: task do_unpack: Started
NOTE: recipe file-native-5.45-r0: task do_unpack: Started
NOTE: recipe gmp-native-6.3.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe zstd-1.5.6-r0: task do_fetch: Started
NOTE: Setscene tasks completed
NOTE: recipe zstd-native-1.5.6-r0: task do_fetch: Succeeded
NOTE: recipe libarchive-native-3.7.3-r0: task do_unpack: Succeeded
NOTE: Running task 716 of 885 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_unpack)
NOTE: Running task 717 of 885 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 718 of 885 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.3.bb:do_patch)
NOTE: recipe zstd-native-1.5.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe zstd-native-1.5.6-r0: task do_unpack: Started
NOTE: recipe zstd-1.5.6-r0: task do_fetch: Succeeded
NOTE: Running task 719 of 885 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_unpack)
NOTE: recipe zstd-native-1.5.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libarchive-native-3.7.3-r0: task do_patch: Started
NOTE: recipe zstd-1.5.6-r0: task do_unpack: Started
NOTE: recipe libarchive-native-3.7.3-r0: task do_patch: Succeeded
NOTE: recipe file-native-5.45-r0: task do_unpack: Succeeded
NOTE: Running task 721 of 885 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_patch)
NOTE: recipe file-native-5.45-r0: task do_patch: Started
NOTE: recipe zstd-native-1.5.6-r0: task do_unpack: Succeeded
NOTE: Running task 722 of 885 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_patch)
NOTE: Running task 723 of 885 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_collect_spdx_deps)
NOTE: recipe file-native-5.45-r0: task do_patch: Succeeded
NOTE: recipe cmake-native-3.28.3-r0: task do_unpack: Succeeded
NOTE: Running task 725 of 885 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake-native_3.28.3.bb:do_patch)
NOTE: recipe zstd-native-1.5.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe zstd-native-1.5.6-r0: task do_patch: Started
NOTE: recipe zstd-native-1.5.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 726 of 885 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_create_spdx)
NOTE: recipe cmake-native-3.28.3-r0: task do_patch: Started
NOTE: recipe zstd-native-1.5.6-r0: task do_create_spdx: Started
NOTE: recipe cmake-native-3.28.3-r0: task do_patch: Succeeded
NOTE: recipe zstd-1.5.6-r0: task do_unpack: Succeeded
NOTE: Running task 728 of 885 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_patch)
NOTE: recipe zstd-1.5.6-r0: task do_patch: Started
NOTE: recipe zstd-native-1.5.6-r0: task do_create_spdx: Succeeded
NOTE: recipe gcc-source-13.2.0-13.2.0-r0: task do_patch: Succeeded
NOTE: Running task 730 of 885 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-source_13.2.bb:do_preconfigure)
NOTE: recipe gcc-source-13.2.0-13.2.0-r0: task do_preconfigure: Started
NOTE: recipe glibc-2.39+git-r0: task do_unpack: Succeeded
NOTE: Running task 735 of 885 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.39.bb:do_patch)
NOTE: recipe gcc-source-13.2.0-13.2.0-r0: task do_preconfigure: Succeeded
NOTE: recipe glibc-2.39+git-r0: task do_patch: Started
NOTE: recipe glibc-2.39+git-r0: task do_patch: Succeeded
NOTE: recipe zstd-native-1.5.6-r0: task do_patch: Failed
NOTE: recipe zstd-1.5.6-r0: task do_patch: Failed
NOTE: recipe linux-libc-headers-6.6-r0: task do_unpack: Succeeded
NOTE: Tasks Summary: Attempted 736 tasks of which 704 didn't need to be rerun and 2 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240501091612.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240501091612.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 2 tasks failed:
  virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_patch
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_patch
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: zstd-native-1.5.6-r0 do_patch: Applying patch '0001-pzstd-use-directly-for-the-test-c-snippet.patch' on target directory '/home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/zstd-native/1.5.6/git'
CmdError('quilt --quiltrc /home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/zstd-native/1.5.6/recipe-sysroot-native/etc/quiltrc push', 0, 'stdout: Applying patch 0001-pzstd-use-directly-for-the-test-c-snippet.patch
patching file contrib/pzstd/Makefile
Hunk #1 FAILED at 37.
1 out of 1 hunk FAILED -- rejects in file contrib/pzstd/Makefile
Patch 0001-pzstd-use-directly-for-the-test-c-snippet.patch can be reverse-applied

stderr: ')
ERROR: zstd-1.5.6-r0 do_patch: Applying patch '0001-pzstd-use-directly-for-the-test-c-snippet.patch' on target directory '/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/zstd/1.5.6/git'
CmdError('quilt --quiltrc /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/zstd/1.5.6/recipe-sysroot-native/etc/quiltrc push', 0, 'stdout: Applying patch 0001-pzstd-use-directly-for-the-test-c-snippet.patch
patching file contrib/pzstd/Makefile
Hunk #1 FAILED at 37.
1 out of 1 hunk FAILED -- rejects in file contrib/pzstd/Makefile
Patch 0001-pzstd-use-directly-for-the-test-c-snippet.patch can be reverse-applied

stderr: ')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/zstd-native/1.5.6/temp/log.do_patch.1404211
ERROR: Task (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_patch) failed with exit code '1'
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/zstd/1.5.6/temp/log.do_patch.1405063
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_patch) failed with exit code '1'

--===============2104464696846693626==--

