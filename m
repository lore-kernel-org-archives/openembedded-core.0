Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2A25C25B7F
	for <webhook@archiver.kernel.org>; Fri, 16 Jun 2023 03:51:28 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.830.1686887483580283367
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jun 2023 20:51:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=IJsA50mR;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 01010188c2544559-888dce0f-ab8f-4a3f-a95b-ba18c0bff270-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1686887482;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=eN0Ol+BcitgZJRPxwvpVhWy95gYUSB9OXwULAQBkg9c=;
	b=IJsA50mRXI9mS2rNHP8Ltlpt7KgLwJst4W9revwWRGU6IDHzzvrtt9hKp0x8J3Gf
	eqHpbImbYZ8i67cf+O8VeSiGrIw6lI3bjeFHeXp7T/kzaa4dvmmara1U6tgwMeuwIE+
	38obMXp5ucJ9992ERyMDN5Yve0ls1zNAsnoVu0OE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1686887482;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=eN0Ol+BcitgZJRPxwvpVhWy95gYUSB9OXwULAQBkg9c=;
	b=eS1j9OvvDhXaLmOI6XA4jrs+XcYJJnHsaaDhesaz+vRCh679jiTrVS6XwiG2ypSf
	95aQUOIZjfg+/yV7qiiNBL9fBNzyRG1LDhr1eOSWbytOrRFP7zmu3gH4YnE/Li7jvA1
	aKgT9vFSdTlYJXIrBBAAXCB0CSkGCfDDzzeh/P0E=
Content-Type: multipart/mixed; boundary="===============7278877040850972315=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-markupsafe: upgrading to 2.1.3 SUCCEEDED
Message-ID: <01010188c2544559-888dce0f-ab8f-4a3f-a95b-ba18c0bff270-000000@us-west-2.amazonses.com>
Date: Fri, 16 Jun 2023 03:51:22 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.06.16-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 03:51:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182929

--===============7278877040850972315==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-markupsafe* to *2.1.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-markupsafe-upgrade-2.1.2-2.1.3.patch
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
From a0d3bc5ddc461a9c93c0e63b2c723e56bc3390db Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Jun 2023 13:30:12 +0000
Subject: [PATCH] python3-markupsafe: upgrade 2.1.2 -> 2.1.3

---
 ...{python3-markupsafe_2.1.2.bb => python3-markupsafe_2.1.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-markupsafe_2.1.2.bb => python3-markupsafe_2.1.3.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb b/meta/recipes-devtools/python/python3-markupsafe_2.1.3.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb
rename to meta/recipes-devtools/python/python3-markupsafe_2.1.3.bb
index d150403f8c..b346cc85d9 100644
--- a/meta/recipes-devtools/python/python3-markupsafe_2.1.2.bb
+++ b/meta/recipes-devtools/python/python3-markupsafe_2.1.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://github.com/mitsuhiko/markupsafe"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=ffeffa59c90c9c4a033c7574f8f3fb75"
 
-SRC_URI[sha256sum] = "abcabc8c2b26036d62d4c746381a6f7cf60aafcc653198ad678306986b09450d"
+SRC_URI[sha256sum] = "af598ed32d6ae86f1b747b82783958b1a4ab8f617b06fe68795c7f026abbdcad"
 
 PYPI_PACKAGE = "MarkupSafe"
 inherit pypi setuptools3 ptest
-- 
2.39.2


--===============7278877040850972315==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-markupsafe-upgrade-2.1.2-2.1.3.patch"

RnJvbSBhMGQzYmM1ZGRjNDYxYTljOTNjMGU2M2IyYzcyM2U1NmJjMzM5MGRiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgSnVuIDIwMjMgMTM6MzA6MTIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLW1hcmt1cHNhZmU6IHVwZ3JhZGUgMi4xLjIgLT4gMi4xLjMKCi0tLQogLi4ue3B5dGhv
bjMtbWFya3Vwc2FmZV8yLjEuMi5iYiA9PiBweXRob24zLW1hcmt1cHNhZmVfMi4xLjMuYmJ9IHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5h
bWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1tYXJrdXBzYWZlXzIuMS4y
LmJiID0+IHB5dGhvbjMtbWFya3Vwc2FmZV8yLjEuMy5iYn0gKDg3JSkKCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbWFya3Vwc2FmZV8yLjEuMi5iYiBi
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1tYXJrdXBzYWZlXzIuMS4zLmJi
CnNpbWlsYXJpdHkgaW5kZXggODclCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy1tYXJrdXBzYWZlXzIuMS4yLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbWFya3Vwc2FmZV8yLjEuMy5iYgppbmRleCBkMTUwNDAz
ZjhjLi5iMzQ2Y2M4NWQ5IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtbWFya3Vwc2FmZV8yLjEuMi5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtbWFya3Vwc2FmZV8yLjEuMy5iYgpAQCAtMyw3ICszLDcgQEAgSE9NRVBB
R0UgPSAiaHR0cDovL2dpdGh1Yi5jb20vbWl0c3VoaWtvL21hcmt1cHNhZmUiCiBMSUNFTlNFID0g
IkJTRC0zLUNsYXVzZSIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0UucnN0O21k
NT1mZmVmZmE1OWM5MGM5YzRhMDMzYzc1NzRmOGYzZmI3NSIKIAotU1JDX1VSSVtzaGEyNTZzdW1d
ID0gImFiY2FiYzhjMmIyNjAzNmQ2MmQ0Yzc0NjM4MWE2ZjdjZjYwYWFmY2M2NTMxOThhZDY3ODMw
Njk4NmIwOTQ1MGQiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiYWY1OThlZDMyZDZhZTg2ZjFiNzQ3
YjgyNzgzOTU4YjFhNGFiOGY2MTdiMDZmZTY4Nzk1YzdmMDI2YWJiZGNhZCIKIAogUFlQSV9QQUNL
QUdFID0gIk1hcmt1cFNhZmUiCiBpbmhlcml0IHB5cGkgc2V0dXB0b29sczMgcHRlc3QKLS0gCjIu
MzkuMgoK

--===============7278877040850972315==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1804 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (897 cached, 1 parsed). 1802 targets, 36 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:13d6696f964ad53dad2b09bed96589046fe305e1"
workspace            = "master:d9cf8973d01b74aa2680dba5ac46c5cea3d1a6d0"

Initialising tasks...done.
Sstate summary: Wanted 22 Local 13 Mirrors 0 Missed 9 Current 482 (59% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 485 of 504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.2.0.bb:do_packagedata_setscene)
NOTE: recipe python3-importlib-metadata-6.2.0-r0: task do_packagedata_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/python3-importlib-metadata/6.2.0-r0/temp/log.do_packagedata_setscene.1353399
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.2.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 503 of 504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.2.0.bb:do_package_setscene)
NOTE: Running task 1076 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.3.bb:do_fetch)
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_fetch: Started
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_fetch: Succeeded
NOTE: Running task 1543 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.3.bb:do_unpack)
NOTE: Running task 1544 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_unpack: Started
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_unpack: Succeeded
NOTE: Running task 1732 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.3.bb:do_patch)
NOTE: Running task 1733 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.3.bb:do_collect_spdx_deps)
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_patch: Started
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-importlib-metadata-6.2.0-r0: task do_package_setscene: Started
NOTE: recipe python3-importlib-metadata-6.2.0-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1743 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.2.0.bb:do_packagedata)
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-importlib-metadata-6.2.0-r0: task do_packagedata: Started
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_patch: Succeeded
NOTE: Running task 1744 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1745 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.3.bb:do_populate_lic)
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_populate_lic: Started
NOTE: recipe python3-importlib-metadata-6.2.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.3.bb:do_populate_lic unihash changed to 3caf5cf7e083b70c8ca437026f962b62f573a2d9cef01062b2fe17907a08a81c
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1747 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.3.bb:do_configure)
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_configure: Started
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_configure: Succeeded
NOTE: Running task 1748 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.3.bb:do_configure_ptest_base)
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1749 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.3.bb:do_compile)
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_compile: Started
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_compile: Succeeded
NOTE: Running task 1750 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.3.bb:do_compile_ptest_base)
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1751 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.3.bb:do_install)
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_install: Started
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_install: Succeeded
NOTE: Running task 1752 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.3.bb:do_install_ptest_base)
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_install_ptest_base: Started
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1753 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.3.bb:do_package)
NOTE: Running task 1754 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.3.bb:do_populate_sysroot)
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_populate_sysroot: Started
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_package: Started
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_package: Succeeded
NOTE: Running task 1755 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.3.bb:do_packagedata)
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_packagedata: Started
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_packagedata: Succeeded
NOTE: Running task 1756 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.3.bb:do_create_spdx)
NOTE: Running task 1757 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.3.bb:do_package_write_rpm)
NOTE: Running task 1758 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.3.bb:do_package_qa)
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_create_spdx: Started
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_package_write_rpm: Started
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_package_qa: Started
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_create_spdx: Succeeded
NOTE: Running task 1759 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.3.bb:do_create_runtime_spdx)
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_package_qa: Succeeded
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_create_runtime_spdx: Started
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1760 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.3.bb:do_build)
NOTE: Tasks Summary: Attempted 1760 tasks of which 1738 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-src went backwards which would break package feeds (from 0:6.6.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-dbg went backwards which would break package feeds (from 0:6.6.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-staticdev went backwards which would break package feeds (from 0:6.6.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-dev went backwards which would break package feeds (from 0:6.6.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-doc went backwards which would break package feeds (from 0:6.6.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-locale went backwards which would break package feeds (from 0:6.6.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata went backwards which would break package feeds (from 0:6.6.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============7278877040850972315==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-markupsafe: SRC_URI changed from "https://files.pythonhosted.org/packages/source/M/MarkupSafe/MarkupSafe-2.1.2.tar.gz;downloadfilename=MarkupSafe-2.1.2.tar.gz file://run-ptest" to "https://files.pythonhosted.org/packages/source/M/MarkupSafe/MarkupSafe-2.1.3.tar.gz;downloadfilename=MarkupSafe-2.1.3.tar.gz file://run-ptest"
packages/core2-32-poky-linux/python3-markupsafe: PV changed from "2.1.2" to "2.1.3"
packages/core2-32-poky-linux/python3-markupsafe: PKGV changed from 2.1.2 [default] to 2.1.3 [default]
packages/core2-32-poky-linux/python3-markupsafe/python3-markupsafe-dbg: PV changed from "2.1.2" to "2.1.3"
packages/core2-32-poky-linux/python3-markupsafe/python3-markupsafe-dbg: PKGV changed from 2.1.2 [default] to 2.1.3 [default]
packages/core2-32-poky-linux/python3-markupsafe/python3-markupsafe-dev: PV changed from "2.1.2" to "2.1.3"
packages/core2-32-poky-linux/python3-markupsafe/python3-markupsafe-dev: PKGV changed from 2.1.2 [default] to 2.1.3 [default]
packages/core2-32-poky-linux/python3-markupsafe/python3-markupsafe-doc: PV changed from "2.1.2" to "2.1.3"
packages/core2-32-poky-linux/python3-markupsafe/python3-markupsafe-doc: PKGV changed from 2.1.2 [default] to 2.1.3 [default]
packages/core2-32-poky-linux/python3-markupsafe/python3-markupsafe-locale: PV changed from "2.1.2" to "2.1.3"
packages/core2-32-poky-linux/python3-markupsafe/python3-markupsafe-locale: PKGV changed from 2.1.2 [default] to 2.1.3 [default]
packages/core2-32-poky-linux/python3-markupsafe/python3-markupsafe-ptest: PV changed from "2.1.2" to "2.1.3"
packages/core2-32-poky-linux/python3-markupsafe/python3-markupsafe-ptest: PKGV changed from 2.1.2 [default] to 2.1.3 [default]
packages/core2-32-poky-linux/python3-markupsafe/python3-markupsafe-ptest: PKGSIZE changed from 8101 to 8245 (+2%)
packages/core2-32-poky-linux/python3-markupsafe/python3-markupsafe-src: PV changed from "2.1.2" to "2.1.3"
packages/core2-32-poky-linux/python3-markupsafe/python3-markupsafe-src: PKGV changed from 2.1.2 [default] to 2.1.3 [default]
packages/core2-32-poky-linux/python3-markupsafe/python3-markupsafe-staticdev: PV changed from "2.1.2" to "2.1.3"
packages/core2-32-poky-linux/python3-markupsafe/python3-markupsafe-staticdev: PKGV changed from 2.1.2 [default] to 2.1.3 [default]
packages/core2-32-poky-linux/python3-markupsafe/python3-markupsafe: PV changed from "2.1.2" to "2.1.3"
packages/core2-32-poky-linux/python3-markupsafe/python3-markupsafe: PKGV changed from 2.1.2 [default] to 2.1.3 [default]
packages/core2-32-poky-linux/python3-markupsafe/python3-markupsafe: PKGSIZE changed from 58871 to 61090 (+4%)
Changes to packages/core2-32-poky-linux/python3-markupsafe (sysroot):
  /usr/lib/python3.11/site-packages/MarkupSafe-2.1.2.dist-info moved to /usr/lib/python3.11/site-packages/MarkupSafe-2.1.3.dist-info

--===============7278877040850972315==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1802 targets, 53 skipped, 0 masked, 0 errors.
Removing 1 recipes from the cortexa15t2hf-neon sysroot...done.
Removing 1 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:13d6696f964ad53dad2b09bed96589046fe305e1"
workspace            = "master:d9cf8973d01b74aa2680dba5ac46c5cea3d1a6d0"

Initialising tasks...done.
Sstate summary: Wanted 22 Local 13 Mirrors 0 Missed 9 Current 482 (59% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 485 of 504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.2.0.bb:do_packagedata_setscene)
NOTE: recipe python3-importlib-metadata-6.2.0-r0: task do_packagedata_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/python3-importlib-metadata/6.2.0-r0/temp/log.do_packagedata_setscene.1362332
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.2.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 503 of 504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.2.0.bb:do_package_setscene)
NOTE: Running task 1076 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.3.bb:do_fetch)
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_fetch: Started
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_fetch: Succeeded
NOTE: Running task 1595 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.3.bb:do_unpack)
NOTE: Running task 1596 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_unpack: Started
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_unpack: Succeeded
NOTE: Running task 1732 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.3.bb:do_patch)
NOTE: Running task 1733 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.3.bb:do_collect_spdx_deps)
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_patch: Started
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-importlib-metadata-6.2.0-r0: task do_package_setscene: Started
NOTE: recipe python3-importlib-metadata-6.2.0-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1743 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.2.0.bb:do_packagedata)
NOTE: recipe python3-importlib-metadata-6.2.0-r0: task do_packagedata: Started
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_patch: Succeeded
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1744 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1745 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.3.bb:do_populate_lic)
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_populate_lic: Started
NOTE: recipe python3-importlib-metadata-6.2.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.3.bb:do_populate_lic unihash changed to 3caf5cf7e083b70c8ca437026f962b62f573a2d9cef01062b2fe17907a08a81c
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1747 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.3.bb:do_configure)
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_configure: Started
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_configure: Succeeded
NOTE: Running task 1748 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.3.bb:do_configure_ptest_base)
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1749 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.3.bb:do_compile)
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_compile: Started
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_compile: Succeeded
NOTE: Running task 1750 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.3.bb:do_compile_ptest_base)
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1751 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.3.bb:do_install)
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_install: Started
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_install: Succeeded
NOTE: Running task 1752 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.3.bb:do_install_ptest_base)
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_install_ptest_base: Started
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1753 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.3.bb:do_package)
NOTE: Running task 1754 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.3.bb:do_populate_sysroot)
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_populate_sysroot: Started
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_package: Started
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_package: Succeeded
NOTE: Running task 1755 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.3.bb:do_packagedata)
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_packagedata: Started
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_packagedata: Succeeded
NOTE: Running task 1756 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.3.bb:do_create_spdx)
NOTE: Running task 1757 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.3.bb:do_package_write_rpm)
NOTE: Running task 1758 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.3.bb:do_package_qa)
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_create_spdx: Started
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_package_write_rpm: Started
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_package_qa: Started
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_create_spdx: Succeeded
NOTE: Running task 1759 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.3.bb:do_create_runtime_spdx)
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_package_qa: Succeeded
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_create_runtime_spdx: Started
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1760 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.3.bb:do_build)
NOTE: Tasks Summary: Attempted 1760 tasks of which 1738 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-src went backwards which would break package feeds (from 0:6.6.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-dbg went backwards which would break package feeds (from 0:6.6.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-staticdev went backwards which would break package feeds (from 0:6.6.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-dev went backwards which would break package feeds (from 0:6.6.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-doc went backwards which would break package feeds (from 0:6.6.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-locale went backwards which would break package feeds (from 0:6.6.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata went backwards which would break package feeds (from 0:6.6.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============7278877040850972315==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1802 targets, 69 skipped, 0 masked, 0 errors.
Removing 1 recipes from the ppc7400 sysroot...done.
Removing 1 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:13d6696f964ad53dad2b09bed96589046fe305e1"
workspace            = "master:d9cf8973d01b74aa2680dba5ac46c5cea3d1a6d0"

Initialising tasks...done.
Sstate summary: Wanted 22 Local 13 Mirrors 0 Missed 9 Current 482 (59% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 485 of 504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.2.0.bb:do_packagedata_setscene)
NOTE: recipe python3-importlib-metadata-6.2.0-r0: task do_packagedata_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/python3-importlib-metadata/6.2.0-r0/temp/log.do_packagedata_setscene.1396367
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.2.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 503 of 504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.2.0.bb:do_package_setscene)
NOTE: Running task 1076 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.3.bb:do_fetch)
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_fetch: Started
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_fetch: Succeeded
NOTE: Running task 1532 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.3.bb:do_unpack)
NOTE: Running task 1533 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_unpack: Started
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_unpack: Succeeded
NOTE: Running task 1732 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.3.bb:do_patch)
NOTE: Running task 1733 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.3.bb:do_collect_spdx_deps)
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_patch: Started
NOTE: recipe python3-importlib-metadata-6.2.0-r0: task do_package_setscene: Started
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-importlib-metadata-6.2.0-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1743 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.2.0.bb:do_packagedata)
NOTE: recipe python3-importlib-metadata-6.2.0-r0: task do_packagedata: Started
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_patch: Succeeded
NOTE: Running task 1744 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1745 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.3.bb:do_populate_lic)
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_populate_lic: Started
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-importlib-metadata-6.2.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.3.bb:do_populate_lic unihash changed to 3caf5cf7e083b70c8ca437026f962b62f573a2d9cef01062b2fe17907a08a81c
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1747 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.3.bb:do_configure)
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_configure: Started
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_configure: Succeeded
NOTE: Running task 1748 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.3.bb:do_configure_ptest_base)
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1749 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.3.bb:do_compile)
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_compile: Started
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_compile: Succeeded
NOTE: Running task 1750 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.3.bb:do_compile_ptest_base)
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1751 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.3.bb:do_install)
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_install: Started
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_install: Succeeded
NOTE: Running task 1752 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.3.bb:do_install_ptest_base)
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_install_ptest_base: Started
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1753 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.3.bb:do_package)
NOTE: Running task 1754 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.3.bb:do_populate_sysroot)
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_populate_sysroot: Started
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_package: Started
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_package: Succeeded
NOTE: Running task 1755 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.3.bb:do_packagedata)
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_packagedata: Started
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_packagedata: Succeeded
NOTE: Running task 1756 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.3.bb:do_create_spdx)
NOTE: Running task 1757 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.3.bb:do_package_write_rpm)
NOTE: Running task 1758 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.3.bb:do_package_qa)
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_create_spdx: Started
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_package_write_rpm: Started
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_package_qa: Started
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_create_spdx: Succeeded
NOTE: Running task 1759 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.3.bb:do_create_runtime_spdx)
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_package_qa: Succeeded
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_create_runtime_spdx: Started
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1760 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.3.bb:do_build)
NOTE: Tasks Summary: Attempted 1760 tasks of which 1738 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-src went backwards which would break package feeds (from 0:6.6.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-dbg went backwards which would break package feeds (from 0:6.6.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-staticdev went backwards which would break package feeds (from 0:6.6.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-dev went backwards which would break package feeds (from 0:6.6.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-doc went backwards which would break package feeds (from 0:6.6.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-locale went backwards which would break package feeds (from 0:6.6.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata went backwards which would break package feeds (from 0:6.6.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============7278877040850972315==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-markupsafe (sysroot):
  /usr/lib/python3.11/site-packages/MarkupSafe-2.1.2.dist-info moved to /usr/lib/python3.11/site-packages/MarkupSafe-2.1.3.dist-info

--===============7278877040850972315==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1802 targets, 63 skipped, 0 masked, 0 errors.
Removing 1 recipes from the mips32r2 sysroot...done.
Removing 1 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:13d6696f964ad53dad2b09bed96589046fe305e1"
workspace            = "master:d9cf8973d01b74aa2680dba5ac46c5cea3d1a6d0"

Initialising tasks...done.
Sstate summary: Wanted 22 Local 13 Mirrors 0 Missed 9 Current 482 (59% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 485 of 504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.2.0.bb:do_packagedata_setscene)
NOTE: recipe python3-importlib-metadata-6.2.0-r0: task do_packagedata_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/python3-importlib-metadata/6.2.0-r0/temp/log.do_packagedata_setscene.1376660
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.2.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 503 of 504 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.2.0.bb:do_package_setscene)
NOTE: Running task 1076 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.3.bb:do_fetch)
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_fetch: Started
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_fetch: Succeeded
NOTE: Running task 1595 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.3.bb:do_unpack)
NOTE: Running task 1596 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_unpack: Started
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_unpack: Succeeded
NOTE: Running task 1732 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.3.bb:do_patch)
NOTE: Running task 1733 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.3.bb:do_collect_spdx_deps)
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_patch: Started
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-importlib-metadata-6.2.0-r0: task do_package_setscene: Started
NOTE: recipe python3-importlib-metadata-6.2.0-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1743 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.2.0.bb:do_packagedata)
NOTE: recipe python3-importlib-metadata-6.2.0-r0: task do_packagedata: Started
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_patch: Succeeded
NOTE: Running task 1744 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1745 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.3.bb:do_populate_lic)
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_populate_lic: Started
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-importlib-metadata-6.2.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.3.bb:do_populate_lic unihash changed to 3caf5cf7e083b70c8ca437026f962b62f573a2d9cef01062b2fe17907a08a81c
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1747 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.3.bb:do_configure)
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_configure: Started
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_configure: Succeeded
NOTE: Running task 1748 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.3.bb:do_configure_ptest_base)
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1749 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.3.bb:do_compile)
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_compile: Started
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_compile: Succeeded
NOTE: Running task 1750 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.3.bb:do_compile_ptest_base)
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1751 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.3.bb:do_install)
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_install: Started
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_install: Succeeded
NOTE: Running task 1752 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.3.bb:do_install_ptest_base)
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_install_ptest_base: Started
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1753 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.3.bb:do_package)
NOTE: Running task 1754 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.3.bb:do_populate_sysroot)
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_populate_sysroot: Started
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_package: Started
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_package: Succeeded
NOTE: Running task 1755 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.3.bb:do_packagedata)
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_packagedata: Started
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_packagedata: Succeeded
NOTE: Running task 1756 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.3.bb:do_create_spdx)
NOTE: Running task 1757 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.3.bb:do_package_write_rpm)
NOTE: Running task 1758 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.3.bb:do_package_qa)
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_create_spdx: Started
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_package_write_rpm: Started
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_package_qa: Started
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_create_spdx: Succeeded
NOTE: Running task 1759 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.3.bb:do_create_runtime_spdx)
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_package_qa: Succeeded
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_create_runtime_spdx: Started
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_create_runtime_spdx: Succeeded
NOTE: Running noexec task 1760 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.3.bb:do_build)
NOTE: Tasks Summary: Attempted 1760 tasks of which 1738 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-src went backwards which would break package feeds (from 0:6.6.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-dbg went backwards which would break package feeds (from 0:6.6.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-staticdev went backwards which would break package feeds (from 0:6.6.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-dev went backwards which would break package feeds (from 0:6.6.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-doc went backwards which would break package feeds (from 0:6.6.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-locale went backwards which would break package feeds (from 0:6.6.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata went backwards which would break package feeds (from 0:6.6.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============7278877040850972315==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1802 targets, 47 skipped, 0 masked, 0 errors.
Removing 27 recipes from the core2-32 sysroot...done.
Removing 51 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:13d6696f964ad53dad2b09bed96589046fe305e1"
workspace            = "master:d9cf8973d01b74aa2680dba5ac46c5cea3d1a6d0"

Initialising tasks...done.
Sstate summary: Wanted 247 Local 238 Mirrors 0 Missed 9 Current 252 (96% match, 98% complete)
Removing 3 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 253 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 263 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.3.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 264 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.3.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 265 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-unittest-automake-output_0.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 266 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-unittest-automake-output_0.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 267 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 268 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 269 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 270 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_package_write_rpm_setscene)
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pytest-7.3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pytest-7.3.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_package_write_rpm_setscene: Started
NOTE: Running task 777 of 1743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.3.bb:do_fetch)
NOTE: recipe python3-3.11.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-pytest-7.3.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-pytest-7.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 283 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-unittest-automake-output_0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 287 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-atomicwrites_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 288 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_23.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 289 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.2.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 290 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-iniconfig_2.0.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 291 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_9.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 292 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-packaging_23.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 293 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 294 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pluggy_1.0.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 295 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-py_1.11.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 296 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 297 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_67.6.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 298 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 299 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 300 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 301 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.6.bb:do_packagedata_setscene)
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_fetch: Started
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_fetch: Succeeded
NOTE: Running task 1024 of 1743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.3.bb:do_unpack)
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-py-1.11.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-attrs-23.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-setuptools-67.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-packaging-23.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-importlib-metadata-6.2.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 303 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 304 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 305 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 306 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 307 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: recipe python3-more-itertools-9.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytest-7.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe psmisc-23.6-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_unpack: Started
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_unpack: Succeeded
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1030 of 1743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.3.bb:do_patch)
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pluggy-1.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-py-1.11.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-attrs-23.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-iniconfig-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-setuptools-67.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-wcwidth-0.2.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Started
NOTE: recipe python3-atomicwrites-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-packaging-23.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-more-itertools-9.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/python3-importlib-metadata/6.2.0-r0/temp/log.do_packagedata_setscene.1406612
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.2.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 330 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.2.0.bb:do_package_setscene)
NOTE: recipe python3-3.11.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-pytest-7.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_patch: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_patch: Succeeded
NOTE: recipe psmisc-23.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 351 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 353 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 356 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 361 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.1.bb:do_create_spdx_setscene)
NOTE: Running task 1069 of 1743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1095 of 1743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.3.bb:do_populate_lic)
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 366 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 368 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 370 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.69.bb:do_packagedata_setscene)
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_populate_lic: Started
NOTE: recipe gcc-runtime-13.1.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.1.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 377 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.3.bb:do_populate_lic unihash changed to 3caf5cf7e083b70c8ca437026f962b62f573a2d9cef01062b2fe17907a08a81c
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_create_spdx_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 384 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 389 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 395 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.1.bb:do_create_spdx_setscene)
NOTE: recipe python3-importlib-metadata-6.2.0-r0: task do_package_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-cross-i686-13.1.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-cross-i686-13.1.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-importlib-metadata-6.2.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 401 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 402 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.11.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 404 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 408 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 409 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 410 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 411 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 412 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 413 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 414 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 415 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 416 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 417 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.41.2.bb:do_packagedata_setscene)
NOTE: recipe python3-3.11.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 418 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 419 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 420 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 421 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 423 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 424 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 425 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 426 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 427 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 428 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.41.2.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20221030-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.41.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20221030-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.41.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20221030-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.41.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 431 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 435 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 436 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 440 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20221030-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.4.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 445 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.41.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 455 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 461 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 463 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 468 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.1.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 469 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-13.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-13.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 472 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.1.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 474 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-13.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 476 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 477 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 480 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 481 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 482 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 486 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 487 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 493 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-13.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-13.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 496 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 497 of 499 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.40.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1462 of 1743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1622 of 1743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.3.bb:do_collect_spdx_deps)
NOTE: Running task 1708 of 1743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.2.0.bb:do_packagedata)
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-importlib-metadata-6.2.0-r0: task do_packagedata: Started
NOTE: recipe python3-importlib-metadata-6.2.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1730 of 1743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.3.bb:do_configure)
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_configure: Started
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_configure: Succeeded
NOTE: Running task 1731 of 1743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.3.bb:do_configure_ptest_base)
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1732 of 1743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.3.bb:do_compile)
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_compile: Started
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_compile: Succeeded
NOTE: Running task 1733 of 1743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.3.bb:do_compile_ptest_base)
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1734 of 1743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.3.bb:do_install)
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_install: Started
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_install: Succeeded
NOTE: Running task 1735 of 1743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.3.bb:do_install_ptest_base)
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_install_ptest_base: Started
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1736 of 1743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.3.bb:do_package)
NOTE: Running task 1737 of 1743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.3.bb:do_populate_sysroot)
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_populate_sysroot: Started
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_package: Started
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_package: Succeeded
NOTE: Running task 1738 of 1743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.3.bb:do_packagedata)
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_packagedata: Started
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_packagedata: Succeeded
NOTE: Running task 1739 of 1743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.3.bb:do_create_spdx)
NOTE: Running task 1740 of 1743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.3.bb:do_package_write_rpm)
NOTE: Running task 1741 of 1743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.3.bb:do_package_qa)
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_create_spdx: Started
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_package_write_rpm: Started
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_package_qa: Started
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_create_spdx: Succeeded
NOTE: Running task 1742 of 1743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.3.bb:do_create_runtime_spdx)
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_package_qa: Succeeded
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_create_runtime_spdx: Started
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe python3-markupsafe-2.1.3-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1743 of 1743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.3.bb:do_build)
NOTE: Tasks Summary: Attempted 1743 tasks of which 1721 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-src went backwards which would break package feeds (from 0:6.6.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-dbg went backwards which would break package feeds (from 0:6.6.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-staticdev went backwards which would break package feeds (from 0:6.6.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-dev went backwards which would break package feeds (from 0:6.6.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-doc went backwards which would break package feeds (from 0:6.6.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-locale went backwards which would break package feeds (from 0:6.6.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata went backwards which would break package feeds (from 0:6.6.0-r0 to 0:6.2.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.2.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============7278877040850972315==--

