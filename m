Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1380CC30659
	for <webhook@archiver.kernel.org>; Wed, 15 May 2024 17:32:24 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.1233.1715794337377341999
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 May 2024 10:32:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=KX1Gbk2P;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=1ZpOQjcu;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101018f7d4fdf47-2dc71d86-40a3-4e18-8e1b-cf56baa00a52-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1715794337;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=nBfsg2OFMueaxTzoHwhgPJ24f2MmmnrvMPvY+kxKgcE=;
	b=KX1Gbk2Pyd4Sp2oCj7MOOmH+y+SJNaxeAWMNiSiq+RR16914PHxiQNAEM2jrbJJQ
	b2pX2cjAgzSaBcAMz+kmvpuxdyJHpUPiu/5jyq6IsEdcTI51wtaHy4ogj9aAaHYUgx6
	Rs4l13uGdZOpmWu2wXIjQlN72HrLzWMWlyCqcd88=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1715794337;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=nBfsg2OFMueaxTzoHwhgPJ24f2MmmnrvMPvY+kxKgcE=;
	b=1ZpOQjcubJOFmHE5Sxrhrh6roPHgIjUTuow8dmDaRoGuUHqe9qeKJcYLGF885+vo
	TKs0tKzadNGq60TIOlaEmEDq51eQ8wbKkJNZVtv3VHmRJYrUhO7sKrvb7TgoC4qZhT/
	AlcBLWuczAfx8YRPvStxIWHievHJXoqEjs58ZebI=
Content-Type: multipart/mixed; boundary="===============9136994106362818062=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-jsonschema: upgrading to 4.22.0 SUCCEEDED
Message-ID: <0101018f7d4fdf47-2dc71d86-40a3-4e18-8e1b-cf56baa00a52-000000@us-west-2.amazonses.com>
Date: Wed, 15 May 2024 17:32:17 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.05.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 May 2024 17:32:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199327

--===============9136994106362818062==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-jsonschema* to *4.22.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-jsonschema-upgrade-4.21.1-4.22.0.patch
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
From 5b6c44f8dc8c627a557c35d243f4d9cb762edb9a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 May 2024 09:38:57 +0000
Subject: [PATCH] python3-jsonschema: upgrade 4.21.1 -> 4.22.0

---
 ...ython3-jsonschema_4.21.1.bb => python3-jsonschema_4.22.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-jsonschema_4.21.1.bb => python3-jsonschema_4.22.0.bb} (93%)

diff --git a/meta/recipes-devtools/python/python3-jsonschema_4.21.1.bb b/meta/recipes-devtools/python/python3-jsonschema_4.22.0.bb
similarity index 93%
rename from meta/recipes-devtools/python/python3-jsonschema_4.21.1.bb
rename to meta/recipes-devtools/python/python3-jsonschema_4.22.0.bb
index 381148f4bb..c3184396d2 100644
--- a/meta/recipes-devtools/python/python3-jsonschema_4.21.1.bb
+++ b/meta/recipes-devtools/python/python3-jsonschema_4.22.0.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7a60a81c146ec25599a3e1dabb8610a8 \
                     file://json/LICENSE;md5=9d4de43111d33570c8fe49b4cb0e01af"
 
-SRC_URI[sha256sum] = "85727c00279f5fa6bedbe6238d2aa6403bedd8b4864ab11207d07df3cc1b2ee5"
+SRC_URI[sha256sum] = "5b22d434a45935119af990552c862e5d6d564e8f6601206b305a61fdf661a2b7"
 
 inherit pypi python_hatchling
 
-- 
2.44.0


--===============9136994106362818062==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-jsonschema-upgrade-4.21.1-4.22.0.patch"

RnJvbSA1YjZjNDRmOGRjOGM2MjdhNTU3YzM1ZDI0M2Y0ZDljYjc2MmVkYjlhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgTWF5IDIwMjQgMDk6Mzg6NTcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWpzb25zY2hlbWE6IHVwZ3JhZGUgNC4yMS4xIC0+IDQuMjIuMAoKLS0tCiAuLi55dGhv
bjMtanNvbnNjaGVtYV80LjIxLjEuYmIgPT4gcHl0aG9uMy1qc29uc2NoZW1hXzQuMjIuMC5iYn0g
fCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLWpzb25zY2hlbWFfNC4y
MS4xLmJiID0+IHB5dGhvbjMtanNvbnNjaGVtYV80LjIyLjAuYmJ9ICg5MyUpCgpkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWpzb25zY2hlbWFfNC4yMS4x
LmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWpzb25zY2hlbWFfNC4y
Mi4wLmJiCnNpbWlsYXJpdHkgaW5kZXggOTMlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0
b29scy9weXRob24vcHl0aG9uMy1qc29uc2NoZW1hXzQuMjEuMS5iYgpyZW5hbWUgdG8gbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWpzb25zY2hlbWFfNC4yMi4wLmJiCmluZGV4
IDM4MTE0OGY0YmIuLmMzMTg0Mzk2ZDIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9weXRob24vcHl0aG9uMy1qc29uc2NoZW1hXzQuMjEuMS5iYgorKysgYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtanNvbnNjaGVtYV80LjIyLjAuYmIKQEAgLTQsNyArNCw3
IEBAIExJQ0VOU0UgPSAiTUlUIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORztt
ZDU9N2E2MGE4MWMxNDZlYzI1NTk5YTNlMWRhYmI4NjEwYTggXAogICAgICAgICAgICAgICAgICAg
ICBmaWxlOi8vanNvbi9MSUNFTlNFO21kNT05ZDRkZTQzMTExZDMzNTcwYzhmZTQ5YjRjYjBlMDFh
ZiIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjg1NzI3YzAwMjc5ZjVmYTZiZWRiZTYyMzhkMmFh
NjQwM2JlZGQ4YjQ4NjRhYjExMjA3ZDA3ZGYzY2MxYjJlZTUiCitTUkNfVVJJW3NoYTI1NnN1bV0g
PSAiNWIyMmQ0MzRhNDU5MzUxMTlhZjk5MDU1MmM4NjJlNWQ2ZDU2NGU4ZjY2MDEyMDZiMzA1YTYx
ZmRmNjYxYTJiNyIKIAogaW5oZXJpdCBweXBpIHB5dGhvbl9oYXRjaGxpbmcKIAotLSAKMi40NC4w
Cgo=

--===============9136994106362818062==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 921 .bb files complete (0 cached, 921 parsed). 1880 targets, 46 skipped, 0 masked, 0 errors.
Removing 41 recipes from the core2-64 sysroot...done.
Removing 85 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-bc364acb2e720e5aeda65c8c1e73a9cb2d4bbe25"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:bc364acb2e720e5aeda65c8c1e73a9cb2d4bbe25"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 621 Local 607 Mirrors 0 Missed 14 Current 271 (97% match, 98% complete)
Removing 9 stale sstate objects for arch x86_64...done.
Removing 2 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 277 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_23.2.0.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 278 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_23.2.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 279 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_23.2.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 280 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-idna_3.7.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 281 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-idna_3.7.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 282 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-idna_3.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 283 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-importlib-metadata_7.1.0.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 284 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-importlib-metadata_7.1.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 285 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-importlib-metadata_7.1.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 286 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonpointer_2.4.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 287 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonpointer_2.4.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 288 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonpointer_2.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 289 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema-specifications_2023.12.1.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 290 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema-specifications_2023.12.1.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 291 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema-specifications_2023.12.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 293 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_23.2.0.bb:do_create_spdx_setscene)
NOTE: recipe python3-idna-3.7-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-idna-3.7-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-importlib-metadata-7.1.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-attrs-23.2.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-attrs-23.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-importlib-metadata-7.1.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-importlib-metadata-7.1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-attrs-23.2.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-idna-3.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-jsonschema-specifications-2023.12.1-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-jsonschema-specifications-2023.12.1-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-jsonschema-specifications-2023.12.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-jsonpointer-2.4-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-jsonpointer-2.4-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-jsonpointer-2.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-attrs-23.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-idna-3.7-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-importlib-metadata-7.1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-importlib-metadata-7.1.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 294 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-idna_3.7.bb:do_create_spdx_setscene)
NOTE: recipe python3-importlib-metadata-7.1.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-idna-3.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 295 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-importlib-metadata_7.1.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 296 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonpointer_2.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 297 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema-specifications_2023.12.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 308 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema_4.22.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-idna-3.7-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-jsonschema-specifications-2023.12.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-jsonschema-specifications-2023.12.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 309 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_packagedata_setscene)
NOTE: recipe python3-attrs-23.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-jsonschema-specifications-2023.12.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-attrs-23.2.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-jsonpointer-2.4-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 310 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyrsistent_0.20.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 311 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyrsistent_0.20.0.bb:do_package_write_deb_setscene)
NOTE: recipe python3-attrs-23.2.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 312 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyrsistent_0.20.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 313 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyrsistent_0.20.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 314 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-referencing_0.34.0.bb:do_create_spdx_setscene)
NOTE: recipe python3-jsonpointer-2.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-attrs-23.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 315 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.100.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 316 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-referencing_0.34.0.bb:do_package_write_deb_setscene)
NOTE: recipe python3-jsonpointer-2.4-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 317 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_23.2.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 318 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-referencing_0.34.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 319 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-referencing_0.34.0.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-idna-3.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-importlib-metadata-7.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-jsonpointer-2.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pyrsistent-0.20.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-jsonschema-specifications-2023.12.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-jsonschema-4.22.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-pyrsistent-0.20.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-pyrsistent-0.20.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-pyrsistent-0.20.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-referencing-0.34.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-referencing-0.34.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-hypothesis-6.100.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-referencing-0.34.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-referencing-0.34.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-attrs-23.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-jsonschema-4.22.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 320 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_create_spdx_setscene)
NOTE: recipe python3-idna-3.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 321 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-idna_3.7.bb:do_packagedata_setscene)
NOTE: recipe python3-importlib-metadata-7.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 322 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-importlib-metadata_7.1.0.bb:do_packagedata_setscene)
NOTE: recipe python3-jsonpointer-2.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-referencing-0.34.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-pyrsistent-0.20.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 323 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonpointer_2.4.bb:do_packagedata_setscene)
NOTE: recipe python3-referencing-0.34.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 324 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_package_write_deb_setscene)
NOTE: recipe python3-pyrsistent-0.20.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-referencing-0.34.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 325 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_package_write_ipk_setscene)
NOTE: recipe python3-jsonschema-specifications-2023.12.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-referencing-0.34.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 326 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 327 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_create_spdx_setscene)
NOTE: Running setscene task 328 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_package_write_deb_setscene)
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pyrsistent-0.20.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-pyrsistent-0.20.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 329 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema-specifications_2023.12.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 330 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-referencing_0.34.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 334 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyrsistent_0.20.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 335 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 336 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_package_write_rpm_setscene)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/python3-hypothesis/6.100.1/temp/log.do_packagedata_setscene.784446
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.100.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 337 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.100.1.bb:do_package_setscene)
NOTE: recipe python3-attrs-23.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-idna-3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-importlib-metadata-7.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-jsonpointer-2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-jsonschema-specifications-2023.12.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pyrsistent-0.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-referencing-0.34.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-idna-3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-importlib-metadata-7.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-jsonpointer-2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-jsonschema-specifications-2023.12.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pyrsistent-0.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-referencing-0.34.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 359 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 360 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 361 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-rpds-py_0.18.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 362 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 363 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-webcolors_1.13.bb:do_create_spdx_setscene)
NOTE: Running setscene task 364 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-webcolors_1.13.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 365 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-webcolors_1.13.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 366 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-webcolors_1.13.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 367 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-zipp_3.18.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 368 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-zipp_3.18.1.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 369 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-zipp_3.18.1.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 370 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-zipp_3.18.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 371 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.3.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 372 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.3.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 373 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.3.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-zipp-3.18.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-zipp-3.18.1-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-zipp-3.18.1-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-webcolors-1.13-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-webcolors-1.13-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-zipp-3.18.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-webcolors-1.13-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-webcolors-1.13-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-rpds-py-0.18.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.12.3-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-3.12.3-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-3.12.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-zipp-3.18.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-webcolors-1.13-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-zipp-3.18.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-zipp-3.18.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-zipp-3.18.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-webcolors-1.13-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 403 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-more-itertools_10.2.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 404 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-zipp_3.18.1.bb:do_packagedata_setscene)
NOTE: recipe python3-webcolors-1.13-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 423 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_8.2.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 424 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-unittest-automake-output_0.2.bb:do_packagedata_setscene)
NOTE: recipe python3-webcolors-1.13-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 445 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-webcolors_1.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 446 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.3.bb:do_create_spdx_setscene)
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-rpds-py-0.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 493 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.75.0.bb:do_packagedata_setscene)
NOTE: recipe python3-zipp-3.18.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-more-itertools-10.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytest-8.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-webcolors-1.13-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.12.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libstd-rs-1.75.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-zipp-3.18.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-more-itertools-10.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pytest-8.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-webcolors-1.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 520 of 2506 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema_4.22.0.bb:do_fetch)
NOTE: recipe python3-3.12.3-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-hypothesis-6.100.1-r0: task do_package_setscene: Started
NOTE: recipe python3-3.12.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-3.12.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 529 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: recipe python3-3.12.3-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 531 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 532 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 533 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.42.bb:do_packagedata_setscene)
NOTE: Running setscene task 534 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc_13.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 535 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_packagedata_setscene)
NOTE: Running setscene task 536 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 537 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: Running setscene task 538 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 539 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_packagedata_setscene)
NOTE: Running setscene task 540 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.3.bb:do_packagedata_setscene)
NOTE: recipe libstd-rs-1.75.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 544 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_packagedata_setscene)
NOTE: recipe python3-jsonschema-4.22.0-r0: task do_fetch: Started
NOTE: recipe python3-jsonschema-4.22.0-r0: task do_fetch: Succeeded
NOTE: Running task 584 of 2506 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema_4.22.0.bb:do_unpack)
NOTE: recipe tzdata-2024a-r0: task do_packagedata_setscene: Started
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe ptest-runner-2.4.3+git-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.42-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.2.21-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.5-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-jsonschema-4.22.0-r0: task do_unpack: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 551 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe tzdata-2024a-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-jsonschema-4.22.0-r0: task do_unpack: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.3+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 565 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 567 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 575 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 576 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 580 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.0.bb:do_packagedata_setscene)
NOTE: recipe python3-hypothesis-6.100.1-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 585 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.100.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 586 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 587 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.3.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libatomic-ops-7.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.42-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-4.15.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 594 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.191.bb:do_packagedata_setscene)
NOTE: recipe gcc-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 599 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 604 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: recipe bash-5.2.21-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-hypothesis-6.100.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 611 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe coreutils-9.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libatomic-ops-7.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.12.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.12.3-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-hypothesis-6.100.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe elfutils-0.191-r0: task do_packagedata_setscene: Started
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 637 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.1.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.15.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe elfutils-0.191-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 643 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 645 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: Running setscene task 647 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 651 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 653 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 655 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_packagedata_setscene)
NOTE: recipe mpfr-4.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 1039 of 2506 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe libarchive-3.7.3-r0: task do_packagedata_setscene: Started
NOTE: Running task 1065 of 2506 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema_4.22.0.bb:do_patch)
NOTE: recipe python3-3.12.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mpfr-4.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.12.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 659 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 660 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 661 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 662 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 663 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 664 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 666 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 667 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: Running setscene task 671 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 675 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 679 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 680 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_packagedata_setscene)
NOTE: recipe python3-jsonschema-4.22.0-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libarchive-3.7.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 681 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 688 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 691 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-jsonschema-4.22.0-r0: task do_patch: Succeeded
NOTE: Running setscene task 693 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.7.1.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.12.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe file-5.45-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 695 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 697 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_packagedata_setscene)
NOTE: recipe expat-2.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 701 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 703 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 705 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 706 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.12.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 708 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 710 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 717 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.3.bb:do_packagedata_setscene)
NOTE: recipe file-5.45-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 721 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 722 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 723 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.14.bb:do_packagedata_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe curl-8.7.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 725 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_recipe_qa_setscene)
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 726 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 728 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_packagedata_setscene)
NOTE: recipe libtirpc-1.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.10.3-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gnutls-3.8.5-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.45.3-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe lzlib-1.14-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 729 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 730 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_packagedata_setscene)
NOTE: recipe libtirpc-1.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 735 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: recipe curl-8.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 738 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.0.bb:do_packagedata_setscene)
NOTE: recipe xz-5.4.6-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 739 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcrypt-1.10.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 745 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.45.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 747 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_recipe_qa_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 749 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.69.bb:do_packagedata_setscene)
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 753 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.48.bb:do_packagedata_setscene)
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe lzlib-1.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 756 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 762 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.3.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zstd-1.5.5-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 770 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 772 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 775 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 778 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Started
NOTE: recipe libgpg-error-1.48-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.45.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 780 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_packagedata_setscene)
NOTE: recipe zstd-1.5.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 785 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_packagedata_setscene)
NOTE: recipe xz-5.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 789 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 791 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.45.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libseccomp-2.5.5-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 800 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.3.bb:do_recipe_qa_setscene)
NOTE: recipe nettle-3.9.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 802 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgpg-error-1.48-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.6.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 807 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 808 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_populate_sysroot_setscene)
NOTE: Running task 1562 of 2506 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 1578 of 2506 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1586 of 2506 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema_4.22.0.bb:do_deploy_source_date_epoch)
NOTE: recipe xz-5.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.45.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libidn2-2.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-3.9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 817 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 820 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: Running task 1642 of 2506 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema_4.22.0.bb:do_populate_lic)
NOTE: recipe opkg-utils-0.6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.45.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe openssl-3.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-jsonschema-4.22.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libunistring-1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-jsonschema-4.22.0-r0: task do_populate_lic: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: Running task 1653 of 2506 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe opkg-utils-0.6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 826 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_recipe_qa_setscene)
NOTE: recipe libunistring-1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: Running task 1665 of 2506 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe opkg-utils-0.6.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-jsonschema-4.22.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema_4.22.0.bb:do_deploy_source_date_epoch unihash changed to f75b4cac6ab995bac0c62ea63c0105763e401fc8f3af4b92689c5ffa244d7110
NOTE: recipe python3-jsonschema-4.22.0-r0: task do_populate_lic: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema_4.22.0.bb:do_populate_lic unihash changed to 981471f3116f9413efb7f37179d3e9fb4b83ef8226d924ded474e78fa1ecfb77
NOTE: Running task 1671 of 2506 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe libpam-1.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 834 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: Running task 1677 of 2506 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 839 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 840 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: Running task 1698 of 2506 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 850 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 852 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 853 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 855 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 857 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 858 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 860 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 861 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 863 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 865 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 866 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 867 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 868 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 869 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 871 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 879 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 881 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 882 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 1733 of 2506 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 885 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 887 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 046af30f485647cdc4daf97991a290103f143d7d3bc201e5aa9bffcd6d2b5b32
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 888 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.42.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 890 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_recipe_qa_setscene)
NOTE: recipe linux-libc-headers-6.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 892 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.42.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2210 of 2506 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema_4.22.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2424 of 2506 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.100.1.bb:do_packagedata)
NOTE: Running task 2435 of 2506 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema_4.22.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-jsonschema-4.22.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-hypothesis-6.100.1-r0: task do_packagedata: Started
NOTE: recipe python3-jsonschema-4.22.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-hypothesis-6.100.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-jsonschema-4.22.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-jsonschema-4.22.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2494 of 2506 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema_4.22.0.bb:do_configure)
NOTE: recipe python3-jsonschema-4.22.0-r0: task do_configure: Started
NOTE: recipe python3-jsonschema-4.22.0-r0: task do_configure: Succeeded
NOTE: Running task 2495 of 2506 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema_4.22.0.bb:do_compile)
NOTE: recipe python3-jsonschema-4.22.0-r0: task do_compile: Started
NOTE: recipe python3-jsonschema-4.22.0-r0: task do_compile: Succeeded
NOTE: Running task 2496 of 2506 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema_4.22.0.bb:do_install)
NOTE: recipe python3-jsonschema-4.22.0-r0: task do_install: Started
NOTE: recipe python3-jsonschema-4.22.0-r0: task do_install: Succeeded
NOTE: Running task 2497 of 2506 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema_4.22.0.bb:do_package)
NOTE: Running task 2498 of 2506 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema_4.22.0.bb:do_populate_sysroot)
NOTE: recipe python3-jsonschema-4.22.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-jsonschema-4.22.0-r0: task do_package: Started
NOTE: recipe python3-jsonschema-4.22.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-jsonschema-4.22.0-r0: task do_package: Succeeded
NOTE: Running task 2499 of 2506 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema_4.22.0.bb:do_packagedata)
NOTE: recipe python3-jsonschema-4.22.0-r0: task do_packagedata: Started
NOTE: recipe python3-jsonschema-4.22.0-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema_4.22.0.bb:do_packagedata unihash changed to 2a55a428597ed3e4503bee208e5e42d8ea26f6865956f8e07e898d29964aea39
NOTE: Setscene tasks completed
NOTE: Running task 2500 of 2506 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema_4.22.0.bb:do_create_spdx)
NOTE: Running task 2501 of 2506 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema_4.22.0.bb:do_package_write_ipk)
NOTE: Running task 2502 of 2506 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema_4.22.0.bb:do_package_write_deb)
NOTE: Running task 2503 of 2506 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema_4.22.0.bb:do_package_write_rpm)
NOTE: Running task 2504 of 2506 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema_4.22.0.bb:do_package_qa)
NOTE: recipe python3-jsonschema-4.22.0-r0: task do_create_spdx: Started
NOTE: recipe python3-jsonschema-4.22.0-r0: task do_package_write_ipk: Started
NOTE: recipe python3-jsonschema-4.22.0-r0: task do_package_write_deb: Started
NOTE: recipe python3-jsonschema-4.22.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-jsonschema-4.22.0-r0: task do_package_qa: Started
NOTE: recipe python3-jsonschema-4.22.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 2505 of 2506 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema_4.22.0.bb:do_create_runtime_spdx)
NOTE: recipe python3-jsonschema-4.22.0-r0: task do_create_runtime_spdx: Started
NOTE: recipe python3-jsonschema-4.22.0-r0: task do_package_write_ipk: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema_4.22.0.bb:do_package_write_ipk unihash changed to e679e78992eead2f4d2f3aeec8d8778922dbc8484bb3e6f16490f0e904d19cd8
NOTE: recipe python3-jsonschema-4.22.0-r0: task do_package_qa: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema_4.22.0.bb:do_package_qa unihash changed to 3db79a5bc22dfcd0ef3b55cc1a1b0a0768b0fe4ec88a2788e35af3e8a60b3055
NOTE: recipe python3-jsonschema-4.22.0-r0: task do_package_write_deb: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema_4.22.0.bb:do_package_write_deb unihash changed to 04909274f4a6845ae34f3fa9615c64fd1e6f5d5a230922ed9a8ec06401b2cb7b
NOTE: recipe python3-jsonschema-4.22.0-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema_4.22.0.bb:do_package_write_rpm unihash changed to d9857dd2d591df86378196338ea484a28e4669cb8d20df11bb56b0603e85186b
NOTE: recipe python3-jsonschema-4.22.0-r0: task do_create_runtime_spdx: Succeeded
NOTE: Running noexec task 2506 of 2506 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema_4.22.0.bb:do_build)
NOTE: Tasks Summary: Attempted 2506 tasks of which 2476 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: python3-hypothesis-6.100.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-src went backwards which would break package feeds (from 0:6.102.4-r0 to 0:6.100.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.100.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-dbg went backwards which would break package feeds (from 0:6.102.4-r0 to 0:6.100.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.100.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-ptest went backwards which would break package feeds (from 0:6.102.4-r0 to 0:6.100.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.100.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-staticdev went backwards which would break package feeds (from 0:6.102.4-r0 to 0:6.100.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.100.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-dev went backwards which would break package feeds (from 0:6.102.4-r0 to 0:6.100.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.100.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-doc went backwards which would break package feeds (from 0:6.102.4-r0 to 0:6.100.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.100.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-locale went backwards which would break package feeds (from 0:6.102.4-r0 to 0:6.100.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.100.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis went backwards which would break package feeds (from 0:6.102.4-r0 to 0:6.100.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.100.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============9136994106362818062==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-jsonschema: PV changed from "4.21.1" to "4.22.0"
packages/core2-64-poky-linux/python3-jsonschema: SRC_URI changed from "https://files.pythonhosted.org/packages/source/j/jsonschema/jsonschema-4.21.1.tar.gz;downloadfilename=jsonschema-4.21.1.tar.gz" to "https://files.pythonhosted.org/packages/source/j/jsonschema/jsonschema-4.22.0.tar.gz;downloadfilename=jsonschema-4.22.0.tar.gz"
packages/core2-64-poky-linux/python3-jsonschema: PKGV changed from 4.21.1 [default] to 4.22.0 [default]
packages/core2-64-poky-linux/python3-jsonschema/python3-jsonschema-dbg: PV changed from "4.21.1" to "4.22.0"
packages/core2-64-poky-linux/python3-jsonschema/python3-jsonschema-dbg: PKGV changed from 4.21.1 [default] to 4.22.0 [default]
packages/core2-64-poky-linux/python3-jsonschema/python3-jsonschema-dev: PV changed from "4.21.1" to "4.22.0"
packages/core2-64-poky-linux/python3-jsonschema/python3-jsonschema-dev: PKGV changed from 4.21.1 [default] to 4.22.0 [default]
packages/core2-64-poky-linux/python3-jsonschema/python3-jsonschema-doc: PV changed from "4.21.1" to "4.22.0"
packages/core2-64-poky-linux/python3-jsonschema/python3-jsonschema-doc: PKGV changed from 4.21.1 [default] to 4.22.0 [default]
packages/core2-64-poky-linux/python3-jsonschema/python3-jsonschema-locale: PV changed from "4.21.1" to "4.22.0"
packages/core2-64-poky-linux/python3-jsonschema/python3-jsonschema-locale: PKGV changed from 4.21.1 [default] to 4.22.0 [default]
packages/core2-64-poky-linux/python3-jsonschema/python3-jsonschema-src: PV changed from "4.21.1" to "4.22.0"
packages/core2-64-poky-linux/python3-jsonschema/python3-jsonschema-src: PKGV changed from 4.21.1 [default] to 4.22.0 [default]
packages/core2-64-poky-linux/python3-jsonschema/python3-jsonschema-staticdev: PV changed from "4.21.1" to "4.22.0"
packages/core2-64-poky-linux/python3-jsonschema/python3-jsonschema-staticdev: PKGV changed from 4.21.1 [default] to 4.22.0 [default]
packages/core2-64-poky-linux/python3-jsonschema/python3-jsonschema-tests: PV changed from "4.21.1" to "4.22.0"
packages/core2-64-poky-linux/python3-jsonschema/python3-jsonschema-tests: PKGSIZE changed from 453513 to 459063 (+1%)
packages/core2-64-poky-linux/python3-jsonschema/python3-jsonschema-tests: PKGV changed from 4.21.1 [default] to 4.22.0 [default]
packages/core2-64-poky-linux/python3-jsonschema/python3-jsonschema: PV changed from "4.21.1" to "4.22.0"
packages/core2-64-poky-linux/python3-jsonschema/python3-jsonschema: PKGSIZE changed from 460085 to 474915 (+3%)
packages/core2-64-poky-linux/python3-jsonschema/python3-jsonschema: FILELIST: directory renamed /usr/lib/python3.12/site-packages/jsonschema-4.21.1.dist-info -> /usr/lib/python3.12/site-packages/jsonschema-4.22.0.dist-info, directory renamed /usr/lib/python3.12/site-packages/jsonschema-4.21.1.dist-info/licenses -> /usr/lib/python3.12/site-packages/jsonschema-4.22.0.dist-info/licenses, added "/usr/lib/python3.12/site-packages/jsonschema/benchmarks/__pycache__/useless_applicator_schemas.cpython-312.pyc /usr/lib/python3.12/site-packages/jsonschema/benchmarks/useless_keywords.py /usr/lib/python3.12/site-packages/jsonschema/benchmarks/__pycache__/const_vs_enum.cpython-312.pyc /usr/lib/python3.12/site-packages/jsonschema/benchmarks/useless_applicator_schemas.py /usr/lib/python3.12/site-packages/jsonschema/benchmarks/const_vs_enum.py /usr/lib/python3.12/site-packages/jsonschema/benchmarks/__pycache__/useless_keywords.cpython-312.pyc"
packages/core2-64-poky-linux/python3-jsonschema/python3-jsonschema: PKGV changed from 4.21.1 [default] to 4.22.0 [default]
Changes to packages/core2-64-poky-linux/python3-jsonschema (sysroot):
  /usr/lib/python3.12/site-packages/jsonschema-4.21.1.dist-info moved to /usr/lib/python3.12/site-packages/jsonschema-4.22.0.dist-info
  /usr/lib/python3.12/site-packages/jsonschema/benchmarks/const_vs_enum.py was added
  /usr/lib/python3.12/site-packages/jsonschema/benchmarks/__pycache__/const_vs_enum.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/jsonschema/benchmarks/__pycache__/useless_applicator_schemas.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/jsonschema/benchmarks/__pycache__/useless_keywords.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/jsonschema/benchmarks/useless_applicator_schemas.py was added
  /usr/lib/python3.12/site-packages/jsonschema/benchmarks/useless_keywords.py was added

--===============9136994106362818062==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/python3-jsonschema/python3-jsonschema: FILELIST: directory renamed /usr/lib/python3.12/site-packages/jsonschema-4.21.1.dist-info/licenses -> /usr/lib/python3.12/site-packages/jsonschema-4.22.0.dist-info/licenses, directory renamed /usr/lib/python3.12/site-packages/jsonschema-4.21.1.dist-info -> /usr/lib/python3.12/site-packages/jsonschema-4.22.0.dist-info, added "/usr/lib/python3.12/site-packages/jsonschema/benchmarks/__pycache__/useless_keywords.cpython-312.pyc /usr/lib/python3.12/site-packages/jsonschema/benchmarks/__pycache__/const_vs_enum.cpython-312.pyc /usr/lib/python3.12/site-packages/jsonschema/benchmarks/const_vs_enum.py /usr/lib/python3.12/site-packages/jsonschema/benchmarks/useless_keywords.py /usr/lib/python3.12/site-packages/jsonschema/benchmarks/__pycache__/useless_applicator_schemas.cpython-312.pyc /usr/lib/python3.12/site-packages/jsonschema/benchmarks/useless_applicator_schemas.py"
Changes to packages/core2-64-poky-linux/python3-jsonschema (sysroot):
  /usr/lib/python3.12/site-packages/jsonschema-4.21.1.dist-info moved to /usr/lib/python3.12/site-packages/jsonschema-4.22.0.dist-info
  /usr/lib/python3.12/site-packages/jsonschema/benchmarks/const_vs_enum.py was added
  /usr/lib/python3.12/site-packages/jsonschema/benchmarks/__pycache__/const_vs_enum.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/jsonschema/benchmarks/__pycache__/useless_applicator_schemas.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/jsonschema/benchmarks/__pycache__/useless_keywords.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/jsonschema/benchmarks/useless_applicator_schemas.py was added
  /usr/lib/python3.12/site-packages/jsonschema/benchmarks/useless_keywords.py was added

--===============9136994106362818062==--

