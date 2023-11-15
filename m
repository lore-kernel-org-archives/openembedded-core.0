Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 945A1C54F3A
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 14:37:10 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.14620.1700059029803299176
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Nov 2023 06:37:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=gm1L/hXG;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=drDFb59z;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101018bd36a1d79-cae49bc1-d0a0-4761-97b5-9c11d3e0bbfb-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1700059029;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=k3UYKwGAV0FcVl32Yt34/i3mK4nrdTLYXcrs4RkKQgE=;
	b=gm1L/hXGtOYoS3SwvRoQugArl1cPkEqOdWGFa38m7sy/zmTCWNk3Ozv1xPh53H5+
	Nh5o6OlQCuCVGyOBYK4yX+mClmSW4eOQQv/eaRrjxWLfmC1pP/88nlH+OuA8ASMc0f0
	ljuEtf+cb8csP1STxSKykfomwql2pixknkxP5XTk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1700059029;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=k3UYKwGAV0FcVl32Yt34/i3mK4nrdTLYXcrs4RkKQgE=;
	b=drDFb59zRz8t5WpNjfJdPv/r5WcOE41aqD8kEIffYKw4kYbNKYiynDG3Ff5mzCMZ
	leOF9Lvzro4EH8Kp++kqxAyFvEj7N7nGXY5PKiq4CKdtlzi1HX2Z3S7pqd7qKoGijpb
	V6i5kX0dieaZ1vBtLGjP2Ib5/GUTiT0fo2OP01J4=
Content-Type: multipart/mixed; boundary="===============6934899096441321273=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] cmake: upgrading to 3.27.7 FAILED
Message-ID: <0101018bd36a1d79-cae49bc1-d0a0-4761-97b5-9c11d3e0bbfb-000000@us-west-2.amazonses.com>
Date: Wed, 15 Nov 2023 14:37:08 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 14:37:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190616

--===============6934899096441321273==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *cmake* to *3.27.7* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-cmake-upgrade-3.27.5-3.27.7.patch
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
From fb3e5be4e7210641b346b5382fe2c75f25544d78 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Nov 2023 05:45:39 +0000
Subject: [PATCH] cmake: upgrade 3.27.5 -> 3.27.7

---
 meta/recipes-devtools/cmake/cmake.inc                           | 2 +-
 .../recipes-devtools/cmake/{cmake_3.27.5.bb => cmake_3.27.7.bb} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/cmake/{cmake_3.27.5.bb => cmake_3.27.7.bb} (100%)

diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index ef4eec5ab1..ecb0e487df 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -19,7 +19,7 @@ CMAKE_MAJOR_VERSION = "${@'.'.join(d.getVar('PV').split('.')[0:2])}"
 SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
 "
 
-SRC_URI[sha256sum] = "5175e8fe1ca9b1dd09090130db7201968bcce1595971ff9e9998c2f0765004c9"
+SRC_URI[sha256sum] = "08f71a106036bf051f692760ef9558c0577c42ac39e96ba097e7662bd4158d8e"
 
 UPSTREAM_CHECK_REGEX = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/cmake/cmake_3.27.5.bb b/meta/recipes-devtools/cmake/cmake_3.27.7.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake_3.27.5.bb
rename to meta/recipes-devtools/cmake/cmake_3.27.7.bb
-- 
2.39.2


--===============6934899096441321273==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-cmake-upgrade-3.27.5-3.27.7.patch"

RnJvbSBmYjNlNWJlNGU3MjEwNjQxYjM0NmI1MzgyZmUyYzc1ZjI1NTQ0ZDc4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgTm92IDIwMjMgMDU6NDU6MzkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBj
bWFrZTogdXBncmFkZSAzLjI3LjUgLT4gMy4yNy43CgotLS0KIG1ldGEvcmVjaXBlcy1kZXZ0b29s
cy9jbWFrZS9jbWFrZS5pbmMgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDIgKy0KIC4uLi9y
ZWNpcGVzLWRldnRvb2xzL2NtYWtlL3tjbWFrZV8zLjI3LjUuYmIgPT4gY21ha2VfMy4yNy43LmJi
fSB8IDAKIDIgZmlsZXMgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvY21ha2Uve2NtYWtlXzMuMjcuNS5iYiA9PiBjbWFr
ZV8zLjI3LjcuYmJ9ICgxMDAlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9j
bWFrZS9jbWFrZS5pbmMgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvY21ha2UvY21ha2UuaW5jCmlu
ZGV4IGVmNGVlYzVhYjEuLmVjYjBlNDg3ZGYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9jbWFrZS9jbWFrZS5pbmMKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NtYWtlL2Nt
YWtlLmluYwpAQCAtMTksNyArMTksNyBAQCBDTUFLRV9NQUpPUl9WRVJTSU9OID0gIiR7QCcuJy5q
b2luKGQuZ2V0VmFyKCdQVicpLnNwbGl0KCcuJylbMDoyXSl9IgogU1JDX1VSSSA9ICJodHRwczov
L2NtYWtlLm9yZy9maWxlcy92JHtDTUFLRV9NQUpPUl9WRVJTSU9OfS9jbWFrZS0ke1BWfS50YXIu
Z3ogXAogIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiNTE3NWU4ZmUxY2E5YjFkZDA5MDkwMTMw
ZGI3MjAxOTY4YmNjZTE1OTU5NzFmZjllOTk5OGMyZjA3NjUwMDRjOSIKK1NSQ19VUklbc2hhMjU2
c3VtXSA9ICIwOGY3MWExMDYwMzZiZjA1MWY2OTI3NjBlZjk1NThjMDU3N2M0MmFjMzllOTZiYTA5
N2U3NjYyYmQ0MTU4ZDhlIgogCiBVUFNUUkVBTV9DSEVDS19SRUdFWCA9ICJjbWFrZS0oP1A8cHZl
cj5cZCsoXC5cZCspKylcLnRhciIKIApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L2NtYWtlL2NtYWtlXzMuMjcuNS5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9jbWFrZS9jbWFr
ZV8zLjI3LjcuYmIKc2ltaWxhcml0eSBpbmRleCAxMDAlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBl
cy1kZXZ0b29scy9jbWFrZS9jbWFrZV8zLjI3LjUuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1k
ZXZ0b29scy9jbWFrZS9jbWFrZV8zLjI3LjcuYmIKLS0gCjIuMzkuMgoK

--===============6934899096441321273==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1845 entries from dependency cache.
Parsing recipes...done.
Parsing of 911 .bb files complete (909 cached, 2 parsed). 1843 targets, 38 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-493cb294a6d7defb317d5b702d2fb27ba85b37a7"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:493cb294a6d7defb317d5b702d2fb27ba85b37a7"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 190 Local 97 Mirrors 0 Missed 93 Current 224 (51% match, 77% complete)
Removing 6 stale sstate objects for arch core2-64...done.
Removing 20 stale sstate objects for arch qemux86_64...done.
Removing 13 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 242 of 414 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.5.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 253 of 414 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 254 of 414 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 259 of 414 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 263 of 414 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 267 of 414 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 271 of 414 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 280 of 414 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 281 of 414 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.15.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 284 of 414 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 294 of 414 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.1.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 297 of 414 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 300 of 414 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 305 of 414 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 306 of 414 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.4.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 312 of 414 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_13.2.bb:do_create_spdx_setscene)
NOTE: recipe zstd-1.5.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libarchive-3.7.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xz-5.4.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcc-initial-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libidn2-2.3.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-5.2.15-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe openssl-3.1.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe curl-8.4.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zstd-1.5.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 317 of 414 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libarchive-3.7.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 322 of 414 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.38.bb:do_stash_locale_setscene)
NOTE: recipe opkg-utils-0.6.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 323 of 414 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe expat-2.5.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 324 of 414 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.4.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 325 of 414 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe zlib-1.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 331 of 414 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 332 of 414 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 340 of 414 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.1.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 341 of 414 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 342 of 414 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_spdx_setscene)
NOTE: recipe attr-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe openssl-3.1.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 343 of 414 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_create_spdx_setscene)
NOTE: recipe bash-5.2.15-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcc-initial-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 344 of 414 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_create_spdx_setscene)
NOTE: recipe curl-8.4.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 345 of 414 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.15.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 347 of 414 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 348 of 414 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 350 of 414 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_create_spdx_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libunistring-1.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe glibc-2.38+git-r0: task do_stash_locale_setscene: Started
NOTE: recipe bash-5.2.15-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libnsl2-native-2.0.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libedit-native-20230828-3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe xz-native-5.4.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe bzip2-native-1.0.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe e2fsprogs-native-1.47.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gtk-doc-native-1.33.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe openssl-native-3.1.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe e2fsprogs-native-1.47.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-native-1.23-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcc-13.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 352 of 414 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 357 of 414 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.43.2.bb:do_create_spdx_setscene)
NOTE: recipe bash-5.2.15-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 358 of 414 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_create_spdx_setscene)
NOTE: Running setscene task 362 of 414 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 366 of 414 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rsync/rsync_3.2.7.bb:do_create_spdx_setscene)
NOTE: recipe libnsl2-native-2.0.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libedit-native-20230828-3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 367 of 414 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rsync/rsync_3.2.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 368 of 414 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/unifdef/unifdef_2.12.bb:do_create_spdx_setscene)
NOTE: recipe xz-native-5.4.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 369 of 414 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/unifdef/unifdef_2.12.bb:do_populate_sysroot_setscene)
NOTE: recipe e2fsprogs-native-1.47.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gtk-doc-native-1.33.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe openssl-native-3.1.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 371 of 414 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 372 of 414 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 373 of 414 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_create_spdx_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-native-1.23-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bzip2-native-1.0.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 378 of 414 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 380 of 414 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 387 of 414 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libffi-native-3.4.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe sqlite3-native-3_3.43.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe unifdef-native-2.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe rsync-native-3.2.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe unifdef-native-2.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe rsync-native-3.2.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe e2fsprogs-native-1.47.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-native-1.3.3-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 388 of 414 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_populate_sysroot_setscene)
NOTE: recipe ncurses-native-6.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe util-linux-libuuid-native-2.39.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gnutls-native-3.8.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libffi-native-3.4.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 97 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.5.bb:do_fetch)
NOTE: recipe sqlite3-native-3_3.43.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 393 of 414 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/bison/bison_3.8.2.bb:do_create_spdx_setscene)
NOTE: Running task 169 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake-native_3.27.5.bb:do_recipe_qa)
NOTE: recipe unifdef-native-2.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe rsync-native-3.2.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running noexec task 214 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_fetch)
NOTE: Running noexec task 290 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_fetch)
NOTE: Running task 292 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_fetch)
NOTE: Running task 313 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_fetch)
NOTE: Running task 317 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.1.bb:do_fetch)
NOTE: Running task 326 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.bb:do_fetch)
NOTE: recipe ncurses-native-6.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libtirpc-native-1.3.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 336 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.1.4.bb:do_fetch)
NOTE: Running task 339 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_fetch)
NOTE: recipe util-linux-libuuid-native-2.39.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gnutls-native-3.8.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe glibc-2.38+git-r0: task do_stash_locale_setscene: Succeeded
NOTE: Running task 344 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.1.bb:do_fetch)
NOTE: Running setscene task 397 of 414 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.38.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-native-3.11.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 398 of 414 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe unifdef-native-2.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 349 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.5.0.bb:do_fetch)
NOTE: recipe cmake-native-3.27.5-r0: task do_recipe_qa: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_fetch: Started
NOTE: recipe gtk-doc-native-1.33.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe rsync-native-3.2.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.5-r0: task do_fetch: Succeeded
NOTE: Running task 355 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.1.bb:do_fetch)
NOTE: Running task 359 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_fetch)
NOTE: recipe opkg-utils-0.6.2-r0: task do_fetch: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_fetch: Started
NOTE: recipe bison-native-3.8.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_fetch: Started
NOTE: recipe python3-native-3.11.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 362 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.4.0.bb:do_fetch)
NOTE: recipe attr-2.5.1-r0: task do_fetch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Started
NOTE: recipe openssl-3.1.4-r0: task do_fetch: Started
NOTE: recipe libgcc-initial-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_fetch: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_fetch: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_fetch: Succeeded
NOTE: Running task 363 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.bb:do_unpack)
NOTE: Running task 364 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_unpack)
NOTE: recipe attr-2.5.1-r0: task do_fetch: Succeeded
NOTE: Running task 365 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.1.bb:do_unpack)
NOTE: recipe expat-2.5.0-r0: task do_fetch: Started
NOTE: recipe openssl-3.1.4-r0: task do_fetch: Succeeded
NOTE: recipe glibc-2.38+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_fetch: Succeeded
NOTE: recipe cmake-native-3.27.5-r0: task do_recipe_qa: Succeeded
NOTE: Running task 366 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.1.4.bb:do_unpack)
NOTE: Running task 367 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.1.bb:do_unpack)
NOTE: recipe opkg-utils-0.6.2-r0: task do_fetch: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_fetch: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake-native_3.27.5.bb:do_recipe_qa unihash changed to 85c73eadca06d0e92fcea130ae6e23e902c96314ef1c38c60a14ed3445d24ed7
NOTE: recipe expat-2.5.0-r0: task do_fetch: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_fetch: Started
NOTE: recipe bison-native-3.8.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_fetch: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Succeeded
NOTE: recipe gtk-doc-native-1.33.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_fetch: Succeeded
NOTE: recipe curl-8.4.0-r0: task do_fetch: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_unpack: Started
NOTE: recipe zlib-1.3-r0: task do_unpack: Started
NOTE: recipe glibc-2.38+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe curl-8.4.0-r0: task do_fetch: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_unpack: Started
NOTE: recipe acl-2.3.1-r0: task do_unpack: Started
NOTE: recipe openssl-3.1.4-r0: task do_unpack: Started
NOTE: recipe libgcc-initial-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.3-r0: task do_unpack: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_unpack: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_unpack: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_unpack: Succeeded
NOTE: recipe openssl-3.1.4-r0: task do_unpack: Succeeded
NOTE: Running setscene task 327 of 414 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 386 of 414 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: Running task 449 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.5.bb:do_unpack)
NOTE: Running task 488 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.38.bb:do_fetch)
NOTE: Running task 504 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake-native_3.27.5.bb:do_fetch)
NOTE: Running task 530 of 1186 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_unpack)
NOTE: Running task 595 of 1186 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.1.bb:do_unpack)
NOTE: Running task 651 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_unpack)
NOTE: Running task 668 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.1.bb:do_patch)
NOTE: Running task 670 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.bb:do_patch)
NOTE: Running task 678 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.1.4.bb:do_patch)
NOTE: Running task 689 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_unpack)
NOTE: Running task 698 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.1.bb:do_patch)
NOTE: Running task 701 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.5.0.bb:do_unpack)
NOTE: Running task 702 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.1.bb:do_unpack)
NOTE: Running task 703 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_unpack)
NOTE: recipe libgcc-initial-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cmake-native-3.27.5-r0: task do_fetch: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_unpack: Started
WARNING: cmake-native-3.27.5-r0 do_fetch: Checksum mismatch for local file /srv/autobuilder/autobuilder.yocto.io/current_sources/cmake-3.27.5.tar.gz
Cleaning and trying again.
WARNING: cmake-native-3.27.5-r0 do_fetch: Renaming /srv/autobuilder/autobuilder.yocto.io/current_sources/cmake-3.27.5.tar.gz to /srv/autobuilder/autobuilder.yocto.io/current_sources/cmake-3.27.5.tar.gz_bad-checksum_5175e8fe1ca9b1dd09090130db7201968bcce1595971ff9e9998c2f0765004c9
NOTE: recipe opkg-utils-0.6.2-r0: task do_unpack: Started
NOTE: recipe glibc-2.38+git-r0: task do_fetch: Started
NOTE: recipe libgcc-initial-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3-r0: task do_patch: Started
NOTE: Running task 706 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.4.0.bb:do_unpack)
NOTE: recipe libunistring-1.1-r0: task do_unpack: Started
NOTE: recipe attr-2.5.1-r0: task do_patch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Started
NOTE: recipe acl-2.3.1-r0: task do_patch: Started
NOTE: recipe expat-2.5.0-r0: task do_unpack: Started
NOTE: recipe libidn2-2.3.4-r0: task do_unpack: Started
NOTE: recipe openssl-3.1.4-r0: task do_patch: Started
NOTE: recipe gnutls-native-3.8.1-r0: task do_unpack: Started
NOTE: recipe python3-native-3.11.5-r0: task do_unpack: Started
NOTE: recipe glibc-2.38+git-r0: task do_fetch: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_patch: Succeeded
NOTE: Running task 707 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.38.bb:do_unpack)
NOTE: Running task 714 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_fetch)
NOTE: recipe curl-8.4.0-r0: task do_unpack: Started
NOTE: recipe expat-2.5.0-r0: task do_unpack: Succeeded
NOTE: Running task 715 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.5.0.bb:do_patch)
NOTE: recipe libidn2-2.3.4-r0: task do_unpack: Succeeded
NOTE: recipe zlib-1.3-r0: task do_patch: Succeeded
NOTE: Running task 716 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_patch)
NOTE: Running task 719 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_fetch)
NOTE: recipe libunistring-1.1-r0: task do_unpack: Succeeded
NOTE: Running task 720 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.1.bb:do_patch)
NOTE: recipe xz-5.4.4-r0: task do_fetch: Started
NOTE: recipe glibc-2.38+git-r0: task do_unpack: Started
NOTE: recipe xz-5.4.4-r0: task do_fetch: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_patch: Started
NOTE: Running task 721 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_unpack)
NOTE: recipe libidn2-2.3.4-r0: task do_patch: Started
NOTE: recipe ncurses-6.4-r0: task do_fetch: Started
NOTE: recipe acl-2.3.1-r0: task do_patch: Succeeded
NOTE: Running task 724 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_fetch)
NOTE: recipe libunistring-1.1-r0: task do_patch: Started
NOTE: recipe expat-2.5.0-r0: task do_patch: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_fetch: Succeeded
NOTE: Running task 725 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.5.0.bb:do_generate_toolchain_file)
NOTE: Running task 728 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_fetch)
NOTE: recipe xz-5.4.4-r0: task do_unpack: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_unpack: Succeeded
NOTE: Running task 729 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_patch)
NOTE: recipe libidn2-2.3.4-r0: task do_patch: Succeeded
NOTE: Running task 731 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_unpack)
NOTE: recipe openssl-3.1.4-r0: task do_patch: Succeeded
NOTE: recipe zstd-1.5.5-r0: task do_fetch: Started
NOTE: Running task 734 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.2.bb:do_fetch)
NOTE: recipe libunistring-1.1-r0: task do_patch: Succeeded
NOTE: Running task 737 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.15.bb:do_fetch)
NOTE: recipe xz-5.4.4-r0: task do_unpack: Succeeded
NOTE: Running task 738 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_patch)
NOTE: recipe bash-completion-2.11-r0: task do_fetch: Started
NOTE: recipe expat-2.5.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_patch: Started
NOTE: Running task 739 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_patch)
NOTE: recipe curl-8.4.0-r0: task do_unpack: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_fetch: Succeeded
NOTE: Running task 740 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.4.0.bb:do_patch)
NOTE: Running task 741 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_unpack)
NOTE: recipe zstd-1.5.5-r0: task do_fetch: Succeeded
NOTE: Running task 742 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_unpack)
NOTE: recipe ncurses-6.4-r0: task do_unpack: Started
NOTE: recipe expat-2.5.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libarchive-3.7.2-r0: task do_fetch: Started
NOTE: Running task 743 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake_3.27.7.bb:do_recipe_qa)
NOTE: recipe libarchive-3.7.2-r0: task do_fetch: Succeeded
NOTE: Running task 744 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.2.bb:do_unpack)
NOTE: recipe bash-5.2.15-r0: task do_fetch: Started
NOTE: recipe xz-5.4.4-r0: task do_patch: Started
NOTE: recipe zstd-1.5.5-r0: task do_unpack: Started
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Started
NOTE: recipe bash-completion-2.11-r0: task do_unpack: Started
NOTE: recipe bash-5.2.15-r0: task do_fetch: Succeeded
NOTE: Running task 745 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.15.bb:do_unpack)
NOTE: recipe curl-8.4.0-r0: task do_patch: Started
NOTE: recipe cmake-3.27.7-r0: task do_recipe_qa: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_patch: Succeeded
NOTE: recipe curl-8.4.0-r0: task do_patch: Succeeded
NOTE: recipe libarchive-3.7.2-r0: task do_unpack: Started
NOTE: recipe xz-5.4.4-r0: task do_patch: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_unpack: Started
NOTE: recipe bash-completion-2.11-r0: task do_unpack: Succeeded
NOTE: Running task 824 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_patch)
NOTE: recipe gnutls-native-3.8.1-r0: task do_unpack: Succeeded
NOTE: recipe cmake-3.27.7-r0: task do_recipe_qa: Succeeded
NOTE: Running task 825 of 1186 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.1.bb:do_patch)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake_3.27.7.bb:do_recipe_qa unihash changed to cf23b6f7a63ceeba210f0c25e0c27fbc28f666c3759ba2452f16c14071785a13
NOTE: recipe libarchive-3.7.2-r0: task do_unpack: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_patch: Started
NOTE: recipe bash-completion-2.11-r0: task do_patch: Succeeded
NOTE: recipe gnutls-native-3.8.1-r0: task do_patch: Started
NOTE: Running task 826 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.2.bb:do_patch)
NOTE: Running task 827 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake_3.27.7.bb:do_fetch)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 406 of 414 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_gcc_stash_builddir_setscene)
NOTE: recipe bash-5.2.15-r0: task do_unpack: Succeeded
NOTE: Running task 829 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.15.bb:do_patch)
NOTE: recipe ncurses-6.4-r0: task do_unpack: Succeeded
NOTE: Running task 830 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_patch)
NOTE: recipe cmake-3.27.7-r0: task do_fetch: Started
NOTE: recipe libarchive-3.7.2-r0: task do_patch: Started
NOTE: recipe cmake-3.27.7-r0: task do_fetch: Succeeded
NOTE: Running task 831 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake_3.27.7.bb:do_unpack)
NOTE: recipe zstd-1.5.5-r0: task do_unpack: Succeeded
NOTE: Running task 832 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_patch)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_gcc_stash_builddir_setscene: Started
NOTE: recipe gnutls-native-3.8.1-r0: task do_patch: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_patch: Started
NOTE: recipe ncurses-6.4-r0: task do_patch: Started
NOTE: recipe cmake-3.27.7-r0: task do_unpack: Started
NOTE: recipe zstd-1.5.5-r0: task do_patch: Started
NOTE: recipe libarchive-3.7.2-r0: task do_patch: Succeeded
NOTE: recipe zstd-1.5.5-r0: task do_patch: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_patch: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_patch: Succeeded
NOTE: recipe python3-native-3.11.5-r0: task do_unpack: Succeeded
NOTE: Running task 838 of 1186 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_patch)
NOTE: recipe python3-native-3.11.5-r0: task do_patch: Started
NOTE: recipe cmake-3.27.7-r0: task do_unpack: Succeeded
NOTE: Running task 839 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake_3.27.7.bb:do_patch)
NOTE: recipe cmake-3.27.7-r0: task do_patch: Started
NOTE: recipe cmake-3.27.7-r0: task do_patch: Succeeded
NOTE: Running task 840 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake_3.27.7.bb:do_deploy_source_date_epoch)
NOTE: Running task 841 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake_3.27.7.bb:do_generate_toolchain_file)
NOTE: Running task 842 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake_3.27.7.bb:do_populate_lic)
NOTE: recipe cmake-3.27.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cmake-3.27.7-r0: task do_generate_toolchain_file: Started
NOTE: recipe cmake-3.27.7-r0: task do_populate_lic: Started
NOTE: recipe glibc-2.38+git-r0: task do_unpack: Succeeded
NOTE: Running task 843 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.38.bb:do_patch)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_gcc_stash_builddir_setscene: Succeeded
NOTE: Running setscene task 407 of 414 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 409 of 414 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: Running task 845 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-source_13.2.bb:do_unpack)
WARNING: cmake-native-3.27.5-r0 do_fetch: Checksum failure encountered with download of https://cmake.org/files/v3.27/cmake-3.27.5.tar.gz - will attempt other sources if available
NOTE: recipe cmake-3.27.7-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe gcc-source-13.2.0-13.2.0-r0: task do_unpack: Started
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glibc-2.38+git-r0: task do_patch: Started
NOTE: recipe cmake-3.27.7-r0: task do_populate_lic: Succeeded
NOTE: recipe cmake-3.27.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake_3.27.7.bb:do_populate_lic unihash changed to 5517895ee86ae87e5dae4a3e2075cb093e6b2669039c35fbf324d7cdac14b38a
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake_3.27.7.bb:do_deploy_source_date_epoch unihash changed to c5ad767b4dbe9915a841e94342c57844726b96530081aebc7911eeb501334ef2
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
WARNING: cmake-native-3.27.5-r0 do_fetch: Checksum mismatch for local file /srv/autobuilder/autobuilder.yocto.io/current_sources/cmake-3.27.5.tar.gz
Cleaning and trying again.
WARNING: cmake-native-3.27.5-r0 do_fetch: Renaming /srv/autobuilder/autobuilder.yocto.io/current_sources/cmake-3.27.5.tar.gz to /srv/autobuilder/autobuilder.yocto.io/current_sources/cmake-3.27.5.tar.gz_bad-checksum_5175e8fe1ca9b1dd09090130db7201968bcce1595971ff9e9998c2f0765004c9
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 412 of 414 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 413 of 414 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/bison/bison_3.8.2.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-native-3.11.5-r0: task do_patch: Succeeded
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bison-native-3.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bison-native-3.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 868 of 1186 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe linux-libc-headers-6.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe linux-libc-headers-6.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe glibc-2.38+git-r0: task do_patch: Succeeded
NOTE: recipe cmake-native-3.27.5-r0: task do_fetch: Failed
NOTE: recipe linux-libc-headers-6.5-r0: task do_unpack: Succeeded
NOTE: recipe gcc-source-13.2.0-13.2.0-r0: task do_unpack: Succeeded
NOTE: Tasks Summary: Attempted 873 tasks of which 800 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20231115054514.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20231115054514.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake-native_3.27.5.bb:do_fetch
Summary: There were 5 WARNING messages.
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: cmake-native-3.27.5-r0 do_fetch: Checksum failure fetching https://cmake.org/files/v3.27/cmake-3.27.5.tar.gz
ERROR: cmake-native-3.27.5-r0 do_fetch: Bitbake Fetcher Error: ChecksumError('Checksum mismatch!\nFile: \'/srv/autobuilder/autobuilder.yocto.io/current_sources/cmake-3.27.5.tar.gz\' has sha256 checksum \'5175e8fe1ca9b1dd09090130db7201968bcce1595971ff9e9998c2f0765004c9\' when \'08f71a106036bf051f692760ef9558c0577c42ac39e96ba097e7662bd4158d8e\' was expected\nIf this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:\nSRC_URI[sha256sum] = "5175e8fe1ca9b1dd09090130db7201968bcce1595971ff9e9998c2f0765004c9"\nOtherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.', 'https://cmake.org/files/v3.27/cmake-3.27.5.tar.gz')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/cmake-native/3.27.5/temp/log.do_fetch.3726049
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake-native_3.27.5.bb:do_fetch) failed with exit code '1'

--===============6934899096441321273==--

