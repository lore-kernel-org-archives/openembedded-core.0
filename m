Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56246C32789
	for <webhook@archiver.kernel.org>; Fri,  5 Aug 2022 06:03:38 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com
 (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.3937.1659679408028959778
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Aug 2022 23:03:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=awm7/RnA;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192,
 mailfrom: 010101826c99fb27-d08e3481-2788-4c4a-b048-8000c61d44cb-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1659679407;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=l5oGm7Rjy/1R9ZYld0v8S7RYCT60mQoIellwU8v79CE=;
	b=awm7/RnAvr1z890D+3Cy6S7VgkdFg6AM0z2qNmyDgu/aUZeafkY2yNf51/rJajiA
	hTE4/2DPZ/9k+CjnTyOFhhZb5Avg0/YOI0sZg5ecHnXPnQTH9JKNlbfkME0Ykzyc4WT
	o7JIPWtvA/1L6zy0UH1pbyIHw1SkVxq5TvWXoIxQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1659679407;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=l5oGm7Rjy/1R9ZYld0v8S7RYCT60mQoIellwU8v79CE=;
	b=NUjTwDIzgqfeFJeL21uK0eBH/nUZ+yvkhssAfRM2HQRyiYrk4TWZSCrdtwM7FQ3b
	Rxf5oHmbFkjzhe09fZ+A363VuvtTzATAjxoticUKotrWjYgfIlEEQuBo1sJSb/WUIuv
	b/Lk2m/KDz2kFzitKemGxE5kXzkNDPTFTENHc/oY=
Content-Type: multipart/mixed; boundary="===============6506179629186435858=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] util-linux-libuuid: upgrading to 2.38.1 FAILED
Message-ID: 
 <010101826c99fb27-d08e3481-2788-4c4a-b048-8000c61d44cb-000000@us-west-2.amazonses.com>
Date: Fri, 5 Aug 2022 06:03:27 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.08.05-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Aug 2022 06:03:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168891

--===============6506179629186435858==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *util-linux-libuuid* to *2.38.1* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-util-linux-libuuid-upgrade-2.38-2.38.1.patch
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
--===============6506179629186435858==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-util-linux-libuuid-upgrade-2.38-2.38.1.patch"

RnJvbSBmNTA5YzBjMDA0NDBlOGQyNDllOTBiNTAyNWUxZTg0NzAyNjU0ZWQ0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgNCBBdWcgMjAyMiAyMTowMzowOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHV0
aWwtbGludXgtbGlidXVpZDogdXBncmFkZSAyLjM4IC0+IDIuMzguMQoKLS0tCiAuLi57dXRpbC1s
aW51eC1saWJ1dWlkXzIuMzguYmIgPT4gdXRpbC1saW51eC1saWJ1dWlkXzIuMzguMS5iYn0gfCAw
CiBtZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0aWwtbGludXguaW5jICAgICAgICAgICAg
ICAgICAgICAgfCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0
aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC97dXRpbC1saW51eC1s
aWJ1dWlkXzIuMzguYmIgPT4gdXRpbC1saW51eC1saWJ1dWlkXzIuMzguMS5iYn0gKDEwMCUpCgpk
aWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4LWxpYnV1
aWRfMi4zOC5iYiBiL21ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51eC1saWJ1
dWlkXzIuMzguMS5iYgpzaW1pbGFyaXR5IGluZGV4IDEwMCUKcmVuYW1lIGZyb20gbWV0YS9yZWNp
cGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4LWxpYnV1aWRfMi4zOC5iYgpyZW5hbWUgdG8g
bWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4LWxpYnV1aWRfMi4zOC4xLmJi
CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0aWwtbGludXguaW5j
IGIvbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4LmluYwppbmRleCBjOWJk
ZGZiN2E2Li5mMTUxMWYwMmE4IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS91dGlsLWxp
bnV4L3V0aWwtbGludXguaW5jCisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRp
bC1saW51eC5pbmMKQEAgLTM3LDQgKzM3LDQgQEAgU1JDX1VSSSA9ICIke0tFUk5FTE9SR19NSVJS
T1J9L2xpbnV4L3V0aWxzL3V0aWwtbGludXgvdiR7TUFKT1JfVkVSU0lPTn0vdXRpbC1saW4KICAg
ICAgICAgICAgZmlsZTovL2F2b2lkX3BhcmFsbGVsX3Rlc3RzLnBhdGNoIFwKICAgICAgICAgICAg
IgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiNmQxMTFjYmU0ZDU1YjMzNmRiMmYxZmJlZmZiYzY1
Yjg5OTA4NzA0YzAxMTM2MzcxZDMyYWE5YmVjMzczZWI2NCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9
ICI2MDQ5MmExOWI0NGU2Y2Y5YTNkZGZmNjgzMjViMzMzYjhiNTJiNmM1OWNlM2ViZDZhMGVjYWE0
YzUxMTdlODRmIgotLSAKMi4zMS4xCgo=

--===============6506179629186435858==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1659 entries from dependency cache.
Parsing recipes...done.
Parsing of 888 .bb files complete (886 cached, 2 parsed). 1659 targets, 36 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-32 sysroot...done.
Removing 1 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-99f924ca802632cf5ed3686680733ea5e73beda4"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:99f924ca802632cf5ed3686680733ea5e73beda4"
workspace            = "master:6c3a88e8dcf0b7a40080c4cd9d447d0d50b12f4c"

Initialising tasks...done.
Sstate summary: Wanted 36 Local 8 Mirrors 0 Missed 28 Current 121 (22% match, 82% complete)
Removing 11 stale sstate objects for arch x86_64...done.
Removing 4 stale sstate objects for arch qemux86...done.
Removing 2 stale sstate objects for arch core2-32...done.
NOTE: Executing Tasks
NOTE: Running setscene task 132 of 157 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 137 of 157 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc-initial_12.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 138 of 157 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 164 of 655 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.16.bb:do_fetch)
NOTE: Running task 260 of 655 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_fetch)
NOTE: Running task 361 of 655 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.bb:do_fetch)
NOTE: Running noexec task 489 of 655 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.1.bb:do_fetch)
NOTE: Running task 504 of 655 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_fetch)
NOTE: Running noexec task 507 of 655 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.1.bb:do_fetch)
NOTE: recipe libgcc-initial-12.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.16-r0: task do_fetch: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_fetch: Started
NOTE: recipe libgcc-12.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-runtime-12.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-libuuid-native-2.38.1-r0: task do_fetch: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_fetch: Succeeded
NOTE: Running task 519 of 655 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_unpack)
NOTE: recipe util-linux-libuuid-native-2.38.1-r0: task do_fetch: Succeeded
NOTE: recipe util-linux-native-2.38-r0: task do_fetch: Started
NOTE: Running task 520 of 655 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_unpack)
NOTE: Running task 521 of 655 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgcc-12.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-runtime-12.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
WARNING: util-linux-native-2.38-r0 do_fetch: Checksum mismatch for local file /home/pokybuild/yocto-worker/auh/build/build/build/downloads/util-linux-2.38.tar.xz
Cleaning and trying again.
WARNING: util-linux-native-2.38-r0 do_fetch: Renaming /home/pokybuild/yocto-worker/auh/build/build/build/downloads/util-linux-2.38.tar.xz to /home/pokybuild/yocto-worker/auh/build/build/build/downloads/util-linux-2.38.tar.xz_bad-checksum_6d111cbe4d55b336db2f1fbeffbc65b89908704c01136371d32aa9bec373eb64
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_unpack: Started
NOTE: recipe libgcc-initial-12.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 155 of 157 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.1.bb:do_gcc_stash_builddir_setscene)
NOTE: recipe linux-libc-headers-5.16-r0: task do_fetch: Succeeded
NOTE: Running task 526 of 655 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.16.bb:do_unpack)
NOTE: Running task 527 of 655 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.16.bb:do_prepare_recipe_sysroot)
NOTE: recipe util-linux-libuuid-native-2.38.1-r0: task do_unpack: Started
NOTE: recipe util-linux-libuuid-native-2.38.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gcc-cross-i686-12.1.0-r0: task do_gcc_stash_builddir_setscene: Started
NOTE: recipe linux-libc-headers-5.16-r0: task do_unpack: Started
NOTE: recipe linux-libc-headers-5.16-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe linux-libc-headers-5.16-r0: task do_prepare_recipe_sysroot: Succeeded
WARNING: util-linux-native-2.38-r0 do_fetch: Checksum mismatch for local file /home/pokybuild/yocto-worker/auh/build/build/build/downloads/util-linux-2.38.tar.xz
Cleaning and trying again.
WARNING: util-linux-native-2.38-r0 do_fetch: Renaming /home/pokybuild/yocto-worker/auh/build/build/build/downloads/util-linux-2.38.tar.xz to /home/pokybuild/yocto-worker/auh/build/build/build/downloads/util-linux-2.38.tar.xz_bad-checksum_6d111cbe4d55b336db2f1fbeffbc65b89908704c01136371d32aa9bec373eb64
NOTE: recipe util-linux-libuuid-native-2.38.1-r0: task do_prepare_recipe_sysroot: Succeeded
WARNING: util-linux-native-2.38-r0 do_fetch: Checksum failure encountered with download of https://cdn.kernel.org/pub/linux/utils/util-linux/v2.38/util-linux-2.38.tar.xz - will attempt other sources if available
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_unpack: Succeeded
NOTE: Running task 528 of 655 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_patch)
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_patch: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_patch: Succeeded
NOTE: Running task 529 of 655 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 530 of 655 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_populate_lic)
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_lic: Started
NOTE: recipe util-linux-libuuid-native-2.38.1-r0: task do_unpack: Succeeded
NOTE: Running task 531 of 655 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_patch)
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_lic: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe util-linux-libuuid-native-2.38.1-r0: task do_patch: Started
NOTE: recipe util-linux-libuuid-native-2.38.1-r0: task do_patch: Succeeded
NOTE: Running task 532 of 655 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_deploy_source_date_epoch)
WARNING: util-linux-native-2.38-r0 do_fetch: Checksum mismatch for local file /home/pokybuild/yocto-worker/auh/build/build/build/downloads/util-linux-2.38.tar.xz
Cleaning and trying again.
WARNING: util-linux-native-2.38-r0 do_fetch: Renaming /home/pokybuild/yocto-worker/auh/build/build/build/downloads/util-linux-2.38.tar.xz to /home/pokybuild/yocto-worker/auh/build/build/build/downloads/util-linux-2.38.tar.xz_bad-checksum_6d111cbe4d55b336db2f1fbeffbc65b89908704c01136371d32aa9bec373eb64
NOTE: recipe util-linux-native-2.38-r0: task do_fetch: Failed
NOTE: recipe gcc-cross-i686-12.1.0-r0: task do_gcc_stash_builddir_setscene: Succeeded
NOTE: recipe util-linux-libuuid-native-2.38.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe util-linux-libuuid-native-2.38.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe linux-libc-headers-5.16-r0: task do_unpack: Succeeded
NOTE: Tasks Summary: Attempted 532 tasks of which 516 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.bb:do_fetch
Summary: There were 8 WARNING messages.
Summary: There were 2 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: util-linux-native-2.38-r0 do_fetch: Checksum failure fetching https://cdn.kernel.org/pub/linux/utils/util-linux/v2.38/util-linux-2.38.tar.xz
ERROR: util-linux-native-2.38-r0 do_fetch: Bitbake Fetcher Error: ChecksumError('Checksum mismatch!\nFile: \'/home/pokybuild/yocto-worker/auh/build/build/build/downloads/util-linux-2.38.tar.xz\' has sha256 checksum \'6d111cbe4d55b336db2f1fbeffbc65b89908704c01136371d32aa9bec373eb64\' when \'60492a19b44e6cf9a3ddff68325b333b8b52b6c59ce3ebd6a0ecaa4c5117e84f\' was expected\nIf this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:\nSRC_URI[sha256sum] = "6d111cbe4d55b336db2f1fbeffbc65b89908704c01136371d32aa9bec373eb64"\nOtherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.', 'https://cdn.kernel.org/pub/linux/utils/util-linux/v2.38/util-linux-2.38.tar.xz')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/util-linux-native/2.38-r0/temp/log.do_fetch.3412645
ERROR: Task (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.bb:do_fetch) failed with exit code '1'

--===============6506179629186435858==--

