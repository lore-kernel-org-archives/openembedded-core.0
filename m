Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 927CCCA5FA7
	for <webhook@archiver.kernel.org>; Tue, 29 Sep 2026 06:18:51 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1834.1790662724918051237
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Sep 2026 23:18:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=iF+8sTRr;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=jDmIUeca;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 010101a0ebd0c9a5-48260e3a-32b9-4d43-bfba-341bfe7c7b91-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1790662724;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=Rj5Lma3dYvx7+o+gIedZwOqXoO1UmmKjecjvPMUVfFk=;
	b=iF+8sTRrK6mBJFBmtHZvMNod/GhPw+Go83U6azAgk5yV/IJAi4kVv05sh0RG6yLB
	SDY8E5QCFTvacs58VsTDQqYMozz2Eye08yvLsg6W89inyXtcKQ9WDBUM/IljVwlG+19
	Flu7qea14pGTNsL2AYx/ZEIHB4KXp4lVE6lDobMM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1790662724;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=Rj5Lma3dYvx7+o+gIedZwOqXoO1UmmKjecjvPMUVfFk=;
	b=jDmIUeca/uf41JF2Ha5lkCy9aBGZhsCgZ1rlhA2lFezoQeMiMurJevohCWCqNIN7
	ANLE0Zf1m3qwvHD1t/+K7aiw+SYr5d9SVVZ2LK+rfBGFjBf/ndAbxbKkghYSgOHjEqh
	pJN57TwH/CMAGrdFO/7Ud6eJDzVfgsefwtNwELA4=
Content-Type: multipart/mixed; boundary="===============3755066434853289990=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-volk: upgrading to 1.4.363.0 SUCCEEDED
Message-ID: <010101a0ebd0c9a5-48260e3a-32b9-4d43-bfba-341bfe7c7b91-000000@us-west-2.amazonses.com>
Date: Tue, 29 Sep 2026 06:18:44 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.09.29-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Sep 2026 06:18:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246835

--===============3755066434853289990==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *vulkan-volk* to *1.4.363.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-vulkan-volk-upgrade-1.4.357.0-1.4.363.0.patch
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
From f44a14d502046d62f8d105dc428939fe87ac25be Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 29 Sep 2026 06:00:33 +0000
Subject: [PATCH] vulkan-volk: upgrade 1.4.357.0 -> 1.4.363.0

Merge pull request #310 from zeux/update/363
Update to 1.4.363
Merge pull request #309 from zeux/update/362
Update to 1.4.362
Merge pull request #308 from zeux/update/361
Update to 1.4.361
Merge pull request #307 from zeux/update/360
Update to 1.4.360
Merge pull request #306 from zeux/update/359
Update to 1.4.359
Merge pull request #305 from zeux/update/358
Update to 1.4.358
Fix README typo
---
 .../{vulkan-volk_1.4.357.0.bb => vulkan-volk_1.4.363.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/vulkan/{vulkan-volk_1.4.357.0.bb => vulkan-volk_1.4.363.0.bb} (95%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-volk_1.4.357.0.bb b/meta/recipes-graphics/vulkan/vulkan-volk_1.4.363.0.bb
similarity index 95%
rename from meta/recipes-graphics/vulkan/vulkan-volk_1.4.357.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-volk_1.4.363.0.bb
index 4e8504ed66..b336428595 100644
--- a/meta/recipes-graphics/vulkan/vulkan-volk_1.4.357.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-volk_1.4.363.0.bb
@@ -10,7 +10,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=cfcbdd69e15396e371f639c69acf40bf"
 
 SRC_URI = "git://github.com/zeux/volk.git;branch=master;protocol=https;tag=vulkan-sdk-${PV}"
-SRCREV = "776893306c5d3b22b6185b5d4a258b81d94572bf"
+SRCREV = "54fc0d7a72887cbfc5b030d26897b2b40ac53fb8"
 
 REQUIRED_DISTRO_FEATURES = "vulkan"
 
-- 
2.47.1


--===============3755066434853289990==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/vulkan-volk: SRC_URI changed from "git://github.com/zeux/volk.git;branch=master;protocol=https;tag=vulkan-sdk-1.4.357.0" to "git://github.com/zeux/volk.git;branch=master;protocol=https;tag=vulkan-sdk-1.4.363.0"
packages/x86-64-v3-poky-linux/vulkan-volk: PV changed from "1.4.357.0" to "1.4.363.0"
packages/x86-64-v3-poky-linux/vulkan-volk: PKGV changed from 1.4.357.0 [default] to 1.4.363.0 [default]
packages/x86-64-v3-poky-linux/vulkan-volk/vulkan-volk-dbg: PV changed from "1.4.357.0" to "1.4.363.0"
packages/x86-64-v3-poky-linux/vulkan-volk/vulkan-volk-dbg: PKGV changed from 1.4.357.0 [default] to 1.4.363.0 [default]
packages/x86-64-v3-poky-linux/vulkan-volk/vulkan-volk-dev: PV changed from "1.4.357.0" to "1.4.363.0"
packages/x86-64-v3-poky-linux/vulkan-volk/vulkan-volk-dev: PKGV changed from 1.4.357.0 [default] to 1.4.363.0 [default]
packages/x86-64-v3-poky-linux/vulkan-volk/vulkan-volk-dev: PKGSIZE changed from 550163 to 551469 (+0%)
packages/x86-64-v3-poky-linux/vulkan-volk/vulkan-volk-doc: PV changed from "1.4.357.0" to "1.4.363.0"
packages/x86-64-v3-poky-linux/vulkan-volk/vulkan-volk-doc: PKGV changed from 1.4.357.0 [default] to 1.4.363.0 [default]
packages/x86-64-v3-poky-linux/vulkan-volk/vulkan-volk-locale: PV changed from "1.4.357.0" to "1.4.363.0"
packages/x86-64-v3-poky-linux/vulkan-volk/vulkan-volk-locale: PKGV changed from 1.4.357.0 [default] to 1.4.363.0 [default]
packages/x86-64-v3-poky-linux/vulkan-volk/vulkan-volk-src: PV changed from "1.4.357.0" to "1.4.363.0"
packages/x86-64-v3-poky-linux/vulkan-volk/vulkan-volk-src: PKGV changed from 1.4.357.0 [default] to 1.4.363.0 [default]
packages/x86-64-v3-poky-linux/vulkan-volk/vulkan-volk-src: FILELIST: directory renamed /usr/src/debug/vulkan-volk/1.4.357.0 -> /usr/src/debug/vulkan-volk/1.4.363.0
packages/x86-64-v3-poky-linux/vulkan-volk/vulkan-volk-src: PKGSIZE changed from 542050 to 543356 (+0%)
packages/x86-64-v3-poky-linux/vulkan-volk/vulkan-volk-staticdev: PV changed from "1.4.357.0" to "1.4.363.0"
packages/x86-64-v3-poky-linux/vulkan-volk/vulkan-volk-staticdev: PKGV changed from 1.4.357.0 [default] to 1.4.363.0 [default]
packages/x86-64-v3-poky-linux/vulkan-volk/vulkan-volk-staticdev: PKGSIZE changed from 855704 to 855784 (+0%)
packages/x86-64-v3-poky-linux/vulkan-volk/vulkan-volk: PV changed from "1.4.357.0" to "1.4.363.0"
packages/x86-64-v3-poky-linux/vulkan-volk/vulkan-volk: PKGV changed from 1.4.357.0 [default] to 1.4.363.0 [default]

--===============3755066434853289990==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="vulkan-volk-changelog.txt"

Merge pull request #310 from zeux/update/363
Update to 1.4.363
Merge pull request #309 from zeux/update/362
Update to 1.4.362
Merge pull request #308 from zeux/update/361
Update to 1.4.361
Merge pull request #307 from zeux/update/360
Update to 1.4.360
Merge pull request #306 from zeux/update/359
Update to 1.4.359
Merge pull request #305 from zeux/update/358
Update to 1.4.358
Fix README typo

--===============3755066434853289990==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-vulkan-volk-upgrade-1.4.357.0-1.4.363.0.patch"

RnJvbSBmNDRhMTRkNTAyMDQ2ZDYyZjhkMTA1ZGM0Mjg5MzlmZTg3YWMyNWJlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMjkgU2VwIDIwMjYgMDY6MDA6MzMgKzAwMDAKU3ViamVjdDogW1BBVENIXSB2
dWxrYW4tdm9sazogdXBncmFkZSAxLjQuMzU3LjAgLT4gMS40LjM2My4wCgpNZXJnZSBwdWxsIHJl
cXVlc3QgIzMxMCBmcm9tIHpldXgvdXBkYXRlLzM2MwpVcGRhdGUgdG8gMS40LjM2MwpNZXJnZSBw
dWxsIHJlcXVlc3QgIzMwOSBmcm9tIHpldXgvdXBkYXRlLzM2MgpVcGRhdGUgdG8gMS40LjM2MgpN
ZXJnZSBwdWxsIHJlcXVlc3QgIzMwOCBmcm9tIHpldXgvdXBkYXRlLzM2MQpVcGRhdGUgdG8gMS40
LjM2MQpNZXJnZSBwdWxsIHJlcXVlc3QgIzMwNyBmcm9tIHpldXgvdXBkYXRlLzM2MApVcGRhdGUg
dG8gMS40LjM2MApNZXJnZSBwdWxsIHJlcXVlc3QgIzMwNiBmcm9tIHpldXgvdXBkYXRlLzM1OQpV
cGRhdGUgdG8gMS40LjM1OQpNZXJnZSBwdWxsIHJlcXVlc3QgIzMwNSBmcm9tIHpldXgvdXBkYXRl
LzM1OApVcGRhdGUgdG8gMS40LjM1OApGaXggUkVBRE1FIHR5cG8KLS0tCiAuLi4ve3Z1bGthbi12
b2xrXzEuNC4zNTcuMC5iYiA9PiB2dWxrYW4tdm9sa18xLjQuMzYzLjAuYmJ9ICAgICAgfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVsa2FuL3t2dWxrYW4tdm9sa18xLjQuMzU3LjAuYmIgPT4g
dnVsa2FuLXZvbGtfMS40LjM2My4wLmJifSAoOTUlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBl
cy1ncmFwaGljcy92dWxrYW4vdnVsa2FuLXZvbGtfMS40LjM1Ny4wLmJiIGIvbWV0YS9yZWNpcGVz
LWdyYXBoaWNzL3Z1bGthbi92dWxrYW4tdm9sa18xLjQuMzYzLjAuYmIKc2ltaWxhcml0eSBpbmRl
eCA5NSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Z1bGthbi92dWxrYW4tdm9s
a18xLjQuMzU3LjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1ncmFwaGljcy92dWxrYW4vdnVs
a2FuLXZvbGtfMS40LjM2My4wLmJiCmluZGV4IDRlODUwNGVkNjYuLmIzMzY0Mjg1OTUgMTAwNjQ0
Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy92dWxrYW4vdnVsa2FuLXZvbGtfMS40LjM1Ny4w
LmJiCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy92dWxrYW4vdnVsa2FuLXZvbGtfMS40LjM2
My4wLmJiCkBAIC0xMCw3ICsxMCw3IEBAIExJQ0VOU0UgPSAiTUlUIgogTElDX0ZJTEVTX0NIS1NV
TSA9ICJmaWxlOi8vTElDRU5TRS5tZDttZDU9Y2ZjYmRkNjllMTUzOTZlMzcxZjYzOWM2OWFjZjQw
YmYiCiAKIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS96ZXV4L3ZvbGsuZ2l0O2JyYW5jaD1t
YXN0ZXI7cHJvdG9jb2w9aHR0cHM7dGFnPXZ1bGthbi1zZGstJHtQVn0iCi1TUkNSRVYgPSAiNzc2
ODkzMzA2YzVkM2IyMmI2MTg1YjVkNGEyNThiODFkOTQ1NzJiZiIKK1NSQ1JFViA9ICI1NGZjMGQ3
YTcyODg3Y2JmYzViMDMwZDI2ODk3YjJiNDBhYzUzZmI4IgogCiBSRVFVSVJFRF9ESVNUUk9fRkVB
VFVSRVMgPSAidnVsa2FuIgogCi0tIAoyLjQ3LjEKCg==

--===============3755066434853289990==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 959 .bb files complete (0 cached, 959 parsed). 1991 targets, 66 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.19.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-musleabi"
MACHINE              = "qemuarm"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.0.99+snapshot-3d8a02cb09ed65301d1d9f4a47178fc3c884e14e"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
meta                 = "tmp-auh-upgrades:3d8a02cb09ed65301d1d9f4a47178fc3c884e14e"
meta-yocto-bsp       
meta-poky            = "master:d36c827e02ab138b446386792fd7588b5a041507"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 183 Local 166 Mirrors 0 Missed 17 Current 205 (90% match, 95% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 210 of 388 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-volk_1.4.363.0.bb:do_populate_lic_setscene)
NOTE: Running setscene task 310 of 388 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 332 of 388 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.357.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe vulkan-volk-1.4.363.0-r0: task do_populate_lic_setscene: Started
NOTE: recipe vulkan-headers-1.4.357.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-runtime-16.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe vulkan-headers-1.4.357.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 333 of 388 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.357.0.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-volk-1.4.363.0-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running task 847 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-volk_1.4.363.0.bb:do_recipe_qa)
NOTE: recipe gcc-runtime-16.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 335 of 388 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 336 of 388 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.2.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 337 of 388 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 339 of 388 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe vulkan-headers-1.4.357.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-volk-1.4.363.0-r0: task do_recipe_qa: Started
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-runtime-16.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-16.2.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe gcc-runtime-16.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.4.357.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 849 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.357.0.bb:do_fetch)
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gcc-runtime-16.2.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 345 of 388 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_recipe_spdx_setscene)
NOTE: recipe vulkan-headers-1.4.357.0-r0: task do_fetch: Started
NOTE: recipe gcc-runtime-16.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 347 of 388 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.2.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe libgcc-16.2.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 914 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.357.0.bb:do_create_recipe_spdx)
NOTE: recipe vulkan-volk-1.4.363.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 915 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-volk_1.4.363.0.bb:do_fetch)
NOTE: recipe vulkan-headers-1.4.357.0-r0: task do_fetch: Succeeded
NOTE: recipe libgcc-16.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 360 of 388 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: Running task 916 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.357.0.bb:do_unpack)
NOTE: recipe vulkan-headers-1.4.357.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe vulkan-volk-1.4.363.0-r0: task do_fetch: Started
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.4.357.0-r0: task do_unpack: Started
NOTE: recipe gcc-runtime-16.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 361 of 388 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 362 of 388 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.2.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 365 of 388 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_7.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 366 of 388 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 367 of 388 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: recipe vulkan-volk-1.4.363.0-r0: task do_fetch: Succeeded
NOTE: Running task 917 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-volk_1.4.363.0.bb:do_unpack)
NOTE: recipe libgcc-16.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-16.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-volk-1.4.363.0-r0: task do_unpack: Started
NOTE: recipe vulkan-headers-1.4.357.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 918 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-volk_1.4.363.0.bb:do_create_recipe_spdx)
NOTE: recipe gcc-runtime-16.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-16.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 372 of 388 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 373 of 388 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-volk-1.4.363.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-16.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-16.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-volk-1.4.363.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 374 of 388 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 376 of 388 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_7.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 378 of 388 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 381 of 388 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-7.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-headers-1.4.357.0-r0: task do_unpack: Succeeded
NOTE: Running task 934 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.357.0.bb:do_patch)
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 384 of 388 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 386 of 388 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-headers-1.4.357.0-r0: task do_patch: Started
NOTE: recipe vulkan-volk-1.4.363.0-r0: task do_unpack: Succeeded
NOTE: Running task 940 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-volk_1.4.363.0.bb:do_patch)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-7.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 388 of 388 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_7.2.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-headers-1.4.357.0-r0: task do_patch: Succeeded
NOTE: Running task 942 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.357.0.bb:do_generate_toolchain_file)
NOTE: recipe vulkan-volk-1.4.363.0-r0: task do_patch: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-7.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-headers-1.4.357.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe vulkan-volk-1.4.363.0-r0: task do_patch: Succeeded
NOTE: Running task 961 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-volk_1.4.363.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 962 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-volk_1.4.363.0.bb:do_generate_toolchain_file)
NOTE: recipe linux-libc-headers-7.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1021 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.357.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-headers-1.4.357.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe vulkan-volk-1.4.363.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-volk-1.4.363.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe vulkan-headers-1.4.357.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-volk-1.4.363.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe vulkan-headers-1.4.357.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1027 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.357.0.bb:do_configure)
NOTE: recipe vulkan-volk-1.4.363.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vulkan-headers-1.4.357.0-r0: task do_configure: Started
NOTE: recipe vulkan-headers-1.4.357.0-r0: task do_configure: Succeeded
NOTE: Running task 1028 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.357.0.bb:do_compile)
NOTE: recipe vulkan-headers-1.4.357.0-r0: task do_compile: Started
NOTE: recipe vulkan-headers-1.4.357.0-r0: task do_compile: Succeeded
NOTE: Running task 1029 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.357.0.bb:do_install)
NOTE: recipe vulkan-headers-1.4.357.0-r0: task do_install: Started
NOTE: recipe vulkan-headers-1.4.357.0-r0: task do_install: Succeeded
NOTE: Running task 1030 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.357.0.bb:do_package)
NOTE: Running task 1031 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.357.0.bb:do_populate_sysroot)
NOTE: recipe vulkan-headers-1.4.357.0-r0: task do_populate_sysroot: Started
NOTE: recipe vulkan-headers-1.4.357.0-r0: task do_package: Started
NOTE: recipe vulkan-headers-1.4.357.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1032 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-volk_1.4.363.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-volk-1.4.363.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-volk-1.4.363.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1033 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-volk_1.4.363.0.bb:do_configure)
NOTE: recipe vulkan-volk-1.4.363.0-r0: task do_configure: Started
NOTE: recipe vulkan-volk-1.4.363.0-r0: task do_configure: Succeeded
NOTE: Running task 1034 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-volk_1.4.363.0.bb:do_compile)
NOTE: recipe vulkan-volk-1.4.363.0-r0: task do_compile: Started
NOTE: recipe vulkan-headers-1.4.357.0-r0: task do_package: Succeeded
NOTE: Running task 1035 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.357.0.bb:do_packagedata)
NOTE: recipe vulkan-headers-1.4.357.0-r0: task do_packagedata: Started
NOTE: recipe vulkan-volk-1.4.363.0-r0: task do_compile: Succeeded
NOTE: Running task 1036 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-volk_1.4.363.0.bb:do_install)
NOTE: recipe vulkan-volk-1.4.363.0-r0: task do_install: Started
NOTE: recipe vulkan-volk-1.4.363.0-r0: task do_install: Succeeded
NOTE: Running task 1037 of 1047 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-volk_1.4.363.0.bb:do_populate_sysroot)
NOTE: recipe vulkan-volk-1.4.363.0-r0: task do_populate_sysroot: Started
NOTE: recipe vulkan-volk-1.4.363.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe vulkan-headers-1.4.357.0-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 1037 tasks of which 1013 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260929060014.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260929060014.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.357.0.bb:do_packagedata
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/vulkan-headers/1.4.357.0/temp/log.do_packagedata.998654
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: vulkan-headers-1.4.357.0-r0 do_packagedata: QA Issue: Package version for package vulkan-headers-src went backwards which would break package feeds (from 0:1.4.363.0-r0 to 0:1.4.357.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.4.357.0-r0 do_packagedata: QA Issue: Package version for package vulkan-headers-dbg went backwards which would break package feeds (from 0:1.4.363.0-r0 to 0:1.4.357.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.4.357.0-r0 do_packagedata: QA Issue: Package version for package vulkan-headers-staticdev went backwards which would break package feeds (from 0:1.4.363.0-r0 to 0:1.4.357.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.4.357.0-r0 do_packagedata: QA Issue: Package version for package vulkan-headers-dev went backwards which would break package feeds (from 0:1.4.363.0-r0 to 0:1.4.357.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.4.357.0-r0 do_packagedata: QA Issue: Package version for package vulkan-headers-doc went backwards which would break package feeds (from 0:1.4.363.0-r0 to 0:1.4.357.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.4.357.0-r0 do_packagedata: QA Issue: Package version for package vulkan-headers-locale went backwards which would break package feeds (from 0:1.4.363.0-r0 to 0:1.4.357.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.4.357.0-r0 do_packagedata: QA Issue: Package version for package vulkan-headers went backwards which would break package feeds (from 0:1.4.363.0-r0 to 0:1.4.357.0-r0) [version-going-backwards]
ERROR: vulkan-headers-1.4.357.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/vulkan-headers/1.4.357.0/temp/log.do_packagedata.998654
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.357.0.bb:do_packagedata) failed with exit code '1'

--===============3755066434853289990==--

