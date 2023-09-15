Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC63AEED63D
	for <webhook@archiver.kernel.org>; Fri, 15 Sep 2023 18:59:59 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.29670.1694804393397846280
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Sep 2023 11:59:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=G50vDY72;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=qA2LYgSk;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018a9a36b8a9-10b3ee29-447f-4848-8a45-f906b2a93965-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1694804392;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=99WBTiGMuTorW35DvPHnvY4J6evZoregvhPoKqbuxbw=;
	b=G50vDY72BIrKpKPkyfsfGaQhvS9l6qooO3J3U32JaCe8vUMeInvP/rXPamDRSSzJ
	YauzfuJ0156ROfPYN7LlfzDpuBnYTUomUOjlyCzzFyycICjYAeO70iyN59Kt0Mk6pu/
	vBGH8ixAnVYs4SvG8q0DkeaHAYFTj3DEgcMu2Ulo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1694804392;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=99WBTiGMuTorW35DvPHnvY4J6evZoregvhPoKqbuxbw=;
	b=qA2LYgSkEkpLZaGPzA8teRa7uBu2nSQ1U08dei04jIrA4Frc38KssacjE3cy4UNw
	fy2BPlADTSISSGEhjlN/pXpO9Scau+2xK+LnHFzvlXG4BxwbQJkw0Sfo8hWS6kan7IZ
	gSzPP3/N+SDA0iZYyNACs5foYaNIHIOF0/s1fklk=
Content-Type: multipart/mixed; boundary="===============8599015177891899463=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] util-linux-libuuid: upgrading to 2.39.2 FAILED
Message-ID: <0101018a9a36b8a9-10b3ee29-447f-4848-8a45-f906b2a93965-000000@us-west-2.amazonses.com>
Date: Fri, 15 Sep 2023 18:59:52 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.09.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Sep 2023 18:59:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187692

--===============8599015177891899463==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *util-linux-libuuid* to *2.39.2* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-util-linux-libuuid-upgrade-2.39.1-2.39.2.patch
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
From ccc47819549433b59b90974164fccb3ea365eb83 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Sep 2023 07:53:09 +0000
Subject: [PATCH] util-linux-libuuid: upgrade 2.39.1 -> 2.39.2

---
 ...til-linux-libuuid_2.39.1.bb => util-linux-libuuid_2.39.2.bb} | 0
 meta/recipes-core/util-linux/util-linux.inc                     | 2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/util-linux/{util-linux-libuuid_2.39.1.bb => util-linux-libuuid_2.39.2.bb} (100%)

diff --git a/meta/recipes-core/util-linux/util-linux-libuuid_2.39.1.bb b/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb
similarity index 100%
rename from meta/recipes-core/util-linux/util-linux-libuuid_2.39.1.bb
rename to meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb
diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 99ce2a24b0..4aa173574c 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -37,4 +37,4 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-lin
            file://avoid_parallel_tests.patch \
            "
 
-SRC_URI[sha256sum] = "890ae8ff810247bd19e274df76e8371d202cda01ad277681b0ea88eeaa00286b"
+SRC_URI[sha256sum] = "87abdfaa8e490f8be6dde976f7c80b9b5ff9f301e1b67e3899e1f05a59a1531f"
-- 
2.39.2


--===============8599015177891899463==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-util-linux-libuuid-upgrade-2.39.1-2.39.2.patch"

RnJvbSBjY2M0NzgxOTU0OTQzM2I1OWI5MDk3NDE2NGZjY2IzZWEzNjVlYjgzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgU2VwIDIwMjMgMDc6NTM6MDkgKzAwMDAKU3ViamVjdDogW1BBVENIXSB1
dGlsLWxpbnV4LWxpYnV1aWQ6IHVwZ3JhZGUgMi4zOS4xIC0+IDIuMzkuMgoKLS0tCiAuLi50aWwt
bGludXgtbGlidXVpZF8yLjM5LjEuYmIgPT4gdXRpbC1saW51eC1saWJ1dWlkXzIuMzkuMi5iYn0g
fCAwCiBtZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0aWwtbGludXguaW5jICAgICAgICAg
ICAgICAgICAgICAgfCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRl
bGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC97dXRpbC1saW51
eC1saWJ1dWlkXzIuMzkuMS5iYiA9PiB1dGlsLWxpbnV4LWxpYnV1aWRfMi4zOS4yLmJifSAoMTAw
JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0aWwtbGludXgt
bGlidXVpZF8yLjM5LjEuYmIgYi9tZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0aWwtbGlu
dXgtbGlidXVpZF8yLjM5LjIuYmIKc2ltaWxhcml0eSBpbmRleCAxMDAlCnJlbmFtZSBmcm9tIG1l
dGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51eC1saWJ1dWlkXzIuMzkuMS5iYgpy
ZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4LWxpYnV1aWRf
Mi4zOS4yLmJiCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0aWwt
bGludXguaW5jIGIvbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4LmluYwpp
bmRleCA5OWNlMmEyNGIwLi40YWExNzM1NzRjIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29y
ZS91dGlsLWxpbnV4L3V0aWwtbGludXguaW5jCisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL3V0aWwt
bGludXgvdXRpbC1saW51eC5pbmMKQEAgLTM3LDQgKzM3LDQgQEAgU1JDX1VSSSA9ICIke0tFUk5F
TE9SR19NSVJST1J9L2xpbnV4L3V0aWxzL3V0aWwtbGludXgvdiR7TUFKT1JfVkVSU0lPTn0vdXRp
bC1saW4KICAgICAgICAgICAgZmlsZTovL2F2b2lkX3BhcmFsbGVsX3Rlc3RzLnBhdGNoIFwKICAg
ICAgICAgICAgIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiODkwYWU4ZmY4MTAyNDdiZDE5ZTI3
NGRmNzZlODM3MWQyMDJjZGEwMWFkMjc3NjgxYjBlYTg4ZWVhYTAwMjg2YiIKK1NSQ19VUklbc2hh
MjU2c3VtXSA9ICI4N2FiZGZhYThlNDkwZjhiZTZkZGU5NzZmN2M4MGI5YjVmZjlmMzAxZTFiNjdl
Mzg5OWUxZjA1YTU5YTE1MzFmIgotLSAKMi4zOS4yCgo=

--===============8599015177891899463==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

Loading cache...done.
Loaded 1806 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (897 cached, 2 parsed). 1806 targets, 37 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-32 sysroot...done.
Removing 1 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2+snapshot-541869550f6b7ad6669d72d5718287c12f2801c3"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:541869550f6b7ad6669d72d5718287c12f2801c3"
workspace            = "master:de863bc1fa44b5ed7ad2b00abfcdd45db1f51fe2"

Initialising tasks...done.
Sstate summary: Wanted 51 Local 12 Mirrors 0 Missed 39 Current 231 (23% match, 86% complete)
Removing 4 stale sstate objects for arch qemux86...done.
Removing 13 stale sstate objects for arch x86_64...done.
Removing 4 stale sstate objects for arch core2-32...done.
NOTE: Executing Tasks
NOTE: Running setscene task 247 of 282 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 250 of 282 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc-initial_13.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 255 of 282 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.38.bb:do_stash_locale_setscene)
NOTE: Running setscene task 256 of 282 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 261 of 282 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 307 of 856 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_recipe_qa)
NOTE: Running task 481 of 856 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.39.1.bb:do_recipe_qa)
NOTE: Running noexec task 635 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_fetch)
NOTE: Running noexec task 665 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_fetch)
NOTE: Running task 666 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_recipe_qa)
NOTE: Running task 669 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_fetch)
NOTE: recipe libgcc-initial-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe linux-libc-headers-6.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glibc-2.38+git-r0: task do_stash_locale_setscene: Started
NOTE: recipe util-linux-libuuid-native-2.39.2-r0: task do_recipe_qa: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_fetch: Started
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_recipe_qa: Started
NOTE: recipe linux-libc-headers-6.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 685 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.4.bb:do_fetch)
NOTE: recipe util-linux-native-2.39.1-r0: task do_recipe_qa: Started
NOTE: recipe libgcc-13.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_fetch: Succeeded
NOTE: recipe libgcc-initial-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 686 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_unpack)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-libuuid-native-2.39.2-r0: task do_recipe_qa: Succeeded
NOTE: Running task 687 of 856 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_fetch)
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe linux-libc-headers-6.4-r0: task do_fetch: Started
NOTE: Running task 688 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_fetch)
NOTE: recipe libtool-cross-2.4.7-r0: task do_unpack: Started
NOTE: recipe util-linux-native-2.39.1-r0: task do_recipe_qa: Succeeded
NOTE: Task virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.39.1.bb:do_recipe_qa unihash changed to 32aa15bf241d41299fef9d4b7ec642a943c7d7b5ce7889a1d5a8369514761910
NOTE: recipe linux-libc-headers-6.4-r0: task do_fetch: Succeeded
NOTE: Running task 689 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.4.bb:do_unpack)
NOTE: Running task 690 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 691 of 856 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.39.1.bb:do_fetch)
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_fetch: Started
NOTE: recipe glibc-2.38+git-r0: task do_stash_locale_setscene: Succeeded
NOTE: Running setscene task 278 of 282 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc-initial_13.2.bb:do_populate_sysroot_setscene)
NOTE: Running task 692 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.38.bb:do_fetch)
NOTE: recipe util-linux-libuuid-native-2.39.2-r0: task do_fetch: Started
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_fetch: Succeeded
NOTE: recipe linux-libc-headers-6.4-r0: task do_unpack: Started
NOTE: recipe linux-libc-headers-6.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 693 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_unpack)
NOTE: recipe util-linux-libuuid-native-2.39.2-r0: task do_fetch: Succeeded
NOTE: Running task 694 of 856 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_unpack)
NOTE: Running task 695 of 856 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtool-cross-2.4.7-r0: task do_unpack: Succeeded
NOTE: recipe util-linux-native-2.39.1-r0: task do_fetch: Started
NOTE: recipe libgcc-initial-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.4-r0: task do_prepare_recipe_sysroot: Succeeded
WARNING: util-linux-native-2.39.1-r0 do_fetch: Checksum mismatch for local file /home/pokybuild/yocto-worker/auh/build/build/build/downloads/util-linux-2.39.1.tar.xz
Cleaning and trying again.
WARNING: util-linux-native-2.39.1-r0 do_fetch: Renaming /home/pokybuild/yocto-worker/auh/build/build/build/downloads/util-linux-2.39.1.tar.xz to /home/pokybuild/yocto-worker/auh/build/build/build/downloads/util-linux-2.39.1.tar.xz_bad-checksum_890ae8ff810247bd19e274df76e8371d202cda01ad277681b0ea88eeaa00286b
NOTE: recipe glibc-2.38+git-r0: task do_fetch: Started
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_unpack: Started
NOTE: recipe util-linux-libuuid-native-2.39.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe util-linux-libuuid-native-2.39.2-r0: task do_unpack: Started
NOTE: recipe libgcc-initial-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 279 of 282 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_gcc_stash_builddir_setscene)
NOTE: Running setscene task 281 of 282 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc-initial_13.2.bb:do_recipe_qa_setscene)
WARNING: util-linux-native-2.39.1-r0 do_fetch: Checksum failure encountered with download of https://cdn.kernel.org/pub/linux/utils/util-linux/v2.39/util-linux-2.39.1.tar.xz - will attempt other sources if available
NOTE: recipe util-linux-libuuid-native-2.39.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_gcc_stash_builddir_setscene: Started
NOTE: recipe libgcc-initial-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-initial-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glibc-2.38+git-r0: task do_fetch: Succeeded
NOTE: Running task 700 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.38.bb:do_unpack)
NOTE: recipe glibc-2.38+git-r0: task do_unpack: Started
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_unpack: Succeeded
NOTE: Running task 701 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_patch)
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_patch: Started
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_patch: Succeeded
NOTE: Running task 702 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 703 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_populate_lic)
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_gcc_stash_builddir_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 705 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-source_13.2.bb:do_unpack)
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_populate_lic: Started
NOTE: recipe gcc-source-13.2.0-13.2.0-r0: task do_unpack: Started
NOTE: recipe util-linux-libuuid-native-2.39.2-r0: task do_unpack: Succeeded
NOTE: Running task 707 of 856 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_patch)
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_populate_lic: Succeeded
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe util-linux-libuuid-native-2.39.2-r0: task do_patch: Started
NOTE: recipe util-linux-libuuid-native-2.39.2-r0: task do_patch: Succeeded
NOTE: Running task 708 of 856 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_deploy_source_date_epoch)
NOTE: recipe util-linux-libuuid-native-2.39.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe util-linux-libuuid-native-2.39.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 709 of 856 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_configure)
NOTE: recipe util-linux-libuuid-native-2.39.2-r0: task do_configure: Started
NOTE: recipe glibc-2.38+git-r0: task do_unpack: Succeeded
NOTE: Running task 710 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.38.bb:do_patch)
NOTE: recipe glibc-2.38+git-r0: task do_patch: Started
NOTE: recipe glibc-2.38+git-r0: task do_patch: Succeeded
WARNING: util-linux-native-2.39.1-r0 do_fetch: Checksum mismatch for local file /home/pokybuild/yocto-worker/auh/build/build/build/downloads/util-linux-2.39.1.tar.xz
Cleaning and trying again.
WARNING: util-linux-native-2.39.1-r0 do_fetch: Renaming /home/pokybuild/yocto-worker/auh/build/build/build/downloads/util-linux-2.39.1.tar.xz to /home/pokybuild/yocto-worker/auh/build/build/build/downloads/util-linux-2.39.1.tar.xz_bad-checksum_890ae8ff810247bd19e274df76e8371d202cda01ad277681b0ea88eeaa00286b
NOTE: recipe util-linux-native-2.39.1-r0: task do_fetch: Failed
NOTE: recipe linux-libc-headers-6.4-r0: task do_unpack: Succeeded
NOTE: recipe gcc-source-13.2.0-13.2.0-r0: task do_unpack: Succeeded
NOTE: recipe util-linux-libuuid-native-2.39.2-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 711 tasks of which 685 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.39.1.bb:do_fetch
Summary: There were 5 WARNING messages.
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: util-linux-native-2.39.1-r0 do_fetch: Checksum failure fetching https://cdn.kernel.org/pub/linux/utils/util-linux/v2.39/util-linux-2.39.1.tar.xz
ERROR: util-linux-native-2.39.1-r0 do_fetch: Bitbake Fetcher Error: ChecksumError('Checksum mismatch!\nFile: \'/home/pokybuild/yocto-worker/auh/build/build/build/downloads/util-linux-2.39.1.tar.xz\' has sha256 checksum \'890ae8ff810247bd19e274df76e8371d202cda01ad277681b0ea88eeaa00286b\' when \'87abdfaa8e490f8be6dde976f7c80b9b5ff9f301e1b67e3899e1f05a59a1531f\' was expected\nIf this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:\nSRC_URI[sha256sum] = "890ae8ff810247bd19e274df76e8371d202cda01ad277681b0ea88eeaa00286b"\nOtherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.', 'https://cdn.kernel.org/pub/linux/utils/util-linux/v2.39/util-linux-2.39.1.tar.xz')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/util-linux-native/2.39.1/temp/log.do_fetch.2922157
ERROR: Task (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.39.1.bb:do_fetch) failed with exit code '1'

--===============8599015177891899463==--

