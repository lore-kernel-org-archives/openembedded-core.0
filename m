Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F682CDB485
	for <webhook@archiver.kernel.org>; Sun, 15 Oct 2023 19:45:21 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.102670.1697399114526847374
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Oct 2023 12:45:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Xb4R9ky1;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=hehh4Lnz;
 spf=pass (domain: automation.yoctoproject.org, ip: 54.240.27.192, mailfrom: 0101018b34df0fb1-2656c405-e132-4020-b65c-887b9e41c63a-000000@automation.yoctoproject.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1697399115;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=roR9bJ0vrZidlEOPfsEXhTPsiISnHQzfu+ij0/Wtvvk=;
	b=Xb4R9ky1VAf6CbFJgBj1UGS+mrc0JfxxIb6MUIx8ERnbCFVi9Zb+S9GcXym1VTE3
	kSfWR+Bq2baDNVIHChDReYY7NFtMfykEs1MZpB2IODp9lJItyExN32vsv3cm4qeysY0
	DfT0yWo0UHZtAXRnmilohiIm8exNzvU4Ekwm6amo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1697399115;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=roR9bJ0vrZidlEOPfsEXhTPsiISnHQzfu+ij0/Wtvvk=;
	b=hehh4Lnzhim6CgaQ1hmnNzlivulhxjop7aQMkAM8HG/FNQJhEo07aaGBVQhkoSVl
	v1JL6LBudmMBM0GgokEEjXa/DjIaGaKH/yy2emN3iXlz6wy5n+fBGb94Mlu581t5PcI
	3FT3GFyNRsxiTnS+bW/A2qqTEkNfUTGlQfxImiOc=
Content-Type: multipart/mixed; boundary="===============7312551833842905136=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] mpg123: upgrading to 1.32.3 FAILED
Message-ID: <0101018b34df0fb1-2656c405-e132-4020-b65c-887b9e41c63a-000000@us-west-2.amazonses.com>
Date: Sun, 15 Oct 2023 19:45:15 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.10.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Oct 2023 19:45:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189239

--===============7312551833842905136==
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
From 5054ab65af4a94fea0cfc6fa872ac140cfe1a049 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Oct 2023 18:17:09 +0000
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


--===============7312551833842905136==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

Loading cache...done.
Loaded 1844 entries from dependency cache.
Parsing recipes...done.
Parsing of 912 .bb files complete (911 cached, 1 parsed). 1844 targets, 38 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "4.2+snapshot-0399896aa5425d3c14d5745802d82aff67c7216f"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:0399896aa5425d3c14d5745802d82aff67c7216f"
workspace            = "master:988dc0dea4398e77a7d7862d4655a9b1f5eaa06d"

Initialising tasks...done.
Sstate summary: Wanted 285 Local 274 Mirrors 0 Missed 11 Current 588 (96% match, 98% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 2211 of 2367 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.32.3.bb:do_recipe_qa)
NOTE: recipe mpg123-1.32.3-r0: task do_recipe_qa: Started
NOTE: recipe mpg123-1.32.3-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2350 of 2367 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.32.3.bb:do_fetch)
NOTE: recipe mpg123-1.32.3-r0: task do_fetch: Started
NOTE: recipe mpg123-1.32.3-r0: task do_fetch: Succeeded
NOTE: Running task 2351 of 2367 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.32.3.bb:do_unpack)
NOTE: Running task 2352 of 2367 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.32.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe mpg123-1.32.3-r0: task do_unpack: Started
NOTE: recipe mpg123-1.32.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mpg123-1.32.3-r0: task do_unpack: Succeeded
NOTE: Running task 2353 of 2367 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.32.3.bb:do_patch)
NOTE: Running task 2354 of 2367 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.32.3.bb:do_collect_spdx_deps)
NOTE: recipe mpg123-1.32.3-r0: task do_patch: Started
NOTE: recipe mpg123-1.32.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe mpg123-1.32.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe mpg123-1.32.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe mpg123-1.32.3-r0: task do_patch: Succeeded
NOTE: Running task 2355 of 2367 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.32.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 2356 of 2367 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.32.3.bb:do_populate_lic)
NOTE: recipe mpg123-1.32.3-r0: task do_populate_lic: Started
NOTE: recipe mpg123-1.32.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mpg123-1.32.3-r0: task do_populate_lic: Succeeded
NOTE: recipe mpg123-1.32.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2357 of 2367 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.32.3.bb:do_configure)
NOTE: recipe mpg123-1.32.3-r0: task do_configure: Started
NOTE: recipe mpg123-1.32.3-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 2357 tasks of which 2348 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.32.3.bb:do_configure
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: mpg123-1.32.3-r0 do_configure: QA Issue: mpg123: configure was passed unrecognised options: --disable-lfs-alias [unknown-configure-option]
ERROR: mpg123-1.32.3-r0 do_configure: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/mpg123/1.32.3/temp/log.do_configure.1387322
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.32.3.bb:do_configure) failed with exit code '1'

--===============7312551833842905136==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-mpg123-upgrade-1.31.3-1.32.3.patch"

RnJvbSA1MDU0YWI2NWFmNGE5NGZlYTBjZmM2ZmE4NzJhYzE0MGNmZTFhMDQ5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgT2N0IDIwMjMgMTg6MTc6MDkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBt
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

--===============7312551833842905136==--

