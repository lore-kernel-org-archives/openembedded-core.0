Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74BEAC070C3
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 14:25:12 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.8672.1698848705999739857
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Nov 2023 07:25:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=QOLxqORV;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=H0jqNnxy;
 spf=pass (domain: automation.yoctoproject.org, ip: 54.240.27.23, mailfrom: 0101018b8b460dcf-e1b442a5-81d1-47a5-bbb8-1ae2699924b9-000000@automation.yoctoproject.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1698848706;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=/UXKqiaxW3qkZYPUEiQx+FbVheQNI0ywVmfDGcnth9A=;
	b=QOLxqORV1CryLvpoZHF2hieW3YMDF4JG7vMgktjfZOV2D5u38DJUdWqfRR2FHFqg
	EkzQDJIZVwF99ubseoeNPhRGeXupc807X8BuY24mzR1X6KKclBS4QQSTJuQVjqjOhZI
	qmCwUj/LSbjDTJ1FcBmTZVis52Ud3YxWyB366oTA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1698848706;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=/UXKqiaxW3qkZYPUEiQx+FbVheQNI0ywVmfDGcnth9A=;
	b=H0jqNnxyYCB6fKd6zQ+X3zOn9eWSltznqG5zdJB8B6cKHQQ4X/zJU3tT4G74c30f
	uruIgmUjjU4rcnZ5zunLClSnN/0QetIv30OdfCG9RGzbVxWFBxBYMUOYU2036W+XGZY
	nrsjxbKuHKii/IlWzMpPdRHfrF9NkuZMp7Kj8TPk=
Content-Type: multipart/mixed; boundary="===============4377632564324345053=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] mpg123: upgrading to 1.32.3 FAILED
Message-ID: <0101018b8b460dcf-e1b442a5-81d1-47a5-bbb8-1ae2699924b9-000000@us-west-2.amazonses.com>
Date: Wed, 1 Nov 2023 14:25:06 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Nov 2023 14:25:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190017

--===============4377632564324345053==
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
From 3b0e0cc52929d64e051bc834b55d81116b233fbf Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Nov 2023 13:43:54 +0000
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


--===============4377632564324345053==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1843 entries from dependency cache.
Parsing recipes...done.
Parsing of 911 .bb files complete (910 cached, 1 parsed). 1842 targets, 38 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "4.3+snapshot-d87473c14aeefe27098cd8ee2fd4bb2e1f84f6bd"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:d87473c14aeefe27098cd8ee2fd4bb2e1f84f6bd"
workspace            = "master:3a7b408178439482d49d573113cc61a69fb28147"

Initialising tasks...done.
Sstate summary: Wanted 87 Local 77 Mirrors 0 Missed 10 Current 786 (88% match, 98% complete)
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
NOTE: recipe mpg123-1.32.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mpg123-1.32.3-r0: task do_populate_lic: Started
NOTE: recipe mpg123-1.32.3-r0: task do_populate_lic: Succeeded
NOTE: recipe mpg123-1.32.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2357 of 2367 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.32.3.bb:do_configure)
NOTE: recipe mpg123-1.32.3-r0: task do_configure: Started
NOTE: recipe mpg123-1.32.3-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 2357 tasks of which 2348 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.32.3.bb:do_configure
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: mpg123-1.32.3-r0 do_configure: QA Issue: mpg123: configure was passed unrecognised options: --disable-lfs-alias [unknown-configure-option]
ERROR: mpg123-1.32.3-r0 do_configure: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/mpg123/1.32.3/temp/log.do_configure.3322666
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.32.3.bb:do_configure) failed with exit code '1'

--===============4377632564324345053==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-mpg123-upgrade-1.31.3-1.32.3.patch"

RnJvbSAzYjBlMGNjNTI5MjlkNjRlMDUxYmM4MzRiNTVkODExMTZiMjMzZmJmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBOb3YgMjAyMyAxMzo0Mzo1NCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIG1w
ZzEyMzogdXBncmFkZSAxLjMxLjMgLT4gMS4zMi4zCgotLS0KIC4uLi9tcGcxMjMve21wZzEyM18x
LjMxLjMuYmIgPT4gbXBnMTIzXzEuMzIuMy5iYn0gICAgICAgICAgICAgICB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVj
aXBlcy1tdWx0aW1lZGlhL21wZzEyMy97bXBnMTIzXzEuMzEuMy5iYiA9PiBtcGcxMjNfMS4zMi4z
LmJifSAoOTYlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL21wZzEyMy9t
cGcxMjNfMS4zMS4zLmJiIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvbXBnMTIzL21wZzEyM18x
LjMyLjMuYmIKc2ltaWxhcml0eSBpbmRleCA5NiUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLW11
bHRpbWVkaWEvbXBnMTIzL21wZzEyM18xLjMxLjMuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1t
dWx0aW1lZGlhL21wZzEyMy9tcGcxMjNfMS4zMi4zLmJiCmluZGV4IGIwM2VlOWY3MWEuLmNjMzkw
NmUyMDcgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL21wZzEyMy9tcGcxMjNf
MS4zMS4zLmJiCisrKyBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL21wZzEyMy9tcGcxMjNfMS4z
Mi4zLmJiCkBAIC0xMCw3ICsxMCw3IEBAIExJQ0VOU0UgPSAiTEdQTC0yLjEtb25seSIKIExJQ19G
SUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1PWU3YjljMTVmY2ZiOTg2YWJiNGNjNWU4
NDAwYTI0MTY5IgogCiBTUkNfVVJJID0gImh0dHBzOi8vd3d3Lm1wZzEyMy5kZS9kb3dubG9hZC8k
e0JQfS50YXIuYnoyIgotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjFjYTc3ZDNhNjlhNWZmODQ1Yjdh
MDUzNmY3ODNmZWU1NTRlMTA0MTEzOWE2Yjk3OGY2YWZlMTRmNTgxNGFkMWEiCitTUkNfVVJJW3No
YTI1NnN1bV0gPSAiMmQ5OTEzYTU3ZDRlZThmNDk3YTE4MmM2ZTgyNTgyNjAyNDA5NzgyYTRmYjQ4
MWU5ODlmZWViZjQ0MzU4NjdiNCIKIAogVVBTVFJFQU1fQ0hFQ0tfUkVHRVggPSAibXBnMTIzLSg/
UDxwdmVyPlxkKyhcLlxkKykrKVwudGFyIgogCi0tIAoyLjM5LjIKCg==

--===============4377632564324345053==--

