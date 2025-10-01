Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC849CCD19D
	for <webhook@archiver.kernel.org>; Wed,  1 Oct 2025 13:32:23 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.18078.1759325539201890818
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Oct 2025 06:32:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=StK3U/xB;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=nNVQBWj7;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101999ff956f9-9f972613-7362-4987-b5b0-66cf85d274c4-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1759325542;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Z4ak0dXazPoZP0aKq/AZLTTdh32D5mrRLbuRZ6xJ62g=;
	b=StK3U/xB5gIoB47WIUKjunTcKFw2r7/EMHSPus+fbsFBiR/S0z6ogF/2nkPv5FgC
	mbFmg3C3se5S9QCghCYosbwlduCLDNo9H20YMwmcDMVFievrjx0DkURuSWrHgiQQFxw
	d5lANTkiYG3sRGrLk7ey7+87rZKdDwR/Cy/DOIZI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1759325542;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Z4ak0dXazPoZP0aKq/AZLTTdh32D5mrRLbuRZ6xJ62g=;
	b=nNVQBWj7pNmbEJijaR9Rk8m0Z6dUWfgsbPWuzg35USn6P0yzPpi+j5MVwvcFxV7Y
	mHZc53HjFLxxYk5Z/8bH39ADbU95lwTZDkU18xhSKkDIG/76r6HI6wq/hZJE5J2iwkX
	WJAXAOuE9qNOLopBubwFcuCTVDyO4FFB3mMB/Wes=
Content-Type: multipart/mixed; boundary="===============7610832869328833068=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pyopenssl: upgrading to 25.3.0 SUCCEEDED
Message-ID: <010101999ff956f9-9f972613-7362-4987-b5b0-66cf85d274c4-000000@us-west-2.amazonses.com>
Date: Wed, 1 Oct 2025 13:32:22 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.10.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Oct 2025 13:32:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224246

--===============7610832869328833068==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-pyopenssl* to *25.3.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pyopenssl-upgrade-25.1.0-25.3.0.patch
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
From ec8601422cbdc168ca215b11450eda3a62c478a7 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Oct 2025 09:22:37 +0000
Subject: [PATCH] python3-pyopenssl: upgrade 25.1.0 -> 25.3.0

---
 ...{python3-pyopenssl_25.1.0.bb => python3-pyopenssl_25.3.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pyopenssl_25.1.0.bb => python3-pyopenssl_25.3.0.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-pyopenssl_25.1.0.bb b/meta/recipes-devtools/python/python3-pyopenssl_25.3.0.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-pyopenssl_25.1.0.bb
rename to meta/recipes-devtools/python/python3-pyopenssl_25.3.0.bb
index c1f571c552..b5230293d2 100644
--- a/meta/recipes-devtools/python/python3-pyopenssl_25.1.0.bb
+++ b/meta/recipes-devtools/python/python3-pyopenssl_25.3.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 DEPENDS += "openssl python3-cryptography"
 
-SRC_URI[sha256sum] = "8d031884482e0c67ee92bf9a4d8cceb08d92aba7136432ffb0703c5280fc205b"
+SRC_URI[sha256sum] = "c981cb0a3fd84e8602d7afc209522773b94c1c2446a3c710a75b06fe1beae329"
 
 inherit pypi setuptools3
 
-- 
2.47.1


--===============7610832869328833068==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-pyopenssl: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pyopenssl/pyopenssl-25.1.0.tar.gz;downloadfilename=pyopenssl-25.1.0.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pyopenssl/pyopenssl-25.3.0.tar.gz;downloadfilename=pyopenssl-25.3.0.tar.gz"
packages/x86-64-v3-poky-linux/python3-pyopenssl: PKGV changed from 25.1.0 [default] to 25.3.0 [default]
packages/x86-64-v3-poky-linux/python3-pyopenssl: PV changed from "25.1.0" to "25.3.0"
packages/x86-64-v3-poky-linux/python3-pyopenssl/python3-pyopenssl-dbg: PKGV changed from 25.1.0 [default] to 25.3.0 [default]
packages/x86-64-v3-poky-linux/python3-pyopenssl/python3-pyopenssl-dbg: PV changed from "25.1.0" to "25.3.0"
packages/x86-64-v3-poky-linux/python3-pyopenssl/python3-pyopenssl-dev: PKGV changed from 25.1.0 [default] to 25.3.0 [default]
packages/x86-64-v3-poky-linux/python3-pyopenssl/python3-pyopenssl-dev: PV changed from "25.1.0" to "25.3.0"
packages/x86-64-v3-poky-linux/python3-pyopenssl/python3-pyopenssl-doc: PKGV changed from 25.1.0 [default] to 25.3.0 [default]
packages/x86-64-v3-poky-linux/python3-pyopenssl/python3-pyopenssl-doc: PV changed from "25.1.0" to "25.3.0"
packages/x86-64-v3-poky-linux/python3-pyopenssl/python3-pyopenssl-locale: PKGV changed from 25.1.0 [default] to 25.3.0 [default]
packages/x86-64-v3-poky-linux/python3-pyopenssl/python3-pyopenssl-locale: PV changed from "25.1.0" to "25.3.0"
packages/x86-64-v3-poky-linux/python3-pyopenssl/python3-pyopenssl-src: PKGV changed from 25.1.0 [default] to 25.3.0 [default]
packages/x86-64-v3-poky-linux/python3-pyopenssl/python3-pyopenssl-src: PV changed from "25.1.0" to "25.3.0"
packages/x86-64-v3-poky-linux/python3-pyopenssl/python3-pyopenssl-staticdev: PKGV changed from 25.1.0 [default] to 25.3.0 [default]
packages/x86-64-v3-poky-linux/python3-pyopenssl/python3-pyopenssl-staticdev: PV changed from "25.1.0" to "25.3.0"
packages/x86-64-v3-poky-linux/python3-pyopenssl/python3-pyopenssl-tests: PKGV changed from 25.1.0 [default] to 25.3.0 [default]
packages/x86-64-v3-poky-linux/python3-pyopenssl/python3-pyopenssl-tests: PV changed from "25.1.0" to "25.3.0"
packages/x86-64-v3-poky-linux/python3-pyopenssl/python3-pyopenssl: PKGSIZE changed from 473306 to 477660 (+1%)
packages/x86-64-v3-poky-linux/python3-pyopenssl/python3-pyopenssl: PKGV changed from 25.1.0 [default] to 25.3.0 [default]
packages/x86-64-v3-poky-linux/python3-pyopenssl/python3-pyopenssl: PV changed from "25.1.0" to "25.3.0"
Changes to packages/x86-64-v3-poky-linux/python3-pyopenssl (sysroot):
  /usr/lib/python3.13/site-packages/pyopenssl-25.1.0.dist-info moved to /usr/lib/python3.13/site-packages/pyopenssl-25.3.0.dist-info

--===============7610832869328833068==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pyopenssl-upgrade-25.1.0-25.3.0.patch"

RnJvbSBlYzg2MDE0MjJjYmRjMTY4Y2EyMTViMTE0NTBlZGEzYTYyYzQ3OGE3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBPY3QgMjAyNSAwOToyMjozNyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtcHlvcGVuc3NsOiB1cGdyYWRlIDI1LjEuMCAtPiAyNS4zLjAKCi0tLQogLi4ue3B5dGhv
bjMtcHlvcGVuc3NsXzI1LjEuMC5iYiA9PiBweXRob24zLXB5b3BlbnNzbF8yNS4zLjAuYmJ9IHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5h
bWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1weW9wZW5zc2xfMjUuMS4w
LmJiID0+IHB5dGhvbjMtcHlvcGVuc3NsXzI1LjMuMC5iYn0gKDg1JSkKCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHlvcGVuc3NsXzI1LjEuMC5iYiBi
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weW9wZW5zc2xfMjUuMy4wLmJi
CnNpbWlsYXJpdHkgaW5kZXggODUlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy1weW9wZW5zc2xfMjUuMS4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHlvcGVuc3NsXzI1LjMuMC5iYgppbmRleCBjMWY1NzFj
NTUyLi5iNTIzMDI5M2QyIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtcHlvcGVuc3NsXzI1LjEuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtcHlvcGVuc3NsXzI1LjMuMC5iYgpAQCAtNSw3ICs1LDcgQEAgTElDX0ZJ
TEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9M2I4M2VmOTYzODdmMTQ2NTVmYzg1NGRk
YzNjNmJkNTciCiAKIERFUEVORFMgKz0gIm9wZW5zc2wgcHl0aG9uMy1jcnlwdG9ncmFwaHkiCiAK
LVNSQ19VUklbc2hhMjU2c3VtXSA9ICI4ZDAzMTg4NDQ4MmUwYzY3ZWU5MmJmOWE0ZDhjY2ViMDhk
OTJhYmE3MTM2NDMyZmZiMDcwM2M1MjgwZmMyMDViIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImM5
ODFjYjBhM2ZkODRlODYwMmQ3YWZjMjA5NTIyNzczYjk0YzFjMjQ0NmEzYzcxMGE3NWIwNmZlMWJl
YWUzMjkiCiAKIGluaGVyaXQgcHlwaSBzZXR1cHRvb2xzMwogCi0tIAoyLjQ3LjEKCg==

--===============7610832869328833068==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/x86-64-v3-poky-linux/python3-pyopenssl (sysroot):
  /usr/lib/python3.13/site-packages/pyopenssl-25.1.0.dist-info moved to /usr/lib/python3.13/site-packages/pyopenssl-25.3.0.dist-info

--===============7610832869328833068==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 944 .bb files complete (0 cached, 944 parsed). 1940 targets, 51 skipped, 0 masked, 0 errors.
Removing 67 recipes from the qemux86_64 sysroot...done.
Removing 26 recipes from the x86-64-v3 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-f66b387f55e87907060160aee930e121ac87a958"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:f66b387f55e87907060160aee930e121ac87a958"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 508 Local 494 Mirrors 0 Missed 14 Current 274 (97% match, 98% complete)
Removing 2 stale sstate objects for arch qemux86_64...done.
Removing 3 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 279 of 782 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 285 of 782 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.7.bb:do_package_qa_setscene)
NOTE: Running setscene task 290 of 782 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 307 of 782 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.7.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 308 of 782 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 309 of 782 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.7.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 329 of 782 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography.bb:do_package_qa_setscene)
NOTE: Running setscene task 336 of 782 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography.bb:do_create_spdx_setscene)
NOTE: Running setscene task 353 of 782 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyopenssl_25.3.0.bb:do_populate_lic_setscene)
NOTE: Running setscene task 358 of 782 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography.bb:do_package_write_deb_setscene)
NOTE: recipe python3-pyopenssl-25.3.0-r0: task do_populate_lic_setscene: Started
NOTE: recipe python3-cryptography-45.0.7-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-cryptography-45.0.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-cryptography-45.0.7-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-cryptography-45.0.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-cryptography-45.0.7-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-3.13.7-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-3.13.7-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-3.13.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-3.13.7-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-pyopenssl-25.3.0-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe python3-cryptography-45.0.7-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe python3-cryptography-45.0.7-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-3.13.7-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe python3-cryptography-45.0.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-cryptography-45.0.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 372 of 782 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 373 of 782 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.7.bb:do_create_spdx_setscene)
NOTE: recipe python3-cryptography-45.0.7-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 379 of 782 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-unittest-automake-output_0.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 380 of 782 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_8.4.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 381 of 782 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-bcrypt_4.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 382 of 782 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytz_2025.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 383 of 782 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-iso8601_2.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 384 of 782 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cffi_1.17.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 385 of 782 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.139.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 386 of 782 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography.bb:do_packagedata_setscene)
NOTE: Running setscene task 387 of 782 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 388 of 782 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-psutil_7.0.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 389 of 782 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography-vectors.bb:do_packagedata_setscene)
NOTE: recipe python3-unittest-automake-output-0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytest-8.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-iso8601-2.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-cffi-1.17.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-psutil-7.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-hypothesis-6.139.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-cryptography-vectors-45.0.7-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-cryptography-45.0.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-pytz-2025.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.13.7-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-bcrypt-4.3.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 390 of 782 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest-subtests_0.14.2.bb:do_packagedata_setscene)
NOTE: recipe python3-cryptography-45.0.7-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.13.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.13.7-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-3.13.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 391 of 782 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.45.bb:do_packagedata_setscene)
NOTE: Running setscene task 392 of 782 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc_15.2.bb:do_packagedata_setscene)
NOTE: recipe python3-unittest-automake-output-0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 393 of 782 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: recipe python3-pytest-8.4.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-iso8601-2.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 394 of 782 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 395 of 782 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.7.bb:do_packagedata_setscene)
NOTE: recipe python3-pytest-subtests-0.14.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata_setscene: Succeeded
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/python3-cffi/1.17.1/temp/log.do_packagedata_setscene.1935043
NOTE: recipe python3-3.13.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 396 of 782 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: recipe python3-pytz-2025.2-r0: task do_packagedata_setscene: Succeeded
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/python3-hypothesis/6.139.2/temp/log.do_packagedata_setscene.1935044
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/python3-psutil/7.0.0/temp/log.do_packagedata_setscene.1935047
NOTE: recipe python3-cryptography-vectors-45.0.7-r0: task do_packagedata_setscene: Succeeded
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cffi_1.17.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 401 of 782 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cffi_1.17.1.bb:do_package_setscene)
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-psutil_7.0.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.139.2.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/python3-bcrypt/4.3.0/temp/log.do_packagedata_setscene.1935040
NOTE: recipe python3-cryptography-45.0.7-r0: task do_packagedata_setscene: Succeeded
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-bcrypt_4.3.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe binutils-2.45-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-cryptography-45.0.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe tzdata-2025b-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.7-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytest-subtests-0.14.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe tzdata-2025b-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 406 of 782 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 408 of 782 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 410 of 782 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20250419.bb:do_packagedata_setscene)
NOTE: Running setscene task 411 of 782 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 423 of 782 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 425 of 782 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-bcrypt_4.3.0.bb:do_package_setscene)
NOTE: Running setscene task 427 of 782 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.139.2.bb:do_package_setscene)
NOTE: Running setscene task 434 of 782 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-psutil_7.0.0.bb:do_package_setscene)
NOTE: recipe binutils-2.45-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 443 of 782 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 453 of 782 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cryptography.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 457 of 782 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_packagedata_setscene)
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ca-certificates-20250419-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.5.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe elfutils-0.193-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-cryptography-45.0.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ca-certificates-20250419-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-cryptography-45.0.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.5.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 473 of 782 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_create_spdx_setscene)
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 478 of 782 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 484 of 782 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 487 of 782 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 492 of 782 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_packagedata_setscene)
NOTE: Running task 1014 of 2249 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyopenssl_25.3.0.bb:do_recipe_qa)
NOTE: recipe elfutils-0.193-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 497 of 782 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 499 of 782 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 501 of 782 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: Running setscene task 503 of 782 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 507 of 782 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.8.1.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_packagedata_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.18.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pyopenssl-25.3.0-r0: task do_recipe_qa: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 509 of 782 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 510 of 782 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 513 of 782 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: recipe base-passwd-3.6.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 520 of 782 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 535 of 782 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 536 of 782 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_packagedata_setscene)
NOTE: Running setscene task 540 of 782 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_packagedata_setscene)
NOTE: recipe python3-cffi-1.17.1-r0: task do_package_setscene: Started
NOTE: Running setscene task 543 of 782 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.10.bb:do_packagedata_setscene)
NOTE: recipe python3-pyopenssl-25.3.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe libarchive-3.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 546 of 782 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: recipe python3-psutil-7.0.0-r0: task do_package_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1264 of 2249 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyopenssl_25.3.0.bb:do_fetch)
NOTE: Running task 1266 of 2249 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe python3-hypothesis-6.139.2-r0: task do_package_setscene: Started
NOTE: recipe python3-bcrypt-4.3.0-r0: task do_package_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe shadow-4.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 556 of 782 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_15.2.bb:do_create_spdx_setscene)
NOTE: recipe libgcrypt-1.11.2-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe python3-pyopenssl-25.3.0-r0: task do_fetch: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.10-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pyopenssl-25.3.0-r0: task do_fetch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: Running task 1283 of 2249 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyopenssl_25.3.0.bb:do_unpack)
NOTE: Running task 1284 of 2249 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 1285 of 2249 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 564 of 782 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 566 of 782 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.15.bb:do_packagedata_setscene)
NOTE: recipe libgcrypt-1.11.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pyopenssl-25.3.0-r0: task do_unpack: Started
NOTE: Running setscene task 574 of 782 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_packagedata_setscene)
NOTE: Running setscene task 575 of 782 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.55.bb:do_packagedata_setscene)
NOTE: recipe curl-8.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pyopenssl-25.3.0-r0: task do_unpack: Succeeded
NOTE: Running task 1301 of 2249 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyopenssl_25.3.0.bb:do_patch)
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 584 of 782 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Started
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.76-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libgpg-error-1.55-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 591 of 782 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 593 of 782 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 597 of 782 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 598 of 782 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: Running task 1330 of 2249 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe python3-pyopenssl-25.3.0-r0: task do_patch: Started
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-bcrypt-4.3.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 600 of 782 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.90.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 601 of 782 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.90.0.bb:do_packagedata_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 604 of 782 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-bcrypt_4.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-psutil-7.0.0-r0: task do_package_setscene: Succeeded
NOTE: recipe libcap-2.76-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtasn1-4.20.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 619 of 782 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_packagedata_setscene)
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 622 of 782 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-psutil_7.0.0.bb:do_recipe_qa_setscene)
NOTE: recipe nettle-3.10.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe python3-cffi-1.17.1-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 625 of 782 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pycparser_2.22.bb:do_packagedata_setscene)
NOTE: Running setscene task 626 of 782 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cffi_1.17.1.bb:do_recipe_qa_setscene)
NOTE: recipe python3-pyopenssl-25.3.0-r0: task do_patch: Succeeded
NOTE: Running task 1367 of 2249 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyopenssl_25.3.0.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: Running task 1369 of 2249 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe python3-hypothesis-6.139.2-r0: task do_package_setscene: Succeeded
NOTE: recipe libstd-rs-1.90.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 628 of 782 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.139.2.bb:do_recipe_qa_setscene)
NOTE: recipe libstd-rs-1.90.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgpg-error-1.55-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-psutil-7.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pycparser-2.22-r0: task do_packagedata_setscene: Started
NOTE: Running task 1380 of 2249 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyopenssl_25.3.0.bb:do_check_backend)
NOTE: recipe python3-bcrypt-4.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-cffi-1.17.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-3.10.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 644 of 782 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe python3-pyopenssl-25.3.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe python3-psutil-7.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-hypothesis-6.139.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-cffi-1.17.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-bcrypt-4.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libstd-rs-1.90.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 647 of 782 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunwind/libunwind_1.8.3.bb:do_packagedata_setscene)
NOTE: recipe python3-pyopenssl-25.3.0-r0: task do_check_backend: Started
NOTE: recipe python3-pyopenssl-25.3.0-r0: task do_check_backend: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 651 of 782 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_packagedata_setscene)
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/python3-pycparser/2.22/temp/log.do_packagedata_setscene.1936593
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pycparser_2.22.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 653 of 782 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pycparser_2.22.bb:do_package_setscene)
NOTE: Running task 1422 of 2249 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe python3-hypothesis-6.139.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunwind-1.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe python3-pycparser-2.22-r0: task do_package_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: Running task 1433 of 2249 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libunwind-1.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pyopenssl-25.3.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 658 of 782 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.3.2.bb:do_packagedata_setscene)
NOTE: recipe libunistring-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe libucontext-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libucontext-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libstd-rs-1.90.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 663 of 782 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunwind/libunwind_1.8.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 665 of 782 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/rust/libstd-rs_1.90.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-pycparser-2.22-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 667 of 782 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 668 of 782 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pycparser_2.22.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 669 of 782 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.7.bb:do_packagedata_setscene)
NOTE: recipe libpam-1.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunwind-1.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libstd-rs-1.90.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-pycparser-2.22-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libstd-rs-1.90.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.13.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.13.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libunwind-1.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 674 of 782 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunwind/libunwind_1.8.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 675 of 782 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-pycparser-2.22-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: Running task 1457 of 2249 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe libunwind-1.8.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libucontext-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunwind-1.8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe libucontext-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 677 of 782 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.13.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 679 of 782 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 680 of 782 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 681 of 782 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 682 of 782 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 683 of 782 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 684 of 782 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 685 of 782 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 686 of 782 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 687 of 782 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.26.bb:do_packagedata_setscene)
NOTE: Running setscene task 688 of 782 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_packagedata_setscene)
NOTE: recipe libucontext-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.13.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 689 of 782 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 690 of 782 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 691 of 782 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 692 of 782 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libucontext-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 694 of 782 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Started
NOTE: recipe expat-2.7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.7.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 695 of 782 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 696 of 782 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 697 of 782 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.7.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 698 of 782 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 699 of 782 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 701 of 782 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.26.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 707 of 782 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 710 of 782 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.7.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 712 of 782 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 715 of 782 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.2.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 717 of 782 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.13.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.7.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 721 of 782 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.48.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.13.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.7.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 723 of 782 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.1.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 725 of 782 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 726 of 782 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 728 of 782 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 730 of 782 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 732 of 782 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.26.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 734 of 782 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 737 of 782 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 740 of 782 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 742 of 782 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 744 of 782 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 745 of 782 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 747 of 782 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 749 of 782 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 751 of 782 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 752 of 782 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 754 of 782 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 755 of 782 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 756 of 782 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.16.bb:do_packagedata_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.16-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 761 of 782 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 762 of 782 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 763 of 782 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 765 of 782 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 766 of 782 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1551 of 2249 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 770 of 782 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 773 of 782 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 774 of 782 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 322b8f8b906444532279807f4b6d94c79a2dab3feaff9de6d084f1ef1555cf0a
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 777 of 782 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.16.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 780 of 782 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.45.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 781 of 782 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.16.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.16-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.16-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2023 of 2249 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyopenssl_25.3.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2165 of 2249 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pycparser_2.22.bb:do_packagedata)
NOTE: Running task 2212 of 2249 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-hypothesis_6.139.2.bb:do_packagedata)
NOTE: Running task 2213 of 2249 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-bcrypt_4.3.0.bb:do_packagedata)
NOTE: Running task 2215 of 2249 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-psutil_7.0.0.bb:do_packagedata)
NOTE: Running task 2226 of 2249 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyopenssl_25.3.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-pyopenssl-25.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pycparser-2.22-r0: task do_packagedata: Started
NOTE: recipe python3-hypothesis-6.139.2-r0: task do_packagedata: Started
NOTE: recipe python3-psutil-7.0.0-r0: task do_packagedata: Started
NOTE: recipe python3-bcrypt-4.3.0-r0: task do_packagedata: Started
NOTE: recipe python3-pyopenssl-25.3.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-pycparser-2.22-r0: task do_packagedata: Succeeded
NOTE: Running task 2232 of 2249 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-cffi_1.17.1.bb:do_packagedata)
NOTE: recipe python3-psutil-7.0.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-hypothesis-6.139.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-bcrypt-4.3.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-cffi-1.17.1-r0: task do_packagedata: Started
NOTE: recipe python3-pyopenssl-25.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pyopenssl-25.3.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2233 of 2249 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyopenssl_25.3.0.bb:do_configure)
NOTE: recipe python3-pyopenssl-25.3.0-r0: task do_configure: Started
NOTE: recipe python3-pyopenssl-25.3.0-r0: task do_configure: Succeeded
NOTE: recipe python3-cffi-1.17.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2238 of 2249 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyopenssl_25.3.0.bb:do_compile)
NOTE: recipe python3-pyopenssl-25.3.0-r0: task do_compile: Started
NOTE: recipe python3-pyopenssl-25.3.0-r0: task do_compile: Succeeded
NOTE: Running task 2239 of 2249 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyopenssl_25.3.0.bb:do_install)
NOTE: recipe python3-pyopenssl-25.3.0-r0: task do_install: Started
NOTE: recipe python3-pyopenssl-25.3.0-r0: task do_install: Succeeded
NOTE: Running task 2240 of 2249 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyopenssl_25.3.0.bb:do_package)
NOTE: Running task 2241 of 2249 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyopenssl_25.3.0.bb:do_populate_sysroot)
NOTE: recipe python3-pyopenssl-25.3.0-r0: task do_package: Started
NOTE: recipe python3-pyopenssl-25.3.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pyopenssl-25.3.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-pyopenssl-25.3.0-r0: task do_package: Succeeded
NOTE: Running task 2242 of 2249 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyopenssl_25.3.0.bb:do_packagedata)
NOTE: recipe python3-pyopenssl-25.3.0-r0: task do_packagedata: Started
NOTE: recipe python3-pyopenssl-25.3.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2243 of 2249 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyopenssl_25.3.0.bb:do_create_spdx)
NOTE: Running task 2244 of 2249 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyopenssl_25.3.0.bb:do_package_write_ipk)
NOTE: Running task 2245 of 2249 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyopenssl_25.3.0.bb:do_package_write_deb)
NOTE: Running task 2246 of 2249 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyopenssl_25.3.0.bb:do_package_write_rpm)
NOTE: Running task 2247 of 2249 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyopenssl_25.3.0.bb:do_package_qa)
NOTE: recipe python3-pyopenssl-25.3.0-r0: task do_create_spdx: Started
NOTE: recipe python3-pyopenssl-25.3.0-r0: task do_package_write_ipk: Started
NOTE: recipe python3-pyopenssl-25.3.0-r0: task do_package_write_deb: Started
NOTE: recipe python3-pyopenssl-25.3.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pyopenssl-25.3.0-r0: task do_package_qa: Started
NOTE: recipe python3-pyopenssl-25.3.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 2248 of 2249 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyopenssl_25.3.0.bb:do_create_package_spdx)
NOTE: recipe python3-pyopenssl-25.3.0-r0: task do_create_package_spdx: Started
NOTE: recipe python3-pyopenssl-25.3.0-r0: task do_package_write_ipk: Succeeded
NOTE: recipe python3-pyopenssl-25.3.0-r0: task do_package_qa: Succeeded
NOTE: recipe python3-pyopenssl-25.3.0-r0: task do_package_write_deb: Succeeded
NOTE: recipe python3-pyopenssl-25.3.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pyopenssl-25.3.0-r0: task do_create_package_spdx: Succeeded
NOTE: Running noexec task 2249 of 2249 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pyopenssl_25.3.0.bb:do_build)
NOTE: Tasks Summary: Attempted 2249 tasks of which 2214 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 44 ERROR messages, returning a non-zero exit code.
ERROR: python3-cffi-1.17.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cffi-src went backwards which would break package feeds (from 0:2.0.0-r0 to 0:1.17.1-r0) [version-going-backwards]
ERROR: python3-psutil-7.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-psutil-src went backwards which would break package feeds (from 0:7.1.0-r0 to 0:7.0.0-r0) [version-going-backwards]
ERROR: python3-cffi-1.17.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cffi-dbg went backwards which would break package feeds (from 0:2.0.0-r0 to 0:1.17.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.139.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-src went backwards which would break package feeds (from 0:6.140.2-r0 to 0:6.139.2-r0) [version-going-backwards]
ERROR: python3-psutil-7.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-psutil-dbg went backwards which would break package feeds (from 0:7.1.0-r0 to 0:7.0.0-r0) [version-going-backwards]
ERROR: python3-cffi-1.17.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cffi-ptest went backwards which would break package feeds (from 0:2.0.0-r0 to 0:1.17.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.139.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-dbg went backwards which would break package feeds (from 0:6.140.2-r0 to 0:6.139.2-r0) [version-going-backwards]
ERROR: python3-psutil-7.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-psutil-tests went backwards which would break package feeds (from 0:7.1.0-r0 to 0:7.0.0-r0) [version-going-backwards]
ERROR: python3-cffi-1.17.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cffi-staticdev went backwards which would break package feeds (from 0:2.0.0-r0 to 0:1.17.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.139.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-ptest went backwards which would break package feeds (from 0:6.140.2-r0 to 0:6.139.2-r0) [version-going-backwards]
ERROR: python3-psutil-7.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-psutil-staticdev went backwards which would break package feeds (from 0:7.1.0-r0 to 0:7.0.0-r0) [version-going-backwards]
ERROR: python3-cffi-1.17.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cffi-dev went backwards which would break package feeds (from 0:2.0.0-r0 to 0:1.17.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.139.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-staticdev went backwards which would break package feeds (from 0:6.140.2-r0 to 0:6.139.2-r0) [version-going-backwards]
ERROR: python3-psutil-7.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-psutil-dev went backwards which would break package feeds (from 0:7.1.0-r0 to 0:7.0.0-r0) [version-going-backwards]
ERROR: python3-cffi-1.17.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cffi-doc went backwards which would break package feeds (from 0:2.0.0-r0 to 0:1.17.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.139.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-dev went backwards which would break package feeds (from 0:6.140.2-r0 to 0:6.139.2-r0) [version-going-backwards]
ERROR: python3-psutil-7.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-psutil-doc went backwards which would break package feeds (from 0:7.1.0-r0 to 0:7.0.0-r0) [version-going-backwards]
ERROR: python3-cffi-1.17.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cffi-locale went backwards which would break package feeds (from 0:2.0.0-r0 to 0:1.17.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.139.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-doc went backwards which would break package feeds (from 0:6.140.2-r0 to 0:6.139.2-r0) [version-going-backwards]
ERROR: python3-psutil-7.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-psutil-locale went backwards which would break package feeds (from 0:7.1.0-r0 to 0:7.0.0-r0) [version-going-backwards]
ERROR: python3-bcrypt-4.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-bcrypt-src went backwards which would break package feeds (from 0:5.0.0-r0 to 0:4.3.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.139.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-locale went backwards which would break package feeds (from 0:6.140.2-r0 to 0:6.139.2-r0) [version-going-backwards]
ERROR: python3-cffi-1.17.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cffi went backwards which would break package feeds (from 0:2.0.0-r0 to 0:1.17.1-r0) [version-going-backwards]
ERROR: python3-cffi-1.17.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: python3-psutil-7.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-psutil went backwards which would break package feeds (from 0:7.1.0-r0 to 0:7.0.0-r0) [version-going-backwards]
ERROR: python3-bcrypt-4.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-bcrypt-dbg went backwards which would break package feeds (from 0:5.0.0-r0 to 0:4.3.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.139.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis went backwards which would break package feeds (from 0:6.140.2-r0 to 0:6.139.2-r0) [version-going-backwards]
ERROR: python3-psutil-7.0.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: python3-bcrypt-4.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-bcrypt-ptest went backwards which would break package feeds (from 0:5.0.0-r0 to 0:4.3.0-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.139.2-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: python3-bcrypt-4.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-bcrypt-staticdev went backwards which would break package feeds (from 0:5.0.0-r0 to 0:4.3.0-r0) [version-going-backwards]
ERROR: python3-bcrypt-4.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-bcrypt-dev went backwards which would break package feeds (from 0:5.0.0-r0 to 0:4.3.0-r0) [version-going-backwards]
ERROR: python3-bcrypt-4.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-bcrypt-doc went backwards which would break package feeds (from 0:5.0.0-r0 to 0:4.3.0-r0) [version-going-backwards]
ERROR: python3-bcrypt-4.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-bcrypt-locale went backwards which would break package feeds (from 0:5.0.0-r0 to 0:4.3.0-r0) [version-going-backwards]
ERROR: python3-bcrypt-4.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-bcrypt went backwards which would break package feeds (from 0:5.0.0-r0 to 0:4.3.0-r0) [version-going-backwards]
ERROR: python3-bcrypt-4.3.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: python3-pycparser-2.22-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pycparser-src went backwards which would break package feeds (from 0:2.23-r0 to 0:2.22-r0) [version-going-backwards]
ERROR: python3-pycparser-2.22-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pycparser-dbg went backwards which would break package feeds (from 0:2.23-r0 to 0:2.22-r0) [version-going-backwards]
ERROR: python3-pycparser-2.22-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pycparser-staticdev went backwards which would break package feeds (from 0:2.23-r0 to 0:2.22-r0) [version-going-backwards]
ERROR: python3-pycparser-2.22-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pycparser-dev went backwards which would break package feeds (from 0:2.23-r0 to 0:2.22-r0) [version-going-backwards]
ERROR: python3-pycparser-2.22-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pycparser-doc went backwards which would break package feeds (from 0:2.23-r0 to 0:2.22-r0) [version-going-backwards]
ERROR: python3-pycparser-2.22-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pycparser-locale went backwards which would break package feeds (from 0:2.23-r0 to 0:2.22-r0) [version-going-backwards]
ERROR: python3-pycparser-2.22-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pycparser went backwards which would break package feeds (from 0:2.23-r0 to 0:2.22-r0) [version-going-backwards]
ERROR: python3-pycparser-2.22-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============7610832869328833068==--

