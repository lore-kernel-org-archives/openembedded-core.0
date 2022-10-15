Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A5E0C3A59E
	for <webhook@archiver.kernel.org>; Sat, 15 Oct 2022 22:03:19 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.24234.1665871396040793738
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Oct 2022 15:03:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Oguiwscu;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 01010183ddac3960-e8877351-1e3c-40cd-abd8-1601c7809219-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1665871395;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=CNuOXLCI5Q8s2KJZ47mOc4+/GsU0Cq5fb9HxeNRY9O4=;
	b=OguiwscuIou+UgqW4xqMBaO3Iv+YM/zRhKAl6plJLpkqkuSYLGpsbX+Mh1rlDW3+
	v+KOvRx746jeQJUJNSxdlyPv1rnNr0aWY240O4uQjqkgfhx+wiZGCaiqLAq5BEt/CSc
	YeA+PPxbrM8wfcE0aJGTf4zSoVBw7gXDXWu/GZD8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1665871395;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=CNuOXLCI5Q8s2KJZ47mOc4+/GsU0Cq5fb9HxeNRY9O4=;
	b=JBZh89kFTpKmJqY6R9gCJkJLwVTTAFfb5XzUUdmoFNueSH0e5BNJZViOBDOCJAaV
	FOzAAQMV0sWfLY/VguBwL7n4OO8ziZQsWTCG/DyMUY5B5NUjuxgFl3Su5Xh2bl5XwQw
	xki5i8mf9XK2AdQyb/1+tlzRpFovse6rup+dE8us=
Content-Type: multipart/mixed; boundary="===============5045417752370030736=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gsettings-desktop-schemas: upgrading to 43.0 SUCCEEDED
Message-ID: <01010183ddac3960-e8877351-1e3c-40cd-abd8-1601c7809219-000000@us-west-2.amazonses.com>
Date: Sat, 15 Oct 2022 22:03:15 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.10.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Oct 2022 22:03:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171838

--===============5045417752370030736==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gsettings-desktop-schemas* to *43.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gsettings-desktop-schemas-upgrade-42.0-43.0.patch
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
--===============5045417752370030736==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gsettings-desktop-schemas-upgrade-42.0-43.0.patch"

RnJvbSA2NDY3NDMxNmFjZDE2NDBiN2M2NWQwMzkyYmVjNDYyZTdiNjZiMmY2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgT2N0IDIwMjIgMTU6MDc6MzYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
c2V0dGluZ3MtZGVza3RvcC1zY2hlbWFzOiB1cGdyYWRlIDQyLjAgLT4gNDMuMAoKLS0tCiAuLi5l
c2t0b3Atc2NoZW1hc180Mi4wLmJiID0+IGdzZXR0aW5ncy1kZXNrdG9wLXNjaGVtYXNfNDMuMC5i
Yn0gfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
IHJlbmFtZSBtZXRhL3JlY2lwZXMtZ25vbWUvZ3NldHRpbmdzLWRlc2t0b3Atc2NoZW1hcy97Z3Nl
dHRpbmdzLWRlc2t0b3Atc2NoZW1hc180Mi4wLmJiID0+IGdzZXR0aW5ncy1kZXNrdG9wLXNjaGVt
YXNfNDMuMC5iYn0gKDg1JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ25vbWUvZ3NldHRp
bmdzLWRlc2t0b3Atc2NoZW1hcy9nc2V0dGluZ3MtZGVza3RvcC1zY2hlbWFzXzQyLjAuYmIgYi9t
ZXRhL3JlY2lwZXMtZ25vbWUvZ3NldHRpbmdzLWRlc2t0b3Atc2NoZW1hcy9nc2V0dGluZ3MtZGVz
a3RvcC1zY2hlbWFzXzQzLjAuYmIKc2ltaWxhcml0eSBpbmRleCA4NSUKcmVuYW1lIGZyb20gbWV0
YS9yZWNpcGVzLWdub21lL2dzZXR0aW5ncy1kZXNrdG9wLXNjaGVtYXMvZ3NldHRpbmdzLWRlc2t0
b3Atc2NoZW1hc180Mi4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZ25vbWUvZ3NldHRpbmdz
LWRlc2t0b3Atc2NoZW1hcy9nc2V0dGluZ3MtZGVza3RvcC1zY2hlbWFzXzQzLjAuYmIKaW5kZXgg
YjhhZTE1YzIyOS4uOTY2YTY3ZmVhZCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdub21lL2dz
ZXR0aW5ncy1kZXNrdG9wLXNjaGVtYXMvZ3NldHRpbmdzLWRlc2t0b3Atc2NoZW1hc180Mi4wLmJi
CisrKyBiL21ldGEvcmVjaXBlcy1nbm9tZS9nc2V0dGluZ3MtZGVza3RvcC1zY2hlbWFzL2dzZXR0
aW5ncy1kZXNrdG9wLXNjaGVtYXNfNDMuMC5iYgpAQCAtMTMsNCArMTMsNCBAQCBHTk9NRUJBU0VC
VUlMRENMQVNTID0gIm1lc29uIgogCiBpbmhlcml0IGdub21lYmFzZSBnc2V0dGluZ3MgZ29iamVj
dC1pbnRyb3NwZWN0aW9uIGdldHRleHQKIAotU1JDX1VSSVthcmNoaXZlLnNoYTI1NnN1bV0gPSAi
NjY4NjMzNWE5ZWQ2MjNmN2FlMjI3NmZlZmE1MGE0MTBkNGU3MWQ0MjMxODgwODI0NzE0MDcwY2Iz
MTczMjNkMiIKK1NSQ19VUklbYXJjaGl2ZS5zaGEyNTZzdW1dID0gIjVkNTU2ODI4MmFiMzhiOTU3
NTlkNDI1NDAxZjc0NzZlNTZmOGNiZjI2Mjk4ODU1ODc0MzlmNDNiZDBiODRiYmUiCi0tIAoyLjMx
LjEKCg==

--===============5045417752370030736==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-bg: PKGSIZE changed from 6375 to 150974 (+2268%)
packages/core2-32-poky-linux/gsettings-desktop-schemas: PACKAGES: added "gsettings-desktop-schemas-locale-ab gsettings-desktop-schemas-locale-ka"

--===============5045417752370030736==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1661 entries from dependency cache.
Parsing recipes...done.
Parsing of 885 .bb files complete (884 cached, 1 parsed). 1661 targets, 35 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:7f1c42003dc3324a4fc92598f9d08231a2295292"
workspace            = "master:3e5faccfaf50fee0ba8f6eef6c9bf458137d06d2"

Initialising tasks...done.
Sstate summary: Wanted 69 Local 54 Mirrors 0 Missed 15 Current 398 (78% match, 96% complete)
Removing 1 stale sstate objects for arch core2-64...done.
Removing 1 stale sstate objects for arch qemux86_64...done.
Removing 1 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 405 of 467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: Running setscene task 406 of 467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 407 of 467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 420 of 467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_packagedata_setscene)
NOTE: Running task 912 of 1706 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_fetch)
NOTE: Running task 1002 of 1706 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_43.0.bb:do_fetch)
NOTE: Running task 1041 of 1706 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_write_config)
NOTE: Running task 1074 of 1706 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_43.0.bb:do_write_config)
NOTE: Running task 1077 of 1706 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_fetch)
NOTE: Running task 1118 of 1706 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_write_config)
NOTE: recipe tzdata-2022d-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.6-r0: task do_packagedata_setscene: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_fetch: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_fetch: Started
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_write_config: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_write_config: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_write_config: Started
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_fetch: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_fetch: Succeeded
NOTE: Running task 1121 of 1706 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_43.0.bb:do_unpack)
NOTE: Running task 1122 of 1706 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_unpack)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_write_config: Succeeded
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_write_config: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_write_config: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_fetch: Succeeded
NOTE: Running task 1123 of 1706 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_unpack)
NOTE: recipe tzdata-2022d-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_unpack: Started
NOTE: recipe xz-5.2.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_unpack: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_unpack: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/xz/5.2.6-r0/temp/log.do_packagedata_setscene.2911368
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.6.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 452 of 467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.6.bb:do_package_setscene)
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_unpack: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_unpack: Succeeded
NOTE: Running task 1147 of 1706 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_patch)
NOTE: Running task 1148 of 1706 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_43.0.bb:do_patch)
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_patch: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_patch: Started
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_patch: Succeeded
NOTE: Running task 1149 of 1706 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_43.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1150 of 1706 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_43.0.bb:do_populate_lic)
NOTE: recipe shared-mime-info-2.2-r0: task do_unpack: Succeeded
NOTE: Running task 1151 of 1706 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_patch)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_patch: Succeeded
NOTE: Running task 1152 of 1706 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_deploy_source_date_epoch)
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_patch: Started
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_populate_lic: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_patch: Succeeded
NOTE: Running task 1153 of 1706 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_deploy_source_date_epoch)
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_43.0.bb:do_populate_lic unihash changed to 32f4c96757b96583073f1f3ea4ea9f13b631c36c0aaaff1a5307364a1e6ce5f2
NOTE: recipe shared-mime-info-2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xz-5.2.6-r0: task do_package_setscene: Started
NOTE: recipe xz-5.2.6-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 454 of 467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 456 of 467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 457 of 467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 458 of 467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.36.bb:do_populate_sysroot_setscene)
NOTE: recipe glibc-2.36-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glibc-2.36-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 461 of 467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 463 of 467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.19.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 464 of 467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.39.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-x86_64-2.39-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.39-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1557 of 1706 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.6.bb:do_packagedata)
NOTE: Running task 1580 of 1706 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1641 of 1706 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe xz-5.2.6-r0: task do_packagedata: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xz-5.2.6-r0: task do_packagedata: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1685 of 1706 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_configure)
NOTE: recipe shared-mime-info-2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1686 of 1706 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_configure)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_configure: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_configure: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_configure: Succeeded
NOTE: Running task 1687 of 1706 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_compile)
NOTE: recipe shared-mime-info-2.2-r0: task do_compile: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_compile: Succeeded
NOTE: Running task 1688 of 1706 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_install)
NOTE: recipe shared-mime-info-2.2-r0: task do_install: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_configure: Succeeded
NOTE: Running task 1689 of 1706 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_compile)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_compile: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_install: Succeeded
NOTE: Running task 1690 of 1706 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package)
NOTE: recipe shared-mime-info-2.2-r0: task do_package: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_package: Succeeded
NOTE: Running task 1691 of 1706 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata)
NOTE: recipe shared-mime-info-2.2-r0: task do_packagedata: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1692 of 1706 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb:do_package_write_rpm)
NOTE: recipe glib-2.0-1_2.72.3-r0: task do_package_write_rpm: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_compile: Succeeded
NOTE: Running task 1693 of 1706 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_install)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_install: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_install: Succeeded
NOTE: Running task 1694 of 1706 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_populate_sysroot)
NOTE: Running task 1695 of 1706 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_package)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_populate_sysroot: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_package: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1696 of 1706 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_43.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1697 of 1706 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_43.0.bb:do_configure)
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_configure: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_package: Succeeded
NOTE: Running task 1698 of 1706 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_packagedata)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_packagedata: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_packagedata: Succeeded
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_configure: Succeeded
NOTE: Running task 1699 of 1706 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_43.0.bb:do_compile)
NOTE: recipe glib-2.0-1_2.72.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_compile: Started
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_compile: Succeeded
NOTE: Running task 1700 of 1706 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_43.0.bb:do_install)
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_install: Started
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_install: Succeeded
NOTE: Running task 1701 of 1706 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_43.0.bb:do_package)
NOTE: Running task 1702 of 1706 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_43.0.bb:do_populate_sysroot)
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_package: Started
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_populate_sysroot: Started
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_package: Succeeded
NOTE: Running task 1703 of 1706 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_43.0.bb:do_packagedata)
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_packagedata: Started
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1704 of 1706 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_43.0.bb:do_package_write_rpm)
NOTE: Running task 1705 of 1706 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_43.0.bb:do_package_qa)
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_package_write_rpm: Started
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_package_qa: Started
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_package_qa: Succeeded
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1706 of 1706 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_43.0.bb:do_build)
NOTE: Tasks Summary: Attempted 1706 tasks of which 1665 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: There was 1 WARNING message.
Summary: There were 30 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: xz-5.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-src went backwards which would break package feeds (from 0:5.2.7-r0 to 0:5.2.6-r0) [version-going-backwards]
ERROR: xz-5.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-dbg went backwards which would break package feeds (from 0:5.2.7-r0 to 0:5.2.6-r0) [version-going-backwards]
ERROR: xz-5.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package liblzma went backwards which would break package feeds (from 0:5.2.7-r0 to 0:5.2.6-r0) [version-going-backwards]
ERROR: xz-5.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-staticdev went backwards which would break package feeds (from 0:5.2.7-r0 to 0:5.2.6-r0) [version-going-backwards]
ERROR: xz-5.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-dev went backwards which would break package feeds (from 0:5.2.7-r0 to 0:5.2.6-r0) [version-going-backwards]
ERROR: xz-5.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-doc went backwards which would break package feeds (from 0:5.2.7-r0 to 0:5.2.6-r0) [version-going-backwards]
ERROR: xz-5.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz went backwards which would break package feeds (from 0:5.2.7-r0 to 0:5.2.6-r0) [version-going-backwards]
ERROR: xz-5.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-ca went backwards which would break package feeds (from 0:5.2.7-r0 to 0:5.2.6-r0) [version-going-backwards]
ERROR: xz-5.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-cs went backwards which would break package feeds (from 0:5.2.7-r0 to 0:5.2.6-r0) [version-going-backwards]
ERROR: xz-5.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-da went backwards which would break package feeds (from 0:5.2.7-r0 to 0:5.2.6-r0) [version-going-backwards]
ERROR: xz-5.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-de went backwards which would break package feeds (from 0:5.2.7-r0 to 0:5.2.6-r0) [version-going-backwards]
ERROR: xz-5.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-eo went backwards which would break package feeds (from 0:5.2.7-r0 to 0:5.2.6-r0) [version-going-backwards]
ERROR: xz-5.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-es went backwards which would break package feeds (from 0:5.2.7-r0 to 0:5.2.6-r0) [version-going-backwards]
ERROR: xz-5.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-fi went backwards which would break package feeds (from 0:5.2.7-r0 to 0:5.2.6-r0) [version-going-backwards]
ERROR: xz-5.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-fr went backwards which would break package feeds (from 0:5.2.7-r0 to 0:5.2.6-r0) [version-going-backwards]
ERROR: xz-5.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-hr went backwards which would break package feeds (from 0:5.2.7-r0 to 0:5.2.6-r0) [version-going-backwards]
ERROR: xz-5.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-hu went backwards which would break package feeds (from 0:5.2.7-r0 to 0:5.2.6-r0) [version-going-backwards]
ERROR: xz-5.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-it went backwards which would break package feeds (from 0:5.2.7-r0 to 0:5.2.6-r0) [version-going-backwards]
ERROR: xz-5.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-ko went backwards which would break package feeds (from 0:5.2.7-r0 to 0:5.2.6-r0) [version-going-backwards]
ERROR: xz-5.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-pl went backwards which would break package feeds (from 0:5.2.7-r0 to 0:5.2.6-r0) [version-going-backwards]
ERROR: xz-5.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-pt went backwards which would break package feeds (from 0:5.2.7-r0 to 0:5.2.6-r0) [version-going-backwards]
ERROR: xz-5.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-pt-br went backwards which would break package feeds (from 0:5.2.7-r0 to 0:5.2.6-r0) [version-going-backwards]
ERROR: xz-5.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-ro went backwards which would break package feeds (from 0:5.2.7-r0 to 0:5.2.6-r0) [version-going-backwards]
ERROR: xz-5.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-sr went backwards which would break package feeds (from 0:5.2.7-r0 to 0:5.2.6-r0) [version-going-backwards]
ERROR: xz-5.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-sv went backwards which would break package feeds (from 0:5.2.7-r0 to 0:5.2.6-r0) [version-going-backwards]
ERROR: xz-5.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-uk went backwards which would break package feeds (from 0:5.2.7-r0 to 0:5.2.6-r0) [version-going-backwards]
ERROR: xz-5.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-vi went backwards which would break package feeds (from 0:5.2.7-r0 to 0:5.2.6-r0) [version-going-backwards]
ERROR: xz-5.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-zh-cn went backwards which would break package feeds (from 0:5.2.7-r0 to 0:5.2.6-r0) [version-going-backwards]
ERROR: xz-5.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-zh-tw went backwards which would break package feeds (from 0:5.2.7-r0 to 0:5.2.6-r0) [version-going-backwards]
ERROR: xz-5.2.6-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============5045417752370030736==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 885 .bb files complete (0 cached, 885 parsed). 1661 targets, 63 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:7f1c42003dc3324a4fc92598f9d08231a2295292"
workspace            = "master:3e5faccfaf50fee0ba8f6eef6c9bf458137d06d2"

Initialising tasks...done.
Sstate summary: Wanted 69 Local 54 Mirrors 0 Missed 15 Current 394 (78% match, 96% complete)
Removing 1 stale sstate objects for arch mips32r2...done.
Removing 1 stale sstate objects for arch x86_64...done.
Removing 1 stale sstate objects for arch qemumips...done.
NOTE: Executing Tasks
NOTE: Running setscene task 401 of 463 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: Running setscene task 402 of 463 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 403 of 463 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 416 of 463 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_packagedata_setscene)
NOTE: Running task 908 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_fetch)
NOTE: Running task 998 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_43.0.bb:do_fetch)
NOTE: Running task 1037 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_write_config)
NOTE: Running task 1070 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_43.0.bb:do_write_config)
NOTE: Running task 1073 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_fetch)
NOTE: Running task 1114 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_write_config)
NOTE: recipe tzdata-2022d-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.6-r0: task do_packagedata_setscene: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_fetch: Started
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_fetch: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_fetch: Started
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_write_config: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_write_config: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_write_config: Started
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_fetch: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_fetch: Succeeded
NOTE: Running task 1117 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_unpack)
NOTE: Running task 1118 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_43.0.bb:do_unpack)
NOTE: recipe shared-mime-info-2.2-r0: task do_fetch: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_write_config: Succeeded
NOTE: Running task 1119 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_unpack)
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_write_config: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_write_config: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe tzdata-2022d-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_unpack: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_unpack: Started
NOTE: recipe xz-5.2.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_unpack: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/xz/5.2.6-r0/temp/log.do_packagedata_setscene.2959303
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.6.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 448 of 463 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.6.bb:do_package_setscene)
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_unpack: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_unpack: Succeeded
NOTE: Running task 1143 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_patch)
NOTE: Running task 1144 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_43.0.bb:do_patch)
NOTE: recipe shared-mime-info-2.2-r0: task do_unpack: Succeeded
NOTE: Running task 1145 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_patch)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_patch: Started
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_patch: Started
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_patch: Succeeded
NOTE: Running task 1146 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_43.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1147 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_43.0.bb:do_populate_lic)
NOTE: recipe shared-mime-info-2.2-r0: task do_patch: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_patch: Succeeded
NOTE: Running task 1148 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_deploy_source_date_epoch)
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_populate_lic: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_patch: Succeeded
NOTE: Running task 1149 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_deploy_source_date_epoch)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_43.0.bb:do_populate_lic unihash changed to 32f4c96757b96583073f1f3ea4ea9f13b631c36c0aaaff1a5307364a1e6ce5f2
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xz-5.2.6-r0: task do_package_setscene: Started
NOTE: recipe xz-5.2.6-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 450 of 463 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 452 of 463 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 453 of 463 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 454 of 463 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.36.bb:do_populate_sysroot_setscene)
NOTE: recipe glibc-2.36-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glibc-2.36-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 457 of 463 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-mips-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-mips-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 459 of 463 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.19.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 460 of 463 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.39.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-mips-2.39-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-mips-2.39-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1546 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.6.bb:do_packagedata)
NOTE: Running task 1568 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1627 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe xz-5.2.6-r0: task do_packagedata: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xz-5.2.6-r0: task do_packagedata: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1671 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_configure)
NOTE: Running task 1672 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_configure)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_configure: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_configure: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_configure: Succeeded
NOTE: Running task 1673 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_compile)
NOTE: recipe shared-mime-info-2.2-r0: task do_compile: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_compile: Succeeded
NOTE: Running task 1674 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_install)
NOTE: recipe shared-mime-info-2.2-r0: task do_install: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_configure: Succeeded
NOTE: Running task 1675 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_compile)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_compile: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_install: Succeeded
NOTE: Running task 1676 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package)
NOTE: recipe shared-mime-info-2.2-r0: task do_package: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_package: Succeeded
NOTE: Running task 1677 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata)
NOTE: recipe shared-mime-info-2.2-r0: task do_packagedata: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1678 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb:do_package_write_rpm)
NOTE: recipe glib-2.0-1_2.72.3-r0: task do_package_write_rpm: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_compile: Succeeded
NOTE: Running task 1679 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_install)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_install: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_install: Succeeded
NOTE: Running task 1680 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_populate_sysroot)
NOTE: Running task 1681 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_package)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_populate_sysroot: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_package: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1682 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_43.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1683 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_43.0.bb:do_configure)
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_configure: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_package: Succeeded
NOTE: Running task 1684 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_packagedata)
NOTE: recipe glib-2.0-1_2.72.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_packagedata: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_packagedata: Succeeded
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_configure: Succeeded
NOTE: Running task 1685 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_43.0.bb:do_compile)
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_compile: Started
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_compile: Succeeded
NOTE: Running task 1686 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_43.0.bb:do_install)
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_install: Started
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_install: Succeeded
NOTE: Running task 1687 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_43.0.bb:do_package)
NOTE: Running task 1688 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_43.0.bb:do_populate_sysroot)
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_populate_sysroot: Started
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_package: Started
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_package: Succeeded
NOTE: Running task 1689 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_43.0.bb:do_packagedata)
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_packagedata: Started
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1690 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_43.0.bb:do_package_write_rpm)
NOTE: Running task 1691 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_43.0.bb:do_package_qa)
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_package_write_rpm: Started
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_package_qa: Started
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_package_qa: Succeeded
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1692 of 1692 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_43.0.bb:do_build)
NOTE: Tasks Summary: Attempted 1692 tasks of which 1651 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 30 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: xz-5.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-src went backwards which would break package feeds (from 0:5.2.7-r0 to 0:5.2.6-r0) [version-going-backwards]
ERROR: xz-5.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-dbg went backwards which would break package feeds (from 0:5.2.7-r0 to 0:5.2.6-r0) [version-going-backwards]
ERROR: xz-5.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package liblzma went backwards which would break package feeds (from 0:5.2.7-r0 to 0:5.2.6-r0) [version-going-backwards]
ERROR: xz-5.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-staticdev went backwards which would break package feeds (from 0:5.2.7-r0 to 0:5.2.6-r0) [version-going-backwards]
ERROR: xz-5.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-dev went backwards which would break package feeds (from 0:5.2.7-r0 to 0:5.2.6-r0) [version-going-backwards]
ERROR: xz-5.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-doc went backwards which would break package feeds (from 0:5.2.7-r0 to 0:5.2.6-r0) [version-going-backwards]
ERROR: xz-5.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz went backwards which would break package feeds (from 0:5.2.7-r0 to 0:5.2.6-r0) [version-going-backwards]
ERROR: xz-5.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-ca went backwards which would break package feeds (from 0:5.2.7-r0 to 0:5.2.6-r0) [version-going-backwards]
ERROR: xz-5.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-cs went backwards which would break package feeds (from 0:5.2.7-r0 to 0:5.2.6-r0) [version-going-backwards]
ERROR: xz-5.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-da went backwards which would break package feeds (from 0:5.2.7-r0 to 0:5.2.6-r0) [version-going-backwards]
ERROR: xz-5.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-de went backwards which would break package feeds (from 0:5.2.7-r0 to 0:5.2.6-r0) [version-going-backwards]
ERROR: xz-5.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-eo went backwards which would break package feeds (from 0:5.2.7-r0 to 0:5.2.6-r0) [version-going-backwards]
ERROR: xz-5.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-es went backwards which would break package feeds (from 0:5.2.7-r0 to 0:5.2.6-r0) [version-going-backwards]
ERROR: xz-5.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-fi went backwards which would break package feeds (from 0:5.2.7-r0 to 0:5.2.6-r0) [version-going-backwards]
ERROR: xz-5.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-fr went backwards which would break package feeds (from 0:5.2.7-r0 to 0:5.2.6-r0) [version-going-backwards]
ERROR: xz-5.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-hr went backwards which would break package feeds (from 0:5.2.7-r0 to 0:5.2.6-r0) [version-going-backwards]
ERROR: xz-5.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-hu went backwards which would break package feeds (from 0:5.2.7-r0 to 0:5.2.6-r0) [version-going-backwards]
ERROR: xz-5.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-it went backwards which would break package feeds (from 0:5.2.7-r0 to 0:5.2.6-r0) [version-going-backwards]
ERROR: xz-5.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-ko went backwards which would break package feeds (from 0:5.2.7-r0 to 0:5.2.6-r0) [version-going-backwards]
ERROR: xz-5.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-pl went backwards which would break package feeds (from 0:5.2.7-r0 to 0:5.2.6-r0) [version-going-backwards]
ERROR: xz-5.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-pt went backwards which would break package feeds (from 0:5.2.7-r0 to 0:5.2.6-r0) [version-going-backwards]
ERROR: xz-5.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-pt-br went backwards which would break package feeds (from 0:5.2.7-r0 to 0:5.2.6-r0) [version-going-backwards]
ERROR: xz-5.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-ro went backwards which would break package feeds (from 0:5.2.7-r0 to 0:5.2.6-r0) [version-going-backwards]
ERROR: xz-5.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-sr went backwards which would break package feeds (from 0:5.2.7-r0 to 0:5.2.6-r0) [version-going-backwards]
ERROR: xz-5.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-sv went backwards which would break package feeds (from 0:5.2.7-r0 to 0:5.2.6-r0) [version-going-backwards]
ERROR: xz-5.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-uk went backwards which would break package feeds (from 0:5.2.7-r0 to 0:5.2.6-r0) [version-going-backwards]
ERROR: xz-5.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-vi went backwards which would break package feeds (from 0:5.2.7-r0 to 0:5.2.6-r0) [version-going-backwards]
ERROR: xz-5.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-zh-cn went backwards which would break package feeds (from 0:5.2.7-r0 to 0:5.2.6-r0) [version-going-backwards]
ERROR: xz-5.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-zh-tw went backwards which would break package feeds (from 0:5.2.7-r0 to 0:5.2.6-r0) [version-going-backwards]
ERROR: xz-5.2.6-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============5045417752370030736==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 885 .bb files complete (0 cached, 885 parsed). 1661 targets, 70 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:7f1c42003dc3324a4fc92598f9d08231a2295292"
workspace            = "master:3e5faccfaf50fee0ba8f6eef6c9bf458137d06d2"

Initialising tasks...done.
Sstate summary: Wanted 70 Local 55 Mirrors 0 Missed 15 Current 397 (78% match, 96% complete)
Removing 1 stale sstate objects for arch qemuppc...done.
Removing 1 stale sstate objects for arch x86_64...done.
Removing 1 stale sstate objects for arch ppc7400...done.
NOTE: Executing Tasks
NOTE: Running setscene task 404 of 467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: Running setscene task 405 of 467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 406 of 467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 420 of 467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_packagedata_setscene)
NOTE: Running task 912 of 1706 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_fetch)
NOTE: Running task 1002 of 1706 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_43.0.bb:do_fetch)
NOTE: Running task 1041 of 1706 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_write_config)
NOTE: Running task 1074 of 1706 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_43.0.bb:do_write_config)
NOTE: Running task 1077 of 1706 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_fetch)
NOTE: Running task 1118 of 1706 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_write_config)
NOTE: recipe tzdata-2022d-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.6-r0: task do_packagedata_setscene: Started
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_fetch: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_fetch: Started
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_write_config: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_write_config: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_write_config: Started
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_fetch: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_fetch: Succeeded
NOTE: Running task 1121 of 1706 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_unpack)
NOTE: Running task 1122 of 1706 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_43.0.bb:do_unpack)
NOTE: recipe shared-mime-info-2.2-r0: task do_fetch: Succeeded
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_write_config: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_write_config: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_write_config: Succeeded
NOTE: Running task 1123 of 1706 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_unpack)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe tzdata-2022d-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_unpack: Started
NOTE: recipe xz-5.2.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_unpack: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_unpack: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/xz/5.2.6-r0/temp/log.do_packagedata_setscene.2983341
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.6.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 452 of 467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.6.bb:do_package_setscene)
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_unpack: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_unpack: Succeeded
NOTE: Running task 1147 of 1706 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_patch)
NOTE: Running task 1148 of 1706 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_43.0.bb:do_patch)
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_patch: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_patch: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_unpack: Succeeded
NOTE: Running task 1149 of 1706 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_patch)
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_patch: Succeeded
NOTE: Running task 1150 of 1706 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_43.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1151 of 1706 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_43.0.bb:do_populate_lic)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_patch: Succeeded
NOTE: Running task 1152 of 1706 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_deploy_source_date_epoch)
NOTE: recipe shared-mime-info-2.2-r0: task do_patch: Started
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_populate_lic: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_patch: Succeeded
NOTE: Running task 1153 of 1706 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_deploy_source_date_epoch)
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_43.0.bb:do_populate_lic unihash changed to 32f4c96757b96583073f1f3ea4ea9f13b631c36c0aaaff1a5307364a1e6ce5f2
NOTE: recipe shared-mime-info-2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xz-5.2.6-r0: task do_package_setscene: Started
NOTE: recipe xz-5.2.6-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 454 of 467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 456 of 467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 457 of 467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 458 of 467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.36.bb:do_populate_sysroot_setscene)
NOTE: recipe glibc-2.36-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glibc-2.36-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 461 of 467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-powerpc-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-powerpc-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 463 of 467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.19.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 464 of 467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.39.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-powerpc-2.39-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-powerpc-2.39-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1557 of 1706 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.6.bb:do_packagedata)
NOTE: Running task 1580 of 1706 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1641 of 1706 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe xz-5.2.6-r0: task do_packagedata: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xz-5.2.6-r0: task do_packagedata: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1685 of 1706 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_configure)
NOTE: recipe shared-mime-info-2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1686 of 1706 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_configure)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_configure: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_configure: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_configure: Succeeded
NOTE: Running task 1687 of 1706 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_compile)
NOTE: recipe shared-mime-info-2.2-r0: task do_compile: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_compile: Succeeded
NOTE: Running task 1688 of 1706 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_install)
NOTE: recipe shared-mime-info-2.2-r0: task do_install: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_configure: Succeeded
NOTE: Running task 1689 of 1706 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_compile)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_compile: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_install: Succeeded
NOTE: Running task 1690 of 1706 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package)
NOTE: recipe shared-mime-info-2.2-r0: task do_package: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_package: Succeeded
NOTE: Running task 1691 of 1706 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata)
NOTE: recipe shared-mime-info-2.2-r0: task do_packagedata: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1692 of 1706 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb:do_package_write_rpm)
NOTE: recipe glib-2.0-1_2.72.3-r0: task do_package_write_rpm: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_compile: Succeeded
NOTE: Running task 1693 of 1706 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_install)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_install: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_install: Succeeded
NOTE: Running task 1694 of 1706 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_populate_sysroot)
NOTE: Running task 1695 of 1706 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_package)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_populate_sysroot: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_package: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1696 of 1706 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_43.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1697 of 1706 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_43.0.bb:do_configure)
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_configure: Started
NOTE: recipe glib-2.0-1_2.72.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_package: Succeeded
NOTE: Running task 1698 of 1706 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_packagedata)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_packagedata: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_packagedata: Succeeded
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_configure: Succeeded
NOTE: Running task 1699 of 1706 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_43.0.bb:do_compile)
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_compile: Started
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_compile: Succeeded
NOTE: Running task 1700 of 1706 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_43.0.bb:do_install)
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_install: Started
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_install: Succeeded
NOTE: Running task 1701 of 1706 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_43.0.bb:do_package)
NOTE: Running task 1702 of 1706 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_43.0.bb:do_populate_sysroot)
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_package: Started
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_populate_sysroot: Started
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_package: Succeeded
NOTE: Running task 1703 of 1706 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_43.0.bb:do_packagedata)
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_packagedata: Started
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1704 of 1706 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_43.0.bb:do_package_write_rpm)
NOTE: Running task 1705 of 1706 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_43.0.bb:do_package_qa)
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_package_write_rpm: Started
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_package_qa: Started
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_package_qa: Succeeded
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1706 of 1706 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_43.0.bb:do_build)
NOTE: Tasks Summary: Attempted 1706 tasks of which 1665 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 30 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: xz-5.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-src went backwards which would break package feeds (from 0:5.2.7-r0 to 0:5.2.6-r0) [version-going-backwards]
ERROR: xz-5.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-dbg went backwards which would break package feeds (from 0:5.2.7-r0 to 0:5.2.6-r0) [version-going-backwards]
ERROR: xz-5.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package liblzma went backwards which would break package feeds (from 0:5.2.7-r0 to 0:5.2.6-r0) [version-going-backwards]
ERROR: xz-5.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-staticdev went backwards which would break package feeds (from 0:5.2.7-r0 to 0:5.2.6-r0) [version-going-backwards]
ERROR: xz-5.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-dev went backwards which would break package feeds (from 0:5.2.7-r0 to 0:5.2.6-r0) [version-going-backwards]
ERROR: xz-5.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-doc went backwards which would break package feeds (from 0:5.2.7-r0 to 0:5.2.6-r0) [version-going-backwards]
ERROR: xz-5.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz went backwards which would break package feeds (from 0:5.2.7-r0 to 0:5.2.6-r0) [version-going-backwards]
ERROR: xz-5.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-ca went backwards which would break package feeds (from 0:5.2.7-r0 to 0:5.2.6-r0) [version-going-backwards]
ERROR: xz-5.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-cs went backwards which would break package feeds (from 0:5.2.7-r0 to 0:5.2.6-r0) [version-going-backwards]
ERROR: xz-5.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-da went backwards which would break package feeds (from 0:5.2.7-r0 to 0:5.2.6-r0) [version-going-backwards]
ERROR: xz-5.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-de went backwards which would break package feeds (from 0:5.2.7-r0 to 0:5.2.6-r0) [version-going-backwards]
ERROR: xz-5.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-eo went backwards which would break package feeds (from 0:5.2.7-r0 to 0:5.2.6-r0) [version-going-backwards]
ERROR: xz-5.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-es went backwards which would break package feeds (from 0:5.2.7-r0 to 0:5.2.6-r0) [version-going-backwards]
ERROR: xz-5.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-fi went backwards which would break package feeds (from 0:5.2.7-r0 to 0:5.2.6-r0) [version-going-backwards]
ERROR: xz-5.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-fr went backwards which would break package feeds (from 0:5.2.7-r0 to 0:5.2.6-r0) [version-going-backwards]
ERROR: xz-5.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-hr went backwards which would break package feeds (from 0:5.2.7-r0 to 0:5.2.6-r0) [version-going-backwards]
ERROR: xz-5.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-hu went backwards which would break package feeds (from 0:5.2.7-r0 to 0:5.2.6-r0) [version-going-backwards]
ERROR: xz-5.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-it went backwards which would break package feeds (from 0:5.2.7-r0 to 0:5.2.6-r0) [version-going-backwards]
ERROR: xz-5.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-ko went backwards which would break package feeds (from 0:5.2.7-r0 to 0:5.2.6-r0) [version-going-backwards]
ERROR: xz-5.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-pl went backwards which would break package feeds (from 0:5.2.7-r0 to 0:5.2.6-r0) [version-going-backwards]
ERROR: xz-5.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-pt went backwards which would break package feeds (from 0:5.2.7-r0 to 0:5.2.6-r0) [version-going-backwards]
ERROR: xz-5.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-pt-br went backwards which would break package feeds (from 0:5.2.7-r0 to 0:5.2.6-r0) [version-going-backwards]
ERROR: xz-5.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-ro went backwards which would break package feeds (from 0:5.2.7-r0 to 0:5.2.6-r0) [version-going-backwards]
ERROR: xz-5.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-sr went backwards which would break package feeds (from 0:5.2.7-r0 to 0:5.2.6-r0) [version-going-backwards]
ERROR: xz-5.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-sv went backwards which would break package feeds (from 0:5.2.7-r0 to 0:5.2.6-r0) [version-going-backwards]
ERROR: xz-5.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-uk went backwards which would break package feeds (from 0:5.2.7-r0 to 0:5.2.6-r0) [version-going-backwards]
ERROR: xz-5.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-vi went backwards which would break package feeds (from 0:5.2.7-r0 to 0:5.2.6-r0) [version-going-backwards]
ERROR: xz-5.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-zh-cn went backwards which would break package feeds (from 0:5.2.7-r0 to 0:5.2.6-r0) [version-going-backwards]
ERROR: xz-5.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-zh-tw went backwards which would break package feeds (from 0:5.2.7-r0 to 0:5.2.6-r0) [version-going-backwards]
ERROR: xz-5.2.6-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============5045417752370030736==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 885 .bb files complete (0 cached, 885 parsed). 1661 targets, 51 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:7f1c42003dc3324a4fc92598f9d08231a2295292"
workspace            = "master:3e5faccfaf50fee0ba8f6eef6c9bf458137d06d2"

Initialising tasks...done.
Sstate summary: Wanted 69 Local 54 Mirrors 0 Missed 15 Current 398 (78% match, 96% complete)
Removing 1 stale sstate objects for arch qemuarm...done.
Removing 1 stale sstate objects for arch x86_64...done.
Removing 1 stale sstate objects for arch cortexa15t2hf-neon...done.
NOTE: Executing Tasks
NOTE: Running setscene task 405 of 467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: Running setscene task 406 of 467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 407 of 467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 420 of 467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_packagedata_setscene)
NOTE: Running task 912 of 1706 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_fetch)
NOTE: Running task 1002 of 1706 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_43.0.bb:do_fetch)
NOTE: Running task 1041 of 1706 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_write_config)
NOTE: Running task 1074 of 1706 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_43.0.bb:do_write_config)
NOTE: Running task 1078 of 1706 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_fetch)
NOTE: Running task 1119 of 1706 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_write_config)
NOTE: recipe tzdata-2022d-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.6-r0: task do_packagedata_setscene: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_write_config: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_fetch: Started
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_write_config: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_write_config: Started
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_fetch: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_fetch: Succeeded
NOTE: Running task 1121 of 1706 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_unpack)
NOTE: Running task 1122 of 1706 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_43.0.bb:do_unpack)
NOTE: recipe shared-mime-info-2.2-r0: task do_fetch: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_write_config: Succeeded
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_write_config: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_write_config: Succeeded
NOTE: Running task 1123 of 1706 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_unpack)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_unpack: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_unpack: Started
NOTE: recipe tzdata-2022d-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.2.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_unpack: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/xz/5.2.6-r0/temp/log.do_packagedata_setscene.2935373
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.6.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 452 of 467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.6.bb:do_package_setscene)
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_unpack: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_unpack: Succeeded
NOTE: Running task 1147 of 1706 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_patch)
NOTE: Running task 1148 of 1706 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_43.0.bb:do_patch)
NOTE: recipe shared-mime-info-2.2-r0: task do_unpack: Succeeded
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_patch: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_patch: Started
NOTE: Running task 1149 of 1706 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_patch)
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_patch: Succeeded
NOTE: Running task 1150 of 1706 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_43.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1151 of 1706 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_43.0.bb:do_populate_lic)
NOTE: recipe shared-mime-info-2.2-r0: task do_patch: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_patch: Succeeded
NOTE: Running task 1152 of 1706 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_deploy_source_date_epoch)
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_populate_lic: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_patch: Succeeded
NOTE: Running task 1153 of 1706 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_deploy_source_date_epoch)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_43.0.bb:do_populate_lic unihash changed to 32f4c96757b96583073f1f3ea4ea9f13b631c36c0aaaff1a5307364a1e6ce5f2
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xz-5.2.6-r0: task do_package_setscene: Started
NOTE: recipe xz-5.2.6-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 454 of 467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 456 of 467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 457 of 467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 458 of 467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.36.bb:do_populate_sysroot_setscene)
NOTE: recipe glibc-2.36-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glibc-2.36-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 461 of 467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-arm-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-arm-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 463 of 467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.19.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 464 of 467 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.39.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-arm-2.39-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-arm-2.39-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1557 of 1706 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.6.bb:do_packagedata)
NOTE: Running task 1580 of 1706 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1643 of 1706 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe xz-5.2.6-r0: task do_packagedata: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xz-5.2.6-r0: task do_packagedata: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1685 of 1706 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_configure)
NOTE: recipe shared-mime-info-2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1686 of 1706 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_configure)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_configure: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_configure: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_configure: Succeeded
NOTE: Running task 1687 of 1706 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_compile)
NOTE: recipe shared-mime-info-2.2-r0: task do_compile: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_compile: Succeeded
NOTE: Running task 1688 of 1706 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_install)
NOTE: recipe shared-mime-info-2.2-r0: task do_install: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_configure: Succeeded
NOTE: Running task 1689 of 1706 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_compile)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_compile: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_install: Succeeded
NOTE: Running task 1690 of 1706 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package)
NOTE: recipe shared-mime-info-2.2-r0: task do_package: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_package: Succeeded
NOTE: Running task 1691 of 1706 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata)
NOTE: recipe shared-mime-info-2.2-r0: task do_packagedata: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1692 of 1706 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb:do_package_write_rpm)
NOTE: recipe glib-2.0-1_2.72.3-r0: task do_package_write_rpm: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_compile: Succeeded
NOTE: Running task 1693 of 1706 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_install)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_install: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_install: Succeeded
NOTE: Running task 1694 of 1706 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_populate_sysroot)
NOTE: Running task 1695 of 1706 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_package)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_populate_sysroot: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_package: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1696 of 1706 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_43.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1697 of 1706 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_43.0.bb:do_configure)
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_configure: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_package: Succeeded
NOTE: Running task 1698 of 1706 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_packagedata)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_packagedata: Started
NOTE: recipe glib-2.0-1_2.72.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_packagedata: Succeeded
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_configure: Succeeded
NOTE: Running task 1699 of 1706 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_43.0.bb:do_compile)
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_compile: Started
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_compile: Succeeded
NOTE: Running task 1700 of 1706 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_43.0.bb:do_install)
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_install: Started
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_install: Succeeded
NOTE: Running task 1701 of 1706 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_43.0.bb:do_package)
NOTE: Running task 1702 of 1706 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_43.0.bb:do_populate_sysroot)
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_package: Started
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_populate_sysroot: Started
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_package: Succeeded
NOTE: Running task 1703 of 1706 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_43.0.bb:do_packagedata)
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_packagedata: Started
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1704 of 1706 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_43.0.bb:do_package_write_rpm)
NOTE: Running task 1705 of 1706 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_43.0.bb:do_package_qa)
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_package_write_rpm: Started
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_package_qa: Started
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_package_qa: Succeeded
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1706 of 1706 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_43.0.bb:do_build)
NOTE: Tasks Summary: Attempted 1706 tasks of which 1665 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 30 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: xz-5.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-src went backwards which would break package feeds (from 0:5.2.7-r0 to 0:5.2.6-r0) [version-going-backwards]
ERROR: xz-5.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-dbg went backwards which would break package feeds (from 0:5.2.7-r0 to 0:5.2.6-r0) [version-going-backwards]
ERROR: xz-5.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package liblzma went backwards which would break package feeds (from 0:5.2.7-r0 to 0:5.2.6-r0) [version-going-backwards]
ERROR: xz-5.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-staticdev went backwards which would break package feeds (from 0:5.2.7-r0 to 0:5.2.6-r0) [version-going-backwards]
ERROR: xz-5.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-dev went backwards which would break package feeds (from 0:5.2.7-r0 to 0:5.2.6-r0) [version-going-backwards]
ERROR: xz-5.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-doc went backwards which would break package feeds (from 0:5.2.7-r0 to 0:5.2.6-r0) [version-going-backwards]
ERROR: xz-5.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz went backwards which would break package feeds (from 0:5.2.7-r0 to 0:5.2.6-r0) [version-going-backwards]
ERROR: xz-5.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-ca went backwards which would break package feeds (from 0:5.2.7-r0 to 0:5.2.6-r0) [version-going-backwards]
ERROR: xz-5.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-cs went backwards which would break package feeds (from 0:5.2.7-r0 to 0:5.2.6-r0) [version-going-backwards]
ERROR: xz-5.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-da went backwards which would break package feeds (from 0:5.2.7-r0 to 0:5.2.6-r0) [version-going-backwards]
ERROR: xz-5.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-de went backwards which would break package feeds (from 0:5.2.7-r0 to 0:5.2.6-r0) [version-going-backwards]
ERROR: xz-5.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-eo went backwards which would break package feeds (from 0:5.2.7-r0 to 0:5.2.6-r0) [version-going-backwards]
ERROR: xz-5.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-es went backwards which would break package feeds (from 0:5.2.7-r0 to 0:5.2.6-r0) [version-going-backwards]
ERROR: xz-5.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-fi went backwards which would break package feeds (from 0:5.2.7-r0 to 0:5.2.6-r0) [version-going-backwards]
ERROR: xz-5.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-fr went backwards which would break package feeds (from 0:5.2.7-r0 to 0:5.2.6-r0) [version-going-backwards]
ERROR: xz-5.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-hr went backwards which would break package feeds (from 0:5.2.7-r0 to 0:5.2.6-r0) [version-going-backwards]
ERROR: xz-5.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-hu went backwards which would break package feeds (from 0:5.2.7-r0 to 0:5.2.6-r0) [version-going-backwards]
ERROR: xz-5.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-it went backwards which would break package feeds (from 0:5.2.7-r0 to 0:5.2.6-r0) [version-going-backwards]
ERROR: xz-5.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-ko went backwards which would break package feeds (from 0:5.2.7-r0 to 0:5.2.6-r0) [version-going-backwards]
ERROR: xz-5.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-pl went backwards which would break package feeds (from 0:5.2.7-r0 to 0:5.2.6-r0) [version-going-backwards]
ERROR: xz-5.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-pt went backwards which would break package feeds (from 0:5.2.7-r0 to 0:5.2.6-r0) [version-going-backwards]
ERROR: xz-5.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-pt-br went backwards which would break package feeds (from 0:5.2.7-r0 to 0:5.2.6-r0) [version-going-backwards]
ERROR: xz-5.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-ro went backwards which would break package feeds (from 0:5.2.7-r0 to 0:5.2.6-r0) [version-going-backwards]
ERROR: xz-5.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-sr went backwards which would break package feeds (from 0:5.2.7-r0 to 0:5.2.6-r0) [version-going-backwards]
ERROR: xz-5.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-sv went backwards which would break package feeds (from 0:5.2.7-r0 to 0:5.2.6-r0) [version-going-backwards]
ERROR: xz-5.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-uk went backwards which would break package feeds (from 0:5.2.7-r0 to 0:5.2.6-r0) [version-going-backwards]
ERROR: xz-5.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-vi went backwards which would break package feeds (from 0:5.2.7-r0 to 0:5.2.6-r0) [version-going-backwards]
ERROR: xz-5.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-zh-cn went backwards which would break package feeds (from 0:5.2.7-r0 to 0:5.2.6-r0) [version-going-backwards]
ERROR: xz-5.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-zh-tw went backwards which would break package feeds (from 0:5.2.7-r0 to 0:5.2.6-r0) [version-going-backwards]
ERROR: xz-5.2.6-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============5045417752370030736==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 885 .bb files complete (0 cached, 885 parsed). 1662 targets, 49 skipped, 0 masked, 0 errors.
Removing 126 recipes from the core2-32 sysroot...done.
Removing 132 recipes from the qemux86 sysroot...done.
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
meta-yocto-bsp       = "tmp-auh-upgrades:7f1c42003dc3324a4fc92598f9d08231a2295292"
workspace            = "master:3e5faccfaf50fee0ba8f6eef6c9bf458137d06d2"

Initialising tasks...done.
Sstate summary: Wanted 263 Local 242 Mirrors 0 Missed 21 Current 156 (92% match, 94% complete)
Removing 2 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 157 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.52.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 159 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 161 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 177 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 178 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 185 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 186 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.6.bb:do_populate_sysroot_setscene)
NOTE: Running task 680 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.14.bb:do_fetch)
NOTE: Running task 689 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_fetch)
NOTE: Running task 706 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_43.0.bb:do_fetch)
NOTE: Running task 720 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_write_config)
NOTE: Running task 772 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_43.0.bb:do_write_config)
NOTE: Running task 776 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_fetch)
NOTE: Running task 810 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_write_config)
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.5.52-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.9.14-r0: task do_fetch: Started
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_fetch: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_fetch: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_write_config: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_write_config: Started
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_write_config: Started
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_fetch: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_fetch: Succeeded
NOTE: recipe libxml2-2.9.14-r0: task do_fetch: Succeeded
NOTE: Running task 818 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_unpack)
NOTE: Running task 819 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_43.0.bb:do_unpack)
NOTE: recipe python3-3.10.6-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.10.6-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 820 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.14.bb:do_unpack)
NOTE: recipe shared-mime-info-2.2-r0: task do_fetch: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_write_config: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_write_config: Succeeded
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_write_config: Succeeded
NOTE: Running task 821 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_unpack)
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_unpack: Started
NOTE: recipe base-passwd-3.5.52-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 217 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 218 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 219 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.52.bb:do_packagedata_setscene)
NOTE: Running setscene task 220 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 221 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 222 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 223 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 224 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 225 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 226 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 227 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.12.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 228 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.12.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 229 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 230 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 231 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 232 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_unpack: Started
NOTE: recipe libxml2-2.9.14-r0: task do_unpack: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.5.52-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Started
NOTE: recipe expat-2.4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.4.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.14.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-4.12.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.12.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.72.3-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.72.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_unpack: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 235 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 237 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 239 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.65.bb:do_packagedata_setscene)
NOTE: recipe dbus-1.14.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 838 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_fetch)
NOTE: Running task 839 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_43.0.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.5.52-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Succeeded
NOTE: Running task 845 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_patch)
NOTE: recipe expat-2.4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.4.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 249 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_packagedata_setscene)
NOTE: recipe libx11-1_1.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.65-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 252 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_packagedata_setscene)
NOTE: recipe python3-3.10.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.10.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-4.12.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe dbus-1.14.0-r0: task do_fetch: Started
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_patch: Started
NOTE: Running setscene task 254 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 255 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 256 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 257 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 259 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 260 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 261 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 262 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 263 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 264 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 265 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.39.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 266 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.39.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe dbus-1.14.0-r0: task do_fetch: Succeeded
NOTE: recipe libx11-1_1.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 267 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 270 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_populate_sysroot_setscene)
NOTE: Running task 880 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_unpack)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_patch: Started
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_patch: Succeeded
NOTE: recipe glib-2.0-1_2.72.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.12.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 883 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_43.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 892 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_43.0.bb:do_populate_lic)
NOTE: recipe libcap-2.65-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.2.6-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.39.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.39.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_patch: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe dbus-1.14.0-r0: task do_unpack: Started
NOTE: Running task 897 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_deploy_source_date_epoch)
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_populate_lic: Started
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 278 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata_setscene)
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_unpack: Succeeded
NOTE: Running setscene task 281 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 284 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 285 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.39.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 902 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_patch)
NOTE: recipe readline-8.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 288 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.39.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xz-5.2.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 293 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 294 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 295 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 296 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_packagedata_setscene)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/xz/5.2.6-r0/temp/log.do_packagedata_setscene.3009455
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Started
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.6.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_patch: Started
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 298 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.6.bb:do_package_setscene)
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_populate_lic: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.72.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 299 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb:do_package_setscene)
NOTE: recipe libxml2-2.9.14-r0: task do_unpack: Succeeded
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_43.0.bb:do_populate_lic unihash changed to 32f4c96757b96583073f1f3ea4ea9f13b631c36c0aaaff1a5307364a1e6ce5f2
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.14.0-r0: task do_unpack: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_patch: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 304 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 306 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 309 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 311 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 313 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 314 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 315 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_packagedata_setscene)
NOTE: Running task 931 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.14.bb:do_patch)
NOTE: Running task 938 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_patch)
NOTE: Running task 941 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_deploy_source_date_epoch)
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.2.6-r0: task do_package_setscene: Started
NOTE: recipe xorgproto-2022.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.9.14-r0: task do_patch: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glib-2.0-1_2.72.3-r0: task do_package_setscene: Started
NOTE: recipe dbus-1.14.0-r0: task do_patch: Started
NOTE: recipe libxau-1_1.0.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe dbus-1.14.0-r0: task do_patch: Succeeded
NOTE: Running setscene task 326 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 327 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_populate_sysroot_setscene)
NOTE: recipe shared-mime-info-2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.2.6-r0: task do_package_setscene: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.9.14-r0: task do_patch: Succeeded
NOTE: Running task 976 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.14.bb:do_deploy_source_date_epoch)
NOTE: recipe libxml2-2.9.14-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxml2-2.9.14-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glib-2.0-1_2.72.3-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 332 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 333 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 334 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 335 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 336 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 337 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_packagedata_setscene)
NOTE: Running setscene task 338 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_populate_sysroot_setscene)
NOTE: recipe libffi-3.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre-8.45-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.72.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpcre-8.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.72.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 342 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 343 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 348 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_packagedata_setscene)
NOTE: Running setscene task 349 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 350 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 351 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 353 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 354 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 355 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 356 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 357 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 358 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.3+20220423-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 366 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 367 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 372 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 373 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 374 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 375 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_populate_sysroot_setscene)
NOTE: recipe cracklib-2.9.8-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cracklib-2.9.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 380 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 381 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 382 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.12-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 385 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.2.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 387 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 390 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 392 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 394 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+37e18b7bf3-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 395 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+37e18b7bf3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+37e18b7bf3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 398 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 399 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 400 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.19.bb:do_packagedata_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.19-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+37e18b7bf3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 401 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 402 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.19-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 411 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 414 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.19.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 415 of 419 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.39.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.39-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.39-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1331 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.14.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1385 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1426 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1438 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.6.bb:do_packagedata)
NOTE: recipe libxml2-2.9.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xz-5.2.6-r0: task do_packagedata: Started
NOTE: recipe dbus-1.14.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xz-5.2.6-r0: task do_packagedata: Succeeded
NOTE: recipe libxml2-2.9.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1496 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.14.bb:do_configure)
NOTE: recipe dbus-1.14.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gobject-introspection-1.72.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1497 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_configure)
NOTE: Running task 1498 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_configure)
NOTE: recipe libxml2-2.9.14-r0: task do_configure: Started
NOTE: recipe dbus-1.14.0-r0: task do_configure: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_configure: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_configure: Succeeded
NOTE: Running task 1499 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_compile)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_compile: Started
NOTE: recipe libxml2-2.9.14-r0: task do_configure: Succeeded
NOTE: Running task 1500 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.14.bb:do_configure_ptest_base)
NOTE: recipe libxml2-2.9.14-r0: task do_configure_ptest_base: Started
NOTE: recipe libxml2-2.9.14-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1501 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.14.bb:do_compile)
NOTE: recipe libxml2-2.9.14-r0: task do_compile: Started
NOTE: recipe dbus-1.14.0-r0: task do_configure: Succeeded
NOTE: Running task 1502 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_configure_ptest_base)
NOTE: recipe dbus-1.14.0-r0: task do_configure_ptest_base: Started
NOTE: recipe dbus-1.14.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1503 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_compile)
NOTE: recipe libxml2-2.9.14-r0: task do_compile: Succeeded
NOTE: Running task 1504 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.14.bb:do_compile_ptest_base)
NOTE: recipe dbus-1.14.0-r0: task do_compile: Started
NOTE: recipe libxml2-2.9.14-r0: task do_compile_ptest_base: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_compile: Succeeded
NOTE: Running task 1505 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_install)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_install: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_install: Succeeded
NOTE: Running task 1506 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_populate_sysroot)
NOTE: Running task 1507 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_package)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_populate_sysroot: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_package: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1508 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_43.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1509 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_43.0.bb:do_configure)
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_configure: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_package: Succeeded
NOTE: Running task 1510 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.72.0.bb:do_packagedata)
NOTE: recipe gobject-introspection-1.72.0-r0: task do_packagedata: Started
NOTE: recipe gobject-introspection-1.72.0-r0: task do_packagedata: Succeeded
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_configure: Succeeded
NOTE: Running task 1511 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_43.0.bb:do_compile)
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_compile: Started
NOTE: recipe dbus-1.14.0-r0: task do_compile: Succeeded
NOTE: Running task 1512 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_compile_ptest_base)
NOTE: recipe dbus-1.14.0-r0: task do_compile_ptest_base: Started
NOTE: recipe dbus-1.14.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1513 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_install)
NOTE: recipe dbus-1.14.0-r0: task do_install: Started
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_compile: Succeeded
NOTE: Running task 1514 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_43.0.bb:do_install)
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_install: Started
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_install: Succeeded
NOTE: Running task 1515 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_43.0.bb:do_package)
NOTE: Running task 1516 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_43.0.bb:do_populate_sysroot)
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_package: Started
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_populate_sysroot: Started
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe dbus-1.14.0-r0: task do_install: Succeeded
NOTE: Running task 1517 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_install_ptest_base)
NOTE: recipe dbus-1.14.0-r0: task do_install_ptest_base: Started
NOTE: recipe dbus-1.14.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1518 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_package)
NOTE: recipe dbus-1.14.0-r0: task do_package: Started
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_package: Succeeded
NOTE: Running task 1519 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_43.0.bb:do_packagedata)
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_packagedata: Started
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1520 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_43.0.bb:do_package_write_rpm)
NOTE: Running task 1521 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_43.0.bb:do_package_qa)
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_package_write_rpm: Started
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_package_qa: Started
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_package_qa: Succeeded
NOTE: recipe gsettings-desktop-schemas-43.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe dbus-1.14.0-r0: task do_package: Succeeded
NOTE: Running task 1522 of 1535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_packagedata)
NOTE: recipe dbus-1.14.0-r0: task do_packagedata: Started
NOTE: recipe dbus-1.14.0-r0: task do_packagedata: Failed
NOTE: recipe libxml2-2.9.14-r0: task do_compile_ptest_base: Succeeded
NOTE: Tasks Summary: Attempted 1522 tasks of which 1468 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 42 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: xz-5.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-src went backwards which would break package feeds (from 0:5.2.7-r0 to 0:5.2.6-r0) [version-going-backwards]
ERROR: xz-5.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-dbg went backwards which would break package feeds (from 0:5.2.7-r0 to 0:5.2.6-r0) [version-going-backwards]
ERROR: xz-5.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package liblzma went backwards which would break package feeds (from 0:5.2.7-r0 to 0:5.2.6-r0) [version-going-backwards]
ERROR: xz-5.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-staticdev went backwards which would break package feeds (from 0:5.2.7-r0 to 0:5.2.6-r0) [version-going-backwards]
ERROR: xz-5.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-dev went backwards which would break package feeds (from 0:5.2.7-r0 to 0:5.2.6-r0) [version-going-backwards]
ERROR: xz-5.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-doc went backwards which would break package feeds (from 0:5.2.7-r0 to 0:5.2.6-r0) [version-going-backwards]
ERROR: xz-5.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz went backwards which would break package feeds (from 0:5.2.7-r0 to 0:5.2.6-r0) [version-going-backwards]
ERROR: xz-5.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-ca went backwards which would break package feeds (from 0:5.2.7-r0 to 0:5.2.6-r0) [version-going-backwards]
ERROR: xz-5.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-cs went backwards which would break package feeds (from 0:5.2.7-r0 to 0:5.2.6-r0) [version-going-backwards]
ERROR: xz-5.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-da went backwards which would break package feeds (from 0:5.2.7-r0 to 0:5.2.6-r0) [version-going-backwards]
ERROR: xz-5.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-de went backwards which would break package feeds (from 0:5.2.7-r0 to 0:5.2.6-r0) [version-going-backwards]
ERROR: xz-5.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-eo went backwards which would break package feeds (from 0:5.2.7-r0 to 0:5.2.6-r0) [version-going-backwards]
ERROR: xz-5.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-es went backwards which would break package feeds (from 0:5.2.7-r0 to 0:5.2.6-r0) [version-going-backwards]
ERROR: xz-5.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-fi went backwards which would break package feeds (from 0:5.2.7-r0 to 0:5.2.6-r0) [version-going-backwards]
ERROR: xz-5.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-fr went backwards which would break package feeds (from 0:5.2.7-r0 to 0:5.2.6-r0) [version-going-backwards]
ERROR: xz-5.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-hr went backwards which would break package feeds (from 0:5.2.7-r0 to 0:5.2.6-r0) [version-going-backwards]
ERROR: xz-5.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-hu went backwards which would break package feeds (from 0:5.2.7-r0 to 0:5.2.6-r0) [version-going-backwards]
ERROR: xz-5.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-it went backwards which would break package feeds (from 0:5.2.7-r0 to 0:5.2.6-r0) [version-going-backwards]
ERROR: xz-5.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-ko went backwards which would break package feeds (from 0:5.2.7-r0 to 0:5.2.6-r0) [version-going-backwards]
ERROR: xz-5.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-pl went backwards which would break package feeds (from 0:5.2.7-r0 to 0:5.2.6-r0) [version-going-backwards]
ERROR: xz-5.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-pt went backwards which would break package feeds (from 0:5.2.7-r0 to 0:5.2.6-r0) [version-going-backwards]
ERROR: xz-5.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-pt-br went backwards which would break package feeds (from 0:5.2.7-r0 to 0:5.2.6-r0) [version-going-backwards]
ERROR: xz-5.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-ro went backwards which would break package feeds (from 0:5.2.7-r0 to 0:5.2.6-r0) [version-going-backwards]
ERROR: xz-5.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-sr went backwards which would break package feeds (from 0:5.2.7-r0 to 0:5.2.6-r0) [version-going-backwards]
ERROR: xz-5.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-sv went backwards which would break package feeds (from 0:5.2.7-r0 to 0:5.2.6-r0) [version-going-backwards]
ERROR: xz-5.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-uk went backwards which would break package feeds (from 0:5.2.7-r0 to 0:5.2.6-r0) [version-going-backwards]
ERROR: xz-5.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-vi went backwards which would break package feeds (from 0:5.2.7-r0 to 0:5.2.6-r0) [version-going-backwards]
ERROR: xz-5.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-zh-cn went backwards which would break package feeds (from 0:5.2.7-r0 to 0:5.2.6-r0) [version-going-backwards]
ERROR: xz-5.2.6-r0 do_packagedata_setscene: QA Issue: Package version for package xz-locale-zh-tw went backwards which would break package feeds (from 0:5.2.7-r0 to 0:5.2.6-r0) [version-going-backwards]
ERROR: xz-5.2.6-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: dbus-1.14.0-r0 do_packagedata: QA Issue: Package version for package dbus-src went backwards which would break package feeds (from 0:1.14.4-r0 to 0:1.14.0-r0) [version-going-backwards]
ERROR: dbus-1.14.0-r0 do_packagedata: QA Issue: Package version for package dbus-dbg went backwards which would break package feeds (from 0:1.14.4-r0 to 0:1.14.0-r0) [version-going-backwards]
ERROR: dbus-1.14.0-r0 do_packagedata: QA Issue: Package version for package dbus-lib went backwards which would break package feeds (from 0:1.14.4-r0 to 0:1.14.0-r0) [version-going-backwards]
ERROR: dbus-1.14.0-r0 do_packagedata: QA Issue: Package version for package dbus-common went backwards which would break package feeds (from 0:1.14.4-r0 to 0:1.14.0-r0) [version-going-backwards]
ERROR: dbus-1.14.0-r0 do_packagedata: QA Issue: Package version for package dbus-tools went backwards which would break package feeds (from 0:1.14.4-r0 to 0:1.14.0-r0) [version-going-backwards]
ERROR: dbus-1.14.0-r0 do_packagedata: QA Issue: Package version for package dbus-ptest went backwards which would break package feeds (from 0:1.14.4-r0 to 0:1.14.0-r0) [version-going-backwards]
ERROR: dbus-1.14.0-r0 do_packagedata: QA Issue: Package version for package dbus-staticdev went backwards which would break package feeds (from 0:1.14.4-r0 to 0:1.14.0-r0) [version-going-backwards]
ERROR: dbus-1.14.0-r0 do_packagedata: QA Issue: Package version for package dbus-dev went backwards which would break package feeds (from 0:1.14.4-r0 to 0:1.14.0-r0) [version-going-backwards]
ERROR: dbus-1.14.0-r0 do_packagedata: QA Issue: Package version for package dbus-doc went backwards which would break package feeds (from 0:1.14.4-r0 to 0:1.14.0-r0) [version-going-backwards]
ERROR: dbus-1.14.0-r0 do_packagedata: QA Issue: Package version for package dbus-locale went backwards which would break package feeds (from 0:1.14.4-r0 to 0:1.14.0-r0) [version-going-backwards]
ERROR: dbus-1.14.0-r0 do_packagedata: QA Issue: Package version for package dbus went backwards which would break package feeds (from 0:1.14.4-r0 to 0:1.14.0-r0) [version-going-backwards]
ERROR: dbus-1.14.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/dbus/1.14.0-r0/temp/log.do_packagedata.3053215
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_packagedata) failed with exit code '1'

--===============5045417752370030736==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-dbg: PV changed from "42.0" to "43.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-dbg: PKGV changed from 42.0 [default] to 43.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-dev: PKGSIZE changed from 28164 to 29021 (+3%)
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-dev: PV changed from "42.0" to "43.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-dev: PKGV changed from 42.0 [default] to 43.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-doc: PV changed from "42.0" to "43.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-doc: PKGV changed from 42.0 [default] to 43.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-as: PV changed from "42.0" to "43.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-as: PKGV changed from 42.0 [default] to 43.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-bg: PKGSIZE changed from 6375 to 150974 (+2268%)
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-bg: PV changed from "42.0" to "43.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-bg: PKGV changed from 42.0 [default] to 43.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-bs: PV changed from "42.0" to "43.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-bs: PKGV changed from 42.0 [default] to 43.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ca+valencia: PV changed from "42.0" to "43.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ca+valencia: PKGV changed from 42.0 [default] to 43.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ca: PKGSIZE changed from 113653 to 116716 (+3%)
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ca: PV changed from "42.0" to "43.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ca: PKGV changed from 42.0 [default] to 43.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-cs: PKGSIZE changed from 110797 to 113885 (+3%)
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-cs: PV changed from "42.0" to "43.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-cs: PKGV changed from 42.0 [default] to 43.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-da: PKGSIZE changed from 106001 to 108967 (+3%)
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-da: PV changed from "42.0" to "43.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-da: PKGV changed from 42.0 [default] to 43.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-de: PKGSIZE changed from 112021 to 113088 (+1%)
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-de: PV changed from "42.0" to "43.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-de: PKGV changed from 42.0 [default] to 43.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-el: PV changed from "42.0" to "43.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-el: PKGV changed from 42.0 [default] to 43.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-en-gb: PV changed from "42.0" to "43.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-en-gb: PKGV changed from 42.0 [default] to 43.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-eo: PV changed from "42.0" to "43.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-eo: PKGV changed from 42.0 [default] to 43.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-es: PKGSIZE changed from 112739 to 115852 (+3%)
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-es: PV changed from "42.0" to "43.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-es: PKGV changed from 42.0 [default] to 43.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-eu: PKGSIZE changed from 110154 to 113330 (+3%)
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-eu: PV changed from "42.0" to "43.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-eu: PKGV changed from 42.0 [default] to 43.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-fi: PV changed from "42.0" to "43.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-fi: PKGV changed from 42.0 [default] to 43.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-fr: PKGSIZE changed from 119611 to 119612 (+0%)
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-fr: PV changed from "42.0" to "43.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-fr: PKGV changed from 42.0 [default] to 43.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-fur: PKGSIZE changed from 103125 to 108103 (+5%)
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-fur: PV changed from "42.0" to "43.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-fur: PKGV changed from 42.0 [default] to 43.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-gl: PKGSIZE changed from 111152 to 114247 (+3%)
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-gl: PV changed from "42.0" to "43.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-gl: PKGV changed from 42.0 [default] to 43.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-gu: PV changed from "42.0" to "43.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-gu: PKGV changed from 42.0 [default] to 43.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-he: PKGSIZE changed from 103722 to 106724 (+3%)
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-he: PV changed from "42.0" to "43.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-he: PKGV changed from 42.0 [default] to 43.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-hi: PV changed from "42.0" to "43.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-hi: PKGV changed from 42.0 [default] to 43.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-hr: PKGSIZE changed from 105585 to 108580 (+3%)
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-hr: PV changed from "42.0" to "43.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-hr: PKGV changed from 42.0 [default] to 43.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-hu: PKGSIZE changed from 114382 to 117640 (+3%)
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-hu: PV changed from "42.0" to "43.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-hu: PKGV changed from 42.0 [default] to 43.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-id: PKGSIZE changed from 105991 to 109100 (+3%)
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-id: PV changed from "42.0" to "43.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-id: PKGV changed from 42.0 [default] to 43.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-is: PV changed from "42.0" to "43.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-is: PKGV changed from 42.0 [default] to 43.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-it: PV changed from "42.0" to "43.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-it: PKGV changed from 42.0 [default] to 43.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ja: PV changed from "42.0" to "43.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ja: PKGV changed from 42.0 [default] to 43.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-kk: PV changed from "42.0" to "43.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-kk: PKGV changed from 42.0 [default] to 43.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-lt: PKGSIZE changed from 106750 to 109739 (+3%)
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-lt: PV changed from "42.0" to "43.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-lt: PKGV changed from 42.0 [default] to 43.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-lv: PV changed from "42.0" to "43.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-lv: PKGV changed from 42.0 [default] to 43.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ml: PV changed from "42.0" to "43.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ml: PKGV changed from 42.0 [default] to 43.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ms: PV changed from "42.0" to "43.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ms: PKGV changed from 42.0 [default] to 43.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-nb: PV changed from "42.0" to "43.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-nb: PKGV changed from 42.0 [default] to 43.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ne: PV changed from "42.0" to "43.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ne: PKGV changed from 42.0 [default] to 43.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-nl: PKGSIZE changed from 54139 to 56063 (+4%)
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-nl: PV changed from "42.0" to "43.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-nl: PKGV changed from 42.0 [default] to 43.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-oc: PV changed from "42.0" to "43.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-oc: PKGV changed from 42.0 [default] to 43.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-or: PV changed from "42.0" to "43.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-or: PKGV changed from 42.0 [default] to 43.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-pa: PV changed from "42.0" to "43.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-pa: PKGV changed from 42.0 [default] to 43.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-pl: PKGSIZE changed from 113131 to 116315 (+3%)
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-pl: PV changed from "42.0" to "43.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-pl: PKGV changed from 42.0 [default] to 43.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-pt-br: PKGSIZE changed from 111133 to 114280 (+3%)
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-pt-br: PV changed from "42.0" to "43.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-pt-br: PKGV changed from 42.0 [default] to 43.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-pt: PKGSIZE changed from 110551 to 113724 (+3%)
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-pt: PV changed from "42.0" to "43.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-pt: PKGV changed from 42.0 [default] to 43.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ro: PV changed from "42.0" to "43.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ro: PKGV changed from 42.0 [default] to 43.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ru: PKGSIZE changed from 146992 to 151416 (+3%)
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ru: PV changed from "42.0" to "43.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ru: PKGV changed from 42.0 [default] to 43.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-sk: PV changed from "42.0" to "43.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-sk: PKGV changed from 42.0 [default] to 43.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-sl: PKGSIZE changed from 105109 to 108053 (+3%)
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-sl: PV changed from "42.0" to "43.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-sl: PKGV changed from 42.0 [default] to 43.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-sr+latin: PV changed from "42.0" to "43.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-sr+latin: PKGV changed from 42.0 [default] to 43.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-sr: PKGSIZE changed from 142734 to 142864 (+0%)
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-sr: PV changed from "42.0" to "43.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-sr: PKGV changed from 42.0 [default] to 43.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-sv: PKGSIZE changed from 108641 to 111701 (+3%)
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-sv: PV changed from "42.0" to "43.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-sv: PKGV changed from 42.0 [default] to 43.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-tg: PV changed from "42.0" to "43.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-tg: PKGV changed from 42.0 [default] to 43.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-tr: PKGSIZE changed from 112763 to 115933 (+3%)
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-tr: PV changed from "42.0" to "43.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-tr: PKGV changed from 42.0 [default] to 43.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ug: PV changed from "42.0" to "43.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-ug: PKGV changed from 42.0 [default] to 43.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-uk: PKGSIZE changed from 147375 to 151787 (+3%)
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-uk: PV changed from "42.0" to "43.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-uk: PKGV changed from 42.0 [default] to 43.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-vi: PV changed from "42.0" to "43.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-vi: PKGV changed from 42.0 [default] to 43.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-zh-cn: PKGSIZE changed from 97316 to 100029 (+3%)
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-zh-cn: PV changed from "42.0" to "43.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-zh-cn: PKGV changed from 42.0 [default] to 43.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-zh-hk: PV changed from "42.0" to "43.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-zh-hk: PKGV changed from 42.0 [default] to 43.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-zh-tw: PV changed from "42.0" to "43.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-locale-zh-tw: PKGV changed from 42.0 [default] to 43.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-src: PV changed from "42.0" to "43.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-src: PKGV changed from 42.0 [default] to 43.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-staticdev: PV changed from "42.0" to "43.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas-staticdev: PKGV changed from 42.0 [default] to 43.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas: PKGSIZE changed from 147541 to 150439 (+2%)
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas: PV changed from "42.0" to "43.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas/gsettings-desktop-schemas: PKGV changed from 42.0 [default] to 43.0 [default]
packages/core2-32-poky-linux/gsettings-desktop-schemas: PACKAGES: added "gsettings-desktop-schemas-locale-ab gsettings-desktop-schemas-locale-ka"
packages/core2-32-poky-linux/gsettings-desktop-schemas: SRC_URI changed from "https://download.gnome.org/sources//gsettings-desktop-schemas/42/gsettings-desktop-schemas-42.0.tar.xz;name=archive" to "https://download.gnome.org/sources//gsettings-desktop-schemas/43/gsettings-desktop-schemas-43.0.tar.xz;name=archive"
packages/core2-32-poky-linux/gsettings-desktop-schemas: PV changed from "42.0" to "43.0"
packages/core2-32-poky-linux/gsettings-desktop-schemas: PKGV changed from 42.0 [default] to 43.0 [default]

--===============5045417752370030736==--

