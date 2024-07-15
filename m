Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E308C54756
	for <webhook@archiver.kernel.org>; Mon, 15 Jul 2024 19:19:20 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.1361.1721071146299283167
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jul 2024 12:19:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=hvn2GzRy;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=Q0SCxAI8;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 01010190b7d59549-4aa4874e-167d-41bf-8828-f22ab7690d14-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1721071146;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=mRyDDON174YpNLMRl6HyTipb+DsZRW2yxr9J1yxC0jc=;
	b=hvn2GzRy5dTTr8kCbXaEcWPga5MVhL65HZs+ihpGOtF/Wx6j+pFWOf0sOBYyExax
	cz28ktYltp72ITozhgghbI/d1bVcXVxxQati0l5DvtATxcIkIaB9++l0p7veL4w1SEZ
	DjMvZj8gyS01OtfXARb2dE8UKZfLHNfrIqfI1bAs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1721071146;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=mRyDDON174YpNLMRl6HyTipb+DsZRW2yxr9J1yxC0jc=;
	b=Q0SCxAI8k8xEEOA8SY39YNOlucpH/v9HQyEtAw1mgOdnd/y7t6VXj7We1sf9Am/g
	ZPtgRQqOBqoTkFQKIXobAhtPba0L3hmdg/zZNuipcB9TL3tou1xxfqCCXERUZbcgcBd
	2MWI0kx+OMZs9sT4WZSFRi0GlnP489VnhC2COJL0=
Content-Type: multipart/mixed; boundary="===============8096472018798718793=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-jsonschema: upgrading to 4.23.0 SUCCEEDED
Message-ID: <01010190b7d59549-4aa4874e-167d-41bf-8828-f22ab7690d14-000000@us-west-2.amazonses.com>
Date: Mon, 15 Jul 2024 19:19:06 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.07.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jul 2024 19:19:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201975

--===============8096472018798718793==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-jsonschema* to *4.23.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-jsonschema-upgrade-4.22.0-4.23.0.patch
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
From 0e96d6f643aea839642ab2243fb6dfffb9f604c8 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Jul 2024 10:35:09 +0000
Subject: [PATCH] python3-jsonschema: upgrade 4.22.0 -> 4.23.0

---
 ...ython3-jsonschema_4.22.0.bb => python3-jsonschema_4.23.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-jsonschema_4.22.0.bb => python3-jsonschema_4.23.0.bb} (93%)

diff --git a/meta/recipes-devtools/python/python3-jsonschema_4.22.0.bb b/meta/recipes-devtools/python/python3-jsonschema_4.23.0.bb
similarity index 93%
rename from meta/recipes-devtools/python/python3-jsonschema_4.22.0.bb
rename to meta/recipes-devtools/python/python3-jsonschema_4.23.0.bb
index c3184396d2..1a5b373f81 100644
--- a/meta/recipes-devtools/python/python3-jsonschema_4.22.0.bb
+++ b/meta/recipes-devtools/python/python3-jsonschema_4.23.0.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7a60a81c146ec25599a3e1dabb8610a8 \
                     file://json/LICENSE;md5=9d4de43111d33570c8fe49b4cb0e01af"
 
-SRC_URI[sha256sum] = "5b22d434a45935119af990552c862e5d6d564e8f6601206b305a61fdf661a2b7"
+SRC_URI[sha256sum] = "d71497fef26351a33265337fa77ffeb82423f3ea21283cd9467bb03999266bc4"
 
 inherit pypi python_hatchling
 
-- 
2.44.0


--===============8096472018798718793==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-jsonschema-upgrade-4.22.0-4.23.0.patch"

RnJvbSAwZTk2ZDZmNjQzYWVhODM5NjQyYWIyMjQzZmI2ZGZmZmI5ZjYwNGM4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgSnVsIDIwMjQgMTA6MzU6MDkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWpzb25zY2hlbWE6IHVwZ3JhZGUgNC4yMi4wIC0+IDQuMjMuMAoKLS0tCiAuLi55dGhv
bjMtanNvbnNjaGVtYV80LjIyLjAuYmIgPT4gcHl0aG9uMy1qc29uc2NoZW1hXzQuMjMuMC5iYn0g
fCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLWpzb25zY2hlbWFfNC4y
Mi4wLmJiID0+IHB5dGhvbjMtanNvbnNjaGVtYV80LjIzLjAuYmJ9ICg5MyUpCgpkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWpzb25zY2hlbWFfNC4yMi4w
LmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWpzb25zY2hlbWFfNC4y
My4wLmJiCnNpbWlsYXJpdHkgaW5kZXggOTMlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0
b29scy9weXRob24vcHl0aG9uMy1qc29uc2NoZW1hXzQuMjIuMC5iYgpyZW5hbWUgdG8gbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWpzb25zY2hlbWFfNC4yMy4wLmJiCmluZGV4
IGMzMTg0Mzk2ZDIuLjFhNWIzNzNmODEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9weXRob24vcHl0aG9uMy1qc29uc2NoZW1hXzQuMjIuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtanNvbnNjaGVtYV80LjIzLjAuYmIKQEAgLTQsNyArNCw3
IEBAIExJQ0VOU0UgPSAiTUlUIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORztt
ZDU9N2E2MGE4MWMxNDZlYzI1NTk5YTNlMWRhYmI4NjEwYTggXAogICAgICAgICAgICAgICAgICAg
ICBmaWxlOi8vanNvbi9MSUNFTlNFO21kNT05ZDRkZTQzMTExZDMzNTcwYzhmZTQ5YjRjYjBlMDFh
ZiIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjViMjJkNDM0YTQ1OTM1MTE5YWY5OTA1NTJjODYy
ZTVkNmQ1NjRlOGY2NjAxMjA2YjMwNWE2MWZkZjY2MWEyYjciCitTUkNfVVJJW3NoYTI1NnN1bV0g
PSAiZDcxNDk3ZmVmMjYzNTFhMzMyNjUzMzdmYTc3ZmZlYjgyNDIzZjNlYTIxMjgzY2Q5NDY3YmIw
Mzk5OTI2NmJjNCIKIAogaW5oZXJpdCBweXBpIHB5dGhvbl9oYXRjaGxpbmcKIAotLSAKMi40NC4w
Cgo=

--===============8096472018798718793==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-jsonschema (sysroot):
  /usr/lib/python3.12/site-packages/jsonschema-4.22.0.dist-info moved to /usr/lib/python3.12/site-packages/jsonschema-4.23.0.dist-info

--===============8096472018798718793==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 918 .bb files complete (0 cached, 918 parsed). 1879 targets, 46 skipped, 0 masked, 0 errors.
Removing 35 recipes from the core2-64 sysroot...done.
Removing 74 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-c79a92a01c47d83e9758d9591b329c1033b58e57"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:c79a92a01c47d83e9758d9591b329c1033b58e57"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 593 Local 578 Mirrors 0 Missed 15 Current 299 (97% match, 98% complete)
Removing 2 stale sstate objects for arch qemux86_64...done.
Removing 9 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 303 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_23.2.0.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 304 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_23.2.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 305 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_23.2.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 306 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-idna_3.7.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 307 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-idna_3.7.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 308 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-idna_3.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 309 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-importlib-metadata_7.1.0.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 310 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-importlib-metadata_7.1.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 311 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-importlib-metadata_7.1.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 312 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonpointer_2.4.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 313 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonpointer_2.4.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 314 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonpointer_2.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 315 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema-specifications_2023.12.1.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 316 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema-specifications_2023.12.1.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 317 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema-specifications_2023.12.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 319 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_23.2.0.bb:do_create_spdx_setscene)
NOTE: recipe python3-idna-3.7-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-idna-3.7-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-attrs-23.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-idna-3.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-attrs-23.2.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-importlib-metadata-7.1.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-attrs-23.2.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-importlib-metadata-7.1.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-importlib-metadata-7.1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-jsonschema-specifications-2023.12.1-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-jsonpointer-2.4-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-jsonschema-specifications-2023.12.1-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-jsonschema-specifications-2023.12.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-jsonpointer-2.4-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-jsonpointer-2.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-attrs-23.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-idna-3.7-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 320 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-idna_3.7.bb:do_create_spdx_setscene)
NOTE: recipe python3-idna-3.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-importlib-metadata-7.1.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-importlib-metadata-7.1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-importlib-metadata-7.1.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-jsonschema-specifications-2023.12.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-jsonpointer-2.4-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 321 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-importlib-metadata_7.1.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 322 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonpointer_2.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 323 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema-specifications_2023.12.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 335 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 336 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyrsistent_0.20.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 337 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyrsistent_0.20.0.bb:do_package_write_deb_setscene)
NOTE: recipe python3-jsonschema-specifications-2023.12.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-jsonpointer-2.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-jsonschema-specifications-2023.12.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-attrs-23.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 338 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyrsistent_0.20.0.bb:do_package_write_ipk_setscene)
NOTE: recipe python3-attrs-23.2.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-idna-3.7-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-attrs-23.2.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 339 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyrsistent_0.20.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 340 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-referencing_0.35.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 341 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-referencing_0.35.1.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 342 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-referencing_0.35.1.bb:do_package_write_ipk_setscene)
NOTE: recipe python3-jsonpointer-2.4-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 343 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-referencing_0.35.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 344 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 345 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_package_write_deb_setscene)
NOTE: recipe python3-attrs-23.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 346 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-attrs_23.2.0.bb:do_packagedata_setscene)
NOTE: recipe python3-idna-3.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-importlib-metadata-7.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-jsonschema-specifications-2023.12.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pyrsistent-0.20.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-jsonpointer-2.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pyrsistent-0.20.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-pyrsistent-0.20.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-pyrsistent-0.20.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-referencing-0.35.1-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-referencing-0.35.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-referencing-0.35.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-referencing-0.35.1-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-attrs-23.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-idna-3.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 347 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.103.2.bb:do_packagedata_setscene)
NOTE: recipe python3-importlib-metadata-7.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-jsonpointer-2.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-jsonschema-specifications-2023.12.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 348 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-idna_3.7.bb:do_packagedata_setscene)
NOTE: recipe python3-pyrsistent-0.20.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 349 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-importlib-metadata_7.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 350 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonpointer_2.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 351 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema-specifications_2023.12.1.bb:do_packagedata_setscene)
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 352 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_package_write_ipk_setscene)
NOTE: recipe python3-referencing-0.35.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-referencing-0.35.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-referencing-0.35.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 353 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-pyrsistent-0.20.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 357 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_create_spdx_setscene)
NOTE: Running setscene task 358 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 359 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 360 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-referencing-0.35.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 361 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-webcolors_1.13.bb:do_create_spdx_setscene)
NOTE: Running setscene task 362 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-referencing_0.35.1.bb:do_packagedata_setscene)
NOTE: recipe python3-pyrsistent-0.20.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-pyrsistent-0.20.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 363 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-rpds-py_0.18.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 364 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyrsistent_0.20.0.bb:do_packagedata_setscene)
NOTE: recipe python3-attrs-23.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 368 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-webcolors_1.13.bb:do_package_write_deb_setscene)
NOTE: recipe python3-idna-3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-importlib-metadata-7.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-hypothesis-6.103.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-jsonschema-specifications-2023.12.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-jsonpointer-2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-referencing-0.35.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-webcolors-1.13-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pyrsistent-0.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-rpds-py-0.18.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-webcolors-1.13-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 369 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-webcolors_1.13.bb:do_package_write_ipk_setscene)
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_create_spdx_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/python3-importlib-metadata/7.1.0/temp/log.do_packagedata_setscene.1332802
NOTE: Running setscene task 370 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-webcolors_1.13.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 371 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-zipp_3.19.2.bb:do_create_spdx_setscene)
NOTE: recipe python3-idna-3.7-r0: task do_packagedata_setscene: Succeeded
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-importlib-metadata_7.1.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe python3-jsonschema-specifications-2023.12.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 372 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-importlib-metadata_7.1.0.bb:do_package_setscene)
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_package_write_rpm_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/python3-jsonpointer/2.4/temp/log.do_packagedata_setscene.1332813
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonpointer_2.4.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe python3-webcolors-1.13-r0: task do_create_spdx_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/python3-hypothesis/6.103.2/temp/log.do_packagedata_setscene.1332786
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.103.2.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe python3-referencing-0.35.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pyrsistent-0.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-webcolors-1.13-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-rpds-py-0.18.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-webcolors-1.13-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-zipp-3.19.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-webcolors-1.13-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 373 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.103.2.bb:do_package_setscene)
NOTE: recipe python3-zipp-3.19.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-webcolors-1.13-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-webcolors-1.13-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 377 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonpointer_2.4.bb:do_package_setscene)
NOTE: Running setscene task 384 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_8.2.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 388 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 389 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 393 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 394 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-unittest-automake-output_0.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 395 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-webcolors_1.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 396 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-zipp_3.19.2.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 397 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-zipp_3.19.2.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 398 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-zipp_3.19.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 399 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 400 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 401 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 402 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytest-8.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-zipp-3.19.2-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-zipp-3.19.2-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-zipp-3.19.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-webcolors-1.13-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.12.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.12.4-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-3.12.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-3.12.4-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-zipp-3.19.2-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 404 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.75.0.bb:do_packagedata_setscene)
NOTE: recipe python3-zipp-3.19.2-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-zipp-3.19.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 408 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-more-itertools_10.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 409 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-zipp_3.19.2.bb:do_packagedata_setscene)
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pytest-8.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-webcolors-1.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.12.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 530 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.1.bb:do_create_spdx_setscene)
NOTE: recipe python3-more-itertools-10.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libstd-rs-1.75.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-zipp-3.19.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-14.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-zipp-3.19.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-more-itertools-10.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libstd-rs-1.75.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.12.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 541 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_packagedata_setscene)
NOTE: recipe python3-3.12.4-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-3.12.4-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 547 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 548 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 549 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.42.bb:do_packagedata_setscene)
NOTE: Running setscene task 550 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc_14.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 551 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_packagedata_setscene)
NOTE: Running setscene task 552 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 553 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: Running setscene task 554 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 555 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_packagedata_setscene)
NOTE: Running setscene task 556 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.4.bb:do_packagedata_setscene)
NOTE: recipe python3-importlib-metadata-7.1.0-r0: task do_package_setscene: Started
NOTE: recipe gcc-runtime-14.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 558 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe python3-hypothesis-6.103.2-r0: task do_package_setscene: Started
NOTE: recipe python3-jsonpointer-2.4-r0: task do_package_setscene: Started
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe tzdata-2024a-r0: task do_packagedata_setscene: Started
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.42-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-14.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.2.21-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.5-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 563 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 565 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb:do_packagedata_setscene)
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe tzdata-2024a-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 582 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 583 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 587 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 591 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_packagedata_setscene)
NOTE: recipe libatomic-ops-7.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-importlib-metadata-7.1.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 596 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-importlib-metadata_7.1.0.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-14.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.6.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 600 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe binutils-2.42-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 605 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.191.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.15.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 1181 of 2509 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema_4.23.0.bb:do_recipe_qa)
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-jsonpointer-2.4-r0: task do_package_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.2.21-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 614 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonpointer_2.4.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 618 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe python3-importlib-metadata-7.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe coreutils-9.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libatomic-ops-7.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.191-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-jsonschema-4.23.0-r0: task do_recipe_qa: Started
NOTE: recipe base-passwd-3.6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-jsonpointer-2.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-importlib-metadata-7.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-hypothesis-6.103.2-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 636 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.103.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 637 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 638 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 642 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.1.bb:do_packagedata_setscene)
NOTE: recipe python3-jsonpointer-2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1426 of 2509 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe elfutils-0.191-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-4.15.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 645 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 647 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: Running setscene task 649 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 653 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 658 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 660 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_packagedata_setscene)
NOTE: recipe python3-hypothesis-6.103.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mpfr-4.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe python3-jsonschema-4.23.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1440 of 2509 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema_4.23.0.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: recipe python3-3.12.4-r0: task do_packagedata_setscene: Started
NOTE: Running task 1441 of 2509 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 1442 of 2509 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-3.12.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-hypothesis-6.103.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.7.4-r0: task do_packagedata_setscene: Started
NOTE: recipe mpfr-4.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-jsonschema-4.23.0-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-jsonschema-4.23.0-r0: task do_fetch: Succeeded
NOTE: Running task 1453 of 2509 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema_4.23.0.bb:do_unpack)
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 678 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_packagedata_setscene)
NOTE: Running setscene task 680 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.8.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 682 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 684 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_packagedata_setscene)
NOTE: recipe libarchive-3.7.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 691 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: Running task 1518 of 2509 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe python3-jsonschema-4.23.0-r0: task do_unpack: Started
NOTE: recipe file-5.45-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-jsonschema-4.23.0-r0: task do_unpack: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.8.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.10.3-r0: task do_packagedata_setscene: Started
NOTE: Running task 1525 of 2509 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema_4.23.0.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: Running task 1527 of 2509 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe python3-3.12.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe file-5.45-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 699 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 701 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_packagedata_setscene)
NOTE: recipe python3-jsonschema-4.23.0-r0: task do_patch: Started
NOTE: recipe python3-3.12.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 704 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 705 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 706 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 707 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 708 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240517-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 709 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240517-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 711 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 712 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: recipe curl-8.8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 713 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcrypt-1.10.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 714 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 715 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe lzlib-1.14-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.6-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-jsonschema-4.23.0-r0: task do_patch: Succeeded
NOTE: Running setscene task 716 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_packagedata_setscene)
NOTE: recipe gnutls-3.8.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.40.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 717 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20240517-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20240517-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 721 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: recipe python3-3.12.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe lzlib-1.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 727 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_packagedata_setscene)
NOTE: recipe zstd-1.5.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 728 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20240517-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.40.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 730 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 737 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: recipe expat-2.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 739 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 741 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 744 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_packagedata_setscene)
NOTE: recipe python3-3.12.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20240517-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 746 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 748 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 750 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 752 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240517-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 754 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 756 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20240517-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 757 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 763 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_packagedata_setscene)
NOTE: recipe xz-5.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.40.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 766 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 768 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_packagedata_setscene)
NOTE: recipe libedit-20240517-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 769 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 771 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_packagedata_setscene)
NOTE: Running setscene task 775 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.49.bb:do_packagedata_setscene)
NOTE: recipe libtirpc-1.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 777 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 781 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 783 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 784 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.3.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 786 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 789 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 792 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.70-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libidn2-2.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 796 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_packagedata_setscene)
NOTE: Running task 1604 of 2509 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe libgpg-error-1.49-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.45.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe nettle-3.9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.45.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 799 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1610 of 2509 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema_4.23.0.bb:do_deploy_source_date_epoch)
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1616 of 2509 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema_4.23.0.bb:do_populate_lic)
NOTE: recipe libcap-2.70-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 804 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_packagedata_setscene)
NOTE: recipe libunistring-1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 810 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.45.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libseccomp-2.5.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: recipe libtirpc-1.3.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe nettle-3.9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 815 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe python3-jsonschema-4.23.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe sqlite3-3_3.45.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 821 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.3.bb:do_recipe_qa_setscene)
NOTE: Running task 1647 of 2509 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe python3-jsonschema-4.23.0-r0: task do_populate_lic: Started
NOTE: recipe libgpg-error-1.49-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.6.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 823 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 824 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libunistring-1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.45.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.45.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-jsonschema-4.23.0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema_4.23.0.bb:do_populate_lic unihash changed to 85420379228f0ace35e5e4fcdd512653303c6ec0f9928f5d9960098feb9c6f8a
NOTE: recipe opkg-utils-0.6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 835 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_recipe_qa_setscene)
NOTE: recipe python3-jsonschema-4.23.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: Running task 1683 of 2509 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe libpam-1.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 837 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 842 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 843 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 850 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.1.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 852 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 853 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.1.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-14.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-14.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-14.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 855 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.1.bb:do_packagedata_setscene)
NOTE: recipe libgcc-14.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-14.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 857 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 858 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-14.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 860 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-14.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-14.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-14.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-14.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 861 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 863 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.1.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 865 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 866 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 867 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.9.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-14.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-14.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 871 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 872 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 874 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: Running task 1710 of 2509 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 879 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 880 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 882 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 70b51aade0868d2e9665cb098e7343a206fad5376f133e2526ffd66fdb682fa5
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 885 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 887 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.9.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 888 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.42.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 890 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.9.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 892 of 892 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.42.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2218 of 2509 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema_4.23.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2309 of 2509 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonpointer_2.4.bb:do_packagedata)
NOTE: Running task 2310 of 2509 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-importlib-metadata_7.1.0.bb:do_packagedata)
NOTE: Running task 2426 of 2509 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.103.2.bb:do_packagedata)
NOTE: recipe python3-jsonschema-4.23.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2438 of 2509 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema_4.23.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-jsonpointer-2.4-r0: task do_packagedata: Started
NOTE: recipe python3-importlib-metadata-7.1.0-r0: task do_packagedata: Started
NOTE: recipe python3-hypothesis-6.103.2-r0: task do_packagedata: Started
NOTE: recipe python3-jsonschema-4.23.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-importlib-metadata-7.1.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-jsonpointer-2.4-r0: task do_packagedata: Succeeded
NOTE: recipe python3-hypothesis-6.103.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-jsonschema-4.23.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-jsonschema-4.23.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2497 of 2509 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema_4.23.0.bb:do_configure)
NOTE: recipe python3-jsonschema-4.23.0-r0: task do_configure: Started
NOTE: recipe python3-jsonschema-4.23.0-r0: task do_configure: Succeeded
NOTE: Running task 2498 of 2509 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema_4.23.0.bb:do_compile)
NOTE: recipe python3-jsonschema-4.23.0-r0: task do_compile: Started
NOTE: recipe python3-jsonschema-4.23.0-r0: task do_compile: Succeeded
NOTE: Running task 2499 of 2509 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema_4.23.0.bb:do_install)
NOTE: recipe python3-jsonschema-4.23.0-r0: task do_install: Started
NOTE: recipe python3-jsonschema-4.23.0-r0: task do_install: Succeeded
NOTE: Running task 2500 of 2509 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema_4.23.0.bb:do_package)
NOTE: Running task 2501 of 2509 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema_4.23.0.bb:do_populate_sysroot)
NOTE: recipe python3-jsonschema-4.23.0-r0: task do_package: Started
NOTE: recipe python3-jsonschema-4.23.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-jsonschema-4.23.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-jsonschema-4.23.0-r0: task do_package: Succeeded
NOTE: Running task 2502 of 2509 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema_4.23.0.bb:do_packagedata)
NOTE: recipe python3-jsonschema-4.23.0-r0: task do_packagedata: Started
NOTE: recipe python3-jsonschema-4.23.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2503 of 2509 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema_4.23.0.bb:do_create_spdx)
NOTE: Running task 2504 of 2509 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema_4.23.0.bb:do_package_write_ipk)
NOTE: Running task 2505 of 2509 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema_4.23.0.bb:do_package_write_deb)
NOTE: Running task 2506 of 2509 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema_4.23.0.bb:do_package_write_rpm)
NOTE: Running task 2507 of 2509 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema_4.23.0.bb:do_package_qa)
NOTE: recipe python3-jsonschema-4.23.0-r0: task do_create_spdx: Started
NOTE: recipe python3-jsonschema-4.23.0-r0: task do_package_write_ipk: Started
NOTE: recipe python3-jsonschema-4.23.0-r0: task do_package_write_deb: Started
NOTE: recipe python3-jsonschema-4.23.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-jsonschema-4.23.0-r0: task do_package_qa: Started
NOTE: recipe python3-jsonschema-4.23.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 2508 of 2509 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema_4.23.0.bb:do_create_runtime_spdx)
NOTE: recipe python3-jsonschema-4.23.0-r0: task do_create_runtime_spdx: Started
NOTE: recipe python3-jsonschema-4.23.0-r0: task do_package_qa: Succeeded
NOTE: recipe python3-jsonschema-4.23.0-r0: task do_package_write_ipk: Succeeded
NOTE: recipe python3-jsonschema-4.23.0-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe python3-jsonschema-4.23.0-r0: task do_package_write_deb: Succeeded
NOTE: recipe python3-jsonschema-4.23.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2509 of 2509 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jsonschema_4.23.0.bb:do_build)
NOTE: Tasks Summary: Attempted 2509 tasks of which 2476 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 26 ERROR messages, returning a non-zero exit code.
ERROR: python3-importlib-metadata-7.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-src went backwards which would break package feeds (from 0:8.0.0-r0 to 0:7.1.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-7.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-dbg went backwards which would break package feeds (from 0:8.0.0-r0 to 0:7.1.0-r0) [version-going-backwards]
ERROR: python3-jsonpointer-2.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-jsonpointer-src went backwards which would break package feeds (from 0:3.0.0-r0 to 0:2.4-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-7.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-staticdev went backwards which would break package feeds (from 0:8.0.0-r0 to 0:7.1.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.103.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-src went backwards which would break package feeds (from 0:6.108.2-r0 to 0:6.103.2-r0) [version-going-backwards]
ERROR: python3-jsonpointer-2.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-jsonpointer-dbg went backwards which would break package feeds (from 0:3.0.0-r0 to 0:2.4-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-7.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-dev went backwards which would break package feeds (from 0:8.0.0-r0 to 0:7.1.0-r0) [version-going-backwards]
ERROR: python3-jsonpointer-2.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-jsonpointer-ptest went backwards which would break package feeds (from 0:3.0.0-r0 to 0:2.4-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.103.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-dbg went backwards which would break package feeds (from 0:6.108.2-r0 to 0:6.103.2-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-7.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-doc went backwards which would break package feeds (from 0:8.0.0-r0 to 0:7.1.0-r0) [version-going-backwards]
ERROR: python3-jsonpointer-2.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-jsonpointer-staticdev went backwards which would break package feeds (from 0:3.0.0-r0 to 0:2.4-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.103.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-ptest went backwards which would break package feeds (from 0:6.108.2-r0 to 0:6.103.2-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-7.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-locale went backwards which would break package feeds (from 0:8.0.0-r0 to 0:7.1.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.103.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-staticdev went backwards which would break package feeds (from 0:6.108.2-r0 to 0:6.103.2-r0) [version-going-backwards]
ERROR: python3-jsonpointer-2.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-jsonpointer-dev went backwards which would break package feeds (from 0:3.0.0-r0 to 0:2.4-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-7.1.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata went backwards which would break package feeds (from 0:8.0.0-r0 to 0:7.1.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-7.1.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: python3-jsonpointer-2.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-jsonpointer-doc went backwards which would break package feeds (from 0:3.0.0-r0 to 0:2.4-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.103.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-dev went backwards which would break package feeds (from 0:6.108.2-r0 to 0:6.103.2-r0) [version-going-backwards]
ERROR: python3-jsonpointer-2.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-jsonpointer-locale went backwards which would break package feeds (from 0:3.0.0-r0 to 0:2.4-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.103.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-doc went backwards which would break package feeds (from 0:6.108.2-r0 to 0:6.103.2-r0) [version-going-backwards]
ERROR: python3-jsonpointer-2.4-r0 do_packagedata_setscene: QA Issue: Package version for package python3-jsonpointer went backwards which would break package feeds (from 0:3.0.0-r0 to 0:2.4-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.103.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-locale went backwards which would break package feeds (from 0:6.108.2-r0 to 0:6.103.2-r0) [version-going-backwards]
ERROR: python3-jsonpointer-2.4-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: python3-hypothesis-6.103.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis went backwards which would break package feeds (from 0:6.108.2-r0 to 0:6.103.2-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.103.2-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============8096472018798718793==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-jsonschema: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/python3-jsonschema: SRC_URI changed from "https://files.pythonhosted.org/packages/source/j/jsonschema/jsonschema-4.22.0.tar.gz;downloadfilename=jsonschema-4.22.0.tar.gz" to "https://files.pythonhosted.org/packages/source/j/jsonschema/jsonschema-4.23.0.tar.gz;downloadfilename=jsonschema-4.23.0.tar.gz"
packages/core2-64-poky-linux/python3-jsonschema: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/python3-jsonschema/python3-jsonschema-dbg: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/python3-jsonschema/python3-jsonschema-dbg: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/python3-jsonschema/python3-jsonschema-dev: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/python3-jsonschema/python3-jsonschema-dev: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/python3-jsonschema/python3-jsonschema-doc: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/python3-jsonschema/python3-jsonschema-doc: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/python3-jsonschema/python3-jsonschema-locale: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/python3-jsonschema/python3-jsonschema-locale: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/python3-jsonschema/python3-jsonschema-src: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/python3-jsonschema/python3-jsonschema-src: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/python3-jsonschema/python3-jsonschema-staticdev: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/python3-jsonschema/python3-jsonschema-staticdev: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/python3-jsonschema/python3-jsonschema-tests: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/python3-jsonschema/python3-jsonschema-tests: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/python3-jsonschema/python3-jsonschema-tests: PKGSIZE changed from 459063 to 460236 (+0%)
packages/core2-64-poky-linux/python3-jsonschema/python3-jsonschema: PV changed from "4.22.0" to "4.23.0"
packages/core2-64-poky-linux/python3-jsonschema/python3-jsonschema: PKGV changed from 4.22.0 [default] to 4.23.0 [default]
packages/core2-64-poky-linux/python3-jsonschema/python3-jsonschema: PKGSIZE changed from 474915 to 475796 (+0%)
Changes to packages/core2-64-poky-linux/python3-jsonschema (sysroot):
  /usr/lib/python3.12/site-packages/jsonschema-4.22.0.dist-info moved to /usr/lib/python3.12/site-packages/jsonschema-4.23.0.dist-info

--===============8096472018798718793==--

