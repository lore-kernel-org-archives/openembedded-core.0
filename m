Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2288CA0FFF
	for <webhook@archiver.kernel.org>; Sat,  2 Sep 2023 10:29:13 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.5670.1693650552681799033
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 Sep 2023 03:29:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Ez3vx0Ot;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Hzq89KzZ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101018a5570839a-f0a1cfec-1acb-444c-8445-727f338c08ef-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1693650552;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=X37qBSX8zyTLL4U6XYJ5eZNxljH/ywKmirfQcpYBVAg=;
	b=Ez3vx0Oth/rWJ39CUKub5GUY9XatxA8aMOka7IqJ/0JhysPkKYjLz3nQfi5XDEXm
	UT6uhOI5L/6MOz21dpI6J3jzbiGAqk3PS4f6lwYqYK7eWudaHLYL5MAgb60jZGJEKBg
	DcG8YYDrHBz5DZ9Aoxx12cbCE9HjVC1eYzkjGw4I=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1693650552;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=X37qBSX8zyTLL4U6XYJ5eZNxljH/ywKmirfQcpYBVAg=;
	b=Hzq89KzZa1ph+erzbs+TF9uuMZzNLGlIeKOMRyuc5cjinDl38/BECSozO9OI09iR
	lntagu2XN4bpnKj+bj+RCSwc+MsS5F9UY2eUdjTKBTcHgj8NslwAuJrMP+8RVmvHIO4
	CI4bGd/bNwsN8DqViP3ej+ymL5mwrjdRlP0TdNv4=
Content-Type: multipart/mixed; boundary="===============0397263221083816625=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] util-linux-libuuid: upgrading to 2.39.2 FAILED
Message-ID: <0101018a5570839a-f0a1cfec-1acb-444c-8445-727f338c08ef-000000@us-west-2.amazonses.com>
Date: Sat, 2 Sep 2023 10:29:11 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.09.02-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 Sep 2023 10:29:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187042

--===============0397263221083816625==
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
From 53f0a881b11ff28b682b8698f61a7fa70a4b9bb6 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Sep 2023 10:03:51 +0000
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


--===============0397263221083816625==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-util-linux-libuuid-upgrade-2.39.1-2.39.2.patch"

RnJvbSA1M2YwYTg4MWIxMWZmMjhiNjgyYjg2OThmNjFhN2ZhNzBhNGI5YmI2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBTZXAgMjAyMyAxMDowMzo1MSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHV0
aWwtbGludXgtbGlidXVpZDogdXBncmFkZSAyLjM5LjEgLT4gMi4zOS4yCgotLS0KIC4uLnRpbC1s
aW51eC1saWJ1dWlkXzIuMzkuMS5iYiA9PiB1dGlsLWxpbnV4LWxpYnV1aWRfMi4zOS4yLmJifSB8
IDAKIG1ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51eC5pbmMgICAgICAgICAg
ICAgICAgICAgICB8IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVs
ZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3t1dGlsLWxpbnV4
LWxpYnV1aWRfMi4zOS4xLmJiID0+IHV0aWwtbGludXgtbGlidXVpZF8yLjM5LjIuYmJ9ICgxMDAl
KQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51eC1s
aWJ1dWlkXzIuMzkuMS5iYiBiL21ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51
eC1saWJ1dWlkXzIuMzkuMi5iYgpzaW1pbGFyaXR5IGluZGV4IDEwMCUKcmVuYW1lIGZyb20gbWV0
YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4LWxpYnV1aWRfMi4zOS4xLmJiCnJl
bmFtZSB0byBtZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0aWwtbGludXgtbGlidXVpZF8y
LjM5LjIuYmIKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1s
aW51eC5pbmMgYi9tZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0aWwtbGludXguaW5jCmlu
ZGV4IDk5Y2UyYTI0YjAuLjRhYTE3MzU3NGMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb3Jl
L3V0aWwtbGludXgvdXRpbC1saW51eC5pbmMKKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1s
aW51eC91dGlsLWxpbnV4LmluYwpAQCAtMzcsNCArMzcsNCBAQCBTUkNfVVJJID0gIiR7S0VSTkVM
T1JHX01JUlJPUn0vbGludXgvdXRpbHMvdXRpbC1saW51eC92JHtNQUpPUl9WRVJTSU9OfS91dGls
LWxpbgogICAgICAgICAgICBmaWxlOi8vYXZvaWRfcGFyYWxsZWxfdGVzdHMucGF0Y2ggXAogICAg
ICAgICAgICAiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI4OTBhZThmZjgxMDI0N2JkMTllMjc0
ZGY3NmU4MzcxZDIwMmNkYTAxYWQyNzc2ODFiMGVhODhlZWFhMDAyODZiIgorU1JDX1VSSVtzaGEy
NTZzdW1dID0gIjg3YWJkZmFhOGU0OTBmOGJlNmRkZTk3NmY3YzgwYjliNWZmOWYzMDFlMWI2N2Uz
ODk5ZTFmMDVhNTlhMTUzMWYiCi0tIAoyLjM5LjIKCg==

--===============0397263221083816625==
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
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2+snapshot-9a00aeb6104e46693bfba0104635db5d15b6e28a"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:9a00aeb6104e46693bfba0104635db5d15b6e28a"
workspace            = "master:bdc74e5ff3c16fed24829fd494e5860754c08778"

Initialising tasks...done.
Sstate summary: Wanted 52 Local 13 Mirrors 0 Missed 39 Current 230 (25% match, 86% complete)
Removing 13 stale sstate objects for arch x86_64...done.
Removing 4 stale sstate objects for arch core2-32...done.
Removing 4 stale sstate objects for arch qemux86...done.
NOTE: Executing Tasks
NOTE: Running setscene task 246 of 282 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 249 of 282 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc-initial_13.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 254 of 282 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.38.bb:do_stash_locale_setscene)
NOTE: Running setscene task 255 of 282 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 260 of 282 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.4.bb:do_deploy_source_date_epoch_setscene)
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
NOTE: recipe glibc-2.38-r0: task do_stash_locale_setscene: Started
NOTE: recipe util-linux-libuuid-native-2.39.2-r0: task do_recipe_qa: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_fetch: Started
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_recipe_qa: Started
NOTE: recipe linux-libc-headers-6.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 685 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.4.bb:do_fetch)
NOTE: recipe libgcc-13.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-native-2.39.1-r0: task do_recipe_qa: Started
NOTE: recipe libgcc-initial-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_fetch: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 686 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_unpack)
NOTE: recipe util-linux-libuuid-native-2.39.2-r0: task do_recipe_qa: Succeeded
NOTE: Running task 687 of 856 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_fetch)
NOTE: recipe linux-libc-headers-6.4-r0: task do_fetch: Started
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_recipe_qa: Succeeded
NOTE: Running task 688 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_fetch)
NOTE: recipe linux-libc-headers-6.4-r0: task do_fetch: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_unpack: Started
NOTE: Running task 689 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.4.bb:do_unpack)
NOTE: Running task 690 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe util-linux-native-2.39.1-r0: task do_recipe_qa: Succeeded
NOTE: Task virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.39.1.bb:do_recipe_qa unihash changed to 32aa15bf241d41299fef9d4b7ec642a943c7d7b5ce7889a1d5a8369514761910
NOTE: Running task 691 of 856 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.39.1.bb:do_fetch)
NOTE: recipe glibc-2.38-r0: task do_stash_locale_setscene: Succeeded
NOTE: Running setscene task 278 of 282 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc-initial_13.2.bb:do_populate_sysroot_setscene)
NOTE: Running task 692 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.38.bb:do_fetch)
NOTE: recipe util-linux-libuuid-native-2.39.2-r0: task do_fetch: Started
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_fetch: Started
NOTE: recipe linux-libc-headers-6.4-r0: task do_unpack: Started
NOTE: recipe linux-libc-headers-6.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe util-linux-libuuid-native-2.39.2-r0: task do_fetch: Succeeded
NOTE: Running task 693 of 856 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_unpack)
NOTE: Running task 694 of 856 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_fetch: Succeeded
NOTE: Running task 695 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_unpack)
NOTE: recipe libgcc-initial-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_unpack: Succeeded
NOTE: recipe linux-libc-headers-6.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe util-linux-native-2.39.1-r0: task do_fetch: Started
NOTE: recipe glibc-2.38-r0: task do_fetch: Started
WARNING: util-linux-native-2.39.1-r0 do_fetch: Checksum mismatch for local file /home/pokybuild/yocto-worker/auh/build/build/build/downloads/util-linux-2.39.1.tar.xz
Cleaning and trying again.
WARNING: util-linux-native-2.39.1-r0 do_fetch: Renaming /home/pokybuild/yocto-worker/auh/build/build/build/downloads/util-linux-2.39.1.tar.xz to /home/pokybuild/yocto-worker/auh/build/build/build/downloads/util-linux-2.39.1.tar.xz_bad-checksum_890ae8ff810247bd19e274df76e8371d202cda01ad277681b0ea88eeaa00286b
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_unpack: Started
NOTE: recipe util-linux-libuuid-native-2.39.2-r0: task do_unpack: Started
NOTE: recipe util-linux-libuuid-native-2.39.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgcc-initial-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 279 of 282 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_gcc_stash_builddir_setscene)
NOTE: Running setscene task 281 of 282 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc-initial_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-native-2.39.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_gcc_stash_builddir_setscene: Started
WARNING: util-linux-native-2.39.1-r0 do_fetch: Checksum failure encountered with download of https://cdn.kernel.org/pub/linux/utils/util-linux/v2.39/util-linux-2.39.1.tar.xz - will attempt other sources if available
NOTE: recipe libgcc-initial-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glibc-2.38-r0: task do_fetch: Succeeded
NOTE: Running task 698 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.38.bb:do_unpack)
NOTE: recipe libgcc-initial-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glibc-2.38-r0: task do_unpack: Started
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_unpack: Succeeded
NOTE: Running task 701 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_patch)
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_patch: Started
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_patch: Succeeded
NOTE: Running task 702 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 703 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_populate_lic)
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_populate_lic: Started
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_gcc_stash_builddir_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 705 of 856 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-source_13.2.bb:do_unpack)
NOTE: recipe gcc-source-13.2.0-13.2.0-r0: task do_unpack: Started
NOTE: recipe util-linux-libuuid-native-2.39.2-r0: task do_unpack: Succeeded
NOTE: Running task 707 of 856 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.2.bb:do_patch)
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_populate_lic: Succeeded
NOTE: recipe util-linux-libuuid-2.39.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe util-linux-libuuid-native-2.39.2-r0: task do_patch: Started
WARNING: util-linux-native-2.39.1-r0 do_fetch: Checksum mismatch for local file /home/pokybuild/yocto-worker/auh/build/build/build/downloads/util-linux-2.39.1.tar.xz
Cleaning and trying again.
WARNING: util-linux-native-2.39.1-r0 do_fetch: Renaming /home/pokybuild/yocto-worker/auh/build/build/build/downloads/util-linux-2.39.1.tar.xz to /home/pokybuild/yocto-worker/auh/build/build/build/downloads/util-linux-2.39.1.tar.xz_bad-checksum_890ae8ff810247bd19e274df76e8371d202cda01ad277681b0ea88eeaa00286b
NOTE: recipe util-linux-native-2.39.1-r0: task do_fetch: Failed
NOTE: recipe util-linux-libuuid-native-2.39.2-r0: task do_patch: Succeeded
NOTE: recipe glibc-2.38-r0: task do_unpack: Succeeded
NOTE: recipe linux-libc-headers-6.4-r0: task do_unpack: Succeeded
NOTE: recipe gcc-source-13.2.0-13.2.0-r0: task do_unpack: Succeeded
NOTE: Tasks Summary: Attempted 707 tasks of which 684 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.39.1.bb:do_fetch
Summary: There were 5 WARNING messages.
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: util-linux-native-2.39.1-r0 do_fetch: Checksum failure fetching https://cdn.kernel.org/pub/linux/utils/util-linux/v2.39/util-linux-2.39.1.tar.xz
ERROR: util-linux-native-2.39.1-r0 do_fetch: Bitbake Fetcher Error: ChecksumError('Checksum mismatch!\nFile: \'/home/pokybuild/yocto-worker/auh/build/build/build/downloads/util-linux-2.39.1.tar.xz\' has sha256 checksum \'890ae8ff810247bd19e274df76e8371d202cda01ad277681b0ea88eeaa00286b\' when \'87abdfaa8e490f8be6dde976f7c80b9b5ff9f301e1b67e3899e1f05a59a1531f\' was expected\nIf this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:\nSRC_URI[sha256sum] = "890ae8ff810247bd19e274df76e8371d202cda01ad277681b0ea88eeaa00286b"\nOtherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.', 'https://cdn.kernel.org/pub/linux/utils/util-linux/v2.39/util-linux-2.39.1.tar.xz')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/util-linux-native/2.39.1/temp/log.do_fetch.3246049
ERROR: Task (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.39.1.bb:do_fetch) failed with exit code '1'

--===============0397263221083816625==--

