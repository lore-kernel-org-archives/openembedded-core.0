Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D2B4E7848A
	for <webhook@archiver.kernel.org>; Sun,  1 Oct 2023 18:13:20 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.65037.1696183992708763157
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Oct 2023 11:13:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=bCK8CZtI;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=hzBLAL7R;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101018aec71bf5e-6b80fde4-de1b-4b78-8c7c-e116181620c8-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1696183992;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=EEWCaQ1QUEgyG9EsqG2sDjmAivP9CfuxoatyhnLqhX0=;
	b=bCK8CZtIUMIYvQQzBwG/MCcGhgRhf1e+r3fSeMJucErOcizWmbjWsXm8WrNAByAa
	HVyALOnV+0v2hZGl8uMUa2kZt0NkuuCOAsU4bK2CvxR5mpFk+16/lLBOl4R7HgVAZJD
	00noCUDQBTnz7iflfobJhMKGiKEAvW6UCdnsESmo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1696183992;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=EEWCaQ1QUEgyG9EsqG2sDjmAivP9CfuxoatyhnLqhX0=;
	b=hzBLAL7R1Al5eV7m1HJmTCv60elvG947Z8eHYDexi3HlYGOu5WnORCGGwWK/E9g8
	hOmHf9mkSR0L9jc6sG4onkJZBvS1sZBBU5XyEWDSH8/o8yAMbE2hg492ORzrjdvMpMt
	4ApalnFtVlU6EcUue4GkF9YjUKhBO1C1Vbte5qmE=
Content-Type: multipart/mixed; boundary="===============1396230166820009776=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] mpg123: upgrading to 1.32.2 FAILED
Message-ID: <0101018aec71bf5e-6b80fde4-de1b-4b78-8c7c-e116181620c8-000000@us-west-2.amazonses.com>
Date: Sun, 1 Oct 2023 18:13:12 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.10.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Oct 2023 18:13:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188583

--===============1396230166820009776==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *mpg123* to *1.32.2* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-mpg123-upgrade-1.31.3-1.32.2.patch
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
From 52b87a65039aadfb5894b46628d4b976f7bb9bc0 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 Oct 2023 17:57:35 +0000
Subject: [PATCH] mpg123: upgrade 1.31.3 -> 1.32.2

---
 .../mpg123/{mpg123_1.31.3.bb => mpg123_1.32.2.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/mpg123/{mpg123_1.31.3.bb => mpg123_1.32.2.bb} (96%)

diff --git a/meta/recipes-multimedia/mpg123/mpg123_1.31.3.bb b/meta/recipes-multimedia/mpg123/mpg123_1.32.2.bb
similarity index 96%
rename from meta/recipes-multimedia/mpg123/mpg123_1.31.3.bb
rename to meta/recipes-multimedia/mpg123/mpg123_1.32.2.bb
index b03ee9f71a..8b6369242e 100644
--- a/meta/recipes-multimedia/mpg123/mpg123_1.31.3.bb
+++ b/meta/recipes-multimedia/mpg123/mpg123_1.32.2.bb
@@ -10,7 +10,7 @@ LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e7b9c15fcfb986abb4cc5e8400a24169"
 
 SRC_URI = "https://www.mpg123.de/download/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "1ca77d3a69a5ff845b7a0536f783fee554e1041139a6b978f6afe14f5814ad1a"
+SRC_URI[sha256sum] = "ce77e9c20f4fa47c78f5cc7a7fcc97b9a2c36a03eb31fba8e0cf9933df79ea38"
 
 UPSTREAM_CHECK_REGEX = "mpg123-(?P<pver>\d+(\.\d+)+)\.tar"
 
-- 
2.39.2


--===============1396230166820009776==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-mpg123-upgrade-1.31.3-1.32.2.patch"

RnJvbSA1MmI4N2E2NTAzOWFhZGZiNTg5NGI0NjYyOGQ0Yjk3NmY3YmI5YmMwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBPY3QgMjAyMyAxNzo1NzozNSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIG1w
ZzEyMzogdXBncmFkZSAxLjMxLjMgLT4gMS4zMi4yCgotLS0KIC4uLi9tcGcxMjMve21wZzEyM18x
LjMxLjMuYmIgPT4gbXBnMTIzXzEuMzIuMi5iYn0gICAgICAgICAgICAgICB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVj
aXBlcy1tdWx0aW1lZGlhL21wZzEyMy97bXBnMTIzXzEuMzEuMy5iYiA9PiBtcGcxMjNfMS4zMi4y
LmJifSAoOTYlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL21wZzEyMy9t
cGcxMjNfMS4zMS4zLmJiIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvbXBnMTIzL21wZzEyM18x
LjMyLjIuYmIKc2ltaWxhcml0eSBpbmRleCA5NiUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLW11
bHRpbWVkaWEvbXBnMTIzL21wZzEyM18xLjMxLjMuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1t
dWx0aW1lZGlhL21wZzEyMy9tcGcxMjNfMS4zMi4yLmJiCmluZGV4IGIwM2VlOWY3MWEuLjhiNjM2
OTI0MmUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL21wZzEyMy9tcGcxMjNf
MS4zMS4zLmJiCisrKyBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL21wZzEyMy9tcGcxMjNfMS4z
Mi4yLmJiCkBAIC0xMCw3ICsxMCw3IEBAIExJQ0VOU0UgPSAiTEdQTC0yLjEtb25seSIKIExJQ19G
SUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1PWU3YjljMTVmY2ZiOTg2YWJiNGNjNWU4
NDAwYTI0MTY5IgogCiBTUkNfVVJJID0gImh0dHBzOi8vd3d3Lm1wZzEyMy5kZS9kb3dubG9hZC8k
e0JQfS50YXIuYnoyIgotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjFjYTc3ZDNhNjlhNWZmODQ1Yjdh
MDUzNmY3ODNmZWU1NTRlMTA0MTEzOWE2Yjk3OGY2YWZlMTRmNTgxNGFkMWEiCitTUkNfVVJJW3No
YTI1NnN1bV0gPSAiY2U3N2U5YzIwZjRmYTQ3Yzc4ZjVjYzdhN2ZjYzk3YjlhMmMzNmEwM2ViMzFm
YmE4ZTBjZjk5MzNkZjc5ZWEzOCIKIAogVVBTVFJFQU1fQ0hFQ0tfUkVHRVggPSAibXBnMTIzLSg/
UDxwdmVyPlxkKyhcLlxkKykrKVwudGFyIgogCi0tIAoyLjM5LjIKCg==

--===============1396230166820009776==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

Loading cache...done.
Loaded 1843 entries from dependency cache.
Parsing recipes...done.
Parsing of 911 .bb files complete (910 cached, 1 parsed). 1843 targets, 38 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "4.2+snapshot-ed0984b1f1ed859f651c06bc0c066a7241963ce7"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:ed0984b1f1ed859f651c06bc0c066a7241963ce7"
workspace            = "master:ab127e266ecd9f1cf6606d77fe1482d5e23abc52"

Initialising tasks...done.
Sstate summary: Wanted 294 Local 283 Mirrors 0 Missed 11 Current 579 (96% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 595 of 873 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/pulseaudio/pulseaudio_16.1.bb:do_create_spdx_setscene)
NOTE: recipe pulseaudio-16.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe pulseaudio-16.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 842 of 873 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 844 of 873 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 848 of 873 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 850 of 873 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_recipe_qa_setscene)
NOTE: Running task 1492 of 2367 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.32.2.bb:do_recipe_qa)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mpg123-1.32.2-r0: task do_recipe_qa: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 854 of 873 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.38.bb:do_create_spdx_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe mpg123-1.32.2-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1522 of 2367 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.32.2.bb:do_fetch)
NOTE: recipe glibc-2.38+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe mpg123-1.32.2-r0: task do_fetch: Started
NOTE: recipe mpg123-1.32.2-r0: task do_fetch: Succeeded
NOTE: Running task 1523 of 2367 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.32.2.bb:do_unpack)
NOTE: recipe glibc-2.38+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 861 of 873 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 863 of 873 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe mpg123-1.32.2-r0: task do_unpack: Started
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe mpg123-1.32.2-r0: task do_unpack: Succeeded
NOTE: Running task 1579 of 2367 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.32.2.bb:do_patch)
NOTE: recipe mpg123-1.32.2-r0: task do_patch: Started
NOTE: recipe mpg123-1.32.2-r0: task do_patch: Succeeded
NOTE: Running task 1580 of 2367 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.32.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1581 of 2367 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.32.2.bb:do_populate_lic)
NOTE: recipe mpg123-1.32.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mpg123-1.32.2-r0: task do_populate_lic: Started
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 873 of 873 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe mpg123-1.32.2-r0: task do_populate_lic: Succeeded
NOTE: recipe mpg123-1.32.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2307 of 2367 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.32.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2356 of 2367 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.32.2.bb:do_collect_spdx_deps)
NOTE: recipe mpg123-1.32.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mpg123-1.32.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe mpg123-1.32.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe mpg123-1.32.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2357 of 2367 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.32.2.bb:do_configure)
NOTE: recipe mpg123-1.32.2-r0: task do_configure: Started
NOTE: recipe mpg123-1.32.2-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 2357 tasks of which 2348 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.32.2.bb:do_configure
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: mpg123-1.32.2-r0 do_configure: QA Issue: mpg123: configure was passed unrecognised options: --disable-lfs-alias [unknown-configure-option]
ERROR: mpg123-1.32.2-r0 do_configure: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/mpg123/1.32.2/temp/log.do_configure.2824461
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/mpg123/mpg123_1.32.2.bb:do_configure) failed with exit code '1'

--===============1396230166820009776==--

