Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA929CD13B5
	for <webhook@archiver.kernel.org>; Mon,  1 Apr 2024 18:03:31 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.44633.1711994600755626104
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Apr 2024 11:03:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=ZpmIn1PQ;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=OSZHYq1O;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101018e9ad47fda-db8afdf1-681d-4b51-8b12-f405cd25b206-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1711994601;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=tcldmXUmiEpuWyTbRCrnkIrfelWJ/oMnDKfEfFKu68c=;
	b=ZpmIn1PQ4Va0eP+dCrazTrcW3eRCNhq3muL3f3kFS4PMJ7izbe1HYIE9Kd41Pqj7
	kOUwP1Z5V9NbR6V+SqYmEScb4nWSnRrjlJE6xZStw/+b2r+f/ZSOWeuWV0uaTFhx0n2
	ZZH92CKxirIXibAl1+qrfiXNA6siB28y1OJjg620=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1711994601;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=tcldmXUmiEpuWyTbRCrnkIrfelWJ/oMnDKfEfFKu68c=;
	b=OSZHYq1OWm8o170Bag0wyUfjJrpagRUoWdzpsslpiVKVCNyCgr+aHI4j6DwBZj+k
	EBwwpxSr+BKa8REZ8/R4A8wkXI86+9orFAYjS+SU1r9DLXQEuS8SxDl9lp62rpeyEXc
	gDGogX6ZVB3HoieDMQ4PaMdWmtKPQmTz/f9L5uJ4=
Content-Type: multipart/mixed; boundary="===============5798587234061380410=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pyopenssl: upgrading to 24.1.0 SUCCEEDED
Message-ID: <0101018e9ad47fda-db8afdf1-681d-4b51-8b12-f405cd25b206-000000@us-west-2.amazonses.com>
Date: Mon, 1 Apr 2024 18:03:21 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.04.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Apr 2024 18:03:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197725

--===============5798587234061380410==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-pyopenssl* to *24.1.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pyopenssl-upgrade-24.0.0-24.1.0.patch
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
From 41c73ccaca615d06ec8e0523138022988b85aec7 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Apr 2024 09:07:40 +0000
Subject: [PATCH] python3-pyopenssl: upgrade 24.0.0 -> 24.1.0

---
 ...{python3-pyopenssl_24.0.0.bb => python3-pyopenssl_24.1.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pyopenssl_24.0.0.bb => python3-pyopenssl_24.1.0.bb} (86%)

diff --git a/meta/recipes-devtools/python/python3-pyopenssl_24.0.0.bb b/meta/recipes-devtools/python/python3-pyopenssl_24.1.0.bb
similarity index 86%
rename from meta/recipes-devtools/python/python3-pyopenssl_24.0.0.bb
rename to meta/recipes-devtools/python/python3-pyopenssl_24.1.0.bb
index 9ea3075482..e714ad838e 100644
--- a/meta/recipes-devtools/python/python3-pyopenssl_24.0.0.bb
+++ b/meta/recipes-devtools/python/python3-pyopenssl_24.1.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 DEPENDS += "openssl python3-cryptography"
 
-SRC_URI[sha256sum] = "6aa33039a93fffa4563e655b61d11364d01264be8ccb49906101e02a334530bf"
+SRC_URI[sha256sum] = "cabed4bfaa5df9f1a16c0ef64a0cb65318b5cd077a7eda7d6970131ca2f41a6f"
 
 PYPI_PACKAGE = "pyOpenSSL"
 inherit pypi setuptools3
-- 
2.42.0


--===============5798587234061380410==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pyopenssl-upgrade-24.0.0-24.1.0.patch"

RnJvbSA0MWM3M2NjYWNhNjE1ZDA2ZWM4ZTA1MjMxMzgwMjI5ODhiODVhZWM3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBBcHIgMjAyNCAwOTowNzo0MCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtcHlvcGVuc3NsOiB1cGdyYWRlIDI0LjAuMCAtPiAyNC4xLjAKCi0tLQogLi4ue3B5dGhv
bjMtcHlvcGVuc3NsXzI0LjAuMC5iYiA9PiBweXRob24zLXB5b3BlbnNzbF8yNC4xLjAuYmJ9IHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5h
bWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1weW9wZW5zc2xfMjQuMC4w
LmJiID0+IHB5dGhvbjMtcHlvcGVuc3NsXzI0LjEuMC5iYn0gKDg2JSkKCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHlvcGVuc3NsXzI0LjAuMC5iYiBi
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weW9wZW5zc2xfMjQuMS4wLmJi
CnNpbWlsYXJpdHkgaW5kZXggODYlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy1weW9wZW5zc2xfMjQuMC4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHlvcGVuc3NsXzI0LjEuMC5iYgppbmRleCA5ZWEzMDc1
NDgyLi5lNzE0YWQ4MzhlIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtcHlvcGVuc3NsXzI0LjAuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtcHlvcGVuc3NsXzI0LjEuMC5iYgpAQCAtNSw3ICs1LDcgQEAgTElDX0ZJ
TEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9M2I4M2VmOTYzODdmMTQ2NTVmYzg1NGRk
YzNjNmJkNTciCiAKIERFUEVORFMgKz0gIm9wZW5zc2wgcHl0aG9uMy1jcnlwdG9ncmFwaHkiCiAK
LVNSQ19VUklbc2hhMjU2c3VtXSA9ICI2YWEzMzAzOWE5M2ZmZmE0NTYzZTY1NWI2MWQxMTM2NGQw
MTI2NGJlOGNjYjQ5OTA2MTAxZTAyYTMzNDUzMGJmIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImNh
YmVkNGJmYWE1ZGY5ZjFhMTZjMGVmNjRhMGNiNjUzMThiNWNkMDc3YTdlZGE3ZDY5NzAxMzFjYTJm
NDFhNmYiCiAKIFBZUElfUEFDS0FHRSA9ICJweU9wZW5TU0wiCiBpbmhlcml0IHB5cGkgc2V0dXB0
b29sczMKLS0gCjIuNDIuMAoK

--===============5798587234061380410==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-pyopenssl (sysroot):
  /usr/lib/python3.12/site-packages/pyOpenSSL-24.0.0.dist-info moved to /usr/lib/python3.12/site-packages/pyOpenSSL-24.1.0.dist-info

--===============5798587234061380410==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 921 .bb files complete (0 cached, 921 parsed). 1875 targets, 46 skipped, 0 masked, 0 errors.
Removing 34 recipes from the core2-64 sysroot...done.
Removing 70 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.3"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-cecbb3bef398fb370ae574b77def1900602f1352"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:cecbb3bef398fb370ae574b77def1900602f1352"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 561 Local 549 Mirrors 0 Missed 12 Current 263 (97% match, 98% complete)
Removing 8 stale sstate objects for arch x86_64...done.
Removing 2 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 269 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography_42.0.5.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 270 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography_42.0.5.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 271 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography_42.0.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 274 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography_42.0.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 281 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyopenssl_24.1.0.bb:do_populate_lic_setscene)
NOTE: Running setscene task 283 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyopenssl_24.1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 284 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 285 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 286 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 287 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 288 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.2.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 289 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.2.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 290 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.2.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-pyopenssl-24.1.0-r0: task do_populate_lic_setscene: Started
NOTE: recipe python3-pyopenssl-24.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-six-1.16.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-six-1.16.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-six-1.16.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-six-1.16.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-cryptography-42.0.5-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-cryptography-42.0.5-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-cryptography-42.0.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-cryptography-42.0.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.12.2-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-3.12.2-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-3.12.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pyopenssl-24.1.0-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe python3-pyopenssl-24.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 389 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyopenssl_24.1.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-six-1.16.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 390 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_packagedata_setscene)
NOTE: recipe python3-cryptography-42.0.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 391 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.2.bb:do_create_spdx_setscene)
NOTE: recipe python3-cryptography-42.0.5-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-pyopenssl-24.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pyopenssl-24.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 484 of 2342 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyopenssl_24.1.0.bb:do_fetch)
NOTE: recipe python3-3.12.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pyopenssl-24.1.0-r0: task do_fetch: Started
NOTE: recipe python3-3.12.2-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-pyopenssl-24.1.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-3.12.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running task 488 of 2342 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyopenssl_24.1.0.bb:do_unpack)
NOTE: recipe python3-3.12.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 399 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.1.bb:do_create_spdx_setscene)
NOTE: recipe python3-3.12.2-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 413 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 414 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 415 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.42.bb:do_packagedata_setscene)
NOTE: Running setscene task 416 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc_13.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 417 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_packagedata_setscene)
NOTE: Running setscene task 418 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 419 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: Running setscene task 420 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 421 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_packagedata_setscene)
NOTE: recipe python3-cryptography-42.0.5-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-pyopenssl-24.1.0-r0: task do_unpack: Started
NOTE: recipe python3-cryptography-42.0.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 422 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-bcrypt_4.1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 423 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cffi_1.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 424 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography-vectors_42.0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 425 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.98.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 426 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-iso8601_2.1.0.bb:do_packagedata_setscene)
NOTE: recipe tzdata-2024a-r0: task do_packagedata_setscene: Started
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.2.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pyopenssl-24.1.0-r0: task do_unpack: Succeeded
NOTE: recipe binutils-2.42-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 427 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_packagedata_setscene)
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.2.21-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-cryptography-vectors-42.0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-cffi-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-iso8601-2.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-hypothesis-6.98.15-r0: task do_packagedata_setscene: Started
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 428 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-psutil_5.9.8.bb:do_packagedata_setscene)
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-bcrypt-4.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 429 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest-subtests_0.11.0.bb:do_packagedata_setscene)
NOTE: recipe tzdata-2024a-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.2.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 430 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_8.0.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 432 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: recipe python3-psutil-5.9.8-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-iso8601-2.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-cffi-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 436 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytz_2024.1.bb:do_packagedata_setscene)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/python3-hypothesis/6.98.15/temp/log.do_packagedata_setscene.3432706
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.98.15.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 440 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.98.15.bb:do_package_setscene)
NOTE: recipe python3-pytest-8.0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-cryptography-vectors-42.0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe binutils-2.42-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-bcrypt-4.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.2.21-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pytz-2024.1-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-pytest-8.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-psutil-5.9.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 450 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.191.bb:do_packagedata_setscene)
NOTE: Running setscene task 456 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: Running setscene task 463 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography_42.0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 464 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography_42.0.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 471 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_packagedata_setscene)
NOTE: Running setscene task 479 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-unittest-automake-output_0.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 497 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 499 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.3.bb:do_packagedata_setscene)
NOTE: recipe python3-pytz-2024.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.3+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.191-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-cryptography-42.0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-cryptography-42.0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 506 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 513 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.1.bb:do_packagedata_setscene)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/python3-pycparser/2.21/temp/log.do_packagedata_setscene.3433147
NOTE: recipe ptest-runner-2.4.3+git-r0: task do_packagedata_setscene: Succeeded
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 515 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_package_setscene)
NOTE: Running setscene task 520 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 521 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 525 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.14.2.bb:do_packagedata_setscene)
NOTE: recipe python3-cryptography-42.0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 530 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.75.0.bb:do_packagedata_setscene)
NOTE: recipe elfutils-0.191-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 532 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 534 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: Running setscene task 536 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 540 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 542 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 544 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_packagedata_setscene)
NOTE: recipe mpfr-4.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.14.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libstd-rs-1.75.0-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 552 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe python3-cryptography-42.0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 554 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography_42.0.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 555 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.75.0.bb:do_populate_sysroot_setscene)
NOTE: recipe mpfr-4.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-hypothesis-6.98.15-r0: task do_package_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_package_setscene: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libarchive-3.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libstd-rs-1.75.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 578 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_packagedata_setscene)
NOTE: Running setscene task 584 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 586 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 588 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 590 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 594 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_packagedata_setscene)
NOTE: recipe libstd-rs-1.75.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-cryptography-42.0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shadow-4.14.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe file-5.45-r0: task do_packagedata_setscene: Started
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-cryptography-42.0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcrypt-1.10.3-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.3-r0: task do_packagedata_setscene: Started
NOTE: Running task 1196 of 2342 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: Running task 1203 of 2342 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyopenssl_24.1.0.bb:do_patch)
NOTE: recipe file-5.45-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 602 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 604 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_packagedata_setscene)
NOTE: recipe libgcrypt-1.10.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 607 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.69.bb:do_packagedata_setscene)
NOTE: Running setscene task 611 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.48.bb:do_packagedata_setscene)
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 614 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 615 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb:do_packagedata_setscene)
NOTE: recipe curl-8.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_package_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 620 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 624 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe python3-pyopenssl-24.1.0-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: Running task 1360 of 2342 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 1361 of 2342 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-hypothesis-6.98.15-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 627 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.98.15.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 628 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 629 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe lzlib-1.14-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 631 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_packagedata_setscene)
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libatomic-ops-7.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libgpg-error-1.48-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pyopenssl-24.1.0-r0: task do_patch: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 635 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_packagedata_setscene)
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-hypothesis-6.98.15-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zstd-1.5.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 637 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 642 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe lzlib-1.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libidn2-2.3.7-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 648 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_packagedata_setscene)
NOTE: recipe python3-3.12.2-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: Running task 1389 of 2342 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe libatomic-ops-7.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-hypothesis-6.98.15-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.12.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libseccomp-2.5.5-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libgpg-error-1.48-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libstd-rs-1.75.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 661 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.75.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 662 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: Running task 1447 of 2342 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe libunwind-1.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 673 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_packagedata_setscene)
NOTE: recipe libstd-rs-1.75.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-3.9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 679 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe libstd-rs-1.75.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunistring-1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: Running task 1469 of 2342 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe libunwind-1.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 683 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 684 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 686 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.12.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 688 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 689 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 690 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 691 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 692 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 693 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 694 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 695 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe libunistring-1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 696 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_packagedata_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 703 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.1.bb:do_packagedata_setscene)
NOTE: recipe python3-3.12.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 704 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libatomic-ops-7.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunwind-1.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 705 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libunwind-1.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 706 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.45.1-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 707 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 709 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libatomic-ops-7.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 712 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.2.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 715 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 717 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 719 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 720 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 721 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.45.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 722 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 725 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 728 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 731 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 733 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 735 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: recipe libucontext-1.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 737 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.1.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.12.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 739 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_recipe_qa_setscene)
NOTE: recipe libatomic-ops-7.8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.45.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: Running task 1496 of 2342 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe python3-3.12.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libatomic-ops-7.8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 744 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 746 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 748 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 749 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 751 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.2.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 753 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 756 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 757 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 759 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.2.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.45.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 761 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.1.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20230828-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.45.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 763 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 764 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 772 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 774 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 778 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.45.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: recipe libtirpc-1.3.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1583 of 2342 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 780 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 782 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.6.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 783 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 785 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 787 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 789 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 790 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 792 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 793 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 795 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 797 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 798 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 799 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 803 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 804 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 806 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 811 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 813 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 814 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 1628 of 2342 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 3827d1886d21fc285ddcf2fcb9cb1cc58679b8245b5b8a3c52f01f2714d587ae
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 817 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 819 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 820 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.42.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 822 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 824 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.42.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2079 of 2342 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyopenssl_24.1.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2261 of 2342 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_packagedata)
NOTE: Running task 2311 of 2342 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.98.15.bb:do_packagedata)
NOTE: Running task 2316 of 2342 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyopenssl_24.1.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-pyopenssl-24.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_packagedata: Started
NOTE: recipe python3-hypothesis-6.98.15-r0: task do_packagedata: Started
NOTE: recipe python3-pyopenssl-24.1.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-pycparser-2.21-r0: task do_packagedata: Succeeded
NOTE: recipe python3-hypothesis-6.98.15-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pyopenssl-24.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2330 of 2342 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyopenssl_24.1.0.bb:do_configure)
NOTE: recipe python3-pyopenssl-24.1.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-pyopenssl-24.1.0-r0: task do_configure: Started
NOTE: recipe python3-pyopenssl-24.1.0-r0: task do_configure: Succeeded
NOTE: Running task 2331 of 2342 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyopenssl_24.1.0.bb:do_compile)
NOTE: recipe python3-pyopenssl-24.1.0-r0: task do_compile: Started
NOTE: recipe python3-pyopenssl-24.1.0-r0: task do_compile: Succeeded
NOTE: Running task 2332 of 2342 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyopenssl_24.1.0.bb:do_install)
NOTE: recipe python3-pyopenssl-24.1.0-r0: task do_install: Started
NOTE: recipe python3-pyopenssl-24.1.0-r0: task do_install: Succeeded
NOTE: Running task 2333 of 2342 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyopenssl_24.1.0.bb:do_package)
NOTE: Running task 2334 of 2342 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyopenssl_24.1.0.bb:do_populate_sysroot)
NOTE: recipe python3-pyopenssl-24.1.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pyopenssl-24.1.0-r0: task do_package: Started
NOTE: recipe python3-pyopenssl-24.1.0-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyopenssl_24.1.0.bb:do_populate_sysroot unihash changed to 5b4a6edcabd2cc303efa85d0707c6b464d36cec2d3bdf575548c71e80350232c
NOTE: recipe python3-pyopenssl-24.1.0-r0: task do_package: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyopenssl_24.1.0.bb:do_package unihash changed to b4c61a35892810b3af9d0dccfac73c75549d423dd28191d6ce149bce718e0574
NOTE: Setscene task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyopenssl_24.1.0.bb:do_packagedata became valid
NOTE: Running setscene task 824 of 824 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyopenssl_24.1.0.bb:do_packagedata_setscene)
NOTE: recipe python3-pyopenssl-24.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pyopenssl-24.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2336 of 2342 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyopenssl_24.1.0.bb:do_create_spdx)
NOTE: Running task 2337 of 2342 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyopenssl_24.1.0.bb:do_package_write_ipk)
NOTE: Running task 2338 of 2342 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyopenssl_24.1.0.bb:do_package_write_deb)
NOTE: Running task 2339 of 2342 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyopenssl_24.1.0.bb:do_package_write_rpm)
NOTE: Running task 2340 of 2342 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyopenssl_24.1.0.bb:do_package_qa)
NOTE: recipe python3-pyopenssl-24.1.0-r0: task do_create_spdx: Started
NOTE: recipe python3-pyopenssl-24.1.0-r0: task do_package_write_ipk: Started
NOTE: recipe python3-pyopenssl-24.1.0-r0: task do_package_write_deb: Started
NOTE: recipe python3-pyopenssl-24.1.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pyopenssl-24.1.0-r0: task do_package_qa: Started
NOTE: recipe python3-pyopenssl-24.1.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 2341 of 2342 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyopenssl_24.1.0.bb:do_create_runtime_spdx)
NOTE: recipe python3-pyopenssl-24.1.0-r0: task do_package_qa: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyopenssl_24.1.0.bb:do_package_qa unihash changed to 7a689ea868acfda480d4f85f4ff0c36857c9c87a9597e9dea2a66648d270b812
NOTE: recipe python3-pyopenssl-24.1.0-r0: task do_create_runtime_spdx: Started
NOTE: recipe python3-pyopenssl-24.1.0-r0: task do_package_write_ipk: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyopenssl_24.1.0.bb:do_package_write_ipk unihash changed to 66638d62168856e4368cfcdaf710537c04761fcd5b7d6d0e6c5b15cf4e7ba8b5
NOTE: recipe python3-pyopenssl-24.1.0-r0: task do_package_write_deb: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyopenssl_24.1.0.bb:do_package_write_deb unihash changed to 181b20478d8043463ad202a9ebd3222b6ac6f20a9f76c4d42b2470d87f7c9447
NOTE: recipe python3-pyopenssl-24.1.0-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe python3-pyopenssl-24.1.0-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyopenssl_24.1.0.bb:do_package_write_rpm unihash changed to 3f45a88d0d6a5a76c13c9a2fed1ad06ec21f39c07b25eb984f5cfe12e0d39359
NOTE: Running noexec task 2342 of 2342 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyopenssl_24.1.0.bb:do_build)
NOTE: Tasks Summary: Attempted 2342 tasks of which 2314 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: There were 17 ERROR messages, returning a non-zero exit code.
ERROR: python3-hypothesis-6.98.15-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-src went backwards which would break package feeds (from 0:6.100.0-r0 to 0:6.98.15-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.98.15-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-dbg went backwards which would break package feeds (from 0:6.100.0-r0 to 0:6.98.15-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.98.15-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-ptest went backwards which would break package feeds (from 0:6.100.0-r0 to 0:6.98.15-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.98.15-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-staticdev went backwards which would break package feeds (from 0:6.100.0-r0 to 0:6.98.15-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.98.15-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-dev went backwards which would break package feeds (from 0:6.100.0-r0 to 0:6.98.15-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.98.15-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-doc went backwards which would break package feeds (from 0:6.100.0-r0 to 0:6.98.15-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.98.15-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-locale went backwards which would break package feeds (from 0:6.100.0-r0 to 0:6.98.15-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.98.15-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis went backwards which would break package feeds (from 0:6.100.0-r0 to 0:6.98.15-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.98.15-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: python3-pycparser-2.21-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pycparser-src went backwards which would break package feeds (from 0:2.22-r0 to 0:2.21-r0) [version-going-backwards]
ERROR: python3-pycparser-2.21-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pycparser-dbg went backwards which would break package feeds (from 0:2.22-r0 to 0:2.21-r0) [version-going-backwards]
ERROR: python3-pycparser-2.21-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pycparser-staticdev went backwards which would break package feeds (from 0:2.22-r0 to 0:2.21-r0) [version-going-backwards]
ERROR: python3-pycparser-2.21-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pycparser-dev went backwards which would break package feeds (from 0:2.22-r0 to 0:2.21-r0) [version-going-backwards]
ERROR: python3-pycparser-2.21-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pycparser-doc went backwards which would break package feeds (from 0:2.22-r0 to 0:2.21-r0) [version-going-backwards]
ERROR: python3-pycparser-2.21-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pycparser-locale went backwards which would break package feeds (from 0:2.22-r0 to 0:2.21-r0) [version-going-backwards]
ERROR: python3-pycparser-2.21-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pycparser went backwards which would break package feeds (from 0:2.22-r0 to 0:2.21-r0) [version-going-backwards]
ERROR: python3-pycparser-2.21-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============5798587234061380410==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-pyopenssl: PKGV changed from 24.0.0 [default] to 24.1.0 [default]
packages/core2-64-poky-linux/python3-pyopenssl: PV changed from "24.0.0" to "24.1.0"
packages/core2-64-poky-linux/python3-pyopenssl: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pyOpenSSL/pyOpenSSL-24.0.0.tar.gz;downloadfilename=pyOpenSSL-24.0.0.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pyOpenSSL/pyOpenSSL-24.1.0.tar.gz;downloadfilename=pyOpenSSL-24.1.0.tar.gz"
packages/core2-64-poky-linux/python3-pyopenssl/python3-pyopenssl-dbg: PKGV changed from 24.0.0 [default] to 24.1.0 [default]
packages/core2-64-poky-linux/python3-pyopenssl/python3-pyopenssl-dbg: PV changed from "24.0.0" to "24.1.0"
packages/core2-64-poky-linux/python3-pyopenssl/python3-pyopenssl-dev: PKGV changed from 24.0.0 [default] to 24.1.0 [default]
packages/core2-64-poky-linux/python3-pyopenssl/python3-pyopenssl-dev: PV changed from "24.0.0" to "24.1.0"
packages/core2-64-poky-linux/python3-pyopenssl/python3-pyopenssl-doc: PKGV changed from 24.0.0 [default] to 24.1.0 [default]
packages/core2-64-poky-linux/python3-pyopenssl/python3-pyopenssl-doc: PV changed from "24.0.0" to "24.1.0"
packages/core2-64-poky-linux/python3-pyopenssl/python3-pyopenssl-locale: PKGV changed from 24.0.0 [default] to 24.1.0 [default]
packages/core2-64-poky-linux/python3-pyopenssl/python3-pyopenssl-locale: PV changed from "24.0.0" to "24.1.0"
packages/core2-64-poky-linux/python3-pyopenssl/python3-pyopenssl-src: PKGV changed from 24.0.0 [default] to 24.1.0 [default]
packages/core2-64-poky-linux/python3-pyopenssl/python3-pyopenssl-src: PV changed from "24.0.0" to "24.1.0"
packages/core2-64-poky-linux/python3-pyopenssl/python3-pyopenssl-staticdev: PKGV changed from 24.0.0 [default] to 24.1.0 [default]
packages/core2-64-poky-linux/python3-pyopenssl/python3-pyopenssl-staticdev: PV changed from "24.0.0" to "24.1.0"
packages/core2-64-poky-linux/python3-pyopenssl/python3-pyopenssl-tests: PKGV changed from 24.0.0 [default] to 24.1.0 [default]
packages/core2-64-poky-linux/python3-pyopenssl/python3-pyopenssl-tests: PV changed from "24.0.0" to "24.1.0"
packages/core2-64-poky-linux/python3-pyopenssl/python3-pyopenssl: PKGV changed from 24.0.0 [default] to 24.1.0 [default]
packages/core2-64-poky-linux/python3-pyopenssl/python3-pyopenssl: PV changed from "24.0.0" to "24.1.0"
packages/core2-64-poky-linux/python3-pyopenssl/python3-pyopenssl: PKGSIZE changed from 511812 to 491513 (-4%)
Changes to packages/core2-64-poky-linux/python3-pyopenssl (sysroot):
  /usr/lib/python3.12/site-packages/pyOpenSSL-24.0.0.dist-info moved to /usr/lib/python3.12/site-packages/pyOpenSSL-24.1.0.dist-info

--===============5798587234061380410==--

