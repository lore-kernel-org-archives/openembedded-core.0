Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18811C54FB3
	for <webhook@archiver.kernel.org>; Thu, 15 May 2025 12:32:13 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.11030.1747312308491238990
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 May 2025 05:32:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=mAZO8+9N;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=NEaATKmY;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 01010196d3ee42c1-852f2d70-5ea3-4169-8492-66491c14a21b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1747312329;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=KNPpNN1FEUCYIg0GIkZc85TreHWIEcdw/iE8GqfsdsM=;
	b=mAZO8+9NjH3N/5oV0WnoA1ZsqM9/NMrxv+AevDbyu+htI1gk6vWXFkpX5nJNXL7D
	hT4UmM25OktLc2SThQ7+dqM4Y4adCcMRv1GUkgfRQjlppQf2EQYLzaADjDEgMHYZqsK
	sOxugwoeonuIcvr4jIIufMH/5OpXpn15wWSmI06s=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1747312329;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=KNPpNN1FEUCYIg0GIkZc85TreHWIEcdw/iE8GqfsdsM=;
	b=NEaATKmYzVDFy1Fu6fPRLih+X0yzLQTHTxpHY1/m6l8OVTptsS1IwbxxFViwQEQv
	fqmvp0S2VGPk8CLhYiMhio208pXOhuyTOceUYilVTTqjMrLm9BajlTbOyPI8UZKOzCN
	TwkcW1AxJgTeZ1/RA/Ne6rZsf730KnOD/K7t8ol4=
Content-Type: multipart/mixed; boundary="===============1552815724397779346=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] sqlite3: upgrading to 3.49.2 FAILED
Message-ID: <01010196d3ee42c1-852f2d70-5ea3-4169-8492-66491c14a21b-000000@us-west-2.amazonses.com>
Date: Thu, 15 May 2025 12:32:09 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.05.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 May 2025 12:32:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216665

--===============1552815724397779346==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *sqlite3* to *3.49.2* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-sqlite3-upgrade-3.48.0-3.49.2.patch
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
From b31a5c8974424a2c64fe1d96dda4cb7970d49aa3 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 May 2025 12:29:27 +0000
Subject: [PATCH] sqlite3: upgrade 3.48.0 -> 3.49.2

---
 .../sqlite/{sqlite3_3.48.0.bb => sqlite3_3.49.2.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/sqlite/{sqlite3_3.48.0.bb => sqlite3_3.49.2.bb} (69%)

diff --git a/meta/recipes-support/sqlite/sqlite3_3.48.0.bb b/meta/recipes-support/sqlite/sqlite3_3.49.2.bb
similarity index 69%
rename from meta/recipes-support/sqlite/sqlite3_3.48.0.bb
rename to meta/recipes-support/sqlite/sqlite3_3.49.2.bb
index bd2ac6614d..b2c28cf432 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.48.0.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.49.2.bb
@@ -4,5 +4,5 @@ LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=786d3dc581eff03f4fd9e4a77ed00c66"
 
 SRC_URI = "http://www.sqlite.org/2025/sqlite-autoconf-${SQLITE_PV}.tar.gz"
-SRC_URI[sha256sum] = "ac992f7fca3989de7ed1fe99c16363f848794c8c32a158dafd4eb927a2e02fd5"
+SRC_URI[sha256sum] = "5c6d8697e8a32a1512a9be5ad2b2e7a891241c334f56f8b0fb4fc6051e1652e8"
 
-- 
2.47.1


--===============1552815724397779346==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-sqlite3-upgrade-3.48.0-3.49.2.patch"

RnJvbSBiMzFhNWM4OTc0NDI0YTJjNjRmZTFkOTZkZGE0Y2I3OTcwZDQ5YWEzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgTWF5IDIwMjUgMTI6Mjk6MjcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBz
cWxpdGUzOiB1cGdyYWRlIDMuNDguMCAtPiAzLjQ5LjIKCi0tLQogLi4uL3NxbGl0ZS97c3FsaXRl
M18zLjQ4LjAuYmIgPT4gc3FsaXRlM18zLjQ5LjIuYmJ9ICAgICAgICAgICAgIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvc3FsaXRlL3tzcWxpdGUzXzMuNDguMC5iYiA9PiBzcWxpdGUzXzMuNDku
Mi5iYn0gKDY5JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9zcWxpdGUvc3Fs
aXRlM18zLjQ4LjAuYmIgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9zcWxpdGUvc3FsaXRlM18zLjQ5
LjIuYmIKc2ltaWxhcml0eSBpbmRleCA2OSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLXN1cHBv
cnQvc3FsaXRlL3NxbGl0ZTNfMy40OC4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtc3VwcG9y
dC9zcWxpdGUvc3FsaXRlM18zLjQ5LjIuYmIKaW5kZXggYmQyYWM2NjE0ZC4uYjJjMjhjZjQzMiAx
MDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvc3FsaXRlL3NxbGl0ZTNfMy40OC4wLmJi
CisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L3NxbGl0ZS9zcWxpdGUzXzMuNDkuMi5iYgpAQCAt
NCw1ICs0LDUgQEAgTElDRU5TRSA9ICJQRCIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL3Nx
bGl0ZTMuaDtlbmRsaW5lPTExO21kNT03ODZkM2RjNTgxZWZmMDNmNGZkOWU0YTc3ZWQwMGM2NiIK
IAogU1JDX1VSSSA9ICJodHRwOi8vd3d3LnNxbGl0ZS5vcmcvMjAyNS9zcWxpdGUtYXV0b2NvbmYt
JHtTUUxJVEVfUFZ9LnRhci5neiIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJhYzk5MmY3ZmNhMzk4
OWRlN2VkMWZlOTljMTYzNjNmODQ4Nzk0YzhjMzJhMTU4ZGFmZDRlYjkyN2EyZTAyZmQ1IgorU1JD
X1VSSVtzaGEyNTZzdW1dID0gIjVjNmQ4Njk3ZThhMzJhMTUxMmE5YmU1YWQyYjJlN2E4OTEyNDFj
MzM0ZjU2ZjhiMGZiNGZjNjA1MWUxNjUyZTgiCiAKLS0gCjIuNDcuMQoK

--===============1552815724397779346==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1918 entries from dependency cache.
Parsing recipes...done.
Parsing of 937 .bb files complete (936 cached, 1 parsed). 1916 targets, 39 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.12.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:da2291f35ae75772f7ede2e00588384eb4084d55"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 154 Local 83 Mirrors 0 Missed 71 Current 210 (53% match, 80% complete)
Removing 29 stale sstate objects for arch x86_64...done.
Removing 4 stale sstate objects for arch core2-64...done.
Removing 4 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 285 of 364 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pseudo/pseudo_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 297 of 364 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 303 of 364 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 307 of 364 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_15.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 309 of 364 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 315 of 364 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.41.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 319 of 364 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_15.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 321 of 364 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_15.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 324 of 364 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.75.bb:do_create_spdx_setscene)
NOTE: Running setscene task 341 of 364 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_create_spdx_setscene)
NOTE: Running setscene task 346 of 364 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 155 of 1085 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.49.2.bb:do_recipe_qa)
NOTE: recipe libtool-cross-2.5.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe pseudo-native-1.9.0+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcc-initial-15.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcc-initial-15.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-15.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-runtime-15.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-native-2.75-r0: task do_create_spdx_setscene: Started
NOTE: recipe glibc-2.41+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sqlite3-native-3_3.49.2-r0: task do_recipe_qa: Started
NOTE: recipe gdbm-native-1.24-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 349 of 364 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe pseudo-native-1.9.0+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcc-initial-15.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-initial-15.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcc-15.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 649 of 1085 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pseudo/pseudo_git.bb:do_fetch)
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running noexec task 651 of 1085 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_15.1.bb:do_fetch)
NOTE: recipe gcc-runtime-15.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 352 of 364 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.44.bb:do_create_spdx_setscene)
NOTE: Running setscene task 355 of 364 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_15.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-native-2.75-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-native-3.13.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glibc-2.41+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gdbm-native-1.24-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 669 of 1085 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.41.bb:do_fetch)
NOTE: recipe python3-native-3.13.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.44-r0: task do_create_spdx_setscene: Started
NOTE: Running task 713 of 1085 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_fetch)
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pseudo-native-1.9.0+git-r0: task do_fetch: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running noexec task 742 of 1085 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.1.bb:do_fetch)
NOTE: Running noexec task 754 of 1085 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_fetch)
NOTE: Running task 756 of 1085 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_fetch)
NOTE: Running task 757 of 1085 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.49.2.bb:do_recipe_qa)
NOTE: recipe sqlite3-native-3_3.49.2-r0: task do_recipe_qa: Succeeded
NOTE: Running task 770 of 1085 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.49.2.bb:do_fetch)
NOTE: recipe glibc-2.41+git-r0: task do_fetch: Started
NOTE: recipe binutils-cross-x86_64-2.44-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe glibc-2.41+git-r0: task do_fetch: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_fetch: Started
NOTE: Running task 818 of 1085 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.41.bb:do_unpack)
NOTE: recipe sqlite3-3_3.49.2-r0: task do_recipe_qa: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_fetch: Succeeded
NOTE: Running task 820 of 1085 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_unpack)
NOTE: recipe sqlite3-native-3_3.49.2-r0: task do_fetch: Started
NOTE: recipe python3-native-3.13.2-r0: task do_fetch: Started
NOTE: recipe pseudo-native-1.9.0+git-r0: task do_fetch: Succeeded
NOTE: recipe sqlite3-native-3_3.49.2-r0: task do_fetch: Succeeded
NOTE: Running task 821 of 1085 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pseudo/pseudo_git.bb:do_unpack)
NOTE: Running task 822 of 1085 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.49.2.bb:do_unpack)
NOTE: Running task 823 of 1085 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.49.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-native-3.13.2-r0: task do_fetch: Succeeded
NOTE: Running task 824 of 1085 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_unpack)
NOTE: recipe libtool-cross-2.5.4-r0: task do_unpack: Started
NOTE: recipe glibc-2.41+git-r0: task do_unpack: Started
NOTE: recipe pseudo-native-1.9.0+git-r0: task do_unpack: Started
NOTE: recipe sqlite3-native-3_3.49.2-r0: task do_unpack: Started
NOTE: recipe sqlite3-3_3.49.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe sqlite3-native-3_3.49.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 825 of 1085 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.49.2.bb:do_fetch)
NOTE: recipe libtool-cross-2.5.4-r0: task do_unpack: Succeeded
NOTE: Running task 826 of 1085 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_patch)
NOTE: recipe python3-native-3.13.2-r0: task do_unpack: Started
NOTE: recipe sqlite3-3_3.49.2-r0: task do_fetch: Started
NOTE: recipe sqlite3-native-3_3.49.2-r0: task do_unpack: Succeeded
NOTE: Running task 827 of 1085 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.49.2.bb:do_patch)
NOTE: Running task 828 of 1085 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.49.2.bb:do_collect_spdx_deps)
NOTE: recipe sqlite3-3_3.49.2-r0: task do_fetch: Succeeded
NOTE: Running task 829 of 1085 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.49.2.bb:do_unpack)
NOTE: recipe libtool-cross-2.5.4-r0: task do_patch: Started
NOTE: recipe sqlite3-native-3_3.49.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe sqlite3-3_3.49.2-r0: task do_unpack: Started
NOTE: recipe sqlite3-native-3_3.49.2-r0: task do_patch: Started
NOTE: recipe sqlite3-native-3_3.49.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe sqlite3-native-3_3.49.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe sqlite3-native-3_3.49.2-r0: task do_patch: Succeeded
NOTE: Running task 830 of 1085 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.49.2.bb:do_deploy_source_date_epoch)
NOTE: recipe sqlite3-3_3.49.2-r0: task do_unpack: Succeeded
NOTE: Running task 831 of 1085 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.49.2.bb:do_patch)
NOTE: recipe sqlite3-native-3_3.49.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe sqlite3-3_3.49.2-r0: task do_patch: Started
NOTE: recipe pseudo-native-1.9.0+git-r0: task do_unpack: Succeeded
NOTE: recipe sqlite3-3_3.49.2-r0: task do_patch: Succeeded
NOTE: Running task 832 of 1085 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pseudo/pseudo_git.bb:do_patch)
NOTE: Running task 833 of 1085 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.49.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 834 of 1085 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.49.2.bb:do_populate_lic)
NOTE: recipe sqlite3-native-3_3.49.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe sqlite3-3_3.49.2-r0: task do_populate_lic: Started
NOTE: recipe sqlite3-3_3.49.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 835 of 1085 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.49.2.bb:do_configure)
NOTE: recipe pseudo-native-1.9.0+git-r0: task do_patch: Started
NOTE: recipe sqlite3-native-3_3.49.2-r0: task do_configure: Started
NOTE: recipe pseudo-native-1.9.0+git-r0: task do_patch: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_patch: Succeeded
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 358 of 364 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_15.1.bb:do_gcc_stash_builddir_setscene)
NOTE: recipe sqlite3-3_3.49.2-r0: task do_populate_lic: Succeeded
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_gcc_stash_builddir_setscene: Started
NOTE: recipe sqlite3-3_3.49.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-native-3.13.2-r0: task do_unpack: Succeeded
NOTE: Running task 838 of 1085 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_patch)
NOTE: recipe python3-native-3.13.2-r0: task do_patch: Started
NOTE: recipe glibc-2.41+git-r0: task do_unpack: Succeeded
NOTE: Running task 839 of 1085 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.41.bb:do_patch)
NOTE: recipe glibc-2.41+git-r0: task do_patch: Started
NOTE: recipe python3-native-3.13.2-r0: task do_patch: Succeeded
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_gcc_stash_builddir_setscene: Succeeded
NOTE: Running setscene task 361 of 364 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.44.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 362 of 364 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe binutils-cross-x86_64-2.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 851 of 1085 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_fetch)
NOTE: recipe linux-libc-headers-6.12-r0: task do_fetch: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_fetch: Succeeded
NOTE: Running task 852 of 1085 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_unpack)
NOTE: recipe linux-libc-headers-6.12-r0: task do_unpack: Started
NOTE: recipe binutils-cross-x86_64-2.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe glibc-2.41+git-r0: task do_patch: Succeeded
NOTE: recipe linux-libc-headers-6.12-r0: task do_unpack: Succeeded
NOTE: Running task 865 of 1085 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_patch)
NOTE: Running task 866 of 1085 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_collect_spdx_deps)
NOTE: recipe linux-libc-headers-6.12-r0: task do_patch: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_collect_spdx_deps: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe linux-libc-headers-6.12-r0: task do_patch: Succeeded
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-native_2.5.4.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt-native_0.68.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf_2.72.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/automake/automake_1.17.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['gettext-minimal-native', 'libtool-native', 'm4-native', 'quilt-native', 'texinfo-dummy-native', 'autoconf-native', 'automake-native', 'gnu-config-native', 'pkgconfig-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function autotools_preconfigure
| DEBUG: Shell function autotools_preconfigure finished
| DEBUG: Executing python function autotools_sitefiles
| DEBUG: SITE files ['endian-little', 'common-linux', 'common-glibc', 'bit-64', 'x86_64-linux', 'common']
| DEBUG: Python function autotools_sitefiles finished
| DEBUG: Executing shell function do_configure
| NOTE: Running ../sqlite-autoconf-3490200/configure  --build=x86_64-linux 		  --host=x86_64-linux 		  --target=x86_64-linux 		  --prefix=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/sqlite3-native/3.49.2/recipe-sysroot-native/usr 		  --exec_prefix=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/sqlite3-native/3.49.2/recipe-sysroot-native/usr 		  --bindir=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/sqlite3-native/3.49.2/recipe-sysroot-native/usr/bin 		  --sbindir=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/sqlite3-native/3.49.2/recipe-sysroot-native/usr/sbin 		  --libexecdir=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/sqlite3-native/3.49.2/recipe-sysroot-native/usr/libexec 		  --datadir=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/sqlite3-native/3.49.2/recipe-sysroot-native/usr/share 		  --sysconfdir=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-
 linux/sqlite3-native/3.49.2/recipe-sysroot-native/etc 		  --sharedstatedir=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/sqlite3-native/3.49.2/recipe-sysroot-native/com 		  --localstatedir=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/sqlite3-native/3.49.2/recipe-sysroot-native/var 		  --libdir=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/sqlite3-native/3.49.2/recipe-sysroot-native/usr/lib 		  --includedir=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/sqlite3-native/3.49.2/recipe-sysroot-native/usr/include 		  --oldincludedir=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/sqlite3-native/3.49.2/recipe-sysroot-native/usr/include 		  --infodir=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/sqlite3-native/3.49.2/recipe-sysroot-native/usr/share/info 		  --mandir=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/sqlite3-native/3.49.2/recipe-sysroot-native/
 usr/share/man 		  --disable-silent-rules 		  --disable-dependency-tracking      --enable-shared     --enable-threadsafe     --disable-static-shell  --disable-static  --enable-dynamic-extensions --disable-editline --disable-fts3 --enable-fts4 --enable-fts5 --disable-readline --enable-rtree --disable-session
| No installed jimsh or tclsh, building local bootstrap jimsh0
| Configuring SQLite version 3.49.2
| Host System...x86_64-pc-linux-gnu
| Build System...x86_64-pc-linux-gnu
| Source dir = /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/sqlite3-native/3.49.2/sqlite-autoconf-3490200
| Build dir  = /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/sqlite3-native/3.49.2/build
| Error: Unknown option --target
| Try: 'configure --help' for options
| NOTE: The following config.log files may provide further information.
| NOTE: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/sqlite3-native/3.49.2/build/config.log
| ERROR: configure failed
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/sqlite3-native/3.49.2/temp/run.do_configure.1523805:267 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/sqlite3-native/3.49.2/temp/run.do_configure.1523805, line 267
| 	#2: oe_runconf, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/sqlite3-native/3.49.2/temp/run.do_configure.1523805, line 243
| 	#3: autotools_do_configure, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/sqlite3-native/3.49.2/temp/run.do_configure.1523805, line 216
| 	#4: do_configure, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/sqlite3-native/3.49.2/temp/run.do_configure.1523805, line 151
| 	#5: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/sqlite3-native/3.49.2/temp/run.do_configure.1523805, line 271
NOTE: recipe sqlite3-native-3_3.49.2-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 867 tasks of which 834 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250515122914.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250515122914.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.49.2.bb:do_configure
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/sqlite3-native/3.49.2/temp/log.do_configure.1523805
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: sqlite3-native-3_3.49.2-r0 do_configure: configure failed
ERROR: sqlite3-native-3_3.49.2-r0 do_configure: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/sqlite3-native/3.49.2/temp/run.do_configure.1523805' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/sqlite3-native/3.49.2/temp/log.do_configure.1523805
ERROR: Task (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.49.2.bb:do_configure) failed with exit code '1'

--===============1552815724397779346==--

