Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03350C54EB9
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 18:00:21 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.2155.1706810405462465526
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Feb 2024 10:00:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Vdc9ie9l;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=p6AVW9YX;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101018d65d3f205-f3536144-e668-4b8d-9e42-cd23698a4e28-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1706810405;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=K4PO6BSQ3Q4IdieWxPNuf9WHDJy2e0GJXuEbSUaIqDQ=;
	b=Vdc9ie9l70R2IEzf2ZRNckgn4SObZ3aISxdpM/GuDLk/ZdkbMS7KSjKmT+taVje4
	No2wIoIJUESgd9k10TBpe7KAVuyPIQmLIz85RPGWXA5fxiqFqsdp4rui6yCmam8lmel
	MjiwLdtI1OrlgOONwo8MtDUPKerNa0ouFfzAx+ug=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1706810405;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=K4PO6BSQ3Q4IdieWxPNuf9WHDJy2e0GJXuEbSUaIqDQ=;
	b=p6AVW9YX+P2Va9PrEfc/Api4hoeCF4QkgbhUhT3JfPnrghvaVA5InY1KdGaZbuVT
	24Q4+9TWPrpNBUqQtd7DHWd0Hq914FUTrS8fyLAYIdno96EtgI05q6P04sA1JHeqXy3
	iX0foIp295hiGTkqTLl39KOYuevc2mQYHal+WHTA=
Content-Type: multipart/mixed; boundary="===============8635579285676932511=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pyopenssl: upgrading to 24.0.0 SUCCEEDED
Message-ID: <0101018d65d3f205-f3536144-e668-4b8d-9e42-cd23698a4e28-000000@us-west-2.amazonses.com>
Date: Thu, 1 Feb 2024 18:00:05 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.02.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 18:00:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194631

--===============8635579285676932511==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-pyopenssl* to *24.0.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pyopenssl-upgrade-23.3.0-24.0.0.patch
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
From 0e07a735b25bd32501f7a1faef13867af7080614 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 Feb 2024 08:08:29 +0000
Subject: [PATCH] python3-pyopenssl: upgrade 23.3.0 -> 24.0.0

---
 ...{python3-pyopenssl_23.3.0.bb => python3-pyopenssl_24.0.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pyopenssl_23.3.0.bb => python3-pyopenssl_24.0.0.bb} (86%)

diff --git a/meta/recipes-devtools/python/python3-pyopenssl_23.3.0.bb b/meta/recipes-devtools/python/python3-pyopenssl_24.0.0.bb
similarity index 86%
rename from meta/recipes-devtools/python/python3-pyopenssl_23.3.0.bb
rename to meta/recipes-devtools/python/python3-pyopenssl_24.0.0.bb
index cdcae48d60..47850220ea 100644
--- a/meta/recipes-devtools/python/python3-pyopenssl_23.3.0.bb
+++ b/meta/recipes-devtools/python/python3-pyopenssl_24.0.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 DEPENDS += "openssl ${PYTHON_PN}-cryptography"
 
-SRC_URI[sha256sum] = "6b2cba5cc46e822750ec3e5a81ee12819850b11303630d575e98108a079c2b12"
+SRC_URI[sha256sum] = "6aa33039a93fffa4563e655b61d11364d01264be8ccb49906101e02a334530bf"
 
 PYPI_PACKAGE = "pyOpenSSL"
 inherit pypi setuptools3
-- 
2.42.0


--===============8635579285676932511==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-pyopenssl (sysroot):
  /usr/lib/python3.12/site-packages/pyOpenSSL-23.3.0.dist-info moved to /usr/lib/python3.12/site-packages/pyOpenSSL-24.0.0.dist-info

--===============8635579285676932511==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pyopenssl-upgrade-23.3.0-24.0.0.patch"

RnJvbSAwZTA3YTczNWIyNWJkMzI1MDFmN2ExZmFlZjEzODY3YWY3MDgwNjE0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBGZWIgMjAyNCAwODowODoyOSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtcHlvcGVuc3NsOiB1cGdyYWRlIDIzLjMuMCAtPiAyNC4wLjAKCi0tLQogLi4ue3B5dGhv
bjMtcHlvcGVuc3NsXzIzLjMuMC5iYiA9PiBweXRob24zLXB5b3BlbnNzbF8yNC4wLjAuYmJ9IHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5h
bWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1weW9wZW5zc2xfMjMuMy4w
LmJiID0+IHB5dGhvbjMtcHlvcGVuc3NsXzI0LjAuMC5iYn0gKDg2JSkKCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHlvcGVuc3NsXzIzLjMuMC5iYiBi
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weW9wZW5zc2xfMjQuMC4wLmJi
CnNpbWlsYXJpdHkgaW5kZXggODYlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy1weW9wZW5zc2xfMjMuMy4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHlvcGVuc3NsXzI0LjAuMC5iYgppbmRleCBjZGNhZTQ4
ZDYwLi40Nzg1MDIyMGVhIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtcHlvcGVuc3NsXzIzLjMuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtcHlvcGVuc3NsXzI0LjAuMC5iYgpAQCAtNSw3ICs1LDcgQEAgTElDX0ZJ
TEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9M2I4M2VmOTYzODdmMTQ2NTVmYzg1NGRk
YzNjNmJkNTciCiAKIERFUEVORFMgKz0gIm9wZW5zc2wgJHtQWVRIT05fUE59LWNyeXB0b2dyYXBo
eSIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjZiMmNiYTVjYzQ2ZTgyMjc1MGVjM2U1YTgxZWUx
MjgxOTg1MGIxMTMwMzYzMGQ1NzVlOTgxMDhhMDc5YzJiMTIiCitTUkNfVVJJW3NoYTI1NnN1bV0g
PSAiNmFhMzMwMzlhOTNmZmZhNDU2M2U2NTViNjFkMTEzNjRkMDEyNjRiZThjY2I0OTkwNjEwMWUw
MmEzMzQ1MzBiZiIKIAogUFlQSV9QQUNLQUdFID0gInB5T3BlblNTTCIKIGluaGVyaXQgcHlwaSBz
ZXR1cHRvb2xzMwotLSAKMi40Mi4wCgo=

--===============8635579285676932511==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 912 .bb files complete (0 cached, 912 parsed). 1850 targets, 46 skipped, 0 masked, 0 errors.
Removing 25 recipes from the core2-64 sysroot...done.
Removing 69 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-493c67db4c38f91a079e67a390a65c6de6a5d26a"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:493c67db4c38f91a079e67a390a65c6de6a5d26a"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 537 Local 522 Mirrors 0 Missed 15 Current 279 (97% match, 98% complete)
Removing 2 stale sstate objects for arch qemux86_64...done.
Removing 8 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 283 of 816 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography_41.0.7.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 284 of 816 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography_41.0.7.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 285 of 816 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography_41.0.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 288 of 816 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography_41.0.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 299 of 816 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 300 of 816 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 301 of 816 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 302 of 816 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 303 of 816 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.1.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 304 of 816 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.1.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 305 of 816 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.1.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-six-1.16.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-six-1.16.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-six-1.16.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-six-1.16.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-cryptography-41.0.7-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-cryptography-41.0.7-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-cryptography-41.0.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-cryptography-41.0.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-3.12.1-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-3.12.1-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-six-1.16.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 391 of 816 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_packagedata_setscene)
NOTE: recipe python3-3.12.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-cryptography-41.0.7-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-cryptography-41.0.7-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-cryptography-41.0.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 392 of 816 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-bcrypt_4.1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 393 of 816 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cffi_1.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 394 of 816 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography-vectors_41.0.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 395 of 816 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.92.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 396 of 816 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-iso8601_2.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 397 of 816 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 398 of 816 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-psutil_5.9.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 399 of 816 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest-subtests_0.11.0.bb:do_packagedata_setscene)
NOTE: recipe python3-cryptography-41.0.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 400 of 816 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_7.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 401 of 816 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytz_2023.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 402 of 816 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-unittest-automake-output_0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 403 of 816 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.1.bb:do_create_spdx_setscene)
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-cffi-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-cryptography-vectors-41.0.7-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-psutil-5.9.7-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-iso8601-2.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytest-7.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-hypothesis-6.92.9-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytz-2023.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-bcrypt-4.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.12.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-cffi-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 414 of 816 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pycparser_2.21.bb:do_packagedata_setscene)
NOTE: recipe python3-cryptography-vectors-41.0.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 419 of 816 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography_41.0.7.bb:do_packagedata_setscene)
NOTE: recipe python3-pytest-7.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 420 of 816 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography_41.0.7.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-iso8601-2.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-hypothesis-6.92.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pytest-subtests-0.11.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pytz-2023.3-r0: task do_packagedata_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/python3-psutil/5.9.7/temp/log.do_packagedata_setscene.610940
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-psutil_5.9.7.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 433 of 816 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-psutil_5.9.7.bb:do_package_setscene)
NOTE: recipe python3-3.12.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.12.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-3.12.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-bcrypt-4.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 434 of 816 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.4.bb:do_packagedata_setscene)
NOTE: recipe python3-pycparser-2.21-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-cryptography-41.0.7-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-cryptography-41.0.7-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 435 of 816 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: recipe python3-3.12.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-pycparser-2.21-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-cryptography-41.0.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 436 of 816 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 440 of 816 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.41.bb:do_packagedata_setscene)
NOTE: Running setscene task 441 of 816 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc_13.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 460 of 816 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.74.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 461 of 816 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_packagedata_setscene)
NOTE: Running setscene task 465 of 816 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 466 of 816 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: Running setscene task 467 of 816 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 469 of 816 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_packagedata_setscene)
NOTE: Running setscene task 472 of 816 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe tzdata-2023d-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.41-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.4-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.2.21-r0: task do_packagedata_setscene: Started
NOTE: recipe libstd-rs-1.74.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-cryptography-41.0.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 476 of 816 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography_41.0.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 477 of 816 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.74.1.bb:do_populate_sysroot_setscene)
NOTE: Running task 976 of 2320 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyopenssl_24.0.0.bb:do_recipe_qa)
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe tzdata-2023d-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 490 of 816 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 491 of 816 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 495 of 816 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.14.2.bb:do_packagedata_setscene)
NOTE: recipe libstd-rs-1.74.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 506 of 816 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 508 of 816 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: recipe libstd-rs-1.74.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-pyopenssl-24.0.0-r0: task do_recipe_qa: Started
NOTE: recipe python3-cryptography-41.0.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-4.14.2-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.41-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 515 of 816 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_packagedata_setscene)
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-cryptography-41.0.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 520 of 816 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe bash-5.2.21-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe coreutils-9.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pyopenssl-24.0.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe elfutils-0.189-r0: task do_packagedata_setscene: Started
NOTE: Running task 1215 of 2320 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyopenssl_24.0.0.bb:do_fetch)
NOTE: recipe gcc-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 535 of 816 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: Running setscene task 536 of 816 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe python3-psutil-5.9.7-r0: task do_package_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 539 of 816 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 540 of 816 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb:do_packagedata_setscene)
NOTE: recipe python3-pyopenssl-24.0.0-r0: task do_fetch: Started
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-pyopenssl-24.0.0-r0: task do_fetch: Succeeded
NOTE: Running task 1219 of 2320 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: Running task 1220 of 2320 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyopenssl_24.0.0.bb:do_unpack)
NOTE: recipe shadow-4.14.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libatomic-ops-7.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.189-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 545 of 816 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 547 of 816 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: Running setscene task 549 of 816 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 553 of 816 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 555 of 816 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 557 of 816 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 562 of 816 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe python3-pyopenssl-24.0.0-r0: task do_unpack: Started
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: Running setscene task 566 of 816 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.1.bb:do_packagedata_setscene)
NOTE: Running task 1232 of 2320 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 1236 of 2320 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pyopenssl-24.0.0-r0: task do_unpack: Succeeded
NOTE: Running task 1238 of 2320 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyopenssl_24.0.0.bb:do_patch)
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libatomic-ops-7.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe mpfr-4.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pyopenssl-24.0.0-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-psutil-5.9.7-r0: task do_package_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 572 of 816 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-psutil_5.9.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 573 of 816 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 574 of 816 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.1.bb:do_populate_sysroot_setscene)
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 589 of 816 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_packagedata_setscene)
NOTE: Running setscene task 591 of 816 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 593 of 816 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 595 of 816 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_packagedata_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: recipe libarchive-3.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 605 of 816 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 607 of 816 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: recipe python3-pyopenssl-24.0.0-r0: task do_patch: Succeeded
NOTE: recipe mpfr-4.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-psutil-5.9.7-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1340 of 2320 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: Running task 1342 of 2320 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyopenssl_24.0.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1349 of 2320 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyopenssl_24.0.0.bb:do_populate_lic)
NOTE: recipe libgcrypt-1.10.3-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.5-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.12.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.12.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe file-5.45-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-psutil-5.9.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gnutls-3.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pyopenssl-24.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pyopenssl-24.0.0-r0: task do_populate_lic: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: Running task 1356 of 2320 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe libgcrypt-1.10.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe curl-8.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zstd-1.5.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 613 of 816 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.69.bb:do_packagedata_setscene)
NOTE: Running setscene task 617 of 816 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_packagedata_setscene)
NOTE: recipe file-5.45-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 631 of 816 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe python3-pyopenssl-24.0.0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyopenssl_24.0.0.bb:do_populate_lic unihash changed to 053a7f14304a6fa0b9aa24a8889b634e26eebda2bfff7c9b24c31d9d203e7463
NOTE: recipe libstd-rs-1.74.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 634 of 816 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.74.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 635 of 816 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgpg-error-1.47-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pyopenssl-24.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gnutls-3.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 641 of 816 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 645 of 816 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 647 of 816 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 649 of 816 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: Running task 1423 of 2320 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libunwind-1.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libstd-rs-1.74.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 652 of 816 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.5.3.bb:do_packagedata_setscene)
NOTE: recipe libseccomp-2.5.5-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.12.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: Running setscene task 657 of 816 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 658 of 816 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 659 of 816 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 660 of 816 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 661 of 816 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: recipe python3-3.12.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 662 of 816 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libstd-rs-1.74.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 663 of 816 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libgpg-error-1.47-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 664 of 816 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: Running setscene task 665 of 816 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 667 of 816 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.1.bb:do_recipe_qa_setscene)
NOTE: recipe libunwind-1.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 668 of 816 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 669 of 816 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 670 of 816 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 671 of 816 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 674 of 816 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 675 of 816 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.5.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.12.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 680 of 816 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 684 of 816 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 686 of 816 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.5.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 689 of 816 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 693 of 816 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 695 of 816 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.39.3.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.12.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 696 of 816 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 697 of 816 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.4.5-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 699 of 816 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.2.0.bb:do_recipe_qa_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 701 of 816 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 703 of 816 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.2.bb:do_recipe_qa_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 706 of 816 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 708 of 816 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libatomic-ops-7.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 709 of 816 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 710 of 816 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.4.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 711 of 816 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20230828-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 718 of 816 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 721 of 816 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.4.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 724 of 816 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 726 of 816 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 730 of 816 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.44.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 731 of 816 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.44.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 734 of 816 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 737 of 816 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_packagedata_setscene)
NOTE: recipe libatomic-ops-7.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 739 of 816 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 741 of 816 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 742 of 816 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libunistring-1.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 1507 of 2320 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libunwind-1.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.44.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.44.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libatomic-ops-7.8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunwind-1.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.4.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 745 of 816 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: recipe libtirpc-1.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 750 of 816 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 752 of 816 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.4.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.44.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libatomic-ops-7.8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.44.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 762 of 816 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.44.2.bb:do_recipe_qa_setscene)
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 764 of 816 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_recipe_qa_setscene)
NOTE: recipe libtirpc-1.3.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.44.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.44.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: Running task 1568 of 2320 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 766 of 816 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 767 of 816 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 775 of 816 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 776 of 816 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 777 of 816 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 780 of 816 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 781 of 816 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 782 of 816 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 784 of 816 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 785 of 816 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 787 of 816 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 789 of 816 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 790 of 816 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 791 of 816 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 792 of 816 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 793 of 816 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 795 of 816 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 801 of 816 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 802 of 816 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 805 of 816 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe linux-libc-headers-6.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 1613 of 2320 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to e644ec3722734ea60494db1182afab8d0334f493c3dc1fb845b731f7ca727b46
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 809 of 816 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 811 of 816 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 812 of 816 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 814 of 816 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.6.bb:do_recipe_qa_setscene)
NOTE: recipe linux-libc-headers-6.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 816 of 816 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2059 of 2320 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyopenssl_24.0.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2286 of 2320 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-psutil_5.9.7.bb:do_packagedata)
NOTE: Running task 2296 of 2320 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyopenssl_24.0.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-pyopenssl-24.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-psutil-5.9.7-r0: task do_packagedata: Started
NOTE: recipe python3-pyopenssl-24.0.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-psutil-5.9.7-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pyopenssl-24.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pyopenssl-24.0.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2308 of 2320 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyopenssl_24.0.0.bb:do_configure)
NOTE: recipe python3-pyopenssl-24.0.0-r0: task do_configure: Started
NOTE: recipe python3-pyopenssl-24.0.0-r0: task do_configure: Succeeded
NOTE: Running task 2309 of 2320 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyopenssl_24.0.0.bb:do_compile)
NOTE: recipe python3-pyopenssl-24.0.0-r0: task do_compile: Started
NOTE: recipe python3-pyopenssl-24.0.0-r0: task do_compile: Succeeded
NOTE: Running task 2310 of 2320 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyopenssl_24.0.0.bb:do_install)
NOTE: recipe python3-pyopenssl-24.0.0-r0: task do_install: Started
NOTE: recipe python3-pyopenssl-24.0.0-r0: task do_install: Succeeded
NOTE: Running task 2311 of 2320 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyopenssl_24.0.0.bb:do_package)
NOTE: Running task 2312 of 2320 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyopenssl_24.0.0.bb:do_populate_sysroot)
NOTE: recipe python3-pyopenssl-24.0.0-r0: task do_package: Started
NOTE: recipe python3-pyopenssl-24.0.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pyopenssl-24.0.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-pyopenssl-24.0.0-r0: task do_package: Succeeded
NOTE: Running task 2313 of 2320 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyopenssl_24.0.0.bb:do_packagedata)
NOTE: recipe python3-pyopenssl-24.0.0-r0: task do_packagedata: Started
NOTE: recipe python3-pyopenssl-24.0.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2314 of 2320 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyopenssl_24.0.0.bb:do_create_spdx)
NOTE: Running task 2315 of 2320 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyopenssl_24.0.0.bb:do_package_write_ipk)
NOTE: Running task 2316 of 2320 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyopenssl_24.0.0.bb:do_package_write_deb)
NOTE: Running task 2317 of 2320 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyopenssl_24.0.0.bb:do_package_write_rpm)
NOTE: Running task 2318 of 2320 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyopenssl_24.0.0.bb:do_package_qa)
NOTE: recipe python3-pyopenssl-24.0.0-r0: task do_create_spdx: Started
NOTE: recipe python3-pyopenssl-24.0.0-r0: task do_package_write_ipk: Started
NOTE: recipe python3-pyopenssl-24.0.0-r0: task do_package_write_deb: Started
NOTE: recipe python3-pyopenssl-24.0.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pyopenssl-24.0.0-r0: task do_package_qa: Started
NOTE: recipe python3-pyopenssl-24.0.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 2319 of 2320 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyopenssl_24.0.0.bb:do_create_runtime_spdx)
NOTE: recipe python3-pyopenssl-24.0.0-r0: task do_package_qa: Succeeded
NOTE: recipe python3-pyopenssl-24.0.0-r0: task do_create_runtime_spdx: Started
NOTE: recipe python3-pyopenssl-24.0.0-r0: task do_package_write_ipk: Succeeded
NOTE: recipe python3-pyopenssl-24.0.0-r0: task do_package_write_deb: Succeeded
NOTE: recipe python3-pyopenssl-24.0.0-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe python3-pyopenssl-24.0.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2320 of 2320 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyopenssl_24.0.0.bb:do_build)
NOTE: Tasks Summary: Attempted 2320 tasks of which 2289 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: python3-psutil-5.9.7-r0 do_packagedata_setscene: QA Issue: Package version for package python3-psutil-src went backwards which would break package feeds (from 0:5.9.8-r0 to 0:5.9.7-r0) [version-going-backwards]
ERROR: python3-psutil-5.9.7-r0 do_packagedata_setscene: QA Issue: Package version for package python3-psutil-dbg went backwards which would break package feeds (from 0:5.9.8-r0 to 0:5.9.7-r0) [version-going-backwards]
ERROR: python3-psutil-5.9.7-r0 do_packagedata_setscene: QA Issue: Package version for package python3-psutil-tests went backwards which would break package feeds (from 0:5.9.8-r0 to 0:5.9.7-r0) [version-going-backwards]
ERROR: python3-psutil-5.9.7-r0 do_packagedata_setscene: QA Issue: Package version for package python3-psutil-staticdev went backwards which would break package feeds (from 0:5.9.8-r0 to 0:5.9.7-r0) [version-going-backwards]
ERROR: python3-psutil-5.9.7-r0 do_packagedata_setscene: QA Issue: Package version for package python3-psutil-dev went backwards which would break package feeds (from 0:5.9.8-r0 to 0:5.9.7-r0) [version-going-backwards]
ERROR: python3-psutil-5.9.7-r0 do_packagedata_setscene: QA Issue: Package version for package python3-psutil-doc went backwards which would break package feeds (from 0:5.9.8-r0 to 0:5.9.7-r0) [version-going-backwards]
ERROR: python3-psutil-5.9.7-r0 do_packagedata_setscene: QA Issue: Package version for package python3-psutil-locale went backwards which would break package feeds (from 0:5.9.8-r0 to 0:5.9.7-r0) [version-going-backwards]
ERROR: python3-psutil-5.9.7-r0 do_packagedata_setscene: QA Issue: Package version for package python3-psutil went backwards which would break package feeds (from 0:5.9.8-r0 to 0:5.9.7-r0) [version-going-backwards]
ERROR: python3-psutil-5.9.7-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============8635579285676932511==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-pyopenssl: PV changed from "23.3.0" to "24.0.0"
packages/core2-64-poky-linux/python3-pyopenssl: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pyOpenSSL/pyOpenSSL-23.3.0.tar.gz;downloadfilename=pyOpenSSL-23.3.0.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pyOpenSSL/pyOpenSSL-24.0.0.tar.gz;downloadfilename=pyOpenSSL-24.0.0.tar.gz"
packages/core2-64-poky-linux/python3-pyopenssl: PKGV changed from 23.3.0 [default] to 24.0.0 [default]
packages/core2-64-poky-linux/python3-pyopenssl/python3-pyopenssl-dbg: PV changed from "23.3.0" to "24.0.0"
packages/core2-64-poky-linux/python3-pyopenssl/python3-pyopenssl-dbg: PKGV changed from 23.3.0 [default] to 24.0.0 [default]
packages/core2-64-poky-linux/python3-pyopenssl/python3-pyopenssl-dev: PV changed from "23.3.0" to "24.0.0"
packages/core2-64-poky-linux/python3-pyopenssl/python3-pyopenssl-dev: PKGV changed from 23.3.0 [default] to 24.0.0 [default]
packages/core2-64-poky-linux/python3-pyopenssl/python3-pyopenssl-doc: PV changed from "23.3.0" to "24.0.0"
packages/core2-64-poky-linux/python3-pyopenssl/python3-pyopenssl-doc: PKGV changed from 23.3.0 [default] to 24.0.0 [default]
packages/core2-64-poky-linux/python3-pyopenssl/python3-pyopenssl-locale: PV changed from "23.3.0" to "24.0.0"
packages/core2-64-poky-linux/python3-pyopenssl/python3-pyopenssl-locale: PKGV changed from 23.3.0 [default] to 24.0.0 [default]
packages/core2-64-poky-linux/python3-pyopenssl/python3-pyopenssl-src: PV changed from "23.3.0" to "24.0.0"
packages/core2-64-poky-linux/python3-pyopenssl/python3-pyopenssl-src: PKGV changed from 23.3.0 [default] to 24.0.0 [default]
packages/core2-64-poky-linux/python3-pyopenssl/python3-pyopenssl-staticdev: PV changed from "23.3.0" to "24.0.0"
packages/core2-64-poky-linux/python3-pyopenssl/python3-pyopenssl-staticdev: PKGV changed from 23.3.0 [default] to 24.0.0 [default]
packages/core2-64-poky-linux/python3-pyopenssl/python3-pyopenssl-tests: PV changed from "23.3.0" to "24.0.0"
packages/core2-64-poky-linux/python3-pyopenssl/python3-pyopenssl-tests: PKGV changed from 23.3.0 [default] to 24.0.0 [default]
packages/core2-64-poky-linux/python3-pyopenssl/python3-pyopenssl: PV changed from "23.3.0" to "24.0.0"
packages/core2-64-poky-linux/python3-pyopenssl/python3-pyopenssl: PKGV changed from 23.3.0 [default] to 24.0.0 [default]
packages/core2-64-poky-linux/python3-pyopenssl/python3-pyopenssl: PKGSIZE changed from 512944 to 511812 (-0%)
Changes to packages/core2-64-poky-linux/python3-pyopenssl (sysroot):
  /usr/lib/python3.12/site-packages/pyOpenSSL-23.3.0.dist-info moved to /usr/lib/python3.12/site-packages/pyOpenSSL-24.0.0.dist-info

--===============8635579285676932511==--

