Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B862C83F1A
	for <webhook@archiver.kernel.org>; Sun, 15 Jun 2025 13:15:06 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.8874.1749993301246768195
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Jun 2025 06:15:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=YfIHlTDr;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=as8ssw5K;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019773bab1ec-2049ab07-923f-4e8f-a553-48263585d711-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1749993304;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=2GGHnfxOXwjwtzPW4J7ohWjdP/YALIXYJa1lwQ32P6g=;
	b=YfIHlTDraM9htIqjWxdvMHwS9Jxqw4tmf6FRQHUzHGH6VT5ct4rBFSwH7UskOFfr
	h1cqRr1Mo3OQ8SIFVKZXN2krQcFFxHRDBxoIs/zXXaaz87g6kpEEYF2e/aVKkm2Vu9M
	iZqZ2/8bEPO7aqI5hE3LUMqBRXq0QBDOyY1znBmg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1749993304;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=2GGHnfxOXwjwtzPW4J7ohWjdP/YALIXYJa1lwQ32P6g=;
	b=as8ssw5KmZAi7rYoz0p7nb0X1otqqs86BTkCYO4c3c6R+ohibAi0NnzFDZfJ6qJY
	Z7F65TmFPGKA76CGKuEp9bNkgDDd5v9MSqxO5FPaCa0b/yRjg0FqsxYDbZJjhLdd5xO
	g6mQ/NgPLbauJwZdPdOu5doA+/R+3V49L4gYC3ic=
Content-Type: multipart/mixed; boundary="===============7985507857346778379=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] sqlite3: upgrading to 3.50.1 FAILED
Message-ID: <0101019773bab1ec-2049ab07-923f-4e8f-a553-48263585d711-000000@us-west-2.amazonses.com>
Date: Sun, 15 Jun 2025 13:15:04 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.06.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Jun 2025 13:15:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218742

--===============7985507857346778379==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *sqlite3* to *3.50.1* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-sqlite3-upgrade-3.48.0-3.50.1.patch
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
From 2995c8a0e429c4c28b4b65a157e9960e2708948a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Jun 2025 13:12:17 +0000
Subject: [PATCH] sqlite3: upgrade 3.48.0 -> 3.50.1

---
 .../sqlite/{sqlite3_3.48.0.bb => sqlite3_3.50.1.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/sqlite/{sqlite3_3.48.0.bb => sqlite3_3.50.1.bb} (69%)

diff --git a/meta/recipes-support/sqlite/sqlite3_3.48.0.bb b/meta/recipes-support/sqlite/sqlite3_3.50.1.bb
similarity index 69%
rename from meta/recipes-support/sqlite/sqlite3_3.48.0.bb
rename to meta/recipes-support/sqlite/sqlite3_3.50.1.bb
index bd2ac6614d..a997a7bf04 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.48.0.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.50.1.bb
@@ -4,5 +4,5 @@ LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=786d3dc581eff03f4fd9e4a77ed00c66"
 
 SRC_URI = "http://www.sqlite.org/2025/sqlite-autoconf-${SQLITE_PV}.tar.gz"
-SRC_URI[sha256sum] = "ac992f7fca3989de7ed1fe99c16363f848794c8c32a158dafd4eb927a2e02fd5"
+SRC_URI[sha256sum] = "00a65114d697cfaa8fe0630281d76fd1b77afcd95cd5e40ec6a02cbbadbfea71"
 
-- 
2.47.1


--===============7985507857346778379==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-sqlite3-upgrade-3.48.0-3.50.1.patch"

RnJvbSAyOTk1YzhhMGU0MjljNGMyOGI0YjY1YTE1N2U5OTYwZTI3MDg5NDhhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgSnVuIDIwMjUgMTM6MTI6MTcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBz
cWxpdGUzOiB1cGdyYWRlIDMuNDguMCAtPiAzLjUwLjEKCi0tLQogLi4uL3NxbGl0ZS97c3FsaXRl
M18zLjQ4LjAuYmIgPT4gc3FsaXRlM18zLjUwLjEuYmJ9ICAgICAgICAgICAgIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvc3FsaXRlL3tzcWxpdGUzXzMuNDguMC5iYiA9PiBzcWxpdGUzXzMuNTAu
MS5iYn0gKDY5JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9zcWxpdGUvc3Fs
aXRlM18zLjQ4LjAuYmIgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9zcWxpdGUvc3FsaXRlM18zLjUw
LjEuYmIKc2ltaWxhcml0eSBpbmRleCA2OSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLXN1cHBv
cnQvc3FsaXRlL3NxbGl0ZTNfMy40OC4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtc3VwcG9y
dC9zcWxpdGUvc3FsaXRlM18zLjUwLjEuYmIKaW5kZXggYmQyYWM2NjE0ZC4uYTk5N2E3YmYwNCAx
MDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvc3FsaXRlL3NxbGl0ZTNfMy40OC4wLmJi
CisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L3NxbGl0ZS9zcWxpdGUzXzMuNTAuMS5iYgpAQCAt
NCw1ICs0LDUgQEAgTElDRU5TRSA9ICJQRCIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL3Nx
bGl0ZTMuaDtlbmRsaW5lPTExO21kNT03ODZkM2RjNTgxZWZmMDNmNGZkOWU0YTc3ZWQwMGM2NiIK
IAogU1JDX1VSSSA9ICJodHRwOi8vd3d3LnNxbGl0ZS5vcmcvMjAyNS9zcWxpdGUtYXV0b2NvbmYt
JHtTUUxJVEVfUFZ9LnRhci5neiIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJhYzk5MmY3ZmNhMzk4
OWRlN2VkMWZlOTljMTYzNjNmODQ4Nzk0YzhjMzJhMTU4ZGFmZDRlYjkyN2EyZTAyZmQ1IgorU1JD
X1VSSVtzaGEyNTZzdW1dID0gIjAwYTY1MTE0ZDY5N2NmYWE4ZmUwNjMwMjgxZDc2ZmQxYjc3YWZj
ZDk1Y2Q1ZTQwZWM2YTAyY2JiYWRiZmVhNzEiCiAKLS0gCjIuNDcuMQoK

--===============7985507857346778379==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1912 entries from dependency cache.
Parsing recipes...done.
Parsing of 935 .bb files complete (934 cached, 1 parsed). 1910 targets, 39 skipped, 0 masked, 0 errors.
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
workspace            = "tmp-auh-upgrades:624d46d748d59e67a539482db1708537ad3ba566"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 147 Local 76 Mirrors 0 Missed 71 Current 209 (51% match, 80% complete)
Removing 6 stale sstate objects for arch core2-64...done.
Removing 4 stale sstate objects for arch qemux86_64...done.
Removing 13 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 295 of 356 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.44.bb:do_create_spdx_setscene)
NOTE: Running setscene task 304 of 356 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 305 of 356 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pseudo/pseudo_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 311 of 356 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 316 of 356 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 323 of 356 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.41.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 325 of 356 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_15.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 326 of 356 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_15.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 327 of 356 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_15.1.bb:do_gcc_stash_builddir_setscene)
NOTE: Running setscene task 341 of 356 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.8.bb:do_create_spdx_setscene)
NOTE: Running task 165 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.50.1.bb:do_recipe_qa)
NOTE: recipe binutils-cross-x86_64-2.44-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcc-initial-15.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcc-initial-15.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_gcc_stash_builddir_setscene: Started
NOTE: recipe libgcc-15.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-runtime-15.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe pseudo-native-1.9.0+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glibc-2.41+git-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libffi-native-3.4.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe sqlite3-native-3_3.50.1-r0: task do_recipe_qa: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.44-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 350 of 356 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe libgcc-initial-15.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-initial-15.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgcc-15.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-runtime-15.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe pseudo-native-1.9.0+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 670 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pseudo/pseudo_git.bb:do_fetch)
NOTE: Running noexec task 674 of 1061 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc-initial_15.1.bb:do_fetch)
NOTE: recipe glibc-2.41+git-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libffi-native-3.4.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 695 of 1061 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.41.bb:do_fetch)
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running noexec task 730 of 1061 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.1.bb:do_fetch)
NOTE: Running noexec task 742 of 1061 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_fetch)
NOTE: Running task 743 of 1061 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.50.1.bb:do_recipe_qa)
NOTE: recipe pseudo-native-1.9.0+git-r0: task do_fetch: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 792 of 1061 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_fetch)
NOTE: recipe sqlite3-native-3_3.50.1-r0: task do_recipe_qa: Succeeded
NOTE: Running task 801 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.50.1.bb:do_fetch)
NOTE: recipe glibc-2.41+git-r0: task do_fetch: Started
NOTE: recipe sqlite3-3_3.50.1-r0: task do_recipe_qa: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_fetch: Started
NOTE: recipe glibc-2.41+git-r0: task do_fetch: Succeeded
NOTE: Running task 809 of 1061 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.41.bb:do_unpack)
NOTE: recipe libtool-cross-2.5.4-r0: task do_fetch: Succeeded
NOTE: Running task 810 of 1061 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_unpack)
NOTE: recipe sqlite3-native-3_3.50.1-r0: task do_fetch: Started
NOTE: recipe sqlite3-native-3_3.50.1-r0: task do_fetch: Succeeded
NOTE: Running task 811 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.50.1.bb:do_unpack)
NOTE: Running task 812 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.50.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe pseudo-native-1.9.0+git-r0: task do_fetch: Succeeded
NOTE: Running task 813 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pseudo/pseudo_git.bb:do_unpack)
NOTE: recipe libtool-cross-2.5.4-r0: task do_unpack: Started
NOTE: recipe glibc-2.41+git-r0: task do_unpack: Started
NOTE: recipe sqlite3-3_3.50.1-r0: task do_recipe_qa: Succeeded
NOTE: Running task 814 of 1061 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.50.1.bb:do_fetch)
NOTE: recipe sqlite3-native-3_3.50.1-r0: task do_unpack: Started
NOTE: recipe sqlite3-native-3_3.50.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pseudo-native-1.9.0+git-r0: task do_unpack: Started
NOTE: recipe sqlite3-3_3.50.1-r0: task do_fetch: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_unpack: Succeeded
NOTE: Running task 815 of 1061 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_patch)
NOTE: recipe sqlite3-3_3.50.1-r0: task do_fetch: Succeeded
NOTE: recipe sqlite3-native-3_3.50.1-r0: task do_unpack: Succeeded
NOTE: Running task 816 of 1061 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.50.1.bb:do_unpack)
NOTE: Running task 817 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.50.1.bb:do_patch)
NOTE: Running task 818 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.50.1.bb:do_collect_spdx_deps)
NOTE: recipe libtool-cross-2.5.4-r0: task do_patch: Started
NOTE: recipe sqlite3-native-3_3.50.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe sqlite3-3_3.50.1-r0: task do_unpack: Started
NOTE: recipe sqlite3-native-3_3.50.1-r0: task do_patch: Started
NOTE: recipe sqlite3-native-3_3.50.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe sqlite3-native-3_3.50.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe sqlite3-native-3_3.50.1-r0: task do_patch: Succeeded
NOTE: Running task 819 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.50.1.bb:do_deploy_source_date_epoch)
NOTE: recipe sqlite3-3_3.50.1-r0: task do_unpack: Succeeded
NOTE: Running task 820 of 1061 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.50.1.bb:do_patch)
NOTE: recipe sqlite3-3_3.50.1-r0: task do_patch: Started
NOTE: recipe sqlite3-native-3_3.50.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe sqlite3-3_3.50.1-r0: task do_patch: Succeeded
NOTE: Running task 821 of 1061 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.50.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 822 of 1061 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.50.1.bb:do_populate_lic)
NOTE: recipe pseudo-native-1.9.0+git-r0: task do_unpack: Succeeded
NOTE: Running task 823 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pseudo/pseudo_git.bb:do_patch)
NOTE: recipe sqlite3-3_3.50.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe sqlite3-3_3.50.1-r0: task do_populate_lic: Started
NOTE: recipe sqlite3-native-3_3.50.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 824 of 1061 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.50.1.bb:do_configure)
NOTE: recipe pseudo-native-1.9.0+git-r0: task do_patch: Started
NOTE: recipe sqlite3-native-3_3.50.1-r0: task do_configure: Started
NOTE: recipe pseudo-native-1.9.0+git-r0: task do_patch: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_patch: Succeeded
NOTE: recipe sqlite3-3_3.50.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe sqlite3-3_3.50.1-r0: task do_populate_lic: Succeeded
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_gcc_stash_builddir_setscene: Succeeded
NOTE: Running setscene task 355 of 356 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe linux-libc-headers-6.12-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 837 of 1061 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_fetch)
NOTE: recipe linux-libc-headers-6.12-r0: task do_fetch: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_fetch: Succeeded
NOTE: Running task 838 of 1061 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_unpack)
NOTE: recipe linux-libc-headers-6.12-r0: task do_unpack: Started
NOTE: recipe glibc-2.41+git-r0: task do_unpack: Succeeded
NOTE: Running task 839 of 1061 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.41.bb:do_patch)
NOTE: recipe glibc-2.41+git-r0: task do_patch: Started
NOTE: recipe glibc-2.41+git-r0: task do_patch: Succeeded
NOTE: recipe linux-libc-headers-6.12-r0: task do_unpack: Succeeded
NOTE: Running task 841 of 1061 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_patch)
NOTE: Running task 842 of 1061 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_collect_spdx_deps)
NOTE: recipe linux-libc-headers-6.12-r0: task do_patch: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_collect_spdx_deps: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe linux-libc-headers-6.12-r0: task do_patch: Succeeded
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-native_2.5.4.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt-native_0.69.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/autoconf/autoconf_2.72.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/automake/automake_1.17.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['gettext-minimal-native', 'libtool-native', 'm4-native', 'quilt-native', 'texinfo-dummy-native', 'autoconf-native', 'automake-native', 'gnu-config-native', 'pkgconfig-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function autotools_preconfigure
| DEBUG: Shell function autotools_preconfigure finished
| DEBUG: Executing python function autotools_sitefiles
| DEBUG: SITE files ['endian-little', 'common-linux', 'common-glibc', 'bit-64', 'x86_64-linux', 'common']
| DEBUG: Python function autotools_sitefiles finished
| DEBUG: Executing shell function do_configure
| NOTE: Running ../sqlite-autoconf-3500100/configure  --build=x86_64-linux 		  --host=x86_64-linux 		  --target=x86_64-linux 		  --prefix=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/sqlite3-native/3.50.1/recipe-sysroot-native/usr 		  --exec_prefix=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/sqlite3-native/3.50.1/recipe-sysroot-native/usr 		  --bindir=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/sqlite3-native/3.50.1/recipe-sysroot-native/usr/bin 		  --sbindir=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/sqlite3-native/3.50.1/recipe-sysroot-native/usr/sbin 		  --libexecdir=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/sqlite3-native/3.50.1/recipe-sysroot-native/usr/libexec 		  --datadir=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/sqlite3-native/3.50.1/recipe-sysroot-native/usr/share 		  --sysconfdir=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-
 linux/sqlite3-native/3.50.1/recipe-sysroot-native/etc 		  --sharedstatedir=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/sqlite3-native/3.50.1/recipe-sysroot-native/com 		  --localstatedir=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/sqlite3-native/3.50.1/recipe-sysroot-native/var 		  --libdir=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/sqlite3-native/3.50.1/recipe-sysroot-native/usr/lib 		  --includedir=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/sqlite3-native/3.50.1/recipe-sysroot-native/usr/include 		  --oldincludedir=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/sqlite3-native/3.50.1/recipe-sysroot-native/usr/include 		  --infodir=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/sqlite3-native/3.50.1/recipe-sysroot-native/usr/share/info 		  --mandir=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/sqlite3-native/3.50.1/recipe-sysroot-native/
 usr/share/man 		  --disable-silent-rules 		  --disable-dependency-tracking      --enable-shared     --enable-threadsafe     --disable-static-shell  --disable-static  --enable-dynamic-extensions --disable-editline --disable-fts3 --enable-fts4 --enable-fts5 --disable-readline --enable-rtree --disable-session
| No installed jimsh or tclsh, building local bootstrap jimsh0
| Configuring SQLite version 3.50.1
| Host System...x86_64-pc-linux-gnu
| Build System...x86_64-pc-linux-gnu
| Source dir = /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/sqlite3-native/3.50.1/sqlite-autoconf-3500100
| Build dir  = /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/sqlite3-native/3.50.1/build
| C compiler... gcc  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/sqlite3-native/3.50.1/recipe-sysroot-native/usr/include -O2 -pipe -DUSE_PREAD -DSQLITE_ENABLE_COLUMN_METADATA -DSQLITE_BYTEORDER=1234 -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/sqlite3-native/3.50.1/recipe-sysroot-native/usr/include
| C++ compiler... g++  -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/sqlite3-native/3.50.1/recipe-sysroot-native/usr/include -O2 -pipe -fvisibility-inlines-hidden -isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/sqlite3-native/3.50.1/recipe-sysroot-native/usr/include
| Build C compiler...gcc
| Checking for stdlib.h...ok
| Error: Unknown option --target
| Try: 'configure --help' for options
| NOTE: The following config.log files may provide further information.
| NOTE: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/sqlite3-native/3.50.1/build/config.log
| ERROR: configure failed
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/sqlite3-native/3.50.1/temp/run.do_configure.2900282:267 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/sqlite3-native/3.50.1/temp/run.do_configure.2900282, line 267
| 	#2: oe_runconf, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/sqlite3-native/3.50.1/temp/run.do_configure.2900282, line 243
| 	#3: autotools_do_configure, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/sqlite3-native/3.50.1/temp/run.do_configure.2900282, line 216
| 	#4: do_configure, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/sqlite3-native/3.50.1/temp/run.do_configure.2900282, line 151
| 	#5: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/sqlite3-native/3.50.1/temp/run.do_configure.2900282, line 271
NOTE: recipe sqlite3-native-3_3.50.1-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 843 tasks of which 813 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250615131203.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250615131203.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.50.1.bb:do_configure
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/sqlite3-native/3.50.1/temp/log.do_configure.2900282
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: sqlite3-native-3_3.50.1-r0 do_configure: configure failed
ERROR: sqlite3-native-3_3.50.1-r0 do_configure: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/sqlite3-native/3.50.1/temp/run.do_configure.2900282' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/sqlite3-native/3.50.1/temp/log.do_configure.2900282
ERROR: Task (virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.50.1.bb:do_configure) failed with exit code '1'

--===============7985507857346778379==--

