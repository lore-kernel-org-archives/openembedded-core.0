Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76C54C54754
	for <webhook@archiver.kernel.org>; Thu, 15 May 2025 12:31:59 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.11047.1747312318831833662
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 May 2025 05:31:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=OTyf+bQj;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=pvMLwWHC;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 01010196d3ee14d2-d4faab79-226a-4cd2-a0d6-4633f5216ccf-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1747312318;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=/dfItTgAPcJHqY1sqNGJjnpQyVG7TAskfZKxRlFiDfY=;
	b=OTyf+bQj2bc+aJKXG9wIJYlITjHMdc1+vH1dJjP4o0tkztN77JcWijwE2ZCne3Fc
	QS2i/3wIqa2km+2OV+9ITF5guNK9EmGSurWWE4bPqQHPKFY3GVP2syyaKXhF+0wKQAT
	R7RKAzR8PykxuMQQjXvj8fTnrd5zMc6/cYnzrim4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1747312318;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=/dfItTgAPcJHqY1sqNGJjnpQyVG7TAskfZKxRlFiDfY=;
	b=pvMLwWHCwvvW+QdMqYVl7SU9ZLUk0ygxN3sFtn4k95Hi/AjyA2uSBS6dydCj75Rp
	7+INyJZCX4m/1h30dFuAlJC93H66BqaaWfWFSHzI6TGbp1nhosl5y7jB6UIOXgDn/zt
	It4T/HAZWeIDrS4/SUbFrTz63Sz+aib/8eiyDO/M=
Content-Type: multipart/mixed; boundary="===============8284225894182811642=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-urllib3: upgrading to 2.4.0 SUCCEEDED
Message-ID: <01010196d3ee14d2-d4faab79-226a-4cd2-a0d6-4633f5216ccf-000000@us-west-2.amazonses.com>
Date: Thu, 15 May 2025 12:31:57 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.05.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 May 2025 12:31:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216625

--===============8284225894182811642==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-urllib3* to *2.4.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-urllib3-upgrade-2.3.0-2.4.0.patch
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
From f3fe6cb7662827853d7403cd5abcff65131c48ba Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 May 2025 08:28:36 +0000
Subject: [PATCH] python3-urllib3: upgrade 2.3.0 -> 2.4.0

---
 .../{python3-urllib3_2.3.0.bb => python3-urllib3_2.4.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-urllib3_2.3.0.bb => python3-urllib3_2.4.0.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-urllib3_2.3.0.bb b/meta/recipes-devtools/python/python3-urllib3_2.4.0.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-urllib3_2.3.0.bb
rename to meta/recipes-devtools/python/python3-urllib3_2.4.0.bb
index fe913e6b73..7a4bffc05e 100644
--- a/meta/recipes-devtools/python/python3-urllib3_2.3.0.bb
+++ b/meta/recipes-devtools/python/python3-urllib3_2.4.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/urllib3/urllib3"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=52d273a3054ced561275d4d15260ecda"
 
-SRC_URI[sha256sum] = "f8c5449b3cf0861679ce7e0503c7b44b5ec981bec0d1d3795a07f1ba96f0204d"
+SRC_URI[sha256sum] = "414bc6535b787febd7567804cc015fee39daab8ad86268f1310a9250697de466"
 
 inherit pypi python_hatchling
 
-- 
2.47.1


--===============8284225894182811642==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-urllib3-upgrade-2.3.0-2.4.0.patch"

RnJvbSBmM2ZlNmNiNzY2MjgyNzg1M2Q3NDAzY2Q1YWJjZmY2NTEzMWM0OGJhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgTWF5IDIwMjUgMDg6Mjg6MzYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXVybGxpYjM6IHVwZ3JhZGUgMi4zLjAgLT4gMi40LjAKCi0tLQogLi4uL3tweXRob24z
LXVybGxpYjNfMi4zLjAuYmIgPT4gcHl0aG9uMy11cmxsaWIzXzIuNC4wLmJifSAgICAgIHwgMiAr
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUg
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy11cmxsaWIzXzIuMy4wLmJiID0+
IHB5dGhvbjMtdXJsbGliM18yLjQuMC5iYn0gKDg3JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdXJsbGliM18yLjMuMC5iYiBiL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy11cmxsaWIzXzIuNC4wLmJiCnNpbWlsYXJpdHkgaW5k
ZXggODclCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy11
cmxsaWIzXzIuMy4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtdXJsbGliM18yLjQuMC5iYgppbmRleCBmZTkxM2U2YjczLi43YTRiZmZjMDVlIDEwMDY0
NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdXJsbGliM18yLjMu
MC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdXJsbGliM18y
LjQuMC5iYgpAQCAtMyw3ICszLDcgQEAgSE9NRVBBR0UgPSAiaHR0cHM6Ly9naXRodWIuY29tL3Vy
bGxpYjMvdXJsbGliMyIKIExJQ0VOU0UgPSAiTUlUIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxl
Oi8vTElDRU5TRS50eHQ7bWQ1PTUyZDI3M2EzMDU0Y2VkNTYxMjc1ZDRkMTUyNjBlY2RhIgogCi1T
UkNfVVJJW3NoYTI1NnN1bV0gPSAiZjhjNTQ0OWIzY2YwODYxNjc5Y2U3ZTA1MDNjN2I0NGI1ZWM5
ODFiZWMwZDFkMzc5NWEwN2YxYmE5NmYwMjA0ZCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI0MTRi
YzY1MzViNzg3ZmViZDc1Njc4MDRjYzAxNWZlZTM5ZGFhYjhhZDg2MjY4ZjEzMTBhOTI1MDY5N2Rl
NDY2IgogCiBpbmhlcml0IHB5cGkgcHl0aG9uX2hhdGNobGluZwogCi0tIAoyLjQ3LjEKCg==

--===============8284225894182811642==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 937 .bb files complete (0 cached, 937 parsed). 1917 targets, 48 skipped, 0 masked, 0 errors.
Removing 28 recipes from the core2-64 sysroot...done.
Removing 72 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.12.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:9882158fdc3ba40cc9c7833de91eb527979fab50"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 576 Local 566 Mirrors 0 Missed 10 Current 285 (98% match, 98% complete)
Removing 3 stale sstate objects for arch x86_64...done.
Removing 2 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 293 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography.bb:do_package_qa_setscene)
NOTE: Running setscene task 298 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-certifi_2025.4.26.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 300 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-certifi_2025.4.26.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 317 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyopenssl_25.0.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 319 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 320 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 324 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-idna_3.10.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 329 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-idna_3.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 340 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyopenssl_25.0.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 350 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_package_qa_setscene)
NOTE: Running setscene task 360 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-idna_3.10.bb:do_package_qa_setscene)
NOTE: Running setscene task 361 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-idna_3.10.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 365 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 370 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-certifi_2025.4.26.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 373 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyopenssl_25.0.0.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 376 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyopenssl_25.0.0.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-certifi-2025.4.26-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-certifi-2025.4.26-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-pyopenssl-25.0.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-idna-3.10-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-idna-3.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pyopenssl-25.0.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-idna-3.10-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-idna-3.10-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-certifi-2025.4.26-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-pyopenssl-25.0.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-cryptography-44.0.2-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-pyopenssl-25.0.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-cryptography-44.0.2-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-cryptography-44.0.2-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-cryptography-44.0.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-3.13.2-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-certifi-2025.4.26-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-pyopenssl-25.0.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-certifi-2025.4.26-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 378 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-urllib3_2.4.0.bb:do_populate_lic_setscene)
NOTE: recipe python3-idna-3.10-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 379 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyopenssl_25.0.0.bb:do_package_qa_setscene)
NOTE: recipe python3-pyopenssl-25.0.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-idna-3.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-idna-3.10-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-cryptography-44.0.2-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe python3-idna-3.10-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-pyopenssl-25.0.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 381 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-idna_3.10.bb:do_create_spdx_setscene)
NOTE: recipe python3-certifi-2025.4.26-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-pyopenssl-25.0.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 387 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 388 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 390 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 398 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-certifi_2025.4.26.bb:do_package_qa_setscene)
NOTE: Running setscene task 399 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-certifi_2025.4.26.bb:do_create_spdx_setscene)
NOTE: Running setscene task 407 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography.bb:do_create_spdx_setscene)
NOTE: recipe python3-3.13.2-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe python3-cryptography-44.0.2-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-urllib3-2.4.0-r0: task do_populate_lic_setscene: Started
NOTE: recipe python3-cryptography-44.0.2-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-cryptography-44.0.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-pyopenssl-25.0.0-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-idna-3.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-certifi-2025.4.26-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-certifi-2025.4.26-r0: task do_package_qa_setscene: Started
NOTE: Running setscene task 412 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-unittest-automake-output_0.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 413 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography-vectors.bb:do_packagedata_setscene)
NOTE: Running setscene task 414 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-iso8601_2.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 415 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-psutil_7.0.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 416 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest-subtests_0.14.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 417 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 418 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_8.3.5.bb:do_packagedata_setscene)
NOTE: recipe python3-3.13.2-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-cryptography-44.0.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.13.2-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-3.13.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-urllib3-2.4.0-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 419 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-bcrypt_4.3.0.bb:do_packagedata_setscene)
NOTE: recipe python3-pyopenssl-25.0.0-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 420 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cffi_1.17.1.bb:do_packagedata_setscene)
NOTE: recipe python3-certifi-2025.4.26-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 421 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.131.14.bb:do_packagedata_setscene)
NOTE: recipe python3-idna-3.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-cryptography-vectors-44.0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-iso8601-2.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-psutil-7.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytest-subtests-0.14.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-certifi-2025.4.26-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 422 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytz_2025.2.bb:do_packagedata_setscene)
NOTE: recipe python3-pytest-8.3.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 423 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-idna_3.10.bb:do_packagedata_setscene)
NOTE: recipe python3-cryptography-44.0.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 426 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyopenssl_25.0.0.bb:do_packagedata_setscene)
NOTE: recipe python3-cffi-1.17.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-bcrypt-4.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-hypothesis-6.131.14-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-idna-3.10-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytz-2025.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pyopenssl-25.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 427 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-certifi_2025.4.26.bb:do_packagedata_setscene)
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 428 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_create_spdx_setscene)
NOTE: recipe python3-iso8601-2.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-psutil-7.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pytest-subtests-0.14.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pytest-8.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 431 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-urllib3_2.4.0.bb:do_recipe_qa_setscene)
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/python3-cryptography-vectors/44.0.2/temp/log.do_packagedata_setscene.692911
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography-vectors.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 437 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography-vectors.bb:do_package_setscene)
NOTE: recipe python3-cffi-1.17.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-certifi-2025.4.26-r0: task do_packagedata_setscene: Started
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/python3-hypothesis/6.131.14/temp/log.do_packagedata_setscene.693094
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.131.14.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe python3-bcrypt-4.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-urllib3-2.4.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-idna-3.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pytz-2025.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.13.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pyopenssl-25.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-urllib3-2.4.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-certifi-2025.4.26-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.13.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 440 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.131.14.bb:do_package_setscene)
NOTE: Running setscene task 471 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-certifi_2025.4.26.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 492 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-idna_3.10.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 493 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyopenssl_25.0.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 495 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pycparser_2.22.bb:do_packagedata_setscene)
NOTE: Running setscene task 499 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_create_spdx_setscene)
NOTE: recipe python3-certifi-2025.4.26-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-idna-3.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-pycparser-2.22-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pyopenssl-25.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-certifi-2025.4.26-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-idna-3.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-pyopenssl-25.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-pycparser-2.22-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-runtime-15.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 504 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-cryptography-vectors-44.0.2-r0: task do_package_setscene: Started
NOTE: recipe python3-hypothesis-6.131.14-r0: task do_package_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 508 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_15.1.bb:do_create_spdx_setscene)
NOTE: recipe python3-3.13.2-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 1041 of 2445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-urllib3_2.4.0.bb:do_fetch)
NOTE: recipe python3-urllib3-2.4.0-r0: task do_fetch: Started
NOTE: recipe python3-3.13.2-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-hypothesis-6.131.14-r0: task do_package_setscene: Succeeded
NOTE: recipe python3-3.13.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-urllib3-2.4.0-r0: task do_fetch: Succeeded
NOTE: Running setscene task 514 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.131.14.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 515 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 516 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: Running setscene task 517 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.44.bb:do_packagedata_setscene)
NOTE: Running setscene task 518 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 519 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20250419.bb:do_packagedata_setscene)
NOTE: Running setscene task 520 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 521 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.37.bb:do_packagedata_setscene)
NOTE: Running setscene task 522 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 523 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc_15.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 524 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_packagedata_setscene)
NOTE: Running task 1170 of 2445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-urllib3_2.4.0.bb:do_unpack)
NOTE: recipe tzdata-2025b-r0: task do_packagedata_setscene: Started
NOTE: recipe ca-certificates-20250419-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-hypothesis-6.131.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.44-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-urllib3-2.4.0-r0: task do_unpack: Started
NOTE: recipe coreutils-9.6-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.2.37-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-15.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-urllib3-2.4.0-r0: task do_unpack: Succeeded
NOTE: Running task 1232 of 2445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-urllib3_2.4.0.bb:do_patch)
NOTE: recipe python3-hypothesis-6.131.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ca-certificates-20250419-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe tzdata-2025b-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 538 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 541 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 543 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.3.bb:do_packagedata_setscene)
NOTE: recipe python3-urllib3-2.4.0-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.17.3-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.44-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-urllib3-2.4.0-r0: task do_patch: Succeeded
NOTE: recipe gcc-15.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 550 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.192.bb:do_packagedata_setscene)
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 556 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_packagedata_setscene)
NOTE: Running task 1285 of 2445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-urllib3_2.4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.2.37-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe coreutils-9.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.6.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.192-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-urllib3-2.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 578 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.17.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe elfutils-0.192-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 586 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 587 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 589 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 591 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 593 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 595 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: Running setscene task 596 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_packagedata_setscene)
NOTE: recipe python3-urllib3-2.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-urllib3_2.4.0.bb:do_deploy_source_date_epoch unihash changed to c65f6f1bd6d4fa35229c4df66316d0dfa9d1a9badff224070f389d80d9602a6f
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.7.9-r0: task do_packagedata_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libarchive-3.7.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 612 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.12.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 615 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 621 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 625 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_packagedata_setscene)
NOTE: Running setscene task 631 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcrypt-1.11.0-r0: task do_packagedata_setscene: Started
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.12.1-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.9-r0: task do_packagedata_setscene: Started
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcrypt-1.11.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 636 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 639 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 645 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.75.bb:do_packagedata_setscene)
NOTE: Running setscene task 646 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.55.bb:do_packagedata_setscene)
NOTE: recipe curl-8.12.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 653 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Started
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.75-r0: task do_packagedata_setscene: Started
NOTE: recipe libgpg-error-1.55-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 659 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 661 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 662 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 666 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_packagedata_setscene)
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.75-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtasn1-4.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.10.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 670 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.0.bb:do_packagedata_setscene)
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgpg-error-1.55-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-3.10.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 694 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 698 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_packagedata_setscene)
NOTE: recipe python3-cryptography-vectors-44.0.2-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 702 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography.bb:do_packagedata_setscene)
NOTE: Running setscene task 704 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography-vectors.bb:do_recipe_qa_setscene)
NOTE: recipe libunistring-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-cryptography-vectors-44.0.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-cryptography-44.0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-cryptography-vectors-44.0.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunistring-1.3-r0: task do_packagedata_setscene: Succeeded
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/python3-cryptography/44.0.2/temp/log.do_packagedata_setscene.696577
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 711 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography.bb:do_package_setscene)
NOTE: recipe python3-cryptography-44.0.2-r0: task do_package_setscene: Started
NOTE: recipe libpam-1.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-cryptography-44.0.2-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 715 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 716 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.85.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 720 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 721 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_packagedata_setscene)
NOTE: recipe libstd-rs-1.85.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-cryptography-44.0.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.13.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.13.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-cryptography-44.0.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libstd-rs-1.85.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 729 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunwind/libunwind_1.8.1.bb:do_packagedata_setscene)
NOTE: recipe libunwind-1.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libunwind-1.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 737 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_packagedata_setscene)
NOTE: recipe python3-3.13.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.13.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 742 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_packagedata_setscene)
NOTE: Running setscene task 743 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 744 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 745 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 746 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 747 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 748 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 749 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 750 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 751 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 752 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 753 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 754 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 755 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 756 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.8-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.7.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 758 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 759 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 760 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_packagedata_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 761 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 762 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 764 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 765 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libffi-3.4.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 767 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.7.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 774 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 781 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 782 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.8.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 783 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.1.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 785 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_recipe_qa_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Started
NOTE: Running setscene task 790 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.7.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.13.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 794 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.4.bb:do_recipe_qa_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 796 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 798 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 799 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.7.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 801 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 803 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_2.0.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 804 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.13.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 808 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 809 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 811 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.6.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 813 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 816 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 817 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: recipe libtirpc-1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 821 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 823 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 824 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-15.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 826 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.1.bb:do_packagedata_setscene)
NOTE: recipe libgcc-15.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-15.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 828 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-15.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 829 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 831 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.1.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-15.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-15.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 833 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 834 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 835 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-15.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-15.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.12-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 836 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 837 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.1.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-15.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-15.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 843 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 845 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 846 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 849 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_15.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 851 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 853 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-15.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 855 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 858 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.44.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 860 of 861 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.12.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2143 of 2445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography.bb:do_packagedata)
NOTE: Running task 2183 of 2445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-urllib3_2.4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-cryptography-44.0.2-r0: task do_packagedata: Started
NOTE: recipe python3-urllib3-2.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2382 of 2445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.131.14.bb:do_packagedata)
NOTE: Running task 2398 of 2445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-urllib3_2.4.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-hypothesis-6.131.14-r0: task do_packagedata: Started
NOTE: recipe python3-urllib3-2.4.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-cryptography-44.0.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2421 of 2445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography-vectors.bb:do_packagedata)
NOTE: recipe python3-cryptography-vectors-44.0.2-r0: task do_packagedata: Started
NOTE: recipe python3-hypothesis-6.131.14-r0: task do_packagedata: Succeeded
NOTE: recipe python3-urllib3-2.4.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-urllib3-2.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2429 of 2445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-urllib3_2.4.0.bb:do_configure)
NOTE: recipe python3-cryptography-vectors-44.0.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-urllib3-2.4.0-r0: task do_configure: Started
NOTE: recipe python3-urllib3-2.4.0-r0: task do_configure: Succeeded
NOTE: Running task 2434 of 2445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-urllib3_2.4.0.bb:do_compile)
NOTE: recipe python3-urllib3-2.4.0-r0: task do_compile: Started
NOTE: recipe python3-urllib3-2.4.0-r0: task do_compile: Succeeded
NOTE: Running task 2435 of 2445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-urllib3_2.4.0.bb:do_install)
NOTE: recipe python3-urllib3-2.4.0-r0: task do_install: Started
NOTE: recipe python3-urllib3-2.4.0-r0: task do_install: Succeeded
NOTE: Running task 2436 of 2445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-urllib3_2.4.0.bb:do_package)
NOTE: Running task 2437 of 2445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-urllib3_2.4.0.bb:do_populate_sysroot)
NOTE: recipe python3-urllib3-2.4.0-r0: task do_package: Started
NOTE: recipe python3-urllib3-2.4.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-urllib3-2.4.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-urllib3-2.4.0-r0: task do_package: Succeeded
NOTE: Running task 2438 of 2445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-urllib3_2.4.0.bb:do_packagedata)
NOTE: recipe python3-urllib3-2.4.0-r0: task do_packagedata: Started
NOTE: recipe python3-urllib3-2.4.0-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-urllib3_2.4.0.bb:do_packagedata unihash changed to 810e5761f77859ed1a5329f20ff73d25d604c45996ac8bc07851804dbeca092a
NOTE: Setscene tasks completed
NOTE: Running task 2439 of 2445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-urllib3_2.4.0.bb:do_create_spdx)
NOTE: Running task 2440 of 2445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-urllib3_2.4.0.bb:do_package_write_ipk)
NOTE: Running task 2441 of 2445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-urllib3_2.4.0.bb:do_package_write_deb)
NOTE: Running task 2442 of 2445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-urllib3_2.4.0.bb:do_package_write_rpm)
NOTE: Running task 2443 of 2445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-urllib3_2.4.0.bb:do_package_qa)
NOTE: recipe python3-urllib3-2.4.0-r0: task do_create_spdx: Started
NOTE: recipe python3-urllib3-2.4.0-r0: task do_package_write_ipk: Started
NOTE: recipe python3-urllib3-2.4.0-r0: task do_package_write_deb: Started
NOTE: recipe python3-urllib3-2.4.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-urllib3-2.4.0-r0: task do_package_qa: Started
NOTE: recipe python3-urllib3-2.4.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 2444 of 2445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-urllib3_2.4.0.bb:do_create_package_spdx)
NOTE: recipe python3-urllib3-2.4.0-r0: task do_create_package_spdx: Started
NOTE: recipe python3-urllib3-2.4.0-r0: task do_package_write_ipk: Succeeded
NOTE: recipe python3-urllib3-2.4.0-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-urllib3_2.4.0.bb:do_package_write_ipk unihash changed to c1156fb3763f48507474f3a22d2bf0d84d6233f4508c3d26444b248e7218b9bc
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-urllib3_2.4.0.bb:do_package_qa unihash changed to 36616733fc4eca41dc64e3c7932a630e6110868da0cb469b600e439215c59bf7
NOTE: recipe python3-urllib3-2.4.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-urllib3-2.4.0-r0: task do_package_write_deb: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-urllib3_2.4.0.bb:do_package_write_rpm unihash changed to 365159a48beff5f923b7dcfd032290b8614344ab7fb96539f2e52d9653b55b98
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-urllib3_2.4.0.bb:do_package_write_deb unihash changed to 597c7c0d1b8694336789cd08a4ca7db04ee3ccaeda46ef73ab65096cd8c5a5ef
NOTE: recipe python3-urllib3-2.4.0-r0: task do_create_package_spdx: Succeeded
NOTE: Running noexec task 2445 of 2445 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-urllib3_2.4.0.bb:do_build)
NOTE: Tasks Summary: Attempted 2445 tasks of which 2423 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 26 ERROR messages, returning a non-zero exit code.
ERROR: python3-cryptography-vectors-44.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography-vectors-src went backwards which would break package feeds (from 0:44.0.3-r0 to 0:44.0.2-r0) [version-going-backwards]
ERROR: python3-cryptography-vectors-44.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography-vectors-dbg went backwards which would break package feeds (from 0:44.0.3-r0 to 0:44.0.2-r0) [version-going-backwards]
ERROR: python3-cryptography-vectors-44.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography-vectors-staticdev went backwards which would break package feeds (from 0:44.0.3-r0 to 0:44.0.2-r0) [version-going-backwards]
ERROR: python3-cryptography-vectors-44.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography-vectors-dev went backwards which would break package feeds (from 0:44.0.3-r0 to 0:44.0.2-r0) [version-going-backwards]
ERROR: python3-cryptography-vectors-44.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography-vectors-doc went backwards which would break package feeds (from 0:44.0.3-r0 to 0:44.0.2-r0) [version-going-backwards]
ERROR: python3-cryptography-vectors-44.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography-vectors-locale went backwards which would break package feeds (from 0:44.0.3-r0 to 0:44.0.2-r0) [version-going-backwards]
ERROR: python3-cryptography-vectors-44.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography-vectors went backwards which would break package feeds (from 0:44.0.3-r0 to 0:44.0.2-r0) [version-going-backwards]
ERROR: python3-cryptography-vectors-44.0.2-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: python3-hypothesis-6.131.14-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-src went backwards which would break package feeds (from 0:6.131.17-r0 to 0:6.131.14-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.131.14-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-dbg went backwards which would break package feeds (from 0:6.131.17-r0 to 0:6.131.14-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.131.14-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-ptest went backwards which would break package feeds (from 0:6.131.17-r0 to 0:6.131.14-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.131.14-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-staticdev went backwards which would break package feeds (from 0:6.131.17-r0 to 0:6.131.14-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.131.14-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-dev went backwards which would break package feeds (from 0:6.131.17-r0 to 0:6.131.14-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.131.14-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-doc went backwards which would break package feeds (from 0:6.131.17-r0 to 0:6.131.14-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.131.14-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-locale went backwards which would break package feeds (from 0:6.131.17-r0 to 0:6.131.14-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.131.14-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis went backwards which would break package feeds (from 0:6.131.17-r0 to 0:6.131.14-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.131.14-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: python3-cryptography-44.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography-src went backwards which would break package feeds (from 0:44.0.3-r0 to 0:44.0.2-r0) [version-going-backwards]
ERROR: python3-cryptography-44.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography-dbg went backwards which would break package feeds (from 0:44.0.3-r0 to 0:44.0.2-r0) [version-going-backwards]
ERROR: python3-cryptography-44.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography-ptest went backwards which would break package feeds (from 0:44.0.3-r0 to 0:44.0.2-r0) [version-going-backwards]
ERROR: python3-cryptography-44.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography-staticdev went backwards which would break package feeds (from 0:44.0.3-r0 to 0:44.0.2-r0) [version-going-backwards]
ERROR: python3-cryptography-44.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography-dev went backwards which would break package feeds (from 0:44.0.3-r0 to 0:44.0.2-r0) [version-going-backwards]
ERROR: python3-cryptography-44.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography-doc went backwards which would break package feeds (from 0:44.0.3-r0 to 0:44.0.2-r0) [version-going-backwards]
ERROR: python3-cryptography-44.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography-locale went backwards which would break package feeds (from 0:44.0.3-r0 to 0:44.0.2-r0) [version-going-backwards]
ERROR: python3-cryptography-44.0.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cryptography went backwards which would break package feeds (from 0:44.0.3-r0 to 0:44.0.2-r0) [version-going-backwards]
ERROR: python3-cryptography-44.0.2-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============8284225894182811642==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-urllib3: PKGV changed from 2.3.0 [default] to 2.4.0 [default]
packages/core2-64-poky-linux/python3-urllib3: SRC_URI changed from "https://files.pythonhosted.org/packages/source/u/urllib3/urllib3-2.3.0.tar.gz;downloadfilename=urllib3-2.3.0.tar.gz" to "https://files.pythonhosted.org/packages/source/u/urllib3/urllib3-2.4.0.tar.gz;downloadfilename=urllib3-2.4.0.tar.gz"
packages/core2-64-poky-linux/python3-urllib3: PV changed from "2.3.0" to "2.4.0"
packages/core2-64-poky-linux/python3-urllib3/python3-urllib3-dbg: PKGV changed from 2.3.0 [default] to 2.4.0 [default]
packages/core2-64-poky-linux/python3-urllib3/python3-urllib3-dbg: PV changed from "2.3.0" to "2.4.0"
packages/core2-64-poky-linux/python3-urllib3/python3-urllib3-dev: PKGV changed from 2.3.0 [default] to 2.4.0 [default]
packages/core2-64-poky-linux/python3-urllib3/python3-urllib3-dev: PV changed from "2.3.0" to "2.4.0"
packages/core2-64-poky-linux/python3-urllib3/python3-urllib3-doc: PKGV changed from 2.3.0 [default] to 2.4.0 [default]
packages/core2-64-poky-linux/python3-urllib3/python3-urllib3-doc: PV changed from "2.3.0" to "2.4.0"
packages/core2-64-poky-linux/python3-urllib3/python3-urllib3-locale: PKGV changed from 2.3.0 [default] to 2.4.0 [default]
packages/core2-64-poky-linux/python3-urllib3/python3-urllib3-locale: PV changed from "2.3.0" to "2.4.0"
packages/core2-64-poky-linux/python3-urllib3/python3-urllib3-src: PKGV changed from 2.3.0 [default] to 2.4.0 [default]
packages/core2-64-poky-linux/python3-urllib3/python3-urllib3-src: PV changed from "2.3.0" to "2.4.0"
packages/core2-64-poky-linux/python3-urllib3/python3-urllib3-staticdev: PKGV changed from 2.3.0 [default] to 2.4.0 [default]
packages/core2-64-poky-linux/python3-urllib3/python3-urllib3-staticdev: PV changed from "2.3.0" to "2.4.0"
packages/core2-64-poky-linux/python3-urllib3/python3-urllib3: PKGV changed from 2.3.0 [default] to 2.4.0 [default]
packages/core2-64-poky-linux/python3-urllib3/python3-urllib3: PV changed from "2.3.0" to "2.4.0"
packages/core2-64-poky-linux/python3-urllib3/python3-urllib3: PKGSIZE changed from 865171 to 867524 (+0%)
Changes to packages/core2-64-poky-linux/python3-urllib3 (sysroot):
  /usr/lib/python3.13/site-packages/urllib3-2.3.0.dist-info moved to /usr/lib/python3.13/site-packages/urllib3-2.4.0.dist-info
Changes to packages/x86_64-linux/python3-trove-classifiers-native (sysroot):
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.3.19.19.dist-info was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.3.19.19.dist-info/licenses was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.3.19.19.dist-info/licenses/LICENSE was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.3.19.19.dist-info/METADATA was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.3.19.19.dist-info/top_level.txt was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.3.19.19.dist-info/WHEEL was added
  /usr/bin was removed
  /usr/bin/trove-classifiers was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.5.9.12.dist-info was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.5.9.12.dist-info/entry_points.txt was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.5.9.12.dist-info/licenses was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.5.9.12.dist-info/licenses/LICENSE was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.5.9.12.dist-info/METADATA was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.5.9.12.dist-info/top_level.txt was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.5.9.12.dist-info/WHEEL was removed

--===============8284225894182811642==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-urllib3 (sysroot):
  /usr/lib/python3.13/site-packages/urllib3-2.3.0.dist-info moved to /usr/lib/python3.13/site-packages/urllib3-2.4.0.dist-info
Changes to packages/x86_64-linux/python3-trove-classifiers-native (sysroot):
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.3.19.19.dist-info was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.3.19.19.dist-info/licenses was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.3.19.19.dist-info/licenses/LICENSE was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.3.19.19.dist-info/METADATA was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.3.19.19.dist-info/top_level.txt was added
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.3.19.19.dist-info/WHEEL was added
  /usr/bin was removed
  /usr/bin/trove-classifiers was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.5.9.12.dist-info was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.5.9.12.dist-info/entry_points.txt was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.5.9.12.dist-info/licenses was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.5.9.12.dist-info/licenses/LICENSE was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.5.9.12.dist-info/METADATA was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.5.9.12.dist-info/top_level.txt was removed
  /usr/lib/python3.13/site-packages/trove_classifiers-2025.5.9.12.dist-info/WHEEL was removed

--===============8284225894182811642==--

