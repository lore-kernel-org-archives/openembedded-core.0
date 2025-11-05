Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACF79CD343C
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 23:16:35 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2371.1762384588331825178
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Nov 2025 15:16:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=eLw31bdD;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=l9D/94zx;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019a564eac38-0b432603-e8c3-42ef-b404-b288b13b2c81-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1762384587;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=kZDkqwESAIDJvzkpPBa0cyT7sQPt2rmx8nsFOnsGgQM=;
	b=eLw31bdD0ElWIabliJr9CQls+dg1c0e+fksz0AN55aGcS47rPg6YfSfUE/nNvncc
	Meu8Hbr4UaVCnVgsMg+wll2B/eleuGiP8bjQvDYxmYi+96b0wDmUVBoQtyUFienFFuc
	0U8pDHxWsb/pWVXJDeVrdEjAgD+wJerKDyM6i8qQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1762384587;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=kZDkqwESAIDJvzkpPBa0cyT7sQPt2rmx8nsFOnsGgQM=;
	b=l9D/94zx/IHxDHQ+vFvS1xgPK0Srcoea/IdCzdC/zbPqn/zC2xhZ74CrIRtkT2aa
	yO8l8fYlpJyiIuDxnwmnUkax+T3He5S1smJg521Qlyp1tf5KkMm+pV6UV+gUq3iNvnC
	SCajdtQXXvW2fSpDoqnJLJ0NTB6n/MWe9ATlJpLI=
Content-Type: multipart/mixed; boundary="===============3444671858239691048=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pyopenssl: upgrading to 25.3.0 SUCCEEDED
Message-ID: <0101019a564eac38-0b432603-e8c3-42ef-b404-b288b13b2c81-000000@us-west-2.amazonses.com>
Date: Wed, 5 Nov 2025 23:16:27 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.11.05-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Nov 2025 23:16:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225840

--===============3444671858239691048==
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
From 86aea6bd5afcebd791239ec40e2fe0ebb48bb101 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 5 Nov 2025 17:35:43 +0000
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


--===============3444671858239691048==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pyopenssl-upgrade-25.1.0-25.3.0.patch"

RnJvbSA4NmFlYTZiZDVhZmNlYmQ3OTEyMzllYzQwZTJmZTBlYmI0OGJiMTAxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgNSBOb3YgMjAyNSAxNzozNTo0MyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
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

--===============3444671858239691048==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/x86-64-v3-poky-linux/python3-pyopenssl (sysroot):
  /usr/lib/python3.13/site-packages/pyopenssl-25.1.0.dist-info moved to /usr/lib/python3.13/site-packages/pyopenssl-25.3.0.dist-info

--===============3444671858239691048==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-pyopenssl: PKGV changed from 25.1.0 [default] to 25.3.0 [default]
packages/x86-64-v3-poky-linux/python3-pyopenssl: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pyopenssl/pyopenssl-25.1.0.tar.gz;downloadfilename=pyopenssl-25.1.0.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pyopenssl/pyopenssl-25.3.0.tar.gz;downloadfilename=pyopenssl-25.3.0.tar.gz"
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
packages/x86-64-v3-poky-linux/python3-pyopenssl/python3-pyopenssl: PKGV changed from 25.1.0 [default] to 25.3.0 [default]
packages/x86-64-v3-poky-linux/python3-pyopenssl/python3-pyopenssl: PKGSIZE changed from 473306 to 477660 (+1%)
packages/x86-64-v3-poky-linux/python3-pyopenssl/python3-pyopenssl: PV changed from "25.1.0" to "25.3.0"
Changes to packages/x86-64-v3-poky-linux/python3-pyopenssl (sysroot):
  /usr/lib/python3.13/site-packages/pyopenssl-25.1.0.dist-info moved to /usr/lib/python3.13/site-packages/pyopenssl-25.3.0.dist-info

--===============3444671858239691048==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 948 .bb files complete (0 cached, 948 parsed). 1946 targets, 54 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "5.2.99+snapshot-5559d804d25eead3810d1f88b203df7bc90b9a56"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:5559d804d25eead3810d1f88b203df7bc90b9a56"
meta-yocto-bsp       
meta-poky            = "master:66ea31cee15309af07afeee8dec8a6fe1d92d28e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 510 Local 498 Mirrors 0 Missed 12 Current 278 (97% match, 98% complete)
Removing 3 stale sstate objects for arch x86_64...done.
Removing 2 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 298 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 302 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyopenssl_25.3.0.bb:do_populate_lic_setscene)
NOTE: Running setscene task 315 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-cryptography.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 317 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_package_qa_setscene)
NOTE: Running setscene task 333 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 334 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 335 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-cryptography.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 350 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-cryptography.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 355 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-cryptography.bb:do_package_qa_setscene)
NOTE: Running setscene task 370 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-cryptography.bb:do_create_spdx_setscene)
NOTE: Running setscene task 374 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyopenssl_25.3.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-pyopenssl-25.3.0-r0: task do_populate_lic_setscene: Started
NOTE: recipe python3-pyopenssl-25.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-cryptography-45.0.7-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-cryptography-45.0.7-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-cryptography-45.0.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-cryptography-45.0.7-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-cryptography-45.0.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.13.9-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-3.13.9-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-3.13.9-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-3.13.9-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-pyopenssl-25.3.0-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe python3-cryptography-45.0.7-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-cryptography-45.0.7-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe python3-3.13.9-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe python3-cryptography-45.0.7-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-cryptography-45.0.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-cryptography-45.0.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 378 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_create_spdx_setscene)
NOTE: Running setscene task 381 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-cryptography.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 383 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytz_2025.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 384 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-cryptography.bb:do_packagedata_setscene)
NOTE: Running setscene task 385 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest-subtests_0.14.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 386 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_8.4.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 387 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 388 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-cryptography-vectors.bb:do_packagedata_setscene)
NOTE: Running setscene task 389 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-psutil_7.0.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 390 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 391 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-cffi_1.17.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 392 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-bcrypt_4.3.0.bb:do_packagedata_setscene)
NOTE: recipe python3-pyopenssl-25.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 393 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.142.2.bb:do_packagedata_setscene)
NOTE: recipe python3-pytest-subtests-0.14.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytz-2025.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytest-8.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-psutil-7.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-cryptography-vectors-45.0.7-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.13.9-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-cffi-1.17.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 394 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iso8601_2.1.0.bb:do_packagedata_setscene)
NOTE: recipe python3-cryptography-45.0.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-hypothesis-6.142.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-cryptography-45.0.7-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.13.9-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-bcrypt-4.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.13.9-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-3.13.9-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 395 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyopenssl_25.3.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 396 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.45.bb:do_packagedata_setscene)
NOTE: recipe python3-iso8601-2.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytest-subtests-0.14.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 397 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.7.bb:do_packagedata_setscene)
NOTE: recipe python3-pytz-2025.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 398 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ca-certificates/ca-certificates_20250419.bb:do_packagedata_setscene)
NOTE: Running setscene task 399 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_packagedata_setscene)
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/python3-psutil/7.0.0/temp/log.do_packagedata_setscene.1531108
NOTE: recipe python3-3.13.9-r0: task do_create_spdx_setscene: Succeeded
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-psutil_7.0.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 400 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/python3-cffi/1.17.1/temp/log.do_packagedata_setscene.1531110
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-cffi_1.17.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 402 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_15.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 403 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/python3-hypothesis/6.142.2/temp/log.do_packagedata_setscene.1531112
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.142.2.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 408 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: recipe python3-pyopenssl-25.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-2.45-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytest-8.4.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-cryptography-vectors-45.0.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-cryptography-45.0.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 409 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 410 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-cffi_1.17.1.bb:do_package_setscene)
NOTE: recipe python3-cryptography-45.0.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ca-certificates-20250419-r0: task do_packagedata_setscene: Started
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/python3-bcrypt/4.3.0/temp/log.do_packagedata_setscene.1531111
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-bcrypt_4.3.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe coreutils-9.7-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe tzdata-2025b-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pyopenssl-25.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-iso8601-2.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe ca-certificates-20250419-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe tzdata-2025b-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe binutils-2.45-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 413 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 415 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-psutil_7.0.0.bb:do_package_setscene)
NOTE: Running setscene task 416 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-bcrypt_4.3.0.bb:do_package_setscene)
NOTE: Running setscene task 418 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 428 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.142.2.bb:do_package_setscene)
NOTE: Running setscene task 439 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_packagedata_setscene)
NOTE: recipe gcc-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 464 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-cryptography.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 471 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe coreutils-9.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.193-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.5.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-cryptography-45.0.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 485 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_create_spdx_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 492 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 493 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 498 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 502 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_packagedata_setscene)
NOTE: Running task 1021 of 2265 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyopenssl_25.3.0.bb:do_fetch)
NOTE: recipe python3-cryptography-45.0.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe elfutils-0.193-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 507 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 508 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 509 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 510 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 515 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 517 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-4.18.0-r0: task do_packagedata_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pyopenssl-25.3.0-r0: task do_fetch: Started
NOTE: recipe python3-pyopenssl-25.3.0-r0: task do_fetch: Succeeded
NOTE: Running setscene task 519 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.18.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 521 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe libarchive-3.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 523 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe base-passwd-3.6.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Started
NOTE: Running task 1121 of 2265 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyopenssl_25.3.0.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 535 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 536 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.46.bb:do_packagedata_setscene)
NOTE: Running setscene task 540 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 542 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.16.0.bb:do_packagedata_setscene)
NOTE: recipe libarchive-3.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 555 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: recipe python3-cffi-1.17.1-r0: task do_package_setscene: Started
NOTE: recipe python3-psutil-7.0.0-r0: task do_package_setscene: Started
NOTE: recipe python3-hypothesis-6.142.2-r0: task do_package_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-pyopenssl-25.3.0-r0: task do_unpack: Started
NOTE: Running task 1288 of 2265 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe python3-bcrypt-4.3.0-r0: task do_package_setscene: Started
NOTE: recipe python3-pyopenssl-25.3.0-r0: task do_unpack: Succeeded
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1295 of 2265 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyopenssl_25.3.0.bb:do_patch)
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe shadow-4.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 565 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_15.2.bb:do_create_spdx_setscene)
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.11.2-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.10-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: Running task 1301 of 2265 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 1302 of 2265 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pyopenssl-25.3.0-r0: task do_patch: Started
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 570 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 571 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe curl-8.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgcrypt-1.11.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 581 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.76.bb:do_packagedata_setscene)
NOTE: Running setscene task 582 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.56.bb:do_packagedata_setscene)
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 593 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: recipe python3-pyopenssl-25.3.0-r0: task do_patch: Succeeded
NOTE: Running task 1342 of 2265 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyopenssl_25.3.0.bb:do_check_backend)
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.76-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 597 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 599 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_3.10.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 601 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 604 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libgpg-error-1.56-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: Running task 1349 of 2265 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe python3-pyopenssl-25.3.0-r0: task do_check_backend: Started
NOTE: recipe python3-pyopenssl-25.3.0-r0: task do_check_backend: Succeeded
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-psutil-7.0.0-r0: task do_package_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 613 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-psutil_7.0.0.bb:do_recipe_qa_setscene)
NOTE: recipe nettle-3.10.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-bcrypt-4.3.0-r0: task do_package_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: Running setscene task 614 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.90.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 618 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.90.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 623 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-bcrypt_4.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-2.76-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 628 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: Running task 1391 of 2265 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe python3-psutil-7.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-hypothesis-6.142.2-r0: task do_package_setscene: Succeeded
NOTE: recipe libgpg-error-1.56-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libstd-rs-1.90.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-cffi-1.17.1-r0: task do_package_setscene: Succeeded
NOTE: recipe libtasn1-4.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libstd-rs-1.90.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 636 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.142.2.bb:do_recipe_qa_setscene)
NOTE: recipe nettle-3.10.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 642 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-cffi_1.17.1.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.7.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 643 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycparser_2.22.bb:do_packagedata_setscene)
NOTE: Running setscene task 646 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe python3-bcrypt-4.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-psutil-7.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe python3-hypothesis-6.142.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pycparser-2.22-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 653 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.3.bb:do_packagedata_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libstd-rs-1.90.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-cffi-1.17.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 658 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunwind/libunwind_1.8.3.bb:do_packagedata_setscene)
NOTE: recipe python3-bcrypt-4.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: Running task 1433 of 2265 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe python3-hypothesis-6.142.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-cffi-1.17.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunistring-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libunwind-1.8.3-r0: task do_packagedata_setscene: Started
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/python3-pycparser/2.22/temp/log.do_packagedata_setscene.1532782
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycparser_2.22.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 659 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycparser_2.22.bb:do_package_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: Running task 1449 of 2265 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libunistring-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunwind-1.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 667 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libucontext_1.3.2.bb:do_packagedata_setscene)
NOTE: recipe python3-pycparser-2.22-r0: task do_package_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe libucontext-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libstd-rs-1.90.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 669 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunwind/libunwind_1.8.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 670 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.90.0.bb:do_recipe_qa_setscene)
NOTE: recipe libucontext-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunwind-1.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libstd-rs-1.90.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libstd-rs-1.90.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-pycparser-2.22-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 675 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 676 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 678 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycparser_2.22.bb:do_recipe_qa_setscene)
NOTE: recipe libunwind-1.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 679 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libucontext_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 681 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunwind/libunwind_1.8.3.bb:do_recipe_qa_setscene)
NOTE: recipe python3-pycparser-2.22-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunwind-1.8.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: recipe libucontext-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.13.9-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.13.9-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1467 of 2265 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe libunwind-1.8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-pycparser-2.22-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe libucontext-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 683 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libucontext_1.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe libucontext-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libucontext-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.13.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 685 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 686 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 687 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 688 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 689 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 690 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 691 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_packagedata_setscene)
NOTE: Running setscene task 692 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 693 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 694 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_packagedata_setscene)
NOTE: recipe python3-3.13.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 695 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 696 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 698 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 699 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 700 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Started
NOTE: recipe expat-2.7.3-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.5.4-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 701 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 702 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 703 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.4.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.7.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 704 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 706 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 708 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 711 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 715 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 718 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 719 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 721 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 725 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.7.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.13.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 728 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.1.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.13.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 730 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 732 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.7.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.48.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 735 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 736 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 738 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 741 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.48.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.7.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 745 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 746 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.7.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 748 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 750 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 751 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 753 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 755 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 756 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 758 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 760 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.17.bb:do_packagedata_setscene)
NOTE: Running setscene task 761 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 762 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 764 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 765 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_recipe_qa_setscene)
NOTE: recipe linux-libc-headers-6.17-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 770 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 771 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 773 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 777 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 778 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 780 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running task 1567 of 2265 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 322b8f8b906444532279807f4b6d94c79a2dab3feaff9de6d084f1ef1555cf0a
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 783 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.17.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.17-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.17-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 785 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils-cross_2.45.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 787 of 788 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.17.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.17-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.17-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2039 of 2265 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyopenssl_25.3.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2181 of 2265 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycparser_2.22.bb:do_packagedata)
NOTE: Running task 2229 of 2265 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-bcrypt_4.3.0.bb:do_packagedata)
NOTE: Running task 2231 of 2265 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-psutil_7.0.0.bb:do_packagedata)
NOTE: recipe python3-pyopenssl-25.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2232 of 2265 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hypothesis_6.142.2.bb:do_packagedata)
NOTE: Running task 2242 of 2265 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyopenssl_25.3.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-pycparser-2.22-r0: task do_packagedata: Started
NOTE: recipe python3-psutil-7.0.0-r0: task do_packagedata: Started
NOTE: recipe python3-bcrypt-4.3.0-r0: task do_packagedata: Started
NOTE: recipe python3-hypothesis-6.142.2-r0: task do_packagedata: Started
NOTE: recipe python3-pyopenssl-25.3.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-pycparser-2.22-r0: task do_packagedata: Succeeded
NOTE: Running task 2248 of 2265 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-cffi_1.17.1.bb:do_packagedata)
NOTE: recipe python3-hypothesis-6.142.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-psutil-7.0.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-bcrypt-4.3.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-cffi-1.17.1-r0: task do_packagedata: Started
NOTE: recipe python3-pyopenssl-25.3.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-pyopenssl-25.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2249 of 2265 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyopenssl_25.3.0.bb:do_configure)
NOTE: recipe python3-pyopenssl-25.3.0-r0: task do_configure: Started
NOTE: recipe python3-cffi-1.17.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pyopenssl-25.3.0-r0: task do_configure: Succeeded
NOTE: Running task 2254 of 2265 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyopenssl_25.3.0.bb:do_compile)
NOTE: recipe python3-pyopenssl-25.3.0-r0: task do_compile: Started
NOTE: recipe python3-pyopenssl-25.3.0-r0: task do_compile: Succeeded
NOTE: Running task 2255 of 2265 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyopenssl_25.3.0.bb:do_install)
NOTE: recipe python3-pyopenssl-25.3.0-r0: task do_install: Started
NOTE: recipe python3-pyopenssl-25.3.0-r0: task do_install: Succeeded
NOTE: Running task 2256 of 2265 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyopenssl_25.3.0.bb:do_package)
NOTE: Running task 2257 of 2265 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyopenssl_25.3.0.bb:do_populate_sysroot)
NOTE: recipe python3-pyopenssl-25.3.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pyopenssl-25.3.0-r0: task do_package: Started
NOTE: recipe python3-pyopenssl-25.3.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-pyopenssl-25.3.0-r0: task do_package: Succeeded
NOTE: Running task 2258 of 2265 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyopenssl_25.3.0.bb:do_packagedata)
NOTE: recipe python3-pyopenssl-25.3.0-r0: task do_packagedata: Started
NOTE: recipe python3-pyopenssl-25.3.0-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyopenssl_25.3.0.bb:do_packagedata unihash changed to 304ae2934960ac37abd0b93e0d860c9025d6f7b5a4a01e00fb5892dc4012d030
NOTE: Setscene tasks completed
NOTE: Running task 2259 of 2265 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyopenssl_25.3.0.bb:do_create_spdx)
NOTE: Running task 2260 of 2265 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyopenssl_25.3.0.bb:do_package_write_ipk)
NOTE: Running task 2261 of 2265 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyopenssl_25.3.0.bb:do_package_write_deb)
NOTE: Running task 2262 of 2265 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyopenssl_25.3.0.bb:do_package_write_rpm)
NOTE: Running task 2263 of 2265 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyopenssl_25.3.0.bb:do_package_qa)
NOTE: recipe python3-pyopenssl-25.3.0-r0: task do_create_spdx: Started
NOTE: recipe python3-pyopenssl-25.3.0-r0: task do_package_write_ipk: Started
NOTE: recipe python3-pyopenssl-25.3.0-r0: task do_package_write_deb: Started
NOTE: recipe python3-pyopenssl-25.3.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pyopenssl-25.3.0-r0: task do_package_qa: Started
NOTE: recipe python3-pyopenssl-25.3.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 2264 of 2265 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyopenssl_25.3.0.bb:do_create_package_spdx)
NOTE: recipe python3-pyopenssl-25.3.0-r0: task do_create_package_spdx: Started
NOTE: recipe python3-pyopenssl-25.3.0-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyopenssl_25.3.0.bb:do_package_qa unihash changed to 19e364ceeb540f72f1cf7aaaa4fd7c5f71daef58db67a64d8e42218c163982ac
NOTE: recipe python3-pyopenssl-25.3.0-r0: task do_package_write_ipk: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyopenssl_25.3.0.bb:do_package_write_ipk unihash changed to bce20b2300beb4b11d3421b6b7324cda6dba098d8cee25ccc3f74039de8942dc
NOTE: recipe python3-pyopenssl-25.3.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pyopenssl-25.3.0-r0: task do_package_write_deb: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyopenssl_25.3.0.bb:do_package_write_rpm unihash changed to 256a94883bac03369950939dc7ad0820d01f500492b4741a09239fc58e46e4ce
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyopenssl_25.3.0.bb:do_package_write_deb unihash changed to ff6eaba27457c8c9da53fc65db7f9465f8a08dea9db0af7db8e775860624897c
NOTE: recipe python3-pyopenssl-25.3.0-r0: task do_create_package_spdx: Succeeded
NOTE: Running noexec task 2265 of 2265 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyopenssl_25.3.0.bb:do_build)
NOTE: Tasks Summary: Attempted 2265 tasks of which 2232 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 44 ERROR messages, returning a non-zero exit code.
ERROR: python3-psutil-7.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-psutil-src went backwards which would break package feeds (from 0:7.1.3-r0 to 0:7.0.0-r0) [version-going-backwards]
ERROR: python3-psutil-7.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-psutil-dbg went backwards which would break package feeds (from 0:7.1.3-r0 to 0:7.0.0-r0) [version-going-backwards]
ERROR: python3-cffi-1.17.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cffi-src went backwards which would break package feeds (from 0:2.0.0-r0 to 0:1.17.1-r0) [version-going-backwards]
ERROR: python3-psutil-7.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-psutil-tests went backwards which would break package feeds (from 0:7.1.3-r0 to 0:7.0.0-r0) [version-going-backwards]
ERROR: python3-cffi-1.17.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cffi-dbg went backwards which would break package feeds (from 0:2.0.0-r0 to 0:1.17.1-r0) [version-going-backwards]
ERROR: python3-psutil-7.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-psutil-staticdev went backwards which would break package feeds (from 0:7.1.3-r0 to 0:7.0.0-r0) [version-going-backwards]
ERROR: python3-cffi-1.17.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cffi-ptest went backwards which would break package feeds (from 0:2.0.0-r0 to 0:1.17.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.142.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-src went backwards which would break package feeds (from 0:6.146.0-r0 to 0:6.142.2-r0) [version-going-backwards]
ERROR: python3-psutil-7.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-psutil-dev went backwards which would break package feeds (from 0:7.1.3-r0 to 0:7.0.0-r0) [version-going-backwards]
ERROR: python3-cffi-1.17.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cffi-staticdev went backwards which would break package feeds (from 0:2.0.0-r0 to 0:1.17.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.142.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-dbg went backwards which would break package feeds (from 0:6.146.0-r0 to 0:6.142.2-r0) [version-going-backwards]
ERROR: python3-psutil-7.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-psutil-doc went backwards which would break package feeds (from 0:7.1.3-r0 to 0:7.0.0-r0) [version-going-backwards]
ERROR: python3-cffi-1.17.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cffi-dev went backwards which would break package feeds (from 0:2.0.0-r0 to 0:1.17.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.142.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-ptest went backwards which would break package feeds (from 0:6.146.0-r0 to 0:6.142.2-r0) [version-going-backwards]
ERROR: python3-psutil-7.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-psutil-locale went backwards which would break package feeds (from 0:7.1.3-r0 to 0:7.0.0-r0) [version-going-backwards]
ERROR: python3-cffi-1.17.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cffi-doc went backwards which would break package feeds (from 0:2.0.0-r0 to 0:1.17.1-r0) [version-going-backwards]
ERROR: python3-psutil-7.0.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-psutil went backwards which would break package feeds (from 0:7.1.3-r0 to 0:7.0.0-r0) [version-going-backwards]
ERROR: python3-cffi-1.17.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cffi-locale went backwards which would break package feeds (from 0:2.0.0-r0 to 0:1.17.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.142.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-staticdev went backwards which would break package feeds (from 0:6.146.0-r0 to 0:6.142.2-r0) [version-going-backwards]
ERROR: python3-psutil-7.0.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: python3-hypothesis-6.142.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-dev went backwards which would break package feeds (from 0:6.146.0-r0 to 0:6.142.2-r0) [version-going-backwards]
ERROR: python3-cffi-1.17.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-cffi went backwards which would break package feeds (from 0:2.0.0-r0 to 0:1.17.1-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.142.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-doc went backwards which would break package feeds (from 0:6.146.0-r0 to 0:6.142.2-r0) [version-going-backwards]
ERROR: python3-cffi-1.17.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: python3-hypothesis-6.142.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis-locale went backwards which would break package feeds (from 0:6.146.0-r0 to 0:6.142.2-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.142.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-hypothesis went backwards which would break package feeds (from 0:6.146.0-r0 to 0:6.142.2-r0) [version-going-backwards]
ERROR: python3-hypothesis-6.142.2-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: python3-bcrypt-4.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-bcrypt-src went backwards which would break package feeds (from 0:5.0.0-r0 to 0:4.3.0-r0) [version-going-backwards]
ERROR: python3-bcrypt-4.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-bcrypt-dbg went backwards which would break package feeds (from 0:5.0.0-r0 to 0:4.3.0-r0) [version-going-backwards]
ERROR: python3-bcrypt-4.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-bcrypt-ptest went backwards which would break package feeds (from 0:5.0.0-r0 to 0:4.3.0-r0) [version-going-backwards]
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

--===============3444671858239691048==--

