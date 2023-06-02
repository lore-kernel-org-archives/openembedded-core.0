Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C6C6ECAA3C
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 08:10:46 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.7525.1685693431666895453
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jun 2023 01:10:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=fDzDfPBP;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101887b287c60-c8d7f05f-7ddc-4708-80d4-31b8b18f2a19-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1685693431;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=kINJrWFzTMQInZSZNC5FCR6/Rmx9yhjyl6yJFv+4uYE=;
	b=fDzDfPBPTL6A+q3jw4XIkKwqeZHVfHGEmNOmQsqBkWzk2jecGVuEME3p+EvpRB/O
	PRsy4ZeJ2g9JkiRoDGAVEp1U1vqpraA4ahwt1C16zxOW2FCwKH+M8KdgeE7ynxAW/hy
	f91jdH8igKeauI19K0WgS3Gf9jU3EgUuVOuBLWsU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1685693431;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=kINJrWFzTMQInZSZNC5FCR6/Rmx9yhjyl6yJFv+4uYE=;
	b=nqNGc4JZdEpI3RMZZQnpLuqEoqXnnk1i1bheVi0dK4nmXAne4kj5sEkuHDXielMd
	h/N+9Nh+IdCzQ51lpR5TurCGfrLMfQyJLodgjbKuTC3jwJMGLUPaf+8oScVt6jQVPSO
	Mz0xNciWxvK4RwlxiG9uPXNTCEFEfFrGagG8MpH8=
Content-Type: multipart/mixed; boundary="===============1727996037217571873=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] util-linux-libuuid: upgrading to 2.39 FAILED
Message-ID: <010101887b287c60-c8d7f05f-7ddc-4708-80d4-31b8b18f2a19-000000@us-west-2.amazonses.com>
Date: Fri, 2 Jun 2023 08:10:30 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.06.02-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 08:10:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182163

--===============1727996037217571873==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *util-linux-libuuid* to *2.39* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-util-linux-libuuid-upgrade-2.38.1-2.39.patch
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
--===============1727996037217571873==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1800 entries from dependency cache.
Parsing recipes...done.
Parsing of 897 .bb files complete (895 cached, 2 parsed). 1800 targets, 37 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:054b4b9ca8e51157c3c7f02f1db32539fe8c0110"
workspace            = "master:09505f876856471aa46774237bd3f0888615b89f"

Initialising tasks...done.
Sstate summary: Wanted 40 Local 11 Mirrors 0 Missed 29 Current 130 (27% match, 82% complete)
Removing 12 stale sstate objects for arch x86_64...done.
Removing 4 stale sstate objects for arch qemux86...done.
Removing 1 stale sstate objects for arch core2-32...done.
NOTE: Executing Tasks
NOTE: Running setscene task 141 of 170 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 146 of 170 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.37.bb:do_stash_locale_setscene)
NOTE: Running setscene task 147 of 170 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 151 of 170 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 270 of 711 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.bb:do_fetch)
NOTE: Running task 414 of 711 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_fetch)
NOTE: Running noexec task 528 of 711 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.1.bb:do_fetch)
NOTE: Running task 549 of 711 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.bb:do_fetch)
NOTE: Running noexec task 552 of 711 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.1.bb:do_fetch)
NOTE: recipe linux-libc-headers-6.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-libuuid-2.39-r0: task do_fetch: Started
NOTE: recipe libgcc-13.1.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-runtime-13.1.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-libuuid-native-2.39-r0: task do_fetch: Started
NOTE: recipe glibc-2.37-r1: task do_stash_locale_setscene: Started
NOTE: recipe util-linux-libuuid-2.39-r0: task do_fetch: Succeeded
NOTE: Running task 564 of 711 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.bb:do_unpack)
NOTE: recipe util-linux-libuuid-native-2.39-r0: task do_fetch: Succeeded
NOTE: recipe util-linux-native-2.38.1-r0: task do_fetch: Started
NOTE: Running task 565 of 711 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.bb:do_unpack)
NOTE: Running task 566 of 711 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.bb:do_prepare_recipe_sysroot)
NOTE: recipe linux-libc-headers-6.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
WARNING: util-linux-native-2.38.1-r0 do_fetch: Checksum mismatch for local file /home/pokybuild/yocto-worker/auh/build/build/build/downloads/util-linux-2.38.1.tar.xz
Cleaning and trying again.
WARNING: util-linux-native-2.38.1-r0 do_fetch: Renaming /home/pokybuild/yocto-worker/auh/build/build/build/downloads/util-linux-2.38.1.tar.xz to /home/pokybuild/yocto-worker/auh/build/build/build/downloads/util-linux-2.38.1.tar.xz_bad-checksum_60492a19b44e6cf9a3ddff68325b333b8b52b6c59ce3ebd6a0ecaa4c5117e84f
NOTE: Running task 567 of 711 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_fetch)
NOTE: recipe libgcc-13.1.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-runtime-13.1.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39-r0: task do_unpack: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_fetch: Started
NOTE: recipe util-linux-libuuid-native-2.39-r0: task do_unpack: Started
NOTE: recipe util-linux-libuuid-native-2.39-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_fetch: Succeeded
NOTE: Running task 568 of 711 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_unpack)
NOTE: Running task 569 of 711 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_prepare_recipe_sysroot)
WARNING: util-linux-native-2.38.1-r0 do_fetch: Checksum failure encountered with download of https://cdn.kernel.org/pub/linux/utils/util-linux/v2.38/util-linux-2.38.1.tar.xz - will attempt other sources if available
NOTE: recipe glibc-2.37-r1: task do_stash_locale_setscene: Succeeded
NOTE: Running setscene task 167 of 170 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc-initial_13.1.bb:do_populate_sysroot_setscene)
NOTE: Running task 570 of 711 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.37.bb:do_fetch)
NOTE: recipe linux-libc-headers-6.1-r0: task do_unpack: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe util-linux-libuuid-native-2.39-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe linux-libc-headers-6.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libgcc-initial-13.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glibc-2.37-r1: task do_fetch: Started
NOTE: recipe libgcc-initial-13.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 168 of 170 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.1.bb:do_gcc_stash_builddir_setscene)
NOTE: recipe gcc-cross-i686-13.1.1-r0: task do_gcc_stash_builddir_setscene: Started
NOTE: recipe util-linux-libuuid-2.39-r0: task do_unpack: Succeeded
NOTE: Running task 572 of 711 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.bb:do_patch)
NOTE: recipe glibc-2.37-r1: task do_fetch: Succeeded
NOTE: Running task 573 of 711 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.37.bb:do_unpack)
NOTE: recipe util-linux-libuuid-2.39-r0: task do_patch: Started
NOTE: recipe glibc-2.37-r1: task do_unpack: Started
NOTE: recipe util-linux-libuuid-2.39-r0: task do_patch: Succeeded
NOTE: Running task 574 of 711 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.bb:do_deploy_source_date_epoch)
NOTE: Running task 575 of 711 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.bb:do_populate_lic)
NOTE: recipe util-linux-libuuid-2.39-r0: task do_populate_lic: Started
NOTE: recipe util-linux-libuuid-2.39-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe util-linux-libuuid-native-2.39-r0: task do_unpack: Succeeded
NOTE: recipe util-linux-libuuid-2.39-r0: task do_populate_lic: Succeeded
NOTE: Running task 576 of 711 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.bb:do_patch)
NOTE: recipe util-linux-libuuid-2.39-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe util-linux-libuuid-native-2.39-r0: task do_patch: Started
NOTE: recipe util-linux-libuuid-native-2.39-r0: task do_patch: Succeeded
NOTE: Running task 577 of 711 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.bb:do_deploy_source_date_epoch)
WARNING: util-linux-native-2.38.1-r0 do_fetch: Checksum mismatch for local file /home/pokybuild/yocto-worker/auh/build/build/build/downloads/util-linux-2.38.1.tar.xz
Cleaning and trying again.
WARNING: util-linux-native-2.38.1-r0 do_fetch: Renaming /home/pokybuild/yocto-worker/auh/build/build/build/downloads/util-linux-2.38.1.tar.xz to /home/pokybuild/yocto-worker/auh/build/build/build/downloads/util-linux-2.38.1.tar.xz_bad-checksum_60492a19b44e6cf9a3ddff68325b333b8b52b6c59ce3ebd6a0ecaa4c5117e84f
NOTE: recipe util-linux-native-2.38.1-r0: task do_fetch: Failed
NOTE: recipe util-linux-libuuid-native-2.39-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe util-linux-libuuid-native-2.39-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gcc-cross-i686-13.1.1-r0: task do_gcc_stash_builddir_setscene: Succeeded
NOTE: recipe glibc-2.37-r1: task do_unpack: Succeeded
NOTE: recipe linux-libc-headers-6.1-r0: task do_unpack: Succeeded
NOTE: Tasks Summary: Attempted 577 tasks of which 559 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_fetch
Summary: There were 6 WARNING messages.
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: util-linux-native-2.38.1-r0 do_fetch: Checksum failure fetching https://cdn.kernel.org/pub/linux/utils/util-linux/v2.38/util-linux-2.38.1.tar.xz
ERROR: util-linux-native-2.38.1-r0 do_fetch: Bitbake Fetcher Error: ChecksumError('Checksum mismatch!\nFile: \'/home/pokybuild/yocto-worker/auh/build/build/build/downloads/util-linux-2.38.1.tar.xz\' has sha256 checksum \'60492a19b44e6cf9a3ddff68325b333b8b52b6c59ce3ebd6a0ecaa4c5117e84f\' when \'32b30a336cda903182ed61feb3e9b908b762a5e66fe14e43efb88d37162075cb\' was expected\nIf this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:\nSRC_URI[sha256sum] = "60492a19b44e6cf9a3ddff68325b333b8b52b6c59ce3ebd6a0ecaa4c5117e84f"\nOtherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.', 'https://cdn.kernel.org/pub/linux/utils/util-linux/v2.38/util-linux-2.38.1.tar.xz')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/util-linux-native/2.38.1-r0/temp/log.do_fetch.364817
ERROR: Task (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_fetch) failed with exit code '1'

--===============1727996037217571873==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-util-linux-libuuid-upgrade-2.38.1-2.39.patch"

RnJvbSAwOTI4ZTA5ZjgzNjMwNGRmMWI1YWEyZGUxYzVjNTM5OWRmOTdhNGVlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBKdW4gMjAyMyAwODo0NDozMyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHV0
aWwtbGludXgtbGlidXVpZDogdXBncmFkZSAyLjM4LjEgLT4gMi4zOQoKLS0tCiAuLi5kXzIuMzgu
MS5iYiA9PiB1dGlsLWxpbnV4LWxpYnV1aWRfMi4zOS5iYn0gfCAyMiArKysrKysrKwogbWV0YS9y
ZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4LmluYyAgIHwgIDggKystCiAuLi4vMDAw
MS1jaGVjay1mb3Itc3lzLXBpZGZkLmgucGF0Y2ggICAgICAgICAgfCA1MyAtLS0tLS0tLS0tLS0t
LS0tLS0tCiAuLi5jb25maWd1cmUuYWMtSW1wcm92ZS1jaGVjay1mb3ItbWFnaWMucGF0Y2ggfCA0
MCAtLS0tLS0tLS0tLS0tLQogNCBmaWxlcyBjaGFuZ2VkLCAyNSBpbnNlcnRpb25zKCspLCA5OCBk
ZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3t1dGlsLWxp
bnV4LWxpYnV1aWRfMi4zOC4xLmJiID0+IHV0aWwtbGludXgtbGlidXVpZF8yLjM5LmJifSAoNDAl
KQogZGVsZXRlIG1vZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1s
aW51eC8wMDAxLWNoZWNrLWZvci1zeXMtcGlkZmQuaC5wYXRjaAogZGVsZXRlIG1vZGUgMTAwNjQ0
IG1ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51eC8wMDAxLWNvbmZpZ3VyZS5h
Yy1JbXByb3ZlLWNoZWNrLWZvci1tYWdpYy5wYXRjaAoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBl
cy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51eC1saWJ1dWlkXzIuMzguMS5iYiBiL21ldGEvcmVj
aXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51eC1saWJ1dWlkXzIuMzkuYmIKc2ltaWxhcml0
eSBpbmRleCA0MCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGls
LWxpbnV4LWxpYnV1aWRfMi4zOC4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtY29yZS91dGls
LWxpbnV4L3V0aWwtbGludXgtbGlidXVpZF8yLjM5LmJiCmluZGV4IDVkNzU5YWVkOTQuLjcyZGI4
ZjQwMGYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51
eC1saWJ1dWlkXzIuMzguMS5iYgorKysgYi9tZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0
aWwtbGludXgtbGlidXVpZF8yLjM5LmJiCkBAIC0xLDMgKzEsMjUgQEAKKyMgRklYTUU6IHRoZSBM
SUNfRklMRVNfQ0hLU1VNIHZhbHVlcyBoYXZlIGJlZW4gdXBkYXRlZCBieSAnZGV2dG9vbCB1cGdy
YWRlJy4KKyMgVGhlIGZvbGxvd2luZyBpcyB0aGUgZGlmZmVyZW5jZSBiZXR3ZWVuIHRoZSBvbGQg
YW5kIHRoZSBuZXcgbGljZW5zZSB0ZXh0LgorIyBQbGVhc2UgdXBkYXRlIHRoZSBMSUNFTlNFIHZh
bHVlIGlmIG5lZWRlZCwgYW5kIHN1bW1hcml6ZSB0aGUgY2hhbmdlcyBpbgorIyB0aGUgY29tbWl0
IG1lc3NhZ2UgdmlhICdMaWNlbnNlLVVwZGF0ZTonIHRhZy4KKyMgKGV4YW1wbGU6ICdMaWNlbnNl
LVVwZGF0ZTogY29weXJpZ2h0IHllYXJzIHVwZGF0ZWQuJykKKyMKKyMgVGhlIGNoYW5nZXM6Cisj
CisjIC0tLSBSRUFETUUubGljZW5zaW5nCisjICsrKyBSRUFETUUubGljZW5zaW5nCisjIEBAIC05
LDYgKzksOCBAQAorIyAgICAgKiBHUEwtMi4wICAgICAgICAgICAgLSBHTlUgR2VuZXJhbCBQdWJs
aWMgTGljZW5zZSB2ZXJzaW9uIDIKKyMgIAorIyAgICAgKiBMR1BMLTIuMS1vci1sYXRlciAgLSBH
TlUgTGVzc2VyIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgMi4xIG9yIGFueSBsYXRlciB2ZXJzaW9u
CisjICsKKyMgKyAgICogQlNELTItQ2xhdXNlICAgICAgIC0gU2ltcGxpZmllZCBCU0QgTGljZW5z
ZQorIyAgCisjICAgICAqIEJTRC0zLUNsYXVzZSAgICAgICAtIEJTRCAzLUNsYXVzZSAiTmV3IiBv
ciAiUmV2aXNlZCIgTGljZW5zZQorIyAgCisjIAorIworCiAjIFRvIGFsbG93IHV0aWwtbGludXgg
dG8gb3B0aW9uYWxseSBidWlsZC1kZXBlbmQgb24gY3J5cHRzZXR1cCwgbGlidXVpZCBpcwogIyBz
cGxpdCBvdXQgb2YgdGhlIG1haW4gcmVjaXBlLCBhcyBpdCdzIG5lZWRlZCBieSBjcnlwdHNldHVw
CiAKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL3V0aWwtbGludXgvdXRpbC1saW51eC5p
bmMgYi9tZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0aWwtbGludXguaW5jCmluZGV4IDM4
NjhiMWM0MWQuLjIwNGFkMDIwYjkgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL3V0aWwt
bGludXgvdXRpbC1saW51eC5pbmMKKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91
dGlsLWxpbnV4LmluYwpAQCAtMTIsNyArMTIsNyBAQCBMSUNFTlNFOiR7UE59LWxpYmZkaXNrID0g
IkxHUEwtMi4xLW9yLWxhdGVyIgogTElDRU5TRToke1BOfS1saWJtb3VudCA9ICJMR1BMLTIuMS1v
ci1sYXRlciIKIExJQ0VOU0U6JHtQTn0tbGlic21hcnRjb2xzID0gIkxHUEwtMi4xLW9yLWxhdGVy
IgogCi1MSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9SRUFETUUubGljZW5zaW5nO21kNT0wZmQ1
YzA1MGM2MTg3ZDJiZjBhNDQ5MmI3ZjRlMzNkYSBcCitMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6
Ly9SRUFETUUubGljZW5zaW5nO21kNT0xMmFlNzc2OGE2NWVjOGYyZTQ0ZDkzMGRmOWNiNDNmYSBc
CiAgICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9DT1BZSU5HO21kNT1iMjM0ZWU0ZDY5ZjVmY2U0
NDg2YTgwZmRhZjRhNDI2MyBcCiAgICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9Eb2N1bWVudGF0
aW9uL2xpY2Vuc2VzL0NPUFlJTkcuR1BMLTIuMC1vci1sYXRlcjttZDU9YjIzNGVlNGQ2OWY1ZmNl
NDQ4NmE4MGZkYWY0YTQyNjMgXAogICAgICAgICAgICAgICAgICAgICBmaWxlOi8vRG9jdW1lbnRh
dGlvbi9saWNlbnNlcy9DT1BZSU5HLkxHUEwtMi4xLW9yLWxhdGVyO21kNT00ZmJkNjUzODBjZGQy
NTU5NTEwNzkwMDhiMzY0NTE2YyBcCkBAIC0yMyw3ICsyMyw3IEBAIExJQ19GSUxFU19DSEtTVU0g
PSAiZmlsZTovL1JFQURNRS5saWNlbnNpbmc7bWQ1PTBmZDVjMDUwYzYxODdkMmJmMGE0NDkyYjdm
NGUzM2RhCiAgICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9saWJibGtpZC9DT1BZSU5HO21kNT02
OTNiY2JiZTE2ZDNhNGE0YjM3YmM5MDZiYzAxY2MwNCBcCiAgICAgICAgICAgICAgICAgICAgIGZp
bGU6Ly9saWJmZGlzay9DT1BZSU5HO21kNT02OTNiY2JiZTE2ZDNhNGE0YjM3YmM5MDZiYzAxY2Mw
NCBcCiAgICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9saWJzbWFydGNvbHMvQ09QWUlORzttZDU9
NjkzYmNiYmUxNmQzYTRhNGIzN2JjOTA2YmMwMWNjMDQgXAotIgorICAgICAgICAgICAgICAgICAg
ICAiCiAKIEZJTEVTRVhUUkFQQVRIUzpwcmVwZW5kIDo9ICIke1RISVNESVJ9L3V0aWwtbGludXg6
IgogTUFKT1JfVkVSU0lPTiA9ICIke0AnLicuam9pbihkLmdldFZhcignUFYnKS5zcGxpdCgnLicp
WzA6Ml0pfSIKQEAgLTM1LDggKzM1LDYgQEAgU1JDX1VSSSA9ICIke0tFUk5FTE9SR19NSVJST1J9
L2xpbnV4L3V0aWxzL3V0aWwtbGludXgvdiR7TUFKT1JfVkVSU0lPTn0vdXRpbC1saW4KICAgICAg
ICAgICAgZmlsZTovL3J1bi1wdGVzdCBcCiAgICAgICAgICAgIGZpbGU6Ly9kaXNwbGF5X3Rlc3Ru
YW1lX2Zvcl9zdWJ0ZXN0LnBhdGNoIFwKICAgICAgICAgICAgZmlsZTovL2F2b2lkX3BhcmFsbGVs
X3Rlc3RzLnBhdGNoIFwKLSAgICAgICAgICAgZmlsZTovLzAwMDEtY2hlY2stZm9yLXN5cy1waWRm
ZC5oLnBhdGNoIFwKLSAgICAgICAgICAgZmlsZTovLzAwMDEtY29uZmlndXJlLmFjLUltcHJvdmUt
Y2hlY2stZm9yLW1hZ2ljLnBhdGNoIFwKICAgICAgICAgICAgIgogCi1TUkNfVVJJW3NoYTI1NnN1
bV0gPSAiNjA0OTJhMTliNDRlNmNmOWEzZGRmZjY4MzI1YjMzM2I4YjUyYjZjNTljZTNlYmQ2YTBl
Y2FhNGM1MTE3ZTg0ZiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIzMmIzMGEzMzZjZGE5MDMxODJl
ZDYxZmViM2U5YjkwOGI3NjJhNWU2NmZlMTRlNDNlZmI4OGQzNzE2MjA3NWNiIgpkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4LzAwMDEtY2hlY2stZm9y
LXN5cy1waWRmZC5oLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxp
bnV4LzAwMDEtY2hlY2stZm9yLXN5cy1waWRmZC5oLnBhdGNoCmRlbGV0ZWQgZmlsZSBtb2RlIDEw
MDY0NAppbmRleCAxOWY1N2YxNGJjLi4wMDAwMDAwMDAwCi0tLSBhL21ldGEvcmVjaXBlcy1jb3Jl
L3V0aWwtbGludXgvdXRpbC1saW51eC8wMDAxLWNoZWNrLWZvci1zeXMtcGlkZmQuaC5wYXRjaAor
KysgL2Rldi9udWxsCkBAIC0xLDUzICswLDAgQEAKLUZyb20gNTQ4YmM1NjhmM2M3MzVlNTNmYjVi
MGE1YWI2NDczYTNmMTQ1N2I5MSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKLUZyb206IEtoZW0g
UmFqIDxyYWoua2hlbUBnbWFpbC5jb20+Ci1EYXRlOiBTdW4sIDcgQXVnIDIwMjIgMTQ6Mzk6MTkg
LTA3MDAKLVN1YmplY3Q6IFtQQVRDSF0gY2hlY2sgZm9yIHN5cy9waWRmZC5oCi0KLVRoaXMgaGVh
ZGVyIGluIG5ld2VyIGdsaWJjIGRlZmluZXMgdGhlIHNpZ25hdHVyZXMgb2YgZnVuY3Rpb25zCi1w
aWRmZF9zZW5kX3NpZ25hbCgpIGFuZCBwaWRmZF9vcGVuKCkgYW5kIHdoZW4gdGhlc2UgZnVuY3Rp
b25zIGFyZQotZGVmaW5lZCBieSBsaWJjIHRoZW4gd2UgbmVlZCB0byBpbmNsdWRlIHRoZSByZWxl
dmFudCBoZWFkZXIgdG8gZ2V0Ci10aGUgZGVmaW5pdGlvbnMuIENsYW5nIDE1KyBoYXMgc3RhcnRl
ZCB0byBlcnJvciBvdXQgd2hlbiBmdW5jdGlvbgotc2lnbmF0dXJlcyBhcmUgbWlzc2luZy4KLQot
Rml4ZXMgZXJyb3JzIGxpa2UKLW1pc2MtdXRpbHMva2lsbC5jOjQwMjo2OiBlcnJvcjogY2FsbCB0
byB1bmRlY2xhcmVkIGZ1bmN0aW9uICdwaWRmZF9zZW5kX3NpZ25hbCc7IElTTyBDOTkgYW5kIGxh
dGVyIGRvIG5vdCBzdXBwb3J0IGltcGxpY2l0IGZ1bmN0aW9uIGRlY2xhcmF0aW9ucyBbLVdpbXBs
aWNpdC1mdW5jdGlvbi1kZWNsYXJhdGlvbl0KLSAgICAgICAgaWYgKHBpZGZkX3NlbmRfc2lnbmFs
KHBmZCwgY3RsLT5udW1zaWcsICZpbmZvLCAwKSA8IDApCi0KLVVwc3RyZWFtLVN0YXR1czogU3Vi
bWl0dGVkIFtodHRwczovL2dpdGh1Yi5jb20vdXRpbC1saW51eC91dGlsLWxpbnV4L3B1bGwvMTc2
OV0KLVNpZ25lZC1vZmYtYnk6IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+Ci0tLS0KLSBj
b25maWd1cmUuYWMgICAgICAgICAgfCAxICsKLSBpbmNsdWRlL3BpZGZkLXV0aWxzLmggfCA0ICsr
Ky0KLSAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQotCi1k
aWZmIC0tZ2l0IGEvY29uZmlndXJlLmFjIGIvY29uZmlndXJlLmFjCi1pbmRleCBhNTExZTkzZGUu
LmZkN2Q5MjQ1ZiAxMDA2NDQKLS0tLSBhL2NvbmZpZ3VyZS5hYwotKysrIGIvY29uZmlndXJlLmFj
Ci1AQCAtMzQyLDYgKzM0Miw3IEBAIEFDX0NIRUNLX0hFQURFUlMoWyBcCi0gCXN5cy9ta2Rldi5o
IFwKLSAJc3lzL21vdW50LmggXAotIAlzeXMvcGFyYW0uaCBcCi0rCXN5cy9waWRmZC5oIFwKLSAJ
c3lzL3ByY3RsLmggXAotIAlzeXMvcmVzb3VyY2UuaCBcCi0gCXN5cy9zZW5kZmlsZS5oIFwKLWRp
ZmYgLS1naXQgYS9pbmNsdWRlL3BpZGZkLXV0aWxzLmggYi9pbmNsdWRlL3BpZGZkLXV0aWxzLmgK
LWluZGV4IGVkZGVkZTk3Ni4uZDllMzNjYmM1IDEwMDY0NAotLS0tIGEvaW5jbHVkZS9waWRmZC11
dGlscy5oCi0rKysgYi9pbmNsdWRlL3BpZGZkLXV0aWxzLmgKLUBAIC00LDggKzQsMTAgQEAKLSAj
aWZkZWYgSEFWRV9TWVNfU1lTQ0FMTF9ICi0gIyBpbmNsdWRlIDxzeXMvc3lzY2FsbC5oPgotICMg
aWYgZGVmaW5lZChTWVNfcGlkZmRfc2VuZF9zaWduYWwpICYmIGRlZmluZWQoU1lTX3BpZGZkX29w
ZW4pCi0rIyAgaWZkZWYgSEFWRV9TWVNfUElERkRfSAotKyMgICBpbmNsdWRlIDxzeXMvcGlkZmQu
aD4KLSsjICBlbmRpZgotICMgIGluY2x1ZGUgPHN5cy90eXBlcy5oPgotLQotICMgIGlmbmRlZiBI
QVZFX1BJREZEX1NFTkRfU0lHTkFMCi0gc3RhdGljIGlubGluZSBpbnQgcGlkZmRfc2VuZF9zaWdu
YWwoaW50IHBpZGZkLCBpbnQgc2lnLCBzaWdpbmZvX3QgKmluZm8sCi0gCQkJCSAgICB1bnNpZ25l
ZCBpbnQgZmxhZ3MpCi0tLSAKLTIuMzcuMQotCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29y
ZS91dGlsLWxpbnV4L3V0aWwtbGludXgvMDAwMS1jb25maWd1cmUuYWMtSW1wcm92ZS1jaGVjay1m
b3ItbWFnaWMucGF0Y2ggYi9tZXRhL3JlY2lwZXMtY29yZS91dGlsLWxpbnV4L3V0aWwtbGludXgv
MDAwMS1jb25maWd1cmUuYWMtSW1wcm92ZS1jaGVjay1mb3ItbWFnaWMucGF0Y2gKZGVsZXRlZCBm
aWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwNjExZmU1NzguLjAwMDAwMDAwMDAKLS0tIGEvbWV0YS9y
ZWNpcGVzLWNvcmUvdXRpbC1saW51eC91dGlsLWxpbnV4LzAwMDEtY29uZmlndXJlLmFjLUltcHJv
dmUtY2hlY2stZm9yLW1hZ2ljLnBhdGNoCisrKyAvZGV2L251bGwKQEAgLTEsNDAgKzAsMCBAQAot
RnJvbSAyNjMzODFkZGQ0NmVlYTIyOTNjNzBiYzgxMTI3M2I2NmJjNTIwODdiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQotRnJvbTogTWF0ZXVzeiBNYXJjaW5pZWMgPG1hdGV1c3ptYXIyQGdtYWls
LmNvbT4KLURhdGU6IEZyaSwgMTkgQXVnIDIwMjIgMTQ6NDc6NDkgKzAyMDAKLVN1YmplY3Q6IFtQ
QVRDSF0gY29uZmlndXJlLmFjOiBJbXByb3ZlIGNoZWNrIGZvciBtYWdpYwotCi1DaGVjayB3aGV0
aGVyIG1hZ2ljLmggaGVhZGVyIGV4aXN0cyBiZWZvcmUgZGVmaW5pbmcgSEFWRV9NQUdJQy4KLQot
RGVzcGl0ZSBsaWJyYXJ5IGF2YWlsYWJpbGl0eSB0aGVyZSBzdGlsbCBjYW4gYmUgbWlzc2luZyBo
ZWFkZXIuCi1DdXJyZW50IHRlc3QgZG9lc24ndCBjb3ZlciB0aGF0IHBvc3NpYmlsaXR5IHdoaWNo
IHdpbGwgbGVhZCBjb21waWxhdGlvbgotdG8gZmFpbCBpbiBjYXNlIG9mIHNlcGFyYXRlIHN5c3Jv
b3QuCi0KLVVwc3RyZWFtLVN0YXR1czogQmFja3BvcnQKLVtodHRwczovL2dpdGh1Yi5jb20vdXRp
bC1saW51eC91dGlsLWxpbnV4L2NvbW1pdC8yNjMzODFkZGQ0NmVlYTIyOTNjNzBiYzgxMTI3M2I2
NmJjNTIwODdiXQotCi1TaWduZWQtb2ZmLWJ5OiBNYXRldXN6IE1hcmNpbmllYyA8bWF0ZXVzem1h
cjJAZ21haWwuY29tPgotU2lnbmVkLW9mZi1ieTogVG9tYXN6IER6aWVuZHppZWxza2kgPHRvbWFz
ei5kemllbmR6aWVsc2tpQGdtYWlsLmNvbT4KLS0tLQotIGNvbmZpZ3VyZS5hYyB8IDYgKysrKy0t
Ci0gMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKLQotZGlm
ZiAtLWdpdCBhL2NvbmZpZ3VyZS5hYyBiL2NvbmZpZ3VyZS5hYwotaW5kZXggZGFhOGYwZGNhLi45
NjhhMGRhZjAgMTAwNjQ0Ci0tLS0gYS9jb25maWd1cmUuYWMKLSsrKyBiL2NvbmZpZ3VyZS5hYwot
QEAgLTE1NzAsOCArMTU3MCwxMCBAQCBBQ19BUkdfV0lUSChbbGlibWFnaWNdLAotICkKLSBBU19J
RihbdGVzdCAieCR3aXRoX2xpYm1hZ2ljIiA9IHhub10sIFtoYXZlX21hZ2ljPW5vXSwgWwotICAg
QUNfQ0hFQ0tfTElCKFttYWdpY10sIFttYWdpY19vcGVuXSwgWwotLSAgICBBQ19ERUZJTkUoW0hB
VkVfTUFHSUNdLCBbMV0sIFtEZWZpbmUgdG8gMSBpZiB5b3UgaGF2ZSB0aGUgbGlibWFnaWMgcHJl
c2VudC5dKQotLSAgICBNQUdJQ19MSUJTPSItbG1hZ2ljIgotKyAgICBBQ19DSEVDS19IRUFERVIo
bWFnaWMuaCwgWwotKyAgICAgIEFDX0RFRklORShbSEFWRV9NQUdJQ10sIFsxXSwgW0RlZmluZSB0
byAxIGlmIHlvdSBoYXZlIHRoZSBsaWJtYWdpYyBwcmVzZW50Ll0pCi0rICAgICAgTUFHSUNfTElC
Uz0iLWxtYWdpYyIKLSsgICAgXSkKLSAgIF0pCi0gXSkKLSBBQ19TVUJTVChbTUFHSUNfTElCU10p
Ci0tLSAKLTIuMzcuMQotCi0tIAoyLjM5LjIKCg==

--===============1727996037217571873==--

