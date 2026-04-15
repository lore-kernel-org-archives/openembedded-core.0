Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82465F43821
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 14:04:55 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19732.1776261871044280724
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 07:04:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=mfBKwBmq;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=bzMhxT3p;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019d9175623f-9eff28ae-4788-4b69-82c9-5f4c2172cd1c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1776261882;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=+/l2ofvaVUEb6A+UTkaYeROmLacOjo/Lmaiq+dxG2qc=;
	b=mfBKwBmqQ8WSgnimm4AKk8j8DKrkrRQ0n8sTksfQoDk9pcfaVaMOVplR0npimQCX
	qq2brRdsD/cl2xXFTG6ggYeZ3n+IBPjggnOu+Jt38PtBTcLpb9wFb20UxelCccX8llU
	UwBgm2Wv0Rzeop55CPa7pnRNTmj2cKMgcnBJXgVs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1776261882;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=+/l2ofvaVUEb6A+UTkaYeROmLacOjo/Lmaiq+dxG2qc=;
	b=bzMhxT3pmVTDhcOvsRktVWB4U0IvWLOxsWqzIx/Pz2VIhRoLlxp/sjLnL6y6/yDf
	lg/8VWEffDPKPEWxfDUqB8P3FpiB3JkJTf1Ec15g7APkSufjDHdEbYvhCjLl4Ue6y8S
	WLW59imlqA25f3V588UqzJC/4a7iCYk+I0WeBBa4=
Content-Type: multipart/mixed; boundary="===============3258259530281322807=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pytest: upgrading to 9.0.3 SUCCEEDED
Message-ID: <0101019d9175623f-9eff28ae-4788-4b69-82c9-5f4c2172cd1c-000000@us-west-2.amazonses.com>
Date: Wed, 15 Apr 2026 14:04:42 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.04.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 14:04:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235246

--===============3258259530281322807==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-pytest* to *9.0.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pytest-upgrade-9.0.2-9.0.3.patch
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
From d5e96dd6019644cfd29058bfc614500b62e9fe36 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Apr 2026 08:49:32 +0000
Subject: [PATCH] python3-pytest: upgrade 9.0.2 -> 9.0.3

---
 .../python/{python3-pytest_9.0.2.bb => python3-pytest_9.0.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pytest_9.0.2.bb => python3-pytest_9.0.3.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-pytest_9.0.2.bb b/meta/recipes-devtools/python/python3-pytest_9.0.3.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-pytest_9.0.2.bb
rename to meta/recipes-devtools/python/python3-pytest_9.0.3.bb
index 007db2e732..bec521d3ef 100644
--- a/meta/recipes-devtools/python/python3-pytest_9.0.2.bb
+++ b/meta/recipes-devtools/python/python3-pytest_9.0.3.bb
@@ -5,7 +5,7 @@ DESCRIPTION = "The pytest framework makes it easy to write small tests, yet scal
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bd27e41b6550fe0fc45356d1d81ee37c"
 
-SRC_URI[sha256sum] = "75186651a92bd89611d1d9fc20f0b4345fd827c41ccd5c299a868a05d70edf11"
+SRC_URI[sha256sum] = "b86ada508af81d19edeb213c681b1d48246c1a91d304c6c81a427674c17eb91c"
 
 DEPENDS += "python3-setuptools-scm-native"
 
-- 
2.47.1


--===============3258259530281322807==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pytest-upgrade-9.0.2-9.0.3.patch"

RnJvbSBkNWU5NmRkNjAxOTY0NGNmZDI5MDU4YmZjNjE0NTAwYjYyZTlmZTM2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgQXByIDIwMjYgMDg6NDk6MzIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXB5dGVzdDogdXBncmFkZSA5LjAuMiAtPiA5LjAuMwoKLS0tCiAuLi4vcHl0aG9uL3tw
eXRob24zLXB5dGVzdF85LjAuMi5iYiA9PiBweXRob24zLXB5dGVzdF85LjAuMy5iYn0gfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXB5dGVzdF85LjAuMi5iYiA9PiBw
eXRob24zLXB5dGVzdF85LjAuMy5iYn0gKDkxJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHl0ZXN0XzkuMC4yLmJiIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLXB5dGVzdF85LjAuMy5iYgpzaW1pbGFyaXR5IGluZGV4IDkx
JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHl0ZXN0
XzkuMC4yLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMt
cHl0ZXN0XzkuMC4zLmJiCmluZGV4IDAwN2RiMmU3MzIuLmJlYzUyMWQzZWYgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weXRlc3RfOS4wLjIuYmIKKysr
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5dGVzdF85LjAuMy5iYgpA
QCAtNSw3ICs1LDcgQEAgREVTQ1JJUFRJT04gPSAiVGhlIHB5dGVzdCBmcmFtZXdvcmsgbWFrZXMg
aXQgZWFzeSB0byB3cml0ZSBzbWFsbCB0ZXN0cywgeWV0IHNjYWwKIExJQ0VOU0UgPSAiTUlUIgog
TElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9YmQyN2U0MWI2NTUwZmUwZmM0
NTM1NmQxZDgxZWUzN2MiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI3NTE4NjY1MWE5MmJkODk2
MTFkMWQ5ZmMyMGYwYjQzNDVmZDgyN2M0MWNjZDVjMjk5YTg2OGEwNWQ3MGVkZjExIgorU1JDX1VS
SVtzaGEyNTZzdW1dID0gImI4NmFkYTUwOGFmODFkMTllZGViMjEzYzY4MWIxZDQ4MjQ2YzFhOTFk
MzA0YzZjODFhNDI3Njc0YzE3ZWI5MWMiCiAKIERFUEVORFMgKz0gInB5dGhvbjMtc2V0dXB0b29s
cy1zY20tbmF0aXZlIgogCi0tIAoyLjQ3LjEKCg==

--===============3258259530281322807==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 950 .bb files complete (0 cached, 950 parsed). 1971 targets, 62 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-musleabi"
MACHINE              = "qemuarm"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.3.99+snapshot-c3f2ae3b97ade8d37e7f89c7dc5c6cf0ceeb27cb"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
meta                 = "tmp-auh-upgrades:c3f2ae3b97ade8d37e7f89c7dc5c6cf0ceeb27cb"
meta-yocto-bsp       
meta-poky            = "master:49cbb01d52521bfe557395c9ebfae6b1c162581e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 513 Local 470 Mirrors 0 Missed 43 Current 307 (91% match, 94% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 309 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.19.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 321 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.4.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 322 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 325 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.19.2.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 335 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.19.2.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 338 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.4.bb:do_package_qa_setscene)
NOTE: Running setscene task 358 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.19.2.bb:do_package_qa_setscene)
NOTE: Running setscene task 366 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.4.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 394 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.0.3.bb:do_populate_lic_setscene)
NOTE: Running setscene task 409 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.19.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 425 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-colorama_0.4.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 433 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 438 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 444 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 449 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 454 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iniconfig_2.3.0.bb:do_packagedata_setscene)
NOTE: recipe python3-pygments-2.19.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pygments-2.19.2-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-pygments-2.19.2-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-pygments-2.19.2-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-pytest-9.0.3-r0: task do_populate_lic_setscene: Started
NOTE: recipe python3-pygments-2.19.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-colorama-0.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pluggy-1.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-packaging-26.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.14.4-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-3.14.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-3.14.4-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-3.14.4-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-pygments-2.19.2-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe python3-pygments-2.19.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-pygments-2.19.2-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-pytest-9.0.3-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe python3-pygments-2.19.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-pygments-2.19.2-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 457 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 461 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.19.2.bb:do_packagedata_setscene)
NOTE: recipe python3-3.14.4-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe python3-colorama-0.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 462 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-colorama_0.4.6.bb:do_package_setscene)
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pluggy-1.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-packaging-26.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pygments-2.19.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.14.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.14.4-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-3.14.4-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-3.14.4-r0: task do_package_write_rpm_setscene: Succeeded
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/python3-pygments/2.19.2/temp/log.do_packagedata_setscene.2633470
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.19.2.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 463 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 464 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.46.bb:do_packagedata_setscene)
NOTE: Running setscene task 465 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_15.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 467 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 468 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.0.bb:do_package_setscene)
NOTE: Running setscene task 469 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_package_setscene)
NOTE: Running setscene task 470 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 471 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.19.2.bb:do_package_setscene)
NOTE: Running setscene task 472 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 474 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iniconfig_2.3.0.bb:do_package_setscene)
NOTE: Running setscene task 475 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 476 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.46-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.10-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.14.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 486 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.4.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 494 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_spdx_setscene)
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 501 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 504 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.19.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 510 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.19.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.14.4-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe gcc-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 512 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe binutils-2.46-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 520 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.194.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 525 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_create_spdx_setscene)
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 529 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.14.4-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 545 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_recipe_spdx_setscene)
NOTE: recipe coreutils-9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe elfutils-0.194-r0: task do_packagedata_setscene: Started
NOTE: Running task 864 of 2055 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.0.3.bb:do_recipe_qa)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-colorama-0.4.6-r0: task do_package_setscene: Started
NOTE: recipe python3-packaging-26.0-r0: task do_package_setscene: Started
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_package_setscene: Started
NOTE: recipe python3-pygments-2.19.2-r0: task do_package_setscene: Started
NOTE: recipe python3-pluggy-1.6.0-r0: task do_package_setscene: Started
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pytest-9.0.3-r0: task do_recipe_qa: Started
NOTE: Running setscene task 556 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1036 of 2055 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 560 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe shadow-4.19.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 564 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe elfutils-0.194-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 567 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 574 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.18.bb:do_packagedata_setscene)
NOTE: Running setscene task 575 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 576 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 577 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: Running setscene task 578 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: Running setscene task 581 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.8.6-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytest-9.0.3-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1049 of 2055 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.0.3.bb:do_fetch)
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 1051 of 2055 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1056 of 2055 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 590 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_recipe_spdx_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-colorama-0.4.6-r0: task do_package_setscene: Succeeded
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_package_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 594 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-colorama_0.4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 598 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iniconfig_2.3.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pytest-9.0.3-r0: task do_fetch: Started
NOTE: Running setscene task 599 of 820 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-hatch-vcs_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: Running setscene task 602 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 604 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.19.0.bb:do_packagedata_setscene)
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libarchive-3.8.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 609 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.12.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 611 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.47.bb:do_packagedata_setscene)
NOTE: Running setscene task 621 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: recipe python3-pytest-9.0.3-r0: task do_fetch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pluggy-1.6.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 622 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-packaging-26.0-r0: task do_package_setscene: Succeeded
NOTE: Running task 1094 of 2055 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.0.3.bb:do_unpack)
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 623 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-colorama-0.4.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe file-5.47-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.12.1-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.19.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-hatch-vcs-native-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1102 of 2055 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe python3-pluggy-1.6.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-pytest-9.0.3-r0: task do_unpack: Started
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe python3-packaging-26.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-colorama-0.4.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 638 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-colorama_0.4.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 639 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iniconfig_2.3.0.bb:do_recipe_qa_setscene)
NOTE: Running task 1225 of 2055 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.0.3.bb:do_create_recipe_spdx)
NOTE: Running task 1226 of 2055 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_create_recipe_spdx)
NOTE: Running task 1227 of 2055 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.0.bb:do_create_recipe_spdx)
NOTE: recipe python3-pluggy-1.6.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: Running setscene task 640 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-pytest-9.0.3-r0: task do_unpack: Succeeded
NOTE: recipe file-5.47-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-packaging-26.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1228 of 2055 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.0.3.bb:do_patch)
NOTE: Running setscene task 642 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 644 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_packagedata_setscene)
NOTE: recipe libgcrypt-1.12.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 649 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.77.bb:do_packagedata_setscene)
NOTE: recipe curl-8.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-hatch-vcs-native-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 655 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.59.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: Running task 1248 of 2055 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe python3-colorama-0.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1256 of 2055 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-colorama_0.4.6.bb:do_create_recipe_spdx)
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 659 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: recipe python3-pygments-2.19.2-r0: task do_package_setscene: Succeeded
NOTE: recipe python3-pytest-9.0.3-r0: task do_create_recipe_spdx: Started
NOTE: recipe python3-pluggy-1.6.0-r0: task do_create_recipe_spdx: Started
NOTE: Running setscene task 661 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.4.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-packaging-26.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe python3-pluggy-1.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe lzlib-1.16-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytest-9.0.3-r0: task do_patch: Started
NOTE: recipe libcap-2.77-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-packaging-26.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gnutls-3.8.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 665 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.4.bb:do_packagedata_setscene)
NOTE: recipe python3-colorama-0.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 667 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.19.2.bb:do_recipe_qa_setscene)
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgpg-error-1.59-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 668 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe python3-colorama-0.4.6-r0: task do_create_recipe_spdx: Started
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pluggy-1.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 669 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_packagedata_setscene)
NOTE: recipe python3-packaging-26.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 672 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_3.10.2.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: recipe python3-pytest-9.0.3-r0: task do_patch: Succeeded
NOTE: recipe python3-3.14.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 673 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_packagedata_setscene)
NOTE: recipe lzlib-1.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pygments-2.19.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-2.77-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Started
NOTE: Running task 1269 of 2055 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_fetch)
NOTE: Running setscene task 683 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.2.bb:do_packagedata_setscene)
NOTE: Running task 1275 of 2055 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.0.bb:do_fetch)
NOTE: recipe python3-3.14.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.10.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pygments-2.19.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-pytest-9.0.3-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1284 of 2055 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-colorama_0.4.6.bb:do_fetch)
NOTE: recipe libtasn1-4.21.0-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1285 of 2055 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iniconfig_2.3.0.bb:do_fetch)
NOTE: Running task 1294 of 2055 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.0.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libgpg-error-1.59-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pluggy-1.6.0-r0: task do_fetch: Started
NOTE: recipe python3-packaging-26.0-r0: task do_fetch: Started
NOTE: Running task 1300 of 2055 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe libpam-1.7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pluggy-1.6.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-packaging-26.0-r0: task do_fetch: Succeeded
NOTE: Running task 1301 of 2055 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_unpack)
NOTE: Running task 1302 of 2055 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.0.bb:do_unpack)
NOTE: recipe python3-colorama-0.4.6-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running task 1304 of 2055 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iniconfig_2.3.0.bb:do_create_recipe_spdx)
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-colorama-0.4.6-r0: task do_fetch: Started
NOTE: recipe nettle-3.10.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_fetch: Started
NOTE: Running setscene task 698 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe python3-pytest-9.0.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe python3-colorama-0.4.6-r0: task do_fetch: Succeeded
NOTE: recipe libtasn1-4.21.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_fetch: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1322 of 2055 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-colorama_0.4.6.bb:do_unpack)
NOTE: Running setscene task 703 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_packagedata_setscene)
NOTE: Running task 1328 of 2055 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iniconfig_2.3.0.bb:do_unpack)
NOTE: recipe python3-pluggy-1.6.0-r0: task do_unpack: Started
NOTE: recipe python3-packaging-26.0-r0: task do_unpack: Started
NOTE: recipe python3-pluggy-1.6.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: recipe python3-packaging-26.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe python3-pluggy-1.6.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_create_recipe_spdx: Started
NOTE: Running task 1329 of 2055 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 1330 of 2055 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_patch)
NOTE: recipe python3-packaging-26.0-r0: task do_unpack: Succeeded
NOTE: Running task 1331 of 2055 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.0.bb:do_patch)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-1.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-colorama-0.4.6-r0: task do_unpack: Started
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_unpack: Started
NOTE: recipe python3-colorama-0.4.6-r0: task do_unpack: Succeeded
NOTE: Running task 1332 of 2055 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-colorama_0.4.6.bb:do_patch)
NOTE: recipe python3-3.14.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_unpack: Succeeded
NOTE: Running task 1333 of 2055 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iniconfig_2.3.0.bb:do_patch)
NOTE: recipe python3-pluggy-1.6.0-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe python3-3.14.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 708 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 709 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 711 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 712 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 713 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 714 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-packaging-26.0-r0: task do_patch: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 715 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_packagedata_setscene)
NOTE: recipe libunistring-1.4.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 716 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_packagedata_setscene)
NOTE: recipe python3-colorama-0.4.6-r0: task do_patch: Started
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_patch: Started
NOTE: recipe python3-pluggy-1.6.0-r0: task do_patch: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 717 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.4.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-packaging-26.0-r0: task do_patch: Succeeded
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running setscene task 718 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_packagedata_setscene)
NOTE: Running setscene task 719 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-colorama-0.4.6-r0: task do_patch: Succeeded
NOTE: Running setscene task 720 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.5.bb:do_packagedata_setscene)
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_patch: Succeeded
NOTE: Running setscene task 721 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 722 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.6.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.14.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 723 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 724 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 725 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.5.bb:do_populate_sysroot_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 726 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.3.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 727 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 728 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_packagedata_setscene)
NOTE: recipe libedit-20251016-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 729 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.6.bb:do_packagedata_setscene)
NOTE: recipe expat-2.7.5-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.14.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 730 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: recipe libpam-1.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.5.6-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 731 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.51.3-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.51.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.7.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.5.6-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: Running setscene task 736 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 743 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.7.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 748 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 750 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 754 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.51.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 755 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 759 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.51.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.7.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1360 of 2055 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 761 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 763 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.5.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20251016-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.5.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 767 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_recipe_qa_setscene)
NOTE: recipe python3-pytest-9.0.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe openssl-3.5.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 769 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 772 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 775 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.51.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.7.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 778 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 779 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 780 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.5.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.51.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.7.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.5.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 785 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 786 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 788 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 790 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 791 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 792 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_recipe_qa_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 795 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 797 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 798 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_packagedata_setscene)
NOTE: Running setscene task 799 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 800 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 802 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 807 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 810 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 811 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 812 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 816 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 818 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 820 of 820 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1762 of 2055 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1763 of 2055 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1827 of 2055 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.0.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1845 of 2055 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-colorama_0.4.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1846 of 2055 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iniconfig_2.3.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1872 of 2055 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.19.2.bb:do_packagedata)
NOTE: recipe python3-pluggy-1.6.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-packaging-26.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pytest-9.0.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-colorama-0.4.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pygments-2.19.2-r0: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 1981 of 2055 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe python3-pygments-2.19.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-packaging-26.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pluggy-1.6.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1987 of 2055 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.0.bb:do_configure)
NOTE: Running task 1988 of 2055 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_configure)
NOTE: recipe python3-pytest-9.0.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 27a1287f03f8699e6a83b8e7203f6b85f617ccd1b7f11fa183cd486905f39fba
NOTE: Running task 1995 of 2055 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.0.3.bb:do_configure)
NOTE: recipe python3-colorama-0.4.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-packaging-26.0-r0: task do_configure: Started
NOTE: Running task 1996 of 2055 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-colorama_0.4.6.bb:do_configure)
NOTE: recipe python3-pluggy-1.6.0-r0: task do_configure: Started
NOTE: Running task 1997 of 2055 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iniconfig_2.3.0.bb:do_configure)
NOTE: recipe python3-pytest-9.0.3-r0: task do_configure: Started
NOTE: recipe python3-packaging-26.0-r0: task do_configure: Succeeded
NOTE: recipe python3-colorama-0.4.6-r0: task do_configure: Started
NOTE: recipe python3-pluggy-1.6.0-r0: task do_configure: Succeeded
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_configure: Started
NOTE: Running task 1998 of 2055 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.0.bb:do_configure_ptest_base)
NOTE: Running task 1999 of 2055 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_configure_ptest_base)
NOTE: recipe python3-pytest-9.0.3-r0: task do_configure: Succeeded
NOTE: Running task 2000 of 2055 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.0.3.bb:do_compile)
NOTE: recipe python3-colorama-0.4.6-r0: task do_configure: Succeeded
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_configure: Succeeded
NOTE: recipe python3-packaging-26.0-r0: task do_configure_ptest_base: Started
NOTE: Running task 2001 of 2055 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iniconfig_2.3.0.bb:do_compile)
NOTE: recipe python3-pluggy-1.6.0-r0: task do_configure_ptest_base: Started
NOTE: Running task 2002 of 2055 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-colorama_0.4.6.bb:do_compile)
NOTE: recipe python3-packaging-26.0-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-pytest-9.0.3-r0: task do_compile: Started
NOTE: recipe python3-pluggy-1.6.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2003 of 2055 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.0.bb:do_compile)
NOTE: Running task 2004 of 2055 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_compile)
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_compile: Started
NOTE: recipe python3-colorama-0.4.6-r0: task do_compile: Started
NOTE: recipe python3-packaging-26.0-r0: task do_compile: Started
NOTE: recipe python3-pluggy-1.6.0-r0: task do_compile: Started
NOTE: recipe python3-colorama-0.4.6-r0: task do_compile: Succeeded
NOTE: Running task 2005 of 2055 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-colorama_0.4.6.bb:do_install)
NOTE: recipe python3-packaging-26.0-r0: task do_compile: Succeeded
NOTE: Running task 2006 of 2055 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.0.bb:do_compile_ptest_base)
NOTE: recipe python3-colorama-0.4.6-r0: task do_install: Started
NOTE: recipe python3-packaging-26.0-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-packaging-26.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2007 of 2055 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.0.bb:do_install)
NOTE: recipe python3-packaging-26.0-r0: task do_install: Started
NOTE: recipe python3-colorama-0.4.6-r0: task do_install: Succeeded
NOTE: Running task 2010 of 2055 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-colorama_0.4.6.bb:do_populate_sysroot)
NOTE: Running task 2011 of 2055 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-colorama_0.4.6.bb:do_package_write_ipk)
NOTE: Running task 2012 of 2055 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-colorama_0.4.6.bb:do_package_write_deb)
NOTE: Running task 2013 of 2055 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-colorama_0.4.6.bb:do_package_write_rpm)
NOTE: Running task 2014 of 2055 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-colorama_0.4.6.bb:do_package_qa)
NOTE: recipe python3-colorama-0.4.6-r0: task do_populate_sysroot: Started
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_compile: Succeeded
NOTE: recipe python3-colorama-0.4.6-r0: task do_package_write_ipk: Started
NOTE: recipe python3-colorama-0.4.6-r0: task do_package_write_deb: Started
NOTE: Running task 2015 of 2055 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iniconfig_2.3.0.bb:do_install)
NOTE: recipe python3-colorama-0.4.6-r0: task do_package_write_rpm: Started
NOTE: recipe python3-colorama-0.4.6-r0: task do_package_qa: Started
NOTE: recipe python3-pytest-9.0.3-r0: task do_compile: Succeeded
NOTE: Running task 2016 of 2055 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.0.3.bb:do_install)
NOTE: recipe python3-pluggy-1.6.0-r0: task do_compile: Succeeded
NOTE: Running task 2017 of 2055 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_compile_ptest_base)
NOTE: recipe python3-packaging-26.0-r0: task do_install: Succeeded
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_install: Started
NOTE: Running task 2018 of 2055 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.0.bb:do_install_ptest_base)
NOTE: recipe python3-pytest-9.0.3-r0: task do_install: Started
NOTE: recipe python3-pluggy-1.6.0-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-pluggy-1.6.0-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe python3-packaging-26.0-r0: task do_install_ptest_base: Started
NOTE: Running task 2019 of 2055 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_install)
NOTE: recipe python3-packaging-26.0-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-colorama-0.4.6-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2020 of 2055 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-colorama_0.4.6.bb:do_create_spdx)
NOTE: recipe python3-pluggy-1.6.0-r0: task do_install: Started
NOTE: Running task 2023 of 2055 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.0.bb:do_populate_sysroot)
NOTE: recipe python3-colorama-0.4.6-r0: task do_package_qa: Succeeded
NOTE: recipe python3-colorama-0.4.6-r0: task do_create_spdx: Started
NOTE: recipe python3-colorama-0.4.6-r0: task do_package_write_ipk: Succeeded
NOTE: recipe python3-packaging-26.0-r0: task do_populate_sysroot: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-colorama_0.4.6.bb:do_package_qa unihash changed to 3944e7f398d84046db0561d2708237eb6743daa09b216278748ce2d610d3c3a8
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_install: Succeeded
NOTE: Running task 2026 of 2055 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iniconfig_2.3.0.bb:do_populate_sysroot)
NOTE: Running task 2027 of 2055 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iniconfig_2.3.0.bb:do_package_write_ipk)
NOTE: Running task 2028 of 2055 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iniconfig_2.3.0.bb:do_package_write_deb)
NOTE: Running task 2029 of 2055 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iniconfig_2.3.0.bb:do_package_write_rpm)
NOTE: recipe python3-colorama-0.4.6-r0: task do_package_write_deb: Succeeded
NOTE: Running task 2030 of 2055 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iniconfig_2.3.0.bb:do_package_qa)
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_package_write_ipk: Started
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_package_write_deb: Started
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_package_qa: Started
NOTE: recipe python3-pluggy-1.6.0-r0: task do_install: Succeeded
NOTE: Running task 2031 of 2055 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_install_ptest_base)
NOTE: recipe python3-colorama-0.4.6-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-packaging-26.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-colorama-0.4.6-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.0.bb:do_populate_sysroot unihash changed to bc13cfe7ae8515a1b1ee53c039314c4450cd45afe2564efac4a4473a256bf3cb
NOTE: Setscene tasks completed
NOTE: Running task 2032 of 2055 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.0.bb:do_create_spdx)
NOTE: recipe python3-pluggy-1.6.0-r0: task do_install_ptest_base: Started
NOTE: recipe python3-pytest-9.0.3-r0: task do_install: Succeeded
NOTE: Running task 2033 of 2055 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.0.3.bb:do_package)
NOTE: recipe python3-packaging-26.0-r0: task do_create_spdx: Started
NOTE: Running task 2034 of 2055 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.0.3.bb:do_populate_sysroot)
NOTE: recipe python3-pluggy-1.6.0-r0: task do_install_ptest_base: Succeeded
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2037 of 2055 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_populate_sysroot)
NOTE: Running task 2038 of 2055 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iniconfig_2.3.0.bb:do_create_spdx)
NOTE: recipe python3-pytest-9.0.3-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pytest-9.0.3-r0: task do_package: Started
NOTE: recipe python3-pluggy-1.6.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_create_spdx: Started
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_package_write_ipk: Succeeded
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_package_write_deb: Succeeded
NOTE: recipe python3-packaging-26.0-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iniconfig_2.3.0.bb:do_package_qa unihash changed to 2402c1aa3e77d90fe47c94591790b48c90409a326153423529fcaeec8f1fc1be
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pluggy-1.6.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2039 of 2055 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_create_spdx)
NOTE: recipe python3-pytest-9.0.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-pluggy-1.6.0-r0: task do_create_spdx: Started
NOTE: recipe python3-pluggy-1.6.0-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-pytest-9.0.3-r0: task do_package: Succeeded
NOTE: Running task 2040 of 2055 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.0.3.bb:do_packagedata)
NOTE: recipe python3-pytest-9.0.3-r0: task do_packagedata: Started
NOTE: recipe python3-pytest-9.0.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2041 of 2055 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.0.3.bb:do_create_spdx)
NOTE: Running task 2042 of 2055 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_package_write_ipk)
NOTE: Running task 2043 of 2055 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_package_write_deb)
NOTE: Running task 2044 of 2055 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_package_write_rpm)
NOTE: Running task 2045 of 2055 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_package_qa)
NOTE: Running task 2046 of 2055 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.0.bb:do_package_write_ipk)
NOTE: Running task 2047 of 2055 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.0.bb:do_package_write_deb)
NOTE: Running task 2048 of 2055 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.0.bb:do_package_write_rpm)
NOTE: recipe python3-pytest-9.0.3-r0: task do_create_spdx: Started
NOTE: Running task 2049 of 2055 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.0.bb:do_package_qa)
NOTE: Running task 2050 of 2055 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.0.3.bb:do_package_write_ipk)
NOTE: recipe python3-pluggy-1.6.0-r0: task do_package_write_ipk: Started
NOTE: Running task 2051 of 2055 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.0.3.bb:do_package_write_deb)
NOTE: recipe python3-pluggy-1.6.0-r0: task do_package_write_deb: Started
NOTE: Running task 2052 of 2055 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.0.3.bb:do_package_write_rpm)
NOTE: recipe python3-pluggy-1.6.0-r0: task do_package_write_rpm: Started
NOTE: Running task 2053 of 2055 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.0.3.bb:do_package_qa)
NOTE: recipe python3-pluggy-1.6.0-r0: task do_package_qa: Started
NOTE: recipe python3-packaging-26.0-r0: task do_package_write_ipk: Started
NOTE: recipe python3-packaging-26.0-r0: task do_package_write_deb: Started
NOTE: recipe python3-packaging-26.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-packaging-26.0-r0: task do_package_qa: Started
NOTE: recipe python3-pytest-9.0.3-r0: task do_package_write_ipk: Started
NOTE: recipe python3-pytest-9.0.3-r0: task do_package_write_deb: Started
NOTE: recipe python3-pytest-9.0.3-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pytest-9.0.3-r0: task do_package_qa: Started
NOTE: recipe python3-pytest-9.0.3-r0: task do_create_spdx: Succeeded
NOTE: Running task 2054 of 2055 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.0.3.bb:do_create_package_spdx)
NOTE: recipe python3-pytest-9.0.3-r0: task do_create_package_spdx: Started
NOTE: recipe python3-packaging-26.0-r0: task do_package_write_ipk: Succeeded
NOTE: recipe python3-pluggy-1.6.0-r0: task do_package_write_ipk: Succeeded
NOTE: recipe python3-pluggy-1.6.0-r0: task do_package_write_deb: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.0.bb:do_package_write_ipk unihash changed to a976efb0ef3ed8fd2ee206e579cfa38b8212bfa31908dda853d76f1f1b17c101
NOTE: recipe python3-pytest-9.0.3-r0: task do_package_write_ipk: Succeeded
NOTE: recipe python3-pluggy-1.6.0-r0: task do_package_qa: Succeeded
NOTE: recipe python3-pytest-9.0.3-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_package_qa unihash changed to 07b529ca4d91be9a77515594dd9ad534fe641c80adae191e0af79fbd0c21e58b
NOTE: recipe python3-packaging-26.0-r0: task do_package_write_deb: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.0.bb:do_package_write_deb unihash changed to 8193057ab8c6d4fedc9643728c1cc9396f0d03290dec125e50f265d73ef37b90
NOTE: recipe python3-packaging-26.0-r0: task do_package_qa: Succeeded
NOTE: recipe python3-pluggy-1.6.0-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.0.bb:do_package_qa unihash changed to 408707789bde09e06080c5c295523d4ca9ca98e6846439d9f0d9c95f3e7ea282
NOTE: recipe python3-packaging-26.0-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.0.bb:do_package_write_rpm unihash changed to 7199c59393add2c2648449afa7898d0b18b51f9d779de068095acf29441998d1
NOTE: recipe python3-pytest-9.0.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pytest-9.0.3-r0: task do_create_package_spdx: Succeeded
NOTE: recipe python3-pytest-9.0.3-r0: task do_package_write_deb: Succeeded
NOTE: Running noexec task 2055 of 2055 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.0.3.bb:do_build)
NOTE: Tasks Summary: Attempted 2055 tasks of which 1963 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: python3-pygments-2.19.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pygments-src went backwards which would break package feeds (from 0:2.20.0-r0 to 0:2.19.2-r0) [version-going-backwards]
ERROR: python3-pygments-2.19.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pygments-dbg went backwards which would break package feeds (from 0:2.20.0-r0 to 0:2.19.2-r0) [version-going-backwards]
ERROR: python3-pygments-2.19.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pygments-staticdev went backwards which would break package feeds (from 0:2.20.0-r0 to 0:2.19.2-r0) [version-going-backwards]
ERROR: python3-pygments-2.19.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pygments-dev went backwards which would break package feeds (from 0:2.20.0-r0 to 0:2.19.2-r0) [version-going-backwards]
ERROR: python3-pygments-2.19.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pygments-doc went backwards which would break package feeds (from 0:2.20.0-r0 to 0:2.19.2-r0) [version-going-backwards]
ERROR: python3-pygments-2.19.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pygments-locale went backwards which would break package feeds (from 0:2.20.0-r0 to 0:2.19.2-r0) [version-going-backwards]
ERROR: python3-pygments-2.19.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pygments went backwards which would break package feeds (from 0:2.20.0-r0 to 0:2.19.2-r0) [version-going-backwards]
ERROR: python3-pygments-2.19.2-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============3258259530281322807==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-pytest/python3-pytest: FILELIST: directory renamed /usr/lib/python3.14/site-packages/pytest-9.0.2.dist-info/licenses -> /usr/lib/python3.14/site-packages/pytest-9.0.3.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/pytest-9.0.2.dist-info -> /usr/lib/python3.14/site-packages/pytest-9.0.3.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-pytest (sysroot):
  /usr/lib/python3.14/site-packages/pytest-9.0.2.dist-info moved to /usr/lib/python3.14/site-packages/pytest-9.0.3.dist-info

--===============3258259530281322807==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-pytest: PV changed from "9.0.2" to "9.0.3"
packages/x86-64-v3-poky-linux/python3-pytest: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pytest/pytest-9.0.2.tar.gz;downloadfilename=pytest-9.0.2.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pytest/pytest-9.0.3.tar.gz;downloadfilename=pytest-9.0.3.tar.gz"
packages/x86-64-v3-poky-linux/python3-pytest: PKGV changed from 9.0.2 [default] to 9.0.3 [default]
packages/x86-64-v3-poky-linux/python3-pytest/python3-pytest-dbg: PV changed from "9.0.2" to "9.0.3"
packages/x86-64-v3-poky-linux/python3-pytest/python3-pytest-dbg: PKGV changed from 9.0.2 [default] to 9.0.3 [default]
packages/x86-64-v3-poky-linux/python3-pytest/python3-pytest-dev: PV changed from "9.0.2" to "9.0.3"
packages/x86-64-v3-poky-linux/python3-pytest/python3-pytest-dev: PKGV changed from 9.0.2 [default] to 9.0.3 [default]
packages/x86-64-v3-poky-linux/python3-pytest/python3-pytest-doc: PV changed from "9.0.2" to "9.0.3"
packages/x86-64-v3-poky-linux/python3-pytest/python3-pytest-doc: PKGV changed from 9.0.2 [default] to 9.0.3 [default]
packages/x86-64-v3-poky-linux/python3-pytest/python3-pytest-locale: PV changed from "9.0.2" to "9.0.3"
packages/x86-64-v3-poky-linux/python3-pytest/python3-pytest-locale: PKGV changed from 9.0.2 [default] to 9.0.3 [default]
packages/x86-64-v3-poky-linux/python3-pytest/python3-pytest-src: PV changed from "9.0.2" to "9.0.3"
packages/x86-64-v3-poky-linux/python3-pytest/python3-pytest-src: PKGV changed from 9.0.2 [default] to 9.0.3 [default]
packages/x86-64-v3-poky-linux/python3-pytest/python3-pytest-staticdev: PV changed from "9.0.2" to "9.0.3"
packages/x86-64-v3-poky-linux/python3-pytest/python3-pytest-staticdev: PKGV changed from 9.0.2 [default] to 9.0.3 [default]
packages/x86-64-v3-poky-linux/python3-pytest/python3-pytest: PV changed from "9.0.2" to "9.0.3"
packages/x86-64-v3-poky-linux/python3-pytest/python3-pytest: PKGSIZE changed from 3211181 to 3214023 (+0%)
packages/x86-64-v3-poky-linux/python3-pytest/python3-pytest: FILELIST: directory renamed /usr/lib/python3.14/site-packages/pytest-9.0.2.dist-info/licenses -> /usr/lib/python3.14/site-packages/pytest-9.0.3.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/pytest-9.0.2.dist-info -> /usr/lib/python3.14/site-packages/pytest-9.0.3.dist-info
packages/x86-64-v3-poky-linux/python3-pytest/python3-pytest: PKGV changed from 9.0.2 [default] to 9.0.3 [default]
Changes to packages/x86-64-v3-poky-linux/python3-pytest (sysroot):
  /usr/lib/python3.14/site-packages/pytest-9.0.2.dist-info moved to /usr/lib/python3.14/site-packages/pytest-9.0.3.dist-info

--===============3258259530281322807==--

