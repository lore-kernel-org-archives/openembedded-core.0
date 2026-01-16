Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13E74D47CAE
	for <webhook@archiver.kernel.org>; Fri, 16 Jan 2026 01:25:52 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1472.1768526746499768659
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jan 2026 17:25:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=ek2Khfqw;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=cXphO2HZ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019bc468a6bf-2bcbc513-5300-4587-bf1b-3587908af415-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1768526751;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=A5kC6YgQJKztgFe4G9klXHwCizYShTMMG+k9res8vA4=;
	b=ek2KhfqwcIQAsm1+doyuzFP/PfjkD0Ukm2/aaUab3+2Hzc7VK5YWWfu3MtKsKFlY
	ZnguAleBzVC62PHyCodT6UA5DyZZ3ACT9YLgnN/jAo1VQkYJUnuXryq7dOdYX7c7D9R
	Wpr6dJ8vkGzbDFQ7x/qu6VChfgrXM6pN3doPgtik=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1768526751;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=A5kC6YgQJKztgFe4G9klXHwCizYShTMMG+k9res8vA4=;
	b=cXphO2HZdDWMaxrM/QElHeXWZfRaEjstayyjEwAIjtyHoZ4KP72pVhRHLlgNmYkK
	8D4hu7wxfj8wmiZyNpjS5a3BYg8MFTyNuJIgTSQJCBmKqy0WhU2b5OLVsEkbSOiU56z
	kY0HqENx3tP4UCc5Y0ZijBCNR2Xgn2/86UgmKrs4=
Content-Type: multipart/mixed; boundary="===============3573817538627930558=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-yamllint: upgrading to 1.38.0 SUCCEEDED
Message-ID: <0101019bc468a6bf-2bcbc513-5300-4587-bf1b-3587908af415-000000@us-west-2.amazonses.com>
Date: Fri, 16 Jan 2026 01:25:51 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.01.16-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jan 2026 01:25:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229478

--===============3573817538627930558==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-yamllint* to *1.38.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-yamllint-upgrade-1.37.1-1.38.0.patch
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
From f071948d62c25e6fc21606516d5bd01dc871fce8 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Jan 2026 22:11:06 +0000
Subject: [PATCH] python3-yamllint: upgrade 1.37.1 -> 1.38.0

---
 .../{python3-yamllint_1.37.1.bb => python3-yamllint_1.38.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-yamllint_1.37.1.bb => python3-yamllint_1.38.0.bb} (79%)

diff --git a/meta/recipes-devtools/python/python3-yamllint_1.37.1.bb b/meta/recipes-devtools/python/python3-yamllint_1.38.0.bb
similarity index 79%
rename from meta/recipes-devtools/python/python3-yamllint_1.37.1.bb
rename to meta/recipes-devtools/python/python3-yamllint_1.38.0.bb
index 1b0ddde873..c2f32eef63 100644
--- a/meta/recipes-devtools/python/python3-yamllint_1.37.1.bb
+++ b/meta/recipes-devtools/python/python3-yamllint_1.38.0.bb
@@ -7,7 +7,7 @@ inherit pypi python_setuptools_build_meta
 
 PYPI_PACKAGE = "yamllint"
 
-SRC_URI[sha256sum] = "81f7c0c5559becc8049470d86046b36e96113637bcbe4753ecef06977c00245d"
+SRC_URI[sha256sum] = "09e5f29531daab93366bb061e76019d5e91691ef0a40328f04c927387d1d364d"
 
 RDEPENDS:${PN} += "python3-pathspec python3-pyyaml"
 
-- 
2.47.1


--===============3573817538627930558==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-yamllint-upgrade-1.37.1-1.38.0.patch"

RnJvbSBmMDcxOTQ4ZDYyYzI1ZTZmYzIxNjA2NTE2ZDViZDAxZGM4NzFmY2U4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgSmFuIDIwMjYgMjI6MTE6MDYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXlhbWxsaW50OiB1cGdyYWRlIDEuMzcuMSAtPiAxLjM4LjAKCi0tLQogLi4uL3tweXRo
b24zLXlhbWxsaW50XzEuMzcuMS5iYiA9PiBweXRob24zLXlhbWxsaW50XzEuMzguMC5iYn0gIHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5h
bWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy15YW1sbGludF8xLjM3LjEu
YmIgPT4gcHl0aG9uMy15YW1sbGludF8xLjM4LjAuYmJ9ICg3OSUpCgpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXlhbWxsaW50XzEuMzcuMS5iYiBiL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy15YW1sbGludF8xLjM4LjAuYmIKc2lt
aWxhcml0eSBpbmRleCA3OSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLXlhbWxsaW50XzEuMzcuMS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLXlhbWxsaW50XzEuMzguMC5iYgppbmRleCAxYjBkZGRlODczLi5j
MmYzMmVlZjYzIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMteWFtbGxpbnRfMS4zNy4xLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy15YW1sbGludF8xLjM4LjAuYmIKQEAgLTcsNyArNyw3IEBAIGluaGVyaXQgcHlwaSBw
eXRob25fc2V0dXB0b29sc19idWlsZF9tZXRhCiAKIFBZUElfUEFDS0FHRSA9ICJ5YW1sbGludCIK
IAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjgxZjdjMGM1NTU5YmVjYzgwNDk0NzBkODYwNDZiMzZl
OTYxMTM2MzdiY2JlNDc1M2VjZWYwNjk3N2MwMDI0NWQiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAi
MDllNWYyOTUzMWRhYWI5MzM2NmJiMDYxZTc2MDE5ZDVlOTE2OTFlZjBhNDAzMjhmMDRjOTI3Mzg3
ZDFkMzY0ZCIKIAogUkRFUEVORFM6JHtQTn0gKz0gInB5dGhvbjMtcGF0aHNwZWMgcHl0aG9uMy1w
eXlhbWwiCiAKLS0gCjIuNDcuMQoK

--===============3573817538627930558==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 951 .bb files complete (0 cached, 951 parsed). 1956 targets, 71 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-musleabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "5.3.99+snapshot-3a074de609a94a9cdcaa5fdf4d112ca5912a6b4e"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 = "tmp-auh-upgrades:3a074de609a94a9cdcaa5fdf4d112ca5912a6b4e"
meta-yocto-bsp       
meta-poky            = "master:c23c19e0b300812bad314f1d0a901965315271ae"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 432 Local 401 Mirrors 0 Missed 31 Current 252 (92% match, 95% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 256 of 684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.11.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 279 of 684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.11.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 281 of 684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.11.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 321 of 684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.11.bb:do_package_qa_setscene)
NOTE: Running setscene task 325 of 684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-yamllint_1.38.0.bb:do_populate_lic_setscene)
NOTE: Running setscene task 349 of 684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.0.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 353 of 684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 355 of 684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pathspec_0.12.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 356 of 684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.11.bb:do_create_spdx_setscene)
NOTE: Running setscene task 363 of 684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyyaml_6.0.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 364 of 684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 365 of 684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-yamllint_1.38.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-yamllint-1.38.0-r0: task do_populate_lic_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pathspec-0.12.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-pytest-9.0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libyaml-0.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-yamllint-1.38.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-pyyaml-6.0.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-3.13.11-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-3.13.11-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-3.13.11-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-3.13.11-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-3.13.11-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pathspec-0.12.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-yamllint-1.38.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 367 of 684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pathspec_0.12.1.bb:do_recipe_qa_setscene)
NOTE: recipe python3-yamllint-1.38.0-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 368 of 684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-yamllint_1.38.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-pyyaml-6.0.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 369 of 684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyyaml_6.0.3.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.13.11-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pytest-9.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 376 of 684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-3.13.11-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 380 of 684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 389 of 684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_create_spdx_setscene)
NOTE: recipe python3-yamllint-1.38.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-pyyaml-6.0.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-pathspec-0.12.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libyaml-0.2.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.13.11-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-yamllint-1.38.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-pyyaml-6.0.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1019 of 1931 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyyaml_6.0.3.bb:do_fetch)
NOTE: Running task 1020 of 1931 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-yamllint_1.38.0.bb:do_fetch)
NOTE: recipe python3-pathspec-0.12.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.13.11-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running task 1022 of 1931 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pathspec_0.12.1.bb:do_fetch)
NOTE: recipe python3-3.13.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 391 of 684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 392 of 684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 393 of 684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 394 of 684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 395 of 684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 396 of 684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 397 of 684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.45.bb:do_packagedata_setscene)
NOTE: Running setscene task 398 of 684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_15.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 399 of 684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_packagedata_setscene)
NOTE: recipe python3-3.13.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libyaml-0.2.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 400 of 684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 401 of 684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_create_spdx_setscene)
NOTE: recipe python3-yamllint-1.38.0-r0: task do_fetch: Started
NOTE: recipe python3-pyyaml-6.0.3-r0: task do_fetch: Started
NOTE: recipe python3-pathspec-0.12.1-r0: task do_fetch: Started
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-yamllint-1.38.0-r0: task do_fetch: Succeeded
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pyyaml-6.0.3-r0: task do_fetch: Succeeded
NOTE: recipe python3-pathspec-0.12.1-r0: task do_fetch: Succeeded
NOTE: Running task 1023 of 1931 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-yamllint_1.38.0.bb:do_unpack)
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: Running task 1024 of 1931 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyyaml_6.0.3.bb:do_unpack)
NOTE: Running task 1025 of 1931 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pathspec_0.12.1.bb:do_unpack)
NOTE: recipe gcc-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.9-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.45.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libyaml-0.2.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.13.11-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libyaml-0.2.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1027 of 1931 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_fetch)
NOTE: recipe python3-yamllint-1.38.0-r0: task do_unpack: Started
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pathspec-0.12.1-r0: task do_unpack: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pyyaml-6.0.3-r0: task do_unpack: Started
NOTE: Running setscene task 406 of 684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 414 of 684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 416 of 684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-pathspec-0.12.1-r0: task do_unpack: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-yamllint-1.38.0-r0: task do_unpack: Succeeded
NOTE: Running setscene task 419 of 684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: Running task 1033 of 1931 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pathspec_0.12.1.bb:do_patch)
NOTE: Running task 1034 of 1931 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-yamllint_1.38.0.bb:do_patch)
NOTE: recipe python3-pyyaml-6.0.3-r0: task do_unpack: Succeeded
NOTE: Running task 1035 of 1931 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyyaml_6.0.3.bb:do_patch)
NOTE: recipe libyaml-0.2.5-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.18.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pathspec-0.12.1-r0: task do_patch: Started
NOTE: recipe python3-yamllint-1.38.0-r0: task do_patch: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 425 of 684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe python3-3.13.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe binutils-2.45.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 431 of 684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.194.bb:do_packagedata_setscene)
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-pyyaml-6.0.3-r0: task do_patch: Started
NOTE: Running setscene task 436 of 684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe coreutils-9.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pathspec-0.12.1-r0: task do_patch: Succeeded
NOTE: recipe python3-yamllint-1.38.0-r0: task do_patch: Succeeded
NOTE: recipe elfutils-0.194-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.13.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pyyaml-6.0.3-r0: task do_patch: Succeeded
NOTE: Running setscene task 452 of 684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 453 of 684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 455 of 684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 456 of 684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 457 of 684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_packagedata_setscene)
NOTE: Running setscene task 458 of 684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 459 of 684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 460 of 684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 461 of 684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.11.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 462 of 684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_packagedata_setscene)
NOTE: recipe libyaml-0.2.5-r0: task do_fetch: Succeeded
NOTE: Running setscene task 463 of 684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_populate_sysroot_setscene)
NOTE: Running task 1082 of 1931 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1085 of 1931 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 467 of 684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20251016-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.7.3-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.7.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libyaml-0.2.5-r0: task do_unpack: Started
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe elfutils-0.194-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: Running setscene task 474 of 684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 475 of 684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: recipe libyaml-0.2.5-r0: task do_unpack: Succeeded
NOTE: recipe python3-3.13.11-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 476 of 684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: Running setscene task 477 of 684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20251016-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 480 of 684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.18.bb:do_packagedata_setscene)
NOTE: Running setscene task 486 of 684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.7.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.13.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20251016-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 488 of 684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 489 of 684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 490 of 684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.1.bb:do_populate_sysroot_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 493 of 684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 496 of 684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libarchive-3.8.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 499 of 684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.7.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 500 of 684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 502 of 684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.3.bb:do_recipe_qa_setscene)
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 505 of 684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 510 of 684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_recipe_qa_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.51.1-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.51.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.7.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1101 of 1931 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_patch)
NOTE: recipe libarchive-3.8.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 516 of 684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1126 of 1931 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 523 of 684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.18.0.bb:do_packagedata_setscene)
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20251016-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 525 of 684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.46.bb:do_packagedata_setscene)
NOTE: Running setscene task 526 of 684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 532 of 684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.11.bb:do_packagedata_setscene)
NOTE: recipe expat-2.7.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.51.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_patch: Started
NOTE: Running task 1175 of 1931 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.51.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 544 of 684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.1.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe curl-8.18.0-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 547 of 684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.11.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.11-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libyaml-0.2.5-r0: task do_patch: Succeeded
NOTE: recipe sqlite3-3_3.51.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: Running task 1184 of 1931 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe curl-8.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 550 of 684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.51.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 554 of 684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 556 of 684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 559 of 684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 560 of 684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 561 of 684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 563 of 684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 564 of 684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 566 of 684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 567 of 684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 568 of 684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata_setscene)
NOTE: recipe libgcrypt-1.11.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running setscene task 572 of 684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.77.bb:do_packagedata_setscene)
NOTE: Running setscene task 576 of 684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.58.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1216 of 1931 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe openssl-3.5.4-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.77-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 579 of 684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 583 of 684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_3.10.2.bb:do_packagedata_setscene)
NOTE: recipe libgpg-error-1.58-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 587 of 684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_packagedata_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.10.2-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 590 of 684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-2.77-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 599 of 684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 600 of 684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 605 of 684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: recipe openssl-3.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1242 of 1931 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgpg-error-1.58-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtasn1-4.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 614 of 684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 616 of 684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 618 of 684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 619 of 684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_recipe_qa_setscene)
NOTE: recipe nettle-3.10.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 621 of 684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe libpam-1.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 1258 of 1931 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 633 of 684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 640 of 684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunistring-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 646 of 684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 648 of 684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_packagedata_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 651 of 684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 652 of 684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 654 of 684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_packagedata_setscene)
NOTE: Running task 1311 of 1931 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 656 of 684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 657 of 684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 659 of 684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 661 of 684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 662 of 684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_packagedata_setscene)
NOTE: Running setscene task 663 of 684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 667 of 684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 668 of 684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 670 of 684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 673 of 684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 674 of 684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 676 of 684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 680 of 684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 682 of 684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 684 of 684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1623 of 1931 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1732 of 1931 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-yamllint_1.38.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1733 of 1931 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pathspec_0.12.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1875 of 1931 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-yamllint_1.38.0.bb:do_collect_spdx_deps)
NOTE: Running task 1876 of 1931 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_collect_spdx_deps)
NOTE: recipe libyaml-0.2.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1877 of 1931 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pathspec_0.12.1.bb:do_collect_spdx_deps)
NOTE: recipe python3-yamllint-1.38.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pathspec-0.12.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-yamllint-1.38.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libyaml-0.2.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-pathspec-0.12.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe libyaml-0.2.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1878 of 1931 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_configure)
NOTE: recipe libyaml-0.2.5-r0: task do_configure: Started
NOTE: recipe python3-pathspec-0.12.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pathspec-0.12.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-yamllint-1.38.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1879 of 1931 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pathspec_0.12.1.bb:do_configure)
NOTE: recipe python3-yamllint-1.38.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 1880 of 1931 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-yamllint_1.38.0.bb:do_configure)
NOTE: Running task 1881 of 1931 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe python3-pathspec-0.12.1-r0: task do_configure: Started
NOTE: recipe python3-yamllint-1.38.0-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe python3-pathspec-0.12.1-r0: task do_configure: Succeeded
NOTE: Running task 1882 of 1931 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pathspec_0.12.1.bb:do_compile)
NOTE: recipe python3-yamllint-1.38.0-r0: task do_configure: Succeeded
NOTE: Running task 1883 of 1931 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-yamllint_1.38.0.bb:do_compile)
NOTE: recipe python3-pathspec-0.12.1-r0: task do_compile: Started
NOTE: recipe python3-yamllint-1.38.0-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 27a1287f03f8699e6a83b8e7203f6b85f617ccd1b7f11fa183cd486905f39fba
NOTE: recipe python3-pathspec-0.12.1-r0: task do_compile: Succeeded
NOTE: Running task 1890 of 1931 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pathspec_0.12.1.bb:do_install)
NOTE: recipe python3-pathspec-0.12.1-r0: task do_install: Started
NOTE: recipe python3-pathspec-0.12.1-r0: task do_install: Succeeded
NOTE: recipe python3-yamllint-1.38.0-r0: task do_compile: Succeeded
NOTE: Running task 1891 of 1931 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pathspec_0.12.1.bb:do_package)
NOTE: Running task 1892 of 1931 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pathspec_0.12.1.bb:do_populate_sysroot)
NOTE: Running task 1893 of 1931 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-yamllint_1.38.0.bb:do_install)
NOTE: recipe python3-pathspec-0.12.1-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pathspec-0.12.1-r0: task do_package: Started
NOTE: recipe python3-yamllint-1.38.0-r0: task do_install: Started
NOTE: recipe python3-pathspec-0.12.1-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pathspec_0.12.1.bb:do_populate_sysroot unihash changed to 40ed8d0d900a79e2f4a9933ddaf259b044f395e90a73f93d4c7518a851c48a3d
NOTE: Setscene tasks completed
NOTE: recipe python3-yamllint-1.38.0-r0: task do_install: Succeeded
NOTE: Running task 1894 of 1931 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-yamllint_1.38.0.bb:do_package)
NOTE: Running task 1895 of 1931 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-yamllint_1.38.0.bb:do_populate_sysroot)
NOTE: recipe python3-yamllint-1.38.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-yamllint-1.38.0-r0: task do_package: Started
NOTE: recipe python3-yamllint-1.38.0-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-yamllint_1.38.0.bb:do_populate_sysroot unihash changed to 5aa9e11bbf40346d127f7c5ad830ff3caa6d9f6fe2a885f3eef6258ca4ea1826
NOTE: recipe python3-pathspec-0.12.1-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pathspec_0.12.1.bb:do_package unihash changed to ebd0f46a2ea6117994164256bd42bcde215475cafd7cd243e87da7beabe93a82
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pathspec_0.12.1.bb:do_packagedata became valid
NOTE: Running setscene task 684 of 684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pathspec_0.12.1.bb:do_packagedata_setscene)
NOTE: recipe python3-pathspec-0.12.1-r0: task do_packagedata_setscene: Started
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/python3-pathspec/0.12.1/temp/log.do_packagedata_setscene.1587320
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pathspec_0.12.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Setscene tasks completed
NOTE: Running task 1896 of 1931 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pathspec_0.12.1.bb:do_packagedata)
NOTE: recipe python3-pathspec-0.12.1-r0: task do_packagedata: Started
NOTE: recipe python3-yamllint-1.38.0-r0: task do_package: Succeeded
NOTE: recipe python3-pathspec-0.12.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1897 of 1931 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pathspec_0.12.1.bb:do_create_spdx)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-yamllint_1.38.0.bb:do_package unihash changed to f49058f75de5410ae48294b5c94e6963dd35ba9fbe3be6d828c944765a44677b
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-yamllint_1.38.0.bb:do_packagedata became valid
NOTE: Running setscene task 684 of 684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-yamllint_1.38.0.bb:do_packagedata_setscene)
NOTE: Running task 1898 of 1931 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pathspec_0.12.1.bb:do_package_write_ipk)
NOTE: Running task 1899 of 1931 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pathspec_0.12.1.bb:do_package_write_deb)
NOTE: Running task 1900 of 1931 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pathspec_0.12.1.bb:do_package_write_rpm)
NOTE: Running task 1901 of 1931 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pathspec_0.12.1.bb:do_package_qa)
NOTE: recipe python3-pathspec-0.12.1-r0: task do_create_spdx: Started
NOTE: recipe python3-yamllint-1.38.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pathspec-0.12.1-r0: task do_package_write_ipk: Started
NOTE: recipe python3-pathspec-0.12.1-r0: task do_package_write_deb: Started
NOTE: recipe python3-pathspec-0.12.1-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pathspec-0.12.1-r0: task do_package_qa: Started
NOTE: recipe python3-yamllint-1.38.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1903 of 1931 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-yamllint_1.38.0.bb:do_create_spdx)
NOTE: recipe python3-yamllint-1.38.0-r0: task do_create_spdx: Started
NOTE: recipe python3-pathspec-0.12.1-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-pathspec-0.12.1-r0: task do_package_write_ipk: Succeeded
NOTE: recipe python3-yamllint-1.38.0-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-pathspec-0.12.1-r0: task do_package_qa: Succeeded
NOTE: recipe python3-pathspec-0.12.1-r0: task do_package_write_deb: Succeeded
NOTE: recipe python3-pathspec-0.12.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_configure: Succeeded
NOTE: Running task 1904 of 1931 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_compile)
NOTE: recipe libyaml-0.2.5-r0: task do_compile: Started
NOTE: recipe libyaml-0.2.5-r0: task do_compile: Succeeded
NOTE: Running task 1905 of 1931 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_install)
NOTE: recipe libyaml-0.2.5-r0: task do_install: Started
NOTE: recipe libyaml-0.2.5-r0: task do_install: Succeeded
NOTE: Running task 1907 of 1931 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyyaml_6.0.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1908 of 1931 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_package)
NOTE: recipe python3-pyyaml-6.0.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libyaml-0.2.5-r0: task do_package: Started
NOTE: recipe python3-pyyaml-6.0.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1909 of 1931 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyyaml_6.0.3.bb:do_configure)
NOTE: recipe python3-pyyaml-6.0.3-r0: task do_configure: Started
NOTE: recipe python3-pyyaml-6.0.3-r0: task do_configure: Succeeded
NOTE: Running task 1910 of 1931 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyyaml_6.0.3.bb:do_configure_ptest_base)
NOTE: recipe python3-pyyaml-6.0.3-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-pyyaml-6.0.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1911 of 1931 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyyaml_6.0.3.bb:do_compile)
NOTE: recipe python3-pyyaml-6.0.3-r0: task do_compile: Started
NOTE: recipe libyaml-0.2.5-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_package unihash changed to 9384e059ecab7442f199c9b29bfda71b07c6cb9042f7bef3e6823e7a0f4c9f00
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_create_spdx became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_packagedata became valid
NOTE: Running setscene task 680 of 684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_create_spdx_setscene)
NOTE: recipe libyaml-0.2.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libyaml-0.2.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 684 of 684 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_packagedata_setscene)
NOTE: recipe libyaml-0.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libyaml-0.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1914 of 1931 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyyaml_6.0.3.bb:do_collect_spdx_deps)
NOTE: recipe python3-pyyaml-6.0.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-pyyaml-6.0.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-pyyaml-6.0.3-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1915 of 1931 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyyaml_6.0.3.bb:do_compile_ptest_base)
NOTE: recipe python3-pyyaml-6.0.3-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-pyyaml-6.0.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1916 of 1931 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyyaml_6.0.3.bb:do_install)
NOTE: recipe python3-pyyaml-6.0.3-r0: task do_install: Started
NOTE: recipe python3-pyyaml-6.0.3-r0: task do_install: Succeeded
NOTE: Running task 1917 of 1931 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyyaml_6.0.3.bb:do_install_ptest_base)
NOTE: recipe python3-pyyaml-6.0.3-r0: task do_install_ptest_base: Started
NOTE: recipe python3-pyyaml-6.0.3-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1918 of 1931 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyyaml_6.0.3.bb:do_package)
NOTE: Running task 1919 of 1931 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyyaml_6.0.3.bb:do_populate_sysroot)
NOTE: recipe python3-pyyaml-6.0.3-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pyyaml-6.0.3-r0: task do_package: Started
NOTE: recipe python3-pyyaml-6.0.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-pyyaml-6.0.3-r0: task do_package: Succeeded
NOTE: Running task 1920 of 1931 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyyaml_6.0.3.bb:do_packagedata)
NOTE: recipe python3-pyyaml-6.0.3-r0: task do_packagedata: Started
NOTE: recipe python3-pyyaml-6.0.3-r0: task do_packagedata: Succeeded
NOTE: Running task 1921 of 1931 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyyaml_6.0.3.bb:do_create_spdx)
NOTE: Running task 1922 of 1931 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyyaml_6.0.3.bb:do_package_write_ipk)
NOTE: Running task 1923 of 1931 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyyaml_6.0.3.bb:do_package_write_deb)
NOTE: Running task 1924 of 1931 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyyaml_6.0.3.bb:do_package_write_rpm)
NOTE: Running task 1925 of 1931 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyyaml_6.0.3.bb:do_package_qa)
NOTE: Running task 1926 of 1931 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-yamllint_1.38.0.bb:do_package_write_ipk)
NOTE: Running task 1927 of 1931 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-yamllint_1.38.0.bb:do_package_write_deb)
NOTE: Running task 1928 of 1931 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-yamllint_1.38.0.bb:do_package_write_rpm)
NOTE: Running task 1929 of 1931 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-yamllint_1.38.0.bb:do_package_qa)
NOTE: recipe python3-pyyaml-6.0.3-r0: task do_create_spdx: Started
NOTE: recipe python3-pyyaml-6.0.3-r0: task do_package_write_ipk: Started
NOTE: recipe python3-pyyaml-6.0.3-r0: task do_package_write_deb: Started
NOTE: recipe python3-pyyaml-6.0.3-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pyyaml-6.0.3-r0: task do_package_qa: Started
NOTE: recipe python3-yamllint-1.38.0-r0: task do_package_write_deb: Started
NOTE: recipe python3-yamllint-1.38.0-r0: task do_package_write_ipk: Started
NOTE: recipe python3-yamllint-1.38.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-yamllint-1.38.0-r0: task do_package_qa: Started
NOTE: recipe python3-pyyaml-6.0.3-r0: task do_create_spdx: Succeeded
NOTE: Running task 1930 of 1931 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-yamllint_1.38.0.bb:do_create_package_spdx)
NOTE: recipe python3-yamllint-1.38.0-r0: task do_package_qa: Succeeded
NOTE: recipe python3-yamllint-1.38.0-r0: task do_create_package_spdx: Started
NOTE: recipe python3-yamllint-1.38.0-r0: task do_package_write_ipk: Succeeded
NOTE: recipe python3-yamllint-1.38.0-r0: task do_package_write_deb: Succeeded
NOTE: recipe python3-pyyaml-6.0.3-r0: task do_package_write_ipk: Succeeded
NOTE: recipe python3-yamllint-1.38.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pyyaml-6.0.3-r0: task do_package_write_deb: Succeeded
NOTE: recipe python3-pyyaml-6.0.3-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyyaml_6.0.3.bb:do_package_qa unihash changed to 0e676cd457c242c06260303dc7eb5450c1702b4873a1c1ded2754c706ccf07ab
NOTE: recipe python3-yamllint-1.38.0-r0: task do_create_package_spdx: Succeeded
NOTE: recipe python3-pyyaml-6.0.3-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1931 of 1931 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-yamllint_1.38.0.bb:do_build)
NOTE: Tasks Summary: Attempted 1931 tasks of which 1861 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: python3-pathspec-0.12.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pathspec-src went backwards which would break package feeds (from 0:1.0.3-r0 to 0:0.12.1-r0) [version-going-backwards]
ERROR: python3-pathspec-0.12.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pathspec-dbg went backwards which would break package feeds (from 0:1.0.3-r0 to 0:0.12.1-r0) [version-going-backwards]
ERROR: python3-pathspec-0.12.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pathspec-staticdev went backwards which would break package feeds (from 0:1.0.3-r0 to 0:0.12.1-r0) [version-going-backwards]
ERROR: python3-pathspec-0.12.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pathspec-dev went backwards which would break package feeds (from 0:1.0.3-r0 to 0:0.12.1-r0) [version-going-backwards]
ERROR: python3-pathspec-0.12.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pathspec-doc went backwards which would break package feeds (from 0:1.0.3-r0 to 0:0.12.1-r0) [version-going-backwards]
ERROR: python3-pathspec-0.12.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pathspec-locale went backwards which would break package feeds (from 0:1.0.3-r0 to 0:0.12.1-r0) [version-going-backwards]
ERROR: python3-pathspec-0.12.1-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pathspec went backwards which would break package feeds (from 0:1.0.3-r0 to 0:0.12.1-r0) [version-going-backwards]
ERROR: python3-pathspec-0.12.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============3573817538627930558==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-yamllint/python3-yamllint: FILELIST: directory renamed /usr/lib/python3.13/site-packages/yamllint-1.37.1.dist-info/licenses -> /usr/lib/python3.13/site-packages/yamllint-1.38.0.dist-info/licenses, directory renamed /usr/lib/python3.13/site-packages/yamllint-1.37.1.dist-info -> /usr/lib/python3.13/site-packages/yamllint-1.38.0.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-yamllint (sysroot):
  /usr/lib/python3.13/site-packages/yamllint-1.37.1.dist-info moved to /usr/lib/python3.13/site-packages/yamllint-1.38.0.dist-info

--===============3573817538627930558==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-yamllint: PKGV changed from 1.37.1 [default] to 1.38.0 [default]
packages/x86-64-v3-poky-linux/python3-yamllint: SRC_URI changed from "https://files.pythonhosted.org/packages/source/y/yamllint/yamllint-1.37.1.tar.gz;downloadfilename=yamllint-1.37.1.tar.gz" to "https://files.pythonhosted.org/packages/source/y/yamllint/yamllint-1.38.0.tar.gz;downloadfilename=yamllint-1.38.0.tar.gz"
packages/x86-64-v3-poky-linux/python3-yamllint: PV changed from "1.37.1" to "1.38.0"
packages/x86-64-v3-poky-linux/python3-yamllint/python3-yamllint-dbg: PKGV changed from 1.37.1 [default] to 1.38.0 [default]
packages/x86-64-v3-poky-linux/python3-yamllint/python3-yamllint-dbg: PV changed from "1.37.1" to "1.38.0"
packages/x86-64-v3-poky-linux/python3-yamllint/python3-yamllint-dev: PKGV changed from 1.37.1 [default] to 1.38.0 [default]
packages/x86-64-v3-poky-linux/python3-yamllint/python3-yamllint-dev: PV changed from "1.37.1" to "1.38.0"
packages/x86-64-v3-poky-linux/python3-yamllint/python3-yamllint-doc: PKGV changed from 1.37.1 [default] to 1.38.0 [default]
packages/x86-64-v3-poky-linux/python3-yamllint/python3-yamllint-doc: PV changed from "1.37.1" to "1.38.0"
packages/x86-64-v3-poky-linux/python3-yamllint/python3-yamllint-locale: PKGV changed from 1.37.1 [default] to 1.38.0 [default]
packages/x86-64-v3-poky-linux/python3-yamllint/python3-yamllint-locale: PV changed from "1.37.1" to "1.38.0"
packages/x86-64-v3-poky-linux/python3-yamllint/python3-yamllint-src: PKGV changed from 1.37.1 [default] to 1.38.0 [default]
packages/x86-64-v3-poky-linux/python3-yamllint/python3-yamllint-src: PV changed from "1.37.1" to "1.38.0"
packages/x86-64-v3-poky-linux/python3-yamllint/python3-yamllint-staticdev: PKGV changed from 1.37.1 [default] to 1.38.0 [default]
packages/x86-64-v3-poky-linux/python3-yamllint/python3-yamllint-staticdev: PV changed from "1.37.1" to "1.38.0"
packages/x86-64-v3-poky-linux/python3-yamllint/python3-yamllint: PKGV changed from 1.37.1 [default] to 1.38.0 [default]
packages/x86-64-v3-poky-linux/python3-yamllint/python3-yamllint: FILELIST: directory renamed /usr/lib/python3.13/site-packages/yamllint-1.37.1.dist-info -> /usr/lib/python3.13/site-packages/yamllint-1.38.0.dist-info, directory renamed /usr/lib/python3.13/site-packages/yamllint-1.37.1.dist-info/licenses -> /usr/lib/python3.13/site-packages/yamllint-1.38.0.dist-info/licenses
packages/x86-64-v3-poky-linux/python3-yamllint/python3-yamllint: PKGSIZE changed from 353081 to 353554 (+0%)
packages/x86-64-v3-poky-linux/python3-yamllint/python3-yamllint: PV changed from "1.37.1" to "1.38.0"
Changes to packages/x86-64-v3-poky-linux/python3-yamllint (sysroot):
  /usr/lib/python3.13/site-packages/yamllint-1.37.1.dist-info moved to /usr/lib/python3.13/site-packages/yamllint-1.38.0.dist-info

--===============3573817538627930558==--

