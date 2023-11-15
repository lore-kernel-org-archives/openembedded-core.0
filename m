Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E83A2C5CFC2
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 14:37:16 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.14640.1700059033586237539
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Nov 2023 06:37:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=cJugJtwn;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=W84leSWp;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101018bd36a2d70-1e1c4395-89ce-4d9b-b6b0-4765cd667299-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1700059033;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Hx/HUm76nzM4zWGukFf6nFgdUXJpi57hpl+sftUbbDI=;
	b=cJugJtwniYz/wspLLHDSmqqankbIyCAgID+0Q5hOfdH1KwBJdfiIgL1hTYfjWqDE
	GmB7/xxDChUvV4BUoJyss/tUTe8ddjTEfvya+bP2Rwift5trKN72JlTCuPZPJK99s+z
	pFFzEnXGc1tIK2EWo2o33Qec42+jll1iHvo+BdZA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1700059033;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Hx/HUm76nzM4zWGukFf6nFgdUXJpi57hpl+sftUbbDI=;
	b=W84leSWpYrweoFXvmZHnYPnlITlOzl/Jn7DDCpRKvrTbpLhdqJwZeGJqnJIeK0wF
	qWGdbkWYQvEyAeIU3jn1GxHXGmptyUJHOPa8Vd9wOD0qeCHUUJdNOxpjX0QdxSidbgx
	kwmDkSNIPNj+47boy1gEy6Jeu4fACcE3gHgnjBjI=
Content-Type: multipart/mixed; boundary="===============4708306626899589810=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] mpg123: upgrading to 1.32.3 FAILED
Message-ID: <0101018bd36a2d70-1e1c4395-89ce-4d9b-b6b0-4765cd667299-000000@us-west-2.amazonses.com>
Date: Wed, 15 Nov 2023 14:37:12 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 14:37:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190715

--===============4708306626899589810==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *mpg123* to *1.32.3* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-mpg123-upgrade-1.31.3-1.32.3.patch
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
From 3ac931ad7cf2d6356ba8088c30303f86593eb801 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Nov 2023 13:37:57 +0000
Subject: [PATCH] mpg123: upgrade 1.31.3 -> 1.32.3

---
 .../mpg123/{mpg123_1.31.3.bb => mpg123_1.32.3.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/mpg123/{mpg123_1.31.3.bb => mpg123_1.32.3.bb} (96%)

diff --git a/meta/recipes-multimedia/mpg123/mpg123_1.31.3.bb b/meta/recipes-multimedia/mpg123/mpg123_1.32.3.bb
similarity index 96%
rename from meta/recipes-multimedia/mpg123/mpg123_1.31.3.bb
rename to meta/recipes-multimedia/mpg123/mpg123_1.32.3.bb
index b03ee9f71a..cc3906e207 100644
--- a/meta/recipes-multimedia/mpg123/mpg123_1.31.3.bb
+++ b/meta/recipes-multimedia/mpg123/mpg123_1.32.3.bb
@@ -10,7 +10,7 @@ LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e7b9c15fcfb986abb4cc5e8400a24169"
 
 SRC_URI = "https://www.mpg123.de/download/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "1ca77d3a69a5ff845b7a0536f783fee554e1041139a6b978f6afe14f5814ad1a"
+SRC_URI[sha256sum] = "2d9913a57d4ee8f497a182c6e82582602409782a4fb481e989feebf4435867b4"
 
 UPSTREAM_CHECK_REGEX = "mpg123-(?P<pver>\d+(\.\d+)+)\.tar"
 
-- 
2.39.2


--===============4708306626899589810==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1844 entries from dependency cache.
Parsing recipes...done.
Parsing of 911 .bb files complete (910 cached, 1 parsed). 1843 targets, 38 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "4.3+snapshot-64db6c8eac91fd22ec0f07ee41d010d981a4209c"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:64db6c8eac91fd22ec0f07ee41d010d981a4209c"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 338 Local 325 Mirrors 0 Missed 13 Current 546 (96% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 566 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_create_spdx_setscene)
NOTE: recipe pulseaudio-16.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe pulseaudio-16.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 844 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 846 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Started
NOTE: Running task 1279 of 2399 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/mpg123/mpg123_1.32.3.bb:do_recipe_qa)
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 856 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 858 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_recipe_qa_setscene)
NOTE: recipe mpg123-1.32.3-r0: task do_recipe_qa: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe mpg123-1.32.3-r0: task do_recipe_qa: Succeeded
NOTE: Running setscene task 862 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.38.bb:do_create_spdx_setscene)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/mpg123/mpg123_1.32.3.bb:do_recipe_qa unihash changed to 8f7e86d5e2a0669ebd135fa9a4117044b43951cc460f488a6a2e39a152761938
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glibc-2.38+git-r0: task do_create_spdx_setscene: Started
NOTE: Running task 1330 of 2399 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/mpg123/mpg123_1.32.3.bb:do_fetch)
NOTE: recipe glibc-2.38+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 869 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 871 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe mpg123-1.32.3-r0: task do_fetch: Started
NOTE: recipe mpg123-1.32.3-r0: task do_fetch: Succeeded
NOTE: Running task 1337 of 2399 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/mpg123/mpg123_1.32.3.bb:do_unpack)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe mpg123-1.32.3-r0: task do_unpack: Started
NOTE: recipe mpg123-1.32.3-r0: task do_unpack: Succeeded
NOTE: Running task 1609 of 2399 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/mpg123/mpg123_1.32.3.bb:do_patch)
NOTE: recipe mpg123-1.32.3-r0: task do_patch: Started
NOTE: recipe mpg123-1.32.3-r0: task do_patch: Succeeded
NOTE: Running task 1610 of 2399 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/mpg123/mpg123_1.32.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1611 of 2399 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/mpg123/mpg123_1.32.3.bb:do_populate_lic)
NOTE: recipe mpg123-1.32.3-r0: task do_populate_lic: Started
NOTE: recipe mpg123-1.32.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mpg123-1.32.3-r0: task do_populate_lic: Succeeded
NOTE: recipe mpg123-1.32.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/mpg123/mpg123_1.32.3.bb:do_populate_lic unihash changed to 4692e218fc9b09685b1e56798782b3ac151a38f53fe3a672b481d3f0dcbcb11c
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/mpg123/mpg123_1.32.3.bb:do_deploy_source_date_epoch unihash changed to 290f606e92a1afdee9dfd2d8c327b74696ae6c3911d619b429401b25aaeabc70
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 883 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2337 of 2399 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/mpg123/mpg123_1.32.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2386 of 2399 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/mpg123/mpg123_1.32.3.bb:do_collect_spdx_deps)
NOTE: recipe mpg123-1.32.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mpg123-1.32.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe mpg123-1.32.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe mpg123-1.32.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2387 of 2399 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/mpg123/mpg123_1.32.3.bb:do_configure)
NOTE: recipe mpg123-1.32.3-r0: task do_configure: Started
NOTE: recipe mpg123-1.32.3-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 2387 tasks of which 2378 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20231115133724.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20231115133724.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/mpg123/mpg123_1.32.3.bb:do_configure
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: mpg123-1.32.3-r0 do_configure: QA Issue: mpg123: configure was passed unrecognised options: --disable-lfs-alias [unknown-configure-option]
ERROR: mpg123-1.32.3-r0 do_configure: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/mpg123/1.32.3/temp/log.do_configure.2819819
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/mpg123/mpg123_1.32.3.bb:do_configure) failed with exit code '1'

--===============4708306626899589810==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-mpg123-upgrade-1.31.3-1.32.3.patch"

RnJvbSAzYWM5MzFhZDdjZjJkNjM1NmJhODA4OGMzMDMwM2Y4NjU5M2ViODAxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgTm92IDIwMjMgMTM6Mzc6NTcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBt
cGcxMjM6IHVwZ3JhZGUgMS4zMS4zIC0+IDEuMzIuMwoKLS0tCiAuLi4vbXBnMTIzL3ttcGcxMjNf
MS4zMS4zLmJiID0+IG1wZzEyM18xLjMyLjMuYmJ9ICAgICAgICAgICAgICAgfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtbXVsdGltZWRpYS9tcGcxMjMve21wZzEyM18xLjMxLjMuYmIgPT4gbXBnMTIzXzEuMzIu
My5iYn0gKDk2JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9tcGcxMjMv
bXBnMTIzXzEuMzEuMy5iYiBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL21wZzEyMy9tcGcxMjNf
MS4zMi4zLmJiCnNpbWlsYXJpdHkgaW5kZXggOTYlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1t
dWx0aW1lZGlhL21wZzEyMy9tcGcxMjNfMS4zMS4zLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMt
bXVsdGltZWRpYS9tcGcxMjMvbXBnMTIzXzEuMzIuMy5iYgppbmRleCBiMDNlZTlmNzFhLi5jYzM5
MDZlMjA3IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9tcGcxMjMvbXBnMTIz
XzEuMzEuMy5iYgorKysgYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9tcGcxMjMvbXBnMTIzXzEu
MzIuMy5iYgpAQCAtMTAsNyArMTAsNyBAQCBMSUNFTlNFID0gIkxHUEwtMi4xLW9ubHkiCiBMSUNf
RklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT1lN2I5YzE1ZmNmYjk4NmFiYjRjYzVl
ODQwMGEyNDE2OSIKIAogU1JDX1VSSSA9ICJodHRwczovL3d3dy5tcGcxMjMuZGUvZG93bmxvYWQv
JHtCUH0udGFyLmJ6MiIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIxY2E3N2QzYTY5YTVmZjg0NWI3
YTA1MzZmNzgzZmVlNTU0ZTEwNDExMzlhNmI5NzhmNmFmZTE0ZjU4MTRhZDFhIgorU1JDX1VSSVtz
aGEyNTZzdW1dID0gIjJkOTkxM2E1N2Q0ZWU4ZjQ5N2ExODJjNmU4MjU4MjYwMjQwOTc4MmE0ZmI0
ODFlOTg5ZmVlYmY0NDM1ODY3YjQiCiAKIFVQU1RSRUFNX0NIRUNLX1JFR0VYID0gIm1wZzEyMy0o
P1A8cHZlcj5cZCsoXC5cZCspKylcLnRhciIKIAotLSAKMi4zOS4yCgo=

--===============4708306626899589810==--

