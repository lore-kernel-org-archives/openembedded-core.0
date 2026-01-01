Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB76FEED610
	for <webhook@archiver.kernel.org>; Thu,  1 Jan 2026 11:37:59 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.103056.1767267472601410063
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Jan 2026 03:37:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=cSkPaW8e;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=B+ZPz5FE;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019b7959920e-935f5951-bc67-4abb-8348-0aeaec357475-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1767267472;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=s2JttAN4TGwqbGRNYkh1mzDsrVifL+6Vbzpa/OB52zA=;
	b=cSkPaW8eO5G4g9dYUleDifY69QXEsETTgf5bew08hSuGEhquXnSPTOa1XtMcy4wG
	eOkDdQ4V9zJXp2Wwr/ZiqxZNMEzoTOqv23kCHSZjZyu6qdFWszeUEl5i9azOjV2zMn9
	5GvwH9GXywyP+++nbKaYjhE4QcsXw+Ho7fQUmJBU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1767267472;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=s2JttAN4TGwqbGRNYkh1mzDsrVifL+6Vbzpa/OB52zA=;
	b=B+ZPz5FEzgwgUYTUilFY/YhQOOYW+zrJfwEEHvnBv/VOKOPDF0sbMzuG3esIsXqk
	o03p5wgnbo0sbla0L/HW62DaEkBSTU0P5rFsZYQILNvDrvU6vSa9/d9gVE2dYXUeVl4
	PMPkCoQE0EEYe5To/38ZKii2D5SyDkSLtc35MQi8=
Content-Type: multipart/mixed; boundary="===============6609535547252632425=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-docutils: upgrading to 0.22.4 SUCCEEDED
Message-ID: <0101019b7959920e-935f5951-bc67-4abb-8348-0aeaec357475-000000@us-west-2.amazonses.com>
Date: Thu, 1 Jan 2026 11:37:51 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.01.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Jan 2026 11:37:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228770

--===============6609535547252632425==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-docutils* to *0.22.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-docutils-upgrade-0.22.3-0.22.4.patch
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
From dfd4ab4876b6dfe100f9e67433d3340d1b711368 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 Jan 2026 07:03:48 +0000
Subject: [PATCH] python3-docutils: upgrade 0.22.3 -> 0.22.4

---
 .../{python3-docutils_0.22.3.bb => python3-docutils_0.22.4.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-docutils_0.22.3.bb => python3-docutils_0.22.4.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-docutils_0.22.3.bb b/meta/recipes-devtools/python/python3-docutils_0.22.4.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-docutils_0.22.3.bb
rename to meta/recipes-devtools/python/python3-docutils_0.22.4.bb
index a89e9941ca..571a19a958 100644
--- a/meta/recipes-devtools/python/python3-docutils_0.22.3.bb
+++ b/meta/recipes-devtools/python/python3-docutils_0.22.4.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "CC0-1.0 & BSD-2-Clause & GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING.rst;md5=ce467b04b35c7ac3429b6908fc8b318e"
 
-SRC_URI[sha256sum] = "21486ae730e4ca9f622677b1412b879af1791efcfba517e4c6f60be543fc8cdd"
+SRC_URI[sha256sum] = "4db53b1fde9abecbb74d91230d32ab626d94f6badfc575d6db9194a49df29968"
 
 inherit pypi python_flit_core
 
-- 
2.47.1


--===============6609535547252632425==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-docutils-upgrade-0.22.3-0.22.4.patch"

RnJvbSBkZmQ0YWI0ODc2YjZkZmUxMDBmOWU2NzQzM2QzMzQwZDFiNzExMzY4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBKYW4gMjAyNiAwNzowMzo0OCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtZG9jdXRpbHM6IHVwZ3JhZGUgMC4yMi4zIC0+IDAuMjIuNAoKLS0tCiAuLi4ve3B5dGhv
bjMtZG9jdXRpbHNfMC4yMi4zLmJiID0+IHB5dGhvbjMtZG9jdXRpbHNfMC4yMi40LmJifSAgfCAy
ICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFt
ZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLWRvY3V0aWxzXzAuMjIuMy5i
YiA9PiBweXRob24zLWRvY3V0aWxzXzAuMjIuNC5iYn0gKDg1JSkKCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtZG9jdXRpbHNfMC4yMi4zLmJiIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWRvY3V0aWxzXzAuMjIuNC5iYgpzaW1p
bGFyaXR5IGluZGV4IDg1JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtZG9jdXRpbHNfMC4yMi4zLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtZG9jdXRpbHNfMC4yMi40LmJiCmluZGV4IGE4OWU5OTQxY2EuLjU3
MWExOWE5NTggMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
My1kb2N1dGlsc18wLjIyLjMuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24zLWRvY3V0aWxzXzAuMjIuNC5iYgpAQCAtNCw3ICs0LDcgQEAgU0VDVElPTiA9ICJkZXZl
bC9weXRob24iCiBMSUNFTlNFID0gIkNDMC0xLjAgJiBCU0QtMi1DbGF1c2UgJiBHUEwtMy4wLW9u
bHkiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HLnJzdDttZDU9Y2U0NjdiMDRi
MzVjN2FjMzQyOWI2OTA4ZmM4YjMxOGUiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIyMTQ4NmFl
NzMwZTRjYTlmNjIyNjc3YjE0MTJiODc5YWYxNzkxZWZjZmJhNTE3ZTRjNmY2MGJlNTQzZmM4Y2Rk
IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjRkYjUzYjFmZGU5YWJlY2JiNzRkOTEyMzBkMzJhYjYy
NmQ5NGY2YmFkZmM1NzVkNmRiOTE5NGE0OWRmMjk5NjgiCiAKIGluaGVyaXQgcHlwaSBweXRob25f
ZmxpdF9jb3JlCiAKLS0gCjIuNDcuMQoK

--===============6609535547252632425==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-docutils: SRC_URI changed from "https://files.pythonhosted.org/packages/source/d/docutils/docutils-0.22.3.tar.gz;downloadfilename=docutils-0.22.3.tar.gz" to "https://files.pythonhosted.org/packages/source/d/docutils/docutils-0.22.4.tar.gz;downloadfilename=docutils-0.22.4.tar.gz"
packages/x86-64-v3-poky-linux/python3-docutils: PV changed from "0.22.3" to "0.22.4"
packages/x86-64-v3-poky-linux/python3-docutils: PKGV changed from 0.22.3 [default] to 0.22.4 [default]
packages/x86-64-v3-poky-linux/python3-docutils/python3-docutils-dbg: PV changed from "0.22.3" to "0.22.4"
packages/x86-64-v3-poky-linux/python3-docutils/python3-docutils-dbg: PKGV changed from 0.22.3 [default] to 0.22.4 [default]
packages/x86-64-v3-poky-linux/python3-docutils/python3-docutils-dev: PV changed from "0.22.3" to "0.22.4"
packages/x86-64-v3-poky-linux/python3-docutils/python3-docutils-dev: PKGV changed from 0.22.3 [default] to 0.22.4 [default]
packages/x86-64-v3-poky-linux/python3-docutils/python3-docutils-doc: PV changed from "0.22.3" to "0.22.4"
packages/x86-64-v3-poky-linux/python3-docutils/python3-docutils-doc: PKGV changed from 0.22.3 [default] to 0.22.4 [default]
packages/x86-64-v3-poky-linux/python3-docutils/python3-docutils-locale: PV changed from "0.22.3" to "0.22.4"
packages/x86-64-v3-poky-linux/python3-docutils/python3-docutils-locale: PKGV changed from 0.22.3 [default] to 0.22.4 [default]
packages/x86-64-v3-poky-linux/python3-docutils/python3-docutils-src: PV changed from "0.22.3" to "0.22.4"
packages/x86-64-v3-poky-linux/python3-docutils/python3-docutils-src: PKGV changed from 0.22.3 [default] to 0.22.4 [default]
packages/x86-64-v3-poky-linux/python3-docutils/python3-docutils-staticdev: PV changed from "0.22.3" to "0.22.4"
packages/x86-64-v3-poky-linux/python3-docutils/python3-docutils-staticdev: PKGV changed from 0.22.3 [default] to 0.22.4 [default]
packages/x86-64-v3-poky-linux/python3-docutils/python3-docutils: PV changed from "0.22.3" to "0.22.4"
packages/x86-64-v3-poky-linux/python3-docutils/python3-docutils: FILELIST: directory renamed /usr/lib/python3.13/site-packages/docutils-0.22.3.dist-info/licenses -> /usr/lib/python3.13/site-packages/docutils-0.22.4.dist-info/licenses, directory renamed /usr/lib/python3.13/site-packages/docutils-0.22.3.dist-info -> /usr/lib/python3.13/site-packages/docutils-0.22.4.dist-info, directory renamed /usr/lib/python3.13/site-packages/docutils-0.22.3.dist-info/licenses/licenses -> /usr/lib/python3.13/site-packages/docutils-0.22.4.dist-info/licenses/licenses
packages/x86-64-v3-poky-linux/python3-docutils/python3-docutils: PKGV changed from 0.22.3 [default] to 0.22.4 [default]
packages/x86-64-v3-poky-linux/python3-docutils/python3-docutils: PKGSIZE changed from 4244793 to 4245769 (+0%)
Changes to packages/x86-64-v3-poky-linux/python3-docutils (sysroot):
  /usr/lib/python3.13/site-packages/docutils-0.22.3.dist-info moved to /usr/lib/python3.13/site-packages/docutils-0.22.4.dist-info

--===============6609535547252632425==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 951 .bb files complete (0 cached, 951 parsed). 1955 targets, 71 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-musleabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-71d83c6d3d7876a3015e1c4959f63321030193a4"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 = "tmp-auh-upgrades:71d83c6d3d7876a3015e1c4959f63321030193a4"
meta-yocto-bsp       
meta-poky            = "master:853589ccc3445f5952efc02a7102587cb4d4f075"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 405 Local 293 Mirrors 0 Missed 112 Current 236 (72% match, 82% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 287 of 641 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_create_spdx_setscene)
NOTE: Running setscene task 299 of 641 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 313 of 641 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 318 of 641 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ca-certificates/ca-certificates_20250419.bb:do_packagedata_setscene)
NOTE: Running setscene task 325 of 641 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: Running setscene task 328 of 641 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 336 of 641 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 337 of 641 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 340 of 641 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_15.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 342 of 641 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.45.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 343 of 641 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_15.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 345 of 641 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 346 of 641 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 361 of 641 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 371 of 641 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.194.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 378 of 641 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.17.0.bb:do_populate_sysroot_setscene)
NOTE: recipe ca-certificates-20250419-r0: task do_packagedata_setscene: Started
NOTE: recipe tzdata-2025c-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sed-4.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libmpc-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-5.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-2.45.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-15.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe elfutils-0.194-r0: task do_recipe_qa_setscene: Started
NOTE: recipe coreutils-9.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe curl-8.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.13.9-r0: task do_create_spdx_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 381 of 641 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 388 of 641 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.9.bb:do_recipe_qa_setscene)
NOTE: recipe musl-locales-1.0+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 390 of 641 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.4.bb:do_recipe_qa_setscene)
NOTE: recipe ca-certificates-20250419-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libmpc-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-5.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe binutils-2.45.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 392 of 641 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 393 of 641 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-15.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 394 of 641 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 401 of 641 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 404 of 641 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.17.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 405 of 641 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_recipe_qa_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe elfutils-0.194-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 406 of 641 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.77.bb:do_populate_sysroot_setscene)
NOTE: recipe coreutils-9.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 408 of 641 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 409 of 641 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.77.bb:do_packagedata_setscene)
NOTE: recipe tzdata-2025c-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 411 of 641 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.18.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.13.9-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 413 of 641 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_recipe_qa_setscene)
NOTE: recipe mpfr-4.2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 414 of 641 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.9.bb:do_recipe_qa_setscene)
NOTE: recipe curl-8.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 419 of 641 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.11.bb:do_recipe_qa_setscene)
NOTE: recipe sed-4.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libarchive-3.8.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-2.77-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.77-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe e2fsprogs-native-1.47.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sed-4.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libarchive-3.8.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 426 of 641 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_recipe_qa_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe coreutils-9.9-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 435 of 641 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 436 of 641 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 442 of 641 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.46.bb:do_recipe_qa_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 445 of 641 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_packagedata_setscene)
NOTE: recipe bash-5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 448 of 641 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_populate_sysroot_setscene)
NOTE: recipe gnutls-3.8.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 452 of 641 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 453 of 641 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-2.77-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 454 of 641 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_recipe_qa_setscene)
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe curl-8.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-2.77-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 455 of 641 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_packagedata_setscene)
NOTE: recipe coreutils-9.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 459 of 641 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 475 of 641 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 478 of 641 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 482 of 641 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.77.bb:do_recipe_qa_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gnutls-3.8.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 484 of 641 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.15.bb:do_recipe_qa_setscene)
NOTE: recipe file-5.46-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.18.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcrypt-1.11.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe e2fsprogs-native-1.47.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 488 of 641 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.17.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 489 of 641 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.58.bb:do_recipe_qa_setscene)
NOTE: recipe mpfr-4.2.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe file-5.46-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-2.77-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 491 of 641 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 492 of 641 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_3.10.2.bb:do_recipe_qa_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.13.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe lzlib-1.15-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.13.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 497 of 641 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_recipe_qa_setscene)
NOTE: recipe libgcrypt-1.11.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 499 of 641 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 500 of 641 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-2.77-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe mpfr-4.2.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 501 of 641 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_create_spdx_setscene)
NOTE: recipe lzlib-1.15-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 503 of 641 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_recipe_qa_setscene)
NOTE: recipe libgpg-error-1.58-r0: task do_recipe_qa_setscene: Started
NOTE: recipe curl-8.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe nettle-3.10.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 507 of 641 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe curl-8.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgpg-error-1.58-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe mpfr-4.2.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe nettle-3.10.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe util-linux-native-2.41.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 509 of 641 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 512 of 641 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 513 of 641 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 514 of 641 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 515 of 641 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 517 of 641 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 519 of 641 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 520 of 641 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_recipe_qa_setscene)
NOTE: recipe mpfr-4.2.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 522 of 641 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: Running setscene task 523 of 641 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunistring-1.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.13.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 737 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_3.10.2.bb:do_fetch)
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Started
NOTE: Running task 738 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_fetch)
NOTE: Running task 739 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.58.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.13.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 767 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.18.bb:do_fetch)
NOTE: Running task 773 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_fetch)
NOTE: Running setscene task 524 of 641 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_package_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunistring-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunistring-1.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe nettle-3.10.2-r0: task do_fetch: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_fetch: Started
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgpg-error-1.58-r0: task do_fetch: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_fetch: Started
NOTE: recipe json-c-0.18-r0: task do_fetch: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_fetch: Succeeded
NOTE: recipe json-c-0.18-r0: task do_fetch: Succeeded
NOTE: recipe util-linux-native-2.41.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_fetch: Succeeded
NOTE: Running setscene task 532 of 641 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 534 of 641 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_recipe_qa_setscene)
NOTE: Running task 809 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_fetch)
NOTE: Running task 810 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_unpack)
NOTE: Running task 817 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.11.bb:do_fetch)
NOTE: Running task 818 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_fetch)
NOTE: Running task 822 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.18.bb:do_unpack)
NOTE: Running task 835 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_unpack)
NOTE: Running task 844 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_fetch)
NOTE: Running task 846 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.15.bb:do_fetch)
NOTE: Running task 848 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.46.bb:do_fetch)
NOTE: Running task 855 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_fetch)
NOTE: recipe libunistring-1.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_fetch: Started
NOTE: recipe zstd-1.5.7-r0: task do_fetch: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_unpack: Started
NOTE: recipe lzlib-1.15-r0: task do_fetch: Started
NOTE: recipe libgcrypt-1.11.2-r0: task do_fetch: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_fetch: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_unpack: Started
NOTE: recipe json-c-0.18-r0: task do_unpack: Started
NOTE: recipe gnutls-3.8.11-r0: task do_fetch: Started
NOTE: recipe file-5.46-r0: task do_fetch: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_fetch: Succeeded
NOTE: Running task 856 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_fetch)
NOTE: recipe gmp-6.3.0-r0: task do_fetch: Succeeded
NOTE: recipe libgcrypt-1.11.2-r0: task do_fetch: Succeeded
NOTE: Running task 857 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_unpack)
NOTE: recipe gnutls-3.8.11-r0: task do_fetch: Succeeded
NOTE: Running task 858 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_unpack)
NOTE: Running task 859 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.11.bb:do_unpack)
NOTE: recipe libunistring-1.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe json-c-0.18-r0: task do_unpack: Succeeded
NOTE: Running task 865 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_fetch)
NOTE: Running task 866 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.18.bb:do_patch)
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 872 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_fetch)
NOTE: recipe libtasn1-4.20.0-r0: task do_unpack: Succeeded
NOTE: Running task 873 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_patch)
NOTE: recipe fts-1.2.7-r0: task do_fetch: Started
NOTE: recipe gmp-6.3.0-r0: task do_unpack: Started
NOTE: recipe libpam-1.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcrypt-1.11.2-r0: task do_unpack: Started
NOTE: Running setscene task 537 of 641 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_recipe_qa_setscene)
NOTE: recipe gnutls-3.8.11-r0: task do_unpack: Started
NOTE: recipe libgpg-error-1.58-r0: task do_fetch: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_fetch: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_fetch: Started
NOTE: recipe json-c-0.18-r0: task do_patch: Started
NOTE: Running task 907 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.58.bb:do_unpack)
NOTE: recipe zstd-1.5.7-r0: task do_fetch: Succeeded
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_fetch: Succeeded
NOTE: Running task 922 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_unpack)
NOTE: Running task 923 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_fetch)
NOTE: recipe libtasn1-4.20.0-r0: task do_patch: Started
NOTE: recipe libpam-1.7.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_patch: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_unpack: Started
NOTE: recipe libgpg-error-1.58-r0: task do_unpack: Started
NOTE: Running task 924 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.18.bb:do_generate_toolchain_file)
NOTE: recipe musl-obstack-1.2.3-r0: task do_fetch: Started
NOTE: recipe libpam-1.7.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 930 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.18.bb:do_deploy_source_date_epoch)
NOTE: recipe libtasn1-4.20.0-r0: task do_patch: Succeeded
NOTE: Running task 931 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_deploy_source_date_epoch)
NOTE: recipe json-c-0.18-r0: task do_generate_toolchain_file: Started
NOTE: recipe python3-3.13.9-r0: task do_package_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_unpack: Succeeded
NOTE: Running task 932 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_patch)
NOTE: recipe json-c-0.18-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe json-c-0.18-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 933 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.4.bb:do_fetch)
NOTE: recipe libgpg-error-1.58-r0: task do_unpack: Succeeded
NOTE: Running task 934 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.58.bb:do_patch)
NOTE: recipe libtasn1-4.20.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_patch: Started
NOTE: recipe libarchive-3.8.4-r0: task do_fetch: Started
NOTE: recipe libgpg-error-1.58-r0: task do_patch: Started
NOTE: recipe libarchive-3.8.4-r0: task do_fetch: Succeeded
NOTE: Running task 936 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.194.bb:do_fetch)
NOTE: recipe gmp-6.3.0-r0: task do_unpack: Succeeded
NOTE: recipe json-c-0.18-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 937 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_patch)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.18.bb:do_deploy_source_date_epoch unihash changed to ed4610e5741b0acd716f4bb80bffe1f84c38e4da85771ea4c5dd174cd433075b
NOTE: recipe libgcrypt-1.11.2-r0: task do_unpack: Succeeded
NOTE: recipe gnutls-3.8.11-r0: task do_unpack: Succeeded
NOTE: recipe elfutils-0.194-r0: task do_fetch: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_patch: Succeeded
NOTE: recipe libtasn1-4.20.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 938 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 939 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.11.bb:do_patch)
NOTE: Running task 940 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_patch)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_deploy_source_date_epoch unihash changed to 6bacefd649e732cabf6be0bac1573ef214fd4a4911a7135ebc532e71f2378859
NOTE: recipe elfutils-0.194-r0: task do_fetch: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_unpack: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_patch: Started
NOTE: Running task 941 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_patch)
NOTE: Running task 942 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_unpack)
NOTE: Running task 943 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_unpack)
NOTE: Running task 944 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.4.bb:do_unpack)
NOTE: recipe libgpg-error-1.58-r0: task do_patch: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 945 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.58.bb:do_deploy_source_date_epoch)
NOTE: recipe libgcrypt-1.11.2-r0: task do_patch: Started
NOTE: recipe gnutls-3.8.11-r0: task do_patch: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_unpack: Started
NOTE: recipe zstd-1.5.7-r0: task do_patch: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_unpack: Started
NOTE: recipe libarchive-3.8.4-r0: task do_unpack: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_unpack: Succeeded
NOTE: Running task 946 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_patch)
NOTE: recipe libgpg-error-1.58-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe zstd-1.5.7-r0: task do_patch: Succeeded
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_unpack: Succeeded
NOTE: Running task 947 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_deploy_source_date_epoch)
NOTE: Running task 948 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_patch)
NOTE: recipe musl-legacy-error-1.0-r0: task do_patch: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_deploy_source_date_epoch unihash changed to 63a5eeac774a7d094ef8522fe8dd67857f84b60610c51570306d754aa598a0f7
NOTE: recipe zstd-1.5.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libarchive-3.8.4-r0: task do_unpack: Succeeded
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_patch: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_patch: Succeeded
NOTE: recipe gnutls-3.8.11-r0: task do_patch: Succeeded
NOTE: recipe libgpg-error-1.58-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_fetch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.58.bb:do_deploy_source_date_epoch unihash changed to 31fc63eacf0bb87d0f014354ae340c02ff54c6558b356872b5c0a80d26e70813
NOTE: recipe gmp-6.3.0-r0: task do_patch: Succeeded
NOTE: Running task 950 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.11.bb:do_deploy_source_date_epoch)
NOTE: Running task 951 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_unpack)
NOTE: Running task 952 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.4.bb:do_patch)
NOTE: Running task 953 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.194.bb:do_unpack)
NOTE: Running task 961 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.9.bb:do_fetch)
NOTE: Running task 962 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_fetch)
NOTE: Running task 963 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.9.bb:do_fetch)
NOTE: recipe libgcrypt-1.11.2-r0: task do_patch: Succeeded
NOTE: Running task 964 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_patch: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_fetch: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_fetch: Succeeded
NOTE: Running task 966 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_unpack)
NOTE: Running task 972 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_deploy_source_date_epoch)
NOTE: Running task 973 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_unpack)
NOTE: recipe zstd-1.5.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_deploy_source_date_epoch unihash changed to b2e354342372b2ac7f247ec23f84f100a69a15435b7714f0996592c7e0f0b38f
NOTE: recipe fts-1.2.7-r0: task do_unpack: Started
NOTE: recipe libarchive-3.8.4-r0: task do_patch: Started
NOTE: recipe gnutls-3.8.11-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe sed-4.9-r0: task do_fetch: Started
NOTE: recipe elfutils-0.194-r0: task do_unpack: Started
NOTE: recipe bash-5.3-r0: task do_fetch: Started
NOTE: recipe coreutils-9.9-r0: task do_fetch: Started
NOTE: recipe libgcrypt-1.11.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe sed-4.9-r0: task do_fetch: Succeeded
NOTE: recipe bash-5.3-r0: task do_fetch: Succeeded
NOTE: recipe coreutils-9.9-r0: task do_fetch: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_unpack: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_unpack: Started
NOTE: Running task 974 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_prepare_recipe_sysroot)
NOTE: Running task 975 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 978 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.9.bb:do_unpack)
NOTE: Running task 979 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_unpack)
NOTE: recipe libarchive-3.8.4-r0: task do_patch: Succeeded
NOTE: Running task 980 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.4.bb:do_deploy_source_date_epoch)
NOTE: recipe musl-legacy-error-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe sed-4.9-r0: task do_unpack: Started
NOTE: recipe bash-5.3-r0: task do_unpack: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 981 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.9.bb:do_unpack)
NOTE: recipe libarchive-3.8.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gnutls-3.8.11-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe nettle-3.10.2-r0: task do_fetch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.11.bb:do_deploy_source_date_epoch unihash changed to aceeab82e920df65f75b416afed40618ed33b4e2e957f70f7c698476c1342921
NOTE: recipe libgcrypt-1.11.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe coreutils-9.9-r0: task do_unpack: Started
NOTE: recipe sed-4.9-r0: task do_unpack: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_deploy_source_date_epoch unihash changed to 203f68d856efa35c47ec7992b2c241ac9b62810a52ad1a1641185e019b192cc4
NOTE: recipe fts-1.2.7-r0: task do_unpack: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_unpack: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_unpack: Succeeded
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libarchive-3.8.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_deploy_source_date_epoch unihash changed to 40c2968b7edba8dd2a4398bcb916f178dde09cdd60d678f585098869d6f78451
NOTE: recipe bash-5.3-r0: task do_unpack: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.4.bb:do_deploy_source_date_epoch unihash changed to 3631032d8fb6569eaea35a6a1aba265450e937232bef06f42f78a41ee3981019
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_deploy_source_date_epoch unihash changed to b5b4e4b82a25e4b91af6e55425d975d52f76e2717819e30fc3331a2309026f27
NOTE: Running task 982 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_3.10.2.bb:do_unpack)
NOTE: Running task 983 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_patch)
NOTE: Running task 984 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_patch)
NOTE: Running task 985 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_patch)
NOTE: Running noexec task 986 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_configure)
NOTE: Running noexec task 987 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_compile)
NOTE: Running task 988 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_install)
NOTE: Running task 989 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.9.bb:do_patch)
NOTE: Running task 990 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_patch)
NOTE: Running task 992 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_fetch)
NOTE: Running task 997 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-docutils_0.22.4.bb:do_recipe_qa)
NOTE: Running task 1025 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: Running task 1027 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_fetch)
NOTE: recipe fts-1.2.7-r0: task do_patch: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_patch: Started
NOTE: recipe nettle-3.10.2-r0: task do_unpack: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_patch: Started
NOTE: recipe mpfr-4.2.2-r0: task do_fetch: Started
NOTE: recipe python3-docutils-0.22.4-r0: task do_recipe_qa: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_install: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe sed-4.9-r0: task do_patch: Started
NOTE: recipe bash-5.3-r0: task do_patch: Started
NOTE: recipe libmpc-1.3.1-r0: task do_fetch: Started
NOTE: recipe mpfr-4.2.2-r0: task do_fetch: Succeeded
NOTE: Running task 1028 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: recipe coreutils-9.9-r0: task do_unpack: Succeeded
NOTE: Running task 1033 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 1034 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.9.bb:do_patch)
NOTE: recipe sed-4.9-r0: task do_patch: Succeeded
NOTE: Running task 1040 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_fetch)
NOTE: recipe fts-1.2.7-r0: task do_patch: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_patch: Succeeded
NOTE: Running task 1041 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_deploy_source_date_epoch)
NOTE: recipe nettle-3.10.2-r0: task do_unpack: Succeeded
NOTE: Running task 1042 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_deploy_source_date_epoch)
NOTE: Running task 1043 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_3.10.2.bb:do_patch)
NOTE: recipe mpfr-4.2.2-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe coreutils-9.9-r0: task do_patch: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_install: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_patch: Succeeded
NOTE: recipe musl-locales-1.0+git-r0: task do_fetch: Started
NOTE: Running task 1044 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1045 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_populate_sysroot)
NOTE: recipe python3-docutils-0.22.4-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1046 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-docutils_0.22.4.bb:do_fetch)
NOTE: recipe fts-1.2.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe nettle-3.10.2-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: recipe coreutils-9.9-r0: task do_patch: Succeeded
NOTE: Running task 1047 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe musl-legacy-error-1.0-r0: task do_populate_sysroot: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1069 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.45.bb:do_fetch)
NOTE: recipe mpfr-4.2.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-docutils-0.22.4-r0: task do_fetch: Started
NOTE: Running task 1070 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_patch)
NOTE: recipe python3-docutils-0.22.4-r0: task do_fetch: Succeeded
NOTE: Running task 1071 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-docutils_0.22.4.bb:do_unpack)
NOTE: recipe elfutils-0.194-r0: task do_unpack: Succeeded
NOTE: Running task 1072 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.194.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe bash-5.3-r0: task do_patch: Succeeded
NOTE: Running task 1074 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_fetch)
NOTE: recipe binutils-2.45.1-r0: task do_fetch: Started
NOTE: recipe mpfr-4.2.2-r0: task do_patch: Started
NOTE: recipe python3-docutils-0.22.4-r0: task do_unpack: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe binutils-2.45.1-r0: task do_fetch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_deploy_source_date_epoch unihash changed to 1f71d6c42ffe87a616da11d436ecbb235ddb9c917d91379a22fea1d3d68fa50f
NOTE: recipe mpfr-4.2.2-r0: task do_patch: Succeeded
NOTE: recipe nettle-3.10.2-r0: task do_patch: Succeeded
NOTE: recipe elfutils-0.194-r0: task do_patch: Started
NOTE: recipe fts-1.2.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: recipe unzip-1_6.0-r0: task do_fetch: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_deploy_source_date_epoch unihash changed to c54a0f646b78bdd0b3a563d796de0d994868fa441666981fd532dda875db241c
NOTE: recipe argp-standalone-1.4.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-docutils-0.22.4-r0: task do_unpack: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_deploy_source_date_epoch unihash changed to c1bb3a723c1598dd8dcf7961fc809d14904bd4bffcabf1241e7fe296a93c5136
NOTE: Running task 1075 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_3.10.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1076 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-docutils_0.22.4.bb:do_patch)
NOTE: Running task 1093 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1095 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.45.bb:do_unpack)
NOTE: Running noexec task 1140 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_15.2.bb:do_fetch)
NOTE: Running task 1141 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_package)
NOTE: recipe musl-legacy-error-1.0-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_populate_sysroot unihash changed to 9635aa6ea5da73c8e91abcea6f16db3490291d0fa154182b5ea97dd39d287998
NOTE: recipe python3-docutils-0.22.4-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe nettle-3.10.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe binutils-2.45.1-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_package: Started
NOTE: recipe file-5.46-r0: task do_fetch: Succeeded
NOTE: Running task 1167 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: Running task 1168 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.46.bb:do_unpack)
NOTE: recipe python3-docutils-0.22.4-r0: task do_patch: Succeeded
NOTE: Running task 1169 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-docutils_0.22.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1170 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-docutils_0.22.4.bb:do_populate_lic)
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe file-5.46-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: Running task 1171 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe python3-docutils-0.22.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe nettle-3.10.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-docutils-0.22.4-r0: task do_populate_lic: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_3.10.2.bb:do_deploy_source_date_epoch unihash changed to c5a9d819b2d37df11ce7a0a7886c6e55cc38eb2c0b5a0e87fd8ce4dc599e608d
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: Running task 1172 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libmpc-1.3.1-r0: task do_fetch: Succeeded
NOTE: Running task 1173 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_unpack)
NOTE: recipe python3-docutils-0.22.4-r0: task do_populate_lic: Succeeded
NOTE: recipe elfutils-0.194-r0: task do_patch: Succeeded
NOTE: Running task 1174 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.194.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-docutils-0.22.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe libmpc-1.3.1-r0: task do_unpack: Started
NOTE: recipe elfutils-0.194-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libmpc-1.3.1-r0: task do_unpack: Succeeded
NOTE: Running task 1175 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_patch)
NOTE: recipe file-5.46-r0: task do_unpack: Succeeded
NOTE: Running task 1176 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.46.bb:do_patch)
NOTE: recipe libmpc-1.3.1-r0: task do_patch: Started
NOTE: recipe file-5.46-r0: task do_patch: Started
NOTE: recipe elfutils-0.194-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.194.bb:do_deploy_source_date_epoch unihash changed to af6c51171eb7f6406edfc1bd35e24ab9e71d483653ed2ed236cf16fbe3d5a2be
NOTE: recipe libmpc-1.3.1-r0: task do_patch: Succeeded
NOTE: Running task 1177 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_deploy_source_date_epoch)
NOTE: recipe unzip-1_6.0-r0: task do_fetch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: Running task 1178 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_unpack)
NOTE: Running task 1180 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe libmpc-1.3.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe file-5.46-r0: task do_patch: Succeeded
NOTE: Running task 1181 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.46.bb:do_deploy_source_date_epoch)
NOTE: recipe unzip-1_6.0-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe file-5.46-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libmpc-1.3.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_deploy_source_date_epoch unihash changed to 6c2022089f187d601f87cc48cdef5d2fb652e8272489181f3997d0cac76d9116
NOTE: recipe unzip-1_6.0-r0: task do_unpack: Succeeded
NOTE: Running task 1182 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_patch)
NOTE: recipe unzip-1_6.0-r0: task do_patch: Started
NOTE: recipe file-5.46-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.46.bb:do_deploy_source_date_epoch unihash changed to 63f12d193c091e18619b389ade5cdb79ca0fc77ca22e530e0f14742f0f520a0a
NOTE: recipe musl-legacy-error-1.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_package unihash changed to 1ec2ed5ac824f1dcf0bd27c12d96284f8521221a32dd3e09740a40d2896c9a3f
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata became valid
NOTE: recipe musl-locales-1.0+git-r0: task do_fetch: Succeeded
NOTE: Running setscene task 541 of 641 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: Running task 1183 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_unpack)
NOTE: recipe python3-3.13.9-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 543 of 641 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 544 of 641 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 545 of 641 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 546 of 641 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 547 of 641 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 548 of 641 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_packagedata_setscene)
NOTE: Running setscene task 549 of 641 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 550 of 641 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 551 of 641 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 552 of 641 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_unpack: Started
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.7.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 553 of 641 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20251016-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 554 of 641 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 555 of 641 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 556 of 641 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 557 of 641 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 558 of 641 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.4.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.7.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 559 of 641 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 560 of 641 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 561 of 641 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.3.bb:do_packagedata_setscene)
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 562 of 641 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.51.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20251016-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 563 of 641 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.51.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 571 of 641 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.1.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.13.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe openssl-3.5.4-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.7.3-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.51.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 573 of 641 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: recipe musl-locales-1.0+git-r0: task do_unpack: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.13.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 575 of 641 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20251016-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 576 of 641 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 578 of 641 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 580 of 641 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.51.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.7.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 581 of 641 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 583 of 641 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 588 of 641 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.3.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 589 of 641 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.1.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/openssl/3.5.4/temp/log.do_packagedata_setscene.2464008
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.4.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 590 of 641 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.4.bb:do_package_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 593 of 641 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 594 of 641 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20251016-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.13.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.51.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.7.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1204 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_patch)
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.5.4-r0: task do_package_setscene: Started
NOTE: recipe python3-3.13.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.51.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.7.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/ncurses/6.5/temp/log.do_packagedata_setscene.2464400
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Succeeded
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 595 of 641 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_package_setscene)
NOTE: recipe musl-locales-1.0+git-r0: task do_patch: Started
NOTE: recipe ncurses-6.5-r0: task do_package_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_patch: Succeeded
NOTE: Running task 1237 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_generate_toolchain_file)
NOTE: Running task 1238 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_deploy_source_date_epoch)
NOTE: recipe unzip-1_6.0-r0: task do_patch: Succeeded
NOTE: Running task 1239 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 1240 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe musl-locales-1.0+git-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_generate_toolchain_file: Started
NOTE: recipe unzip-1_6.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe unzip-1_6.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe musl-locales-1.0+git-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_deploy_source_date_epoch unihash changed to 5b7fe71f2556a42e9999e513c453833d9d244d59e8e19766fce85a364314720b
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_deploy_source_date_epoch unihash changed to 12490959dcee34517be0aab54ae95fc6733fb1d6f6358d6cfce2ba7384e3a793
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 27a1287f03f8699e6a83b8e7203f6b85f617ccd1b7f11fa183cd486905f39fba
NOTE: recipe binutils-2.45.1-r0: task do_unpack: Succeeded
NOTE: Running task 1241 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.45.bb:do_patch)
NOTE: recipe binutils-2.45.1-r0: task do_patch: Started
NOTE: recipe binutils-2.45.1-r0: task do_patch: Succeeded
NOTE: Running task 1242 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.45.bb:do_deploy_source_date_epoch)
NOTE: recipe binutils-2.45.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe ncurses-6.5-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 596 of 641 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 598 of 641 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-2.45.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.45.bb:do_deploy_source_date_epoch unihash changed to da08b68b64827e31b3d79edd0d54618359e3d66ba64b414cb25eaf18aac5b72d
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 600 of 641 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.5.4-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 602 of 641 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 603 of 641 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 604 of 641 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 606 of 641 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 607 of 641 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 609 of 641 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 611 of 641 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 612 of 641 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 614 of 641 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_recipe_qa_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 616 of 641 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 618 of 641 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 619 of 641 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_packagedata_setscene)
NOTE: Running setscene task 620 of 641 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 621 of 641 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 622 of 641 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 628 of 641 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 629 of 641 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 630 of 641 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 634 of 641 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 637 of 641 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 639 of 641 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 641 of 641 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1370 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1374 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1375 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.58.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1455 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1460 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.18.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1505 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1517 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata)
NOTE: Running task 1518 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1519 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1520 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1528 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.4.bb:do_packagedata)
NOTE: Running task 1540 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.9.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1541 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe gmp-6.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1555 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-docutils_0.22.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgpg-error-1.58-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1576 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtasn1-4.20.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe json-c-0.18-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe zstd-1.5.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe fts-1.2.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ncurses-6.5-r0: task do_packagedata: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe openssl-3.5.4-r0: task do_packagedata: Started
NOTE: recipe sed-4.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bash-5.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-docutils-0.22.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe unzip-1_6.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe zstd-1.5.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1577 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_configure)
NOTE: recipe gmp-6.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1578 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_configure)
NOTE: recipe unzip-1_6.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libgpg-error-1.58-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1579 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_configure)
NOTE: Running task 1580 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.58.bb:do_configure)
NOTE: Running task 1581 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe zstd-1.5.7-r0: task do_configure: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe json-c-0.18-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1582 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.18.bb:do_configure)
NOTE: Running task 1583 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_configure)
NOTE: recipe sed-4.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_configure: Started
NOTE: Running task 1584 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_configure)
NOTE: Running task 1585 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_configure)
NOTE: recipe bash-5.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_configure: Started
NOTE: Running task 1586 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.9.bb:do_configure)
NOTE: recipe libgpg-error-1.58-r0: task do_configure: Started
NOTE: recipe zstd-1.5.7-r0: task do_configure: Succeeded
NOTE: Running task 1587 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_configure)
NOTE: Running task 1588 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_compile)
NOTE: recipe musl-locales-1.0+git-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ncurses-6.5-r0: task do_packagedata: Succeeded
NOTE: recipe openssl-3.5.4-r0: task do_packagedata: Succeeded
NOTE: Running task 1593 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_configure)
NOTE: recipe fts-1.2.7-r0: task do_configure: Started
NOTE: recipe json-c-0.18-r0: task do_configure: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_configure: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_configure: Started
NOTE: Running task 1629 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-docutils_0.22.4.bb:do_collect_spdx_deps)
NOTE: recipe sed-4.9-r0: task do_configure: Started
NOTE: recipe zstd-1.5.7-r0: task do_compile: Started
NOTE: recipe bash-5.3-r0: task do_configure: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1630 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_configure)
NOTE: recipe unzip-1_6.0-r0: task do_configure: Started
NOTE: recipe python3-docutils-0.22.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-docutils-0.22.4-r0: task do_collect_spdx_deps: Started
NOTE: Running task 1631 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-docutils_0.22.4.bb:do_configure)
NOTE: recipe libtasn1-4.20.0-r0: task do_configure: Started
NOTE: recipe unzip-1_6.0-r0: task do_configure: Succeeded
NOTE: recipe python3-docutils-0.22.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1632 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_compile)
NOTE: recipe python3-docutils-0.22.4-r0: task do_configure: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1633 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_configure)
NOTE: recipe unzip-1_6.0-r0: task do_compile: Started
NOTE: recipe python3-docutils-0.22.4-r0: task do_configure: Succeeded
NOTE: Running task 1634 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-docutils_0.22.4.bb:do_compile)
NOTE: recipe musl-locales-1.0+git-r0: task do_configure: Started
NOTE: recipe python3-docutils-0.22.4-r0: task do_compile: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_configure: Succeeded
NOTE: Running task 1635 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_compile)
NOTE: recipe musl-locales-1.0+git-r0: task do_compile: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_compile: Succeeded
NOTE: Running task 1636 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_install)
NOTE: recipe musl-locales-1.0+git-r0: task do_install: Started
NOTE: recipe python3-docutils-0.22.4-r0: task do_compile: Succeeded
NOTE: Running task 1637 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-docutils_0.22.4.bb:do_install)
NOTE: recipe python3-docutils-0.22.4-r0: task do_install: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_install: Succeeded
NOTE: Running task 1638 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_package)
NOTE: recipe musl-locales-1.0+git-r0: task do_package: Started
NOTE: recipe python3-docutils-0.22.4-r0: task do_install: Succeeded
NOTE: Running task 1639 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-docutils_0.22.4.bb:do_package)
NOTE: Running task 1640 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-docutils_0.22.4.bb:do_populate_sysroot)
NOTE: recipe python3-docutils-0.22.4-r0: task do_package: Started
NOTE: recipe python3-docutils-0.22.4-r0: task do_populate_sysroot: Started
NOTE: recipe python3-docutils-0.22.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe json-c-0.18-r0: task do_configure: Succeeded
NOTE: Running task 1641 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.18.bb:do_configure_ptest_base)
NOTE: recipe json-c-0.18-r0: task do_configure_ptest_base: Started
NOTE: recipe json-c-0.18-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1642 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.18.bb:do_compile)
NOTE: recipe json-c-0.18-r0: task do_compile: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_package: Succeeded
NOTE: Running task 1643 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata)
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_configure: Succeeded
NOTE: Running task 1644 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_compile)
NOTE: recipe argp-standalone-1.4.1-r0: task do_compile: Started
NOTE: recipe json-c-0.18-r0: task do_compile: Succeeded
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata: Succeeded
NOTE: Running task 1645 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.18.bb:do_compile_ptest_base)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata unihash changed to 4c51c1bb6bb3ba84952cabc20cc8d8533ddb8a948ec6c40095d5408d7d4fd3f5
NOTE: Setscene tasks completed
NOTE: recipe json-c-0.18-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-docutils-0.22.4-r0: task do_package: Succeeded
NOTE: recipe json-c-0.18-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1646 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.18.bb:do_install)
NOTE: Running task 1647 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-docutils_0.22.4.bb:do_packagedata)
NOTE: recipe python3-docutils-0.22.4-r0: task do_packagedata: Started
NOTE: recipe json-c-0.18-r0: task do_install: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_compile: Succeeded
NOTE: recipe json-c-0.18-r0: task do_install: Succeeded
NOTE: Running task 1648 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_install)
NOTE: recipe python3-docutils-0.22.4-r0: task do_packagedata: Succeeded
NOTE: Running task 1649 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.18.bb:do_install_ptest_base)
NOTE: Running task 1650 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-docutils_0.22.4.bb:do_create_spdx)
NOTE: Running task 1651 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-docutils_0.22.4.bb:do_package_write_ipk)
NOTE: Running task 1652 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-docutils_0.22.4.bb:do_package_write_deb)
NOTE: recipe argp-standalone-1.4.1-r0: task do_install: Started
NOTE: recipe json-c-0.18-r0: task do_install_ptest_base: Started
NOTE: recipe python3-docutils-0.22.4-r0: task do_create_spdx: Started
NOTE: recipe python3-docutils-0.22.4-r0: task do_package_write_ipk: Started
NOTE: recipe python3-docutils-0.22.4-r0: task do_package_write_deb: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_install: Succeeded
NOTE: Running task 1653 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_populate_sysroot)
NOTE: recipe json-c-0.18-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1654 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.18.bb:do_populate_sysroot)
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot: Started
NOTE: recipe json-c-0.18-r0: task do_populate_sysroot: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_configure: Succeeded
NOTE: Running task 1655 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_compile)
NOTE: recipe python3-docutils-0.22.4-r0: task do_create_spdx: Succeeded
NOTE: Running task 1656 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.18.bb:do_package)
NOTE: recipe musl-obstack-1.2.3-r0: task do_compile: Started
NOTE: recipe json-c-0.18-r0: task do_package: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-docutils-0.22.4-r0: task do_package_write_ipk: Succeeded
NOTE: Running task 1657 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_package)
NOTE: Running task 1658 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-docutils_0.22.4.bb:do_create_package_spdx)
NOTE: recipe json-c-0.18-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1659 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-docutils_0.22.4.bb:do_package_write_rpm)
NOTE: recipe fts-1.2.7-r0: task do_configure: Succeeded
NOTE: Running task 1660 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_compile)
NOTE: recipe argp-standalone-1.4.1-r0: task do_package: Started
NOTE: recipe python3-docutils-0.22.4-r0: task do_create_package_spdx: Started
NOTE: recipe fts-1.2.7-r0: task do_compile: Started
NOTE: recipe python3-docutils-0.22.4-r0: task do_package_write_rpm: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_compile: Succeeded
NOTE: Running task 1661 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_install)
NOTE: recipe musl-obstack-1.2.3-r0: task do_install: Started
NOTE: recipe python3-docutils-0.22.4-r0: task do_create_package_spdx: Succeeded
NOTE: Running task 1662 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-docutils_0.22.4.bb:do_package_qa)
NOTE: recipe python3-docutils-0.22.4-r0: task do_package_qa: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_install: Succeeded
NOTE: Running task 1663 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_populate_sysroot)
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot: Started
NOTE: recipe fts-1.2.7-r0: task do_compile: Succeeded
NOTE: Running task 1664 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_install)
NOTE: recipe fts-1.2.7-r0: task do_install: Started
NOTE: recipe python3-docutils-0.22.4-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 1665 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_package)
NOTE: recipe python3-docutils-0.22.4-r0: task do_package_write_deb: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_configure: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-docutils-0.22.4-r0: task do_package_qa: Succeeded
NOTE: Running task 1666 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_configure_ptest_base)
NOTE: recipe musl-obstack-1.2.3-r0: task do_package: Started
NOTE: recipe fts-1.2.7-r0: task do_install: Succeeded
NOTE: Running task 1667 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_populate_sysroot)
NOTE: Running task 1668 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_package)
NOTE: recipe libseccomp-2.6.0-r0: task do_configure_ptest_base: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1669 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_compile)
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot: Started
NOTE: recipe fts-1.2.7-r0: task do_package: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_compile: Started
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_package: Succeeded
NOTE: Running task 1670 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata)
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata unihash changed to 7f49be642bb639bbe9ed34228c06f36b97ddd8b31314722276d41cf1c3336fbb
NOTE: recipe unzip-1_6.0-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1671 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_install)
NOTE: recipe unzip-1_6.0-r0: task do_install: Started
NOTE: recipe json-c-0.18-r0: task do_package: Succeeded
NOTE: Running task 1672 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.18.bb:do_packagedata)
NOTE: recipe unzip-1_6.0-r0: task do_install: Succeeded
NOTE: Running task 1673 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_package)
NOTE: recipe json-c-0.18-r0: task do_packagedata: Started
NOTE: recipe unzip-1_6.0-r0: task do_package: Started
NOTE: recipe json-c-0.18-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.18.bb:do_packagedata unihash changed to c2a0458b8569a7ae6e8888e7c42119d1b05bec0ffa2db0e8d3c1455ca9ce308f
NOTE: Setscene tasks completed
NOTE: recipe musl-obstack-1.2.3-r0: task do_package: Succeeded
NOTE: Running task 1674 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_packagedata)
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata: Started
NOTE: recipe fts-1.2.7-r0: task do_package: Succeeded
NOTE: Running task 1675 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata)
NOTE: recipe fts-1.2.7-r0: task do_packagedata: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_packagedata unihash changed to 587480216c138cead431b560bdc8c92e2cd052fd6f8b1e835df9187d51152473
NOTE: Setscene tasks completed
NOTE: recipe fts-1.2.7-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata unihash changed to 27537be7b33976bf4ecf2d0881983231a1d75dac1bbf01a26304e17fcb2f3eac
NOTE: Setscene tasks completed
NOTE: recipe libgpg-error-1.58-r0: task do_configure: Succeeded
NOTE: Running task 1676 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.58.bb:do_configure_ptest_base)
NOTE: recipe libgpg-error-1.58-r0: task do_configure_ptest_base: Started
NOTE: recipe libgpg-error-1.58-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1677 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.58.bb:do_compile)
NOTE: recipe libgpg-error-1.58-r0: task do_compile: Started
NOTE: recipe unzip-1_6.0-r0: task do_package: Succeeded
NOTE: Running task 1678 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata)
NOTE: recipe unzip-1_6.0-r0: task do_packagedata: Started
NOTE: recipe unzip-1_6.0-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata unihash changed to 51c1c1dd8a3dcdfb4d05e4b1e070c0389185bc1407b4c50a977b1418221c91df
NOTE: Setscene tasks completed
NOTE: recipe libseccomp-2.6.0-r0: task do_compile: Succeeded
NOTE: Running task 1679 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_compile_ptest_base)
NOTE: recipe libseccomp-2.6.0-r0: task do_compile_ptest_base: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1680 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_install)
NOTE: recipe libseccomp-2.6.0-r0: task do_install: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_install: Succeeded
NOTE: Running task 1681 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_install_ptest_base)
NOTE: recipe libseccomp-2.6.0-r0: task do_install_ptest_base: Started
NOTE: recipe bash-5.3-r0: task do_configure: Succeeded
NOTE: Running task 1682 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_configure_ptest_base)
NOTE: recipe bash-5.3-r0: task do_configure_ptest_base: Started
NOTE: recipe bash-5.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1683 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_compile)
NOTE: recipe bash-5.3-r0: task do_compile: Started
NOTE: recipe libgpg-error-1.58-r0: task do_compile: Succeeded
NOTE: Running task 1684 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.58.bb:do_compile_ptest_base)
NOTE: recipe gmp-6.3.0-r0: task do_configure: Succeeded
NOTE: recipe libgpg-error-1.58-r0: task do_compile_ptest_base: Started
NOTE: Running task 1685 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_compile)
NOTE: recipe libgpg-error-1.58-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1686 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.58.bb:do_install)
NOTE: recipe gmp-6.3.0-r0: task do_compile: Started
NOTE: recipe libgpg-error-1.58-r0: task do_install: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_configure: Succeeded
NOTE: Running task 1687 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_compile)
NOTE: recipe libtasn1-4.20.0-r0: task do_compile: Started
NOTE: recipe sed-4.9-r0: task do_configure: Succeeded
NOTE: Running task 1688 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.9.bb:do_configure_ptest_base)
NOTE: recipe sed-4.9-r0: task do_configure_ptest_base: Started
NOTE: recipe sed-4.9-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1689 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.9.bb:do_compile)
NOTE: recipe sed-4.9-r0: task do_compile: Started
NOTE: recipe libgpg-error-1.58-r0: task do_install: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1690 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.58.bb:do_install_ptest_base)
NOTE: Running task 1691 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_populate_sysroot)
NOTE: Running task 1692 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_package)
NOTE: recipe libgpg-error-1.58-r0: task do_install_ptest_base: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_populate_sysroot: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_package: Started
NOTE: recipe libgpg-error-1.58-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1693 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.58.bb:do_populate_sysroot)
NOTE: Running task 1694 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.58.bb:do_package)
NOTE: recipe libgpg-error-1.58-r0: task do_populate_sysroot: Started
NOTE: recipe libgpg-error-1.58-r0: task do_package: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libgpg-error-1.58-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1695 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgcrypt-1.11.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgcrypt-1.11.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1696 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_configure)
NOTE: recipe libgcrypt-1.11.2-r0: task do_configure: Started
NOTE: recipe sed-4.9-r0: task do_compile: Succeeded
NOTE: Running task 1697 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.9.bb:do_compile_ptest_base)
NOTE: recipe sed-4.9-r0: task do_compile_ptest_base: Started
NOTE: recipe bash-5.3-r0: task do_compile: Succeeded
NOTE: Running task 1698 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_compile_ptest_base)
NOTE: recipe sed-4.9-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe bash-5.3-r0: task do_compile_ptest_base: Started
NOTE: Running task 1699 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.9.bb:do_install)
NOTE: recipe bash-5.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1700 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_install)
NOTE: recipe sed-4.9-r0: task do_install: Started
NOTE: recipe bash-5.3-r0: task do_install: Started
NOTE: recipe libgpg-error-1.58-r0: task do_package: Succeeded
NOTE: Running task 1701 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.58.bb:do_packagedata)
NOTE: recipe libgpg-error-1.58-r0: task do_packagedata: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_compile: Succeeded
NOTE: Running task 1702 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_install)
NOTE: recipe libgpg-error-1.58-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.58.bb:do_packagedata unihash changed to d5784eff3a5843a1fe6c6d4be651877acfd09850a0a7cbbbc7b2a843b3aa2ae4
NOTE: Setscene tasks completed
NOTE: recipe libtasn1-4.20.0-r0: task do_install: Started
NOTE: recipe sed-4.9-r0: task do_install: Succeeded
NOTE: Running task 1703 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.9.bb:do_install_ptest_base)
NOTE: recipe sed-4.9-r0: task do_install_ptest_base: Started
NOTE: recipe sed-4.9-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1704 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.9.bb:do_package)
NOTE: recipe sed-4.9-r0: task do_package: Started
NOTE: recipe zstd-1.5.7-r0: task do_compile: Succeeded
NOTE: Running task 1705 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_install)
NOTE: recipe libseccomp-2.6.0-r0: task do_package: Succeeded
NOTE: Running task 1706 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_packagedata)
NOTE: recipe zstd-1.5.7-r0: task do_install: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_install: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1707 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_populate_sysroot)
NOTE: Running task 1708 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_package)
NOTE: recipe libtasn1-4.20.0-r0: task do_populate_sysroot: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_package: Started
NOTE: recipe gmp-6.3.0-r0: task do_compile: Succeeded
NOTE: Running task 1709 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_install)
NOTE: recipe bash-5.3-r0: task do_install: Succeeded
NOTE: recipe libtasn1-4.20.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1710 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_install_ptest_base)
NOTE: recipe gmp-6.3.0-r0: task do_install: Started
NOTE: recipe bash-5.3-r0: task do_install_ptest_base: Started
NOTE: recipe bash-5.3-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1711 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_package)
NOTE: recipe bash-5.3-r0: task do_package: Started
NOTE: recipe gmp-6.3.0-r0: task do_install: Succeeded
NOTE: Running task 1713 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_3.10.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1714 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.9.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1715 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_package)
NOTE: Running task 1716 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtasn1-4.20.0-r0: task do_package: Succeeded
NOTE: Running task 1717 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_packagedata)
NOTE: recipe nettle-3.10.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gmp-6.3.0-r0: task do_package: Started
NOTE: recipe mpfr-4.2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe coreutils-9.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_packagedata: Started
NOTE: recipe mpfr-4.2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe nettle-3.10.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1718 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_configure)
NOTE: Running task 1719 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_3.10.2.bb:do_configure)
NOTE: recipe coreutils-9.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1720 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.9.bb:do_configure)
NOTE: recipe libtasn1-4.20.0-r0: task do_packagedata: Succeeded
NOTE: recipe mpfr-4.2.2-r0: task do_configure: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_packagedata unihash changed to db8ba2d8b3153a26d92665f63b424f8f5c1b30b08c0c903ee04c5a97c214fafd
NOTE: recipe nettle-3.10.2-r0: task do_configure: Started
NOTE: recipe coreutils-9.9-r0: task do_configure: Started
NOTE: Setscene tasks completed
NOTE: recipe sed-4.9-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.9.bb:do_package unihash changed to f661134cc23b01bfa87582216efc4578a9b5f786bd381c55802637c17f6340ec
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata became valid
NOTE: Running setscene task 641 of 641 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_package unihash changed to 61a20b8c10b733e898f578d171ae959dea2cc03b70fabe33136e3818ba6729a7
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata became valid
NOTE: Running setscene task 641 of 641 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe nettle-3.10.2-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1723 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_3.10.2.bb:do_configure_ptest_base)
NOTE: recipe nettle-3.10.2-r0: task do_configure_ptest_base: Started
NOTE: recipe nettle-3.10.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1724 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_3.10.2.bb:do_compile)
NOTE: recipe nettle-3.10.2-r0: task do_compile: Started
NOTE: recipe libgcrypt-1.11.2-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1725 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_configure_ptest_base)
NOTE: recipe libgcrypt-1.11.2-r0: task do_configure_ptest_base: Started
NOTE: recipe libgcrypt-1.11.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1726 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_compile)
NOTE: recipe libgcrypt-1.11.2-r0: task do_compile: Started
NOTE: recipe bash-5.3-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_package unihash changed to 40d76e91b7d618d0ade6c93bf126e4f9902a57e609ddb91a7c3cd4ad92b19f6f
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_packagedata became valid
NOTE: Running setscene task 641 of 641 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_packagedata_setscene)
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe mpfr-4.2.2-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1728 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_compile)
NOTE: recipe mpfr-4.2.2-r0: task do_compile: Started
NOTE: recipe zstd-1.5.7-r0: task do_install: Succeeded
NOTE: Running task 1729 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_populate_sysroot)
NOTE: Running task 1730 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_package)
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot: Started
NOTE: recipe zstd-1.5.7-r0: task do_package: Started
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1731 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libarchive-3.8.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libarchive-3.8.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1732 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.4.bb:do_configure)
NOTE: recipe libarchive-3.8.4-r0: task do_configure: Started
NOTE: recipe nettle-3.10.2-r0: task do_compile: Succeeded
NOTE: Running task 1733 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_3.10.2.bb:do_compile_ptest_base)
NOTE: recipe nettle-3.10.2-r0: task do_compile_ptest_base: Started
NOTE: recipe mpfr-4.2.2-r0: task do_compile: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_package: Succeeded
NOTE: Running task 1734 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_install)
NOTE: Running task 1735 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata)
NOTE: recipe mpfr-4.2.2-r0: task do_install: Started
NOTE: recipe zstd-1.5.7-r0: task do_packagedata: Started
NOTE: recipe zstd-1.5.7-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata unihash changed to e1801cf1ac5439c2bc2f692fee22602315f544e4960e0e2e731d913f9f11224e
NOTE: recipe nettle-3.10.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1736 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_3.10.2.bb:do_install)
NOTE: recipe nettle-3.10.2-r0: task do_install: Started
NOTE: recipe mpfr-4.2.2-r0: task do_install: Succeeded
NOTE: Running task 1738 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1739 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_package)
NOTE: recipe libmpc-1.3.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mpfr-4.2.2-r0: task do_package: Started
NOTE: recipe libmpc-1.3.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1740 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_configure)
NOTE: recipe libmpc-1.3.1-r0: task do_configure: Started
NOTE: recipe nettle-3.10.2-r0: task do_install: Succeeded
NOTE: Running task 1741 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_3.10.2.bb:do_install_ptest_base)
NOTE: recipe nettle-3.10.2-r0: task do_install_ptest_base: Started
NOTE: recipe libgcrypt-1.11.2-r0: task do_compile: Succeeded
NOTE: Running task 1742 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_compile_ptest_base)
NOTE: recipe libgcrypt-1.11.2-r0: task do_compile_ptest_base: Started
NOTE: recipe libgcrypt-1.11.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1743 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_install)
NOTE: recipe nettle-3.10.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1744 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_3.10.2.bb:do_populate_sysroot)
NOTE: Running task 1745 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_3.10.2.bb:do_package)
NOTE: recipe libgcrypt-1.11.2-r0: task do_install: Started
NOTE: recipe nettle-3.10.2-r0: task do_populate_sysroot: Started
NOTE: recipe nettle-3.10.2-r0: task do_package: Started
NOTE: recipe mpfr-4.2.2-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_package unihash changed to 806132841eb831260468f710d1301cb1f8de1377970481d280773780a85dbf28
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_packagedata became valid
NOTE: Running setscene task 640 of 641 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_packagedata_setscene)
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.10.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1746 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.11.bb:do_prepare_recipe_sysroot)
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libgcrypt-1.11.2-r0: task do_install: Succeeded
NOTE: Running task 1748 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_install_ptest_base)
NOTE: recipe gnutls-3.8.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgcrypt-1.11.2-r0: task do_install_ptest_base: Started
NOTE: recipe gnutls-3.8.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1749 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.11.bb:do_configure)
NOTE: recipe libgcrypt-1.11.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1750 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_populate_sysroot)
NOTE: Running task 1751 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_package)
NOTE: recipe gnutls-3.8.11-r0: task do_configure: Started
NOTE: recipe libgcrypt-1.11.2-r0: task do_populate_sysroot: Started
NOTE: recipe libgcrypt-1.11.2-r0: task do_package: Started
NOTE: recipe libgcrypt-1.11.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libmpc-1.3.1-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1752 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_compile)
NOTE: recipe libgcrypt-1.11.2-r0: task do_package: Succeeded
NOTE: Running task 1753 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_packagedata)
NOTE: recipe libmpc-1.3.1-r0: task do_compile: Started
NOTE: recipe libgcrypt-1.11.2-r0: task do_packagedata: Started
NOTE: recipe libgcrypt-1.11.2-r0: task do_packagedata: Succeeded
NOTE: recipe nettle-3.10.2-r0: task do_package: Succeeded
NOTE: Running task 1754 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_3.10.2.bb:do_packagedata)
NOTE: recipe nettle-3.10.2-r0: task do_packagedata: Started
NOTE: recipe nettle-3.10.2-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_3.10.2.bb:do_packagedata unihash changed to 4aa88ecbc27a3f9ce116fa574993f2ec8aa987fc6ae0a1172561b37557459da7
NOTE: recipe libmpc-1.3.1-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1755 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_install)
NOTE: recipe libmpc-1.3.1-r0: task do_install: Started
NOTE: recipe libmpc-1.3.1-r0: task do_install: Succeeded
NOTE: Running task 1756 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_populate_sysroot)
NOTE: Running task 1757 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_package)
NOTE: recipe libmpc-1.3.1-r0: task do_populate_sysroot: Started
NOTE: recipe libmpc-1.3.1-r0: task do_package: Started
NOTE: recipe libmpc-1.3.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1758 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_15.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe gcc-15.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gcc-15.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1759 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_15.2.bb:do_configure)
NOTE: recipe gcc-15.2.0-r0: task do_configure: Started
NOTE: recipe libmpc-1.3.1-r0: task do_package: Succeeded
NOTE: Running task 1760 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_packagedata)
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata: Started
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_packagedata unihash changed to 0e37f4b5e48d98ee73208b45ede7c85b69ebcc03a53c35311a2d3d3818990dd1
NOTE: Setscene tasks completed
NOTE: recipe gcc-15.2.0-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1761 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_15.2.bb:do_compile)
NOTE: recipe gcc-15.2.0-r0: task do_compile: Started
NOTE: recipe libarchive-3.8.4-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1762 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.4.bb:do_compile)
NOTE: recipe libarchive-3.8.4-r0: task do_compile: Started
NOTE: recipe libarchive-3.8.4-r0: task do_compile: Succeeded
NOTE: Running task 1763 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.4.bb:do_install)
NOTE: recipe libarchive-3.8.4-r0: task do_install: Started
NOTE: recipe libarchive-3.8.4-r0: task do_install: Succeeded
NOTE: Running task 1764 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.4.bb:do_populate_sysroot)
NOTE: Running task 1765 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.4.bb:do_package)
NOTE: recipe libarchive-3.8.4-r0: task do_populate_sysroot: Started
NOTE: recipe libarchive-3.8.4-r0: task do_package: Started
NOTE: recipe libarchive-3.8.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libarchive-3.8.4-r0: task do_package: Succeeded
NOTE: Running task 1766 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.4.bb:do_packagedata)
NOTE: recipe libarchive-3.8.4-r0: task do_packagedata: Started
NOTE: recipe libarchive-3.8.4-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.4.bb:do_packagedata unihash changed to c91550a79ab3d2cb91bece6f17a8213025d6a28fcf22176c07a721f220831fa0
NOTE: Setscene tasks completed
NOTE: recipe coreutils-9.9-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1767 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.9.bb:do_configure_ptest_base)
NOTE: recipe coreutils-9.9-r0: task do_configure_ptest_base: Started
NOTE: recipe coreutils-9.9-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1768 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.9.bb:do_compile)
NOTE: recipe coreutils-9.9-r0: task do_compile: Started
NOTE: recipe coreutils-9.9-r0: task do_compile: Succeeded
NOTE: Running task 1769 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.9.bb:do_compile_ptest_base)
NOTE: recipe coreutils-9.9-r0: task do_compile_ptest_base: Started
NOTE: recipe coreutils-9.9-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1770 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.9.bb:do_install)
NOTE: recipe coreutils-9.9-r0: task do_install: Started
NOTE: recipe coreutils-9.9-r0: task do_install: Succeeded
NOTE: Running task 1771 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.9.bb:do_install_ptest_base)
NOTE: recipe coreutils-9.9-r0: task do_install_ptest_base: Started
NOTE: recipe coreutils-9.9-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1772 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.9.bb:do_package)
NOTE: recipe coreutils-9.9-r0: task do_package: Started
NOTE: recipe gnutls-3.8.11-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1773 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.11.bb:do_configure_ptest_base)
NOTE: recipe gnutls-3.8.11-r0: task do_configure_ptest_base: Started
NOTE: recipe gnutls-3.8.11-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1774 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.11.bb:do_compile)
NOTE: recipe gnutls-3.8.11-r0: task do_compile: Started
NOTE: recipe coreutils-9.9-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.9.bb:do_package unihash changed to ec1543722927e6a8827cef423d93ffd1f8a477bf0e2e40e08db85ebb55e406f0
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.9.bb:do_packagedata became valid
NOTE: Running setscene task 641 of 641 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.9.bb:do_packagedata_setscene)
NOTE: recipe coreutils-9.9-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe lzlib-1.15-r0: task do_fetch: Succeeded
NOTE: Running task 1776 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.15.bb:do_unpack)
NOTE: Running task 1777 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.15.bb:do_prepare_recipe_sysroot)
NOTE: recipe lzlib-1.15-r0: task do_unpack: Started
NOTE: recipe lzlib-1.15-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lzlib-1.15-r0: task do_unpack: Succeeded
NOTE: Running task 1778 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.15.bb:do_patch)
NOTE: recipe lzlib-1.15-r0: task do_patch: Started
NOTE: recipe lzlib-1.15-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe lzlib-1.15-r0: task do_patch: Succeeded
NOTE: Running task 1779 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.15.bb:do_deploy_source_date_epoch)
NOTE: recipe lzlib-1.15-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lzlib-1.15-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.15.bb:do_deploy_source_date_epoch unihash changed to 3a30f9528634fec95720d64c1699145f4e0b971d5704b114793d0404b37bd872
NOTE: Setscene tasks completed
NOTE: Running task 1780 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.15.bb:do_configure)
NOTE: recipe lzlib-1.15-r0: task do_configure: Started
NOTE: recipe lzlib-1.15-r0: task do_configure: Succeeded
NOTE: Running task 1781 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.15.bb:do_compile)
NOTE: recipe lzlib-1.15-r0: task do_compile: Started
NOTE: recipe lzlib-1.15-r0: task do_compile: Succeeded
NOTE: Running task 1782 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.15.bb:do_install)
NOTE: recipe lzlib-1.15-r0: task do_install: Started
NOTE: recipe lzlib-1.15-r0: task do_install: Succeeded
NOTE: Running task 1783 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.15.bb:do_populate_sysroot)
NOTE: Running task 1784 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.15.bb:do_package)
NOTE: recipe lzlib-1.15-r0: task do_populate_sysroot: Started
NOTE: recipe lzlib-1.15-r0: task do_package: Started
NOTE: recipe lzlib-1.15-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1785 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.46.bb:do_prepare_recipe_sysroot)
NOTE: recipe file-5.46-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe file-5.46-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1786 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.46.bb:do_configure)
NOTE: recipe file-5.46-r0: task do_configure: Started
NOTE: recipe lzlib-1.15-r0: task do_package: Succeeded
NOTE: Running task 1787 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.15.bb:do_packagedata)
NOTE: recipe lzlib-1.15-r0: task do_packagedata: Started
NOTE: recipe lzlib-1.15-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.15.bb:do_packagedata unihash changed to decd639df421c02b1ece87bf7814904015c8a1219f637672b49048ad5382120d
NOTE: Setscene tasks completed
NOTE: recipe gnutls-3.8.11-r0: task do_compile: Succeeded
NOTE: Running task 1788 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.11.bb:do_compile_ptest_base)
NOTE: recipe gnutls-3.8.11-r0: task do_compile_ptest_base: Started
NOTE: recipe gnutls-3.8.11-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1789 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.11.bb:do_install)
NOTE: recipe gnutls-3.8.11-r0: task do_install: Started
NOTE: recipe gnutls-3.8.11-r0: task do_install: Succeeded
NOTE: Running task 1790 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.11.bb:do_install_ptest_base)
NOTE: recipe gnutls-3.8.11-r0: task do_install_ptest_base: Started
NOTE: recipe file-5.46-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1791 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.46.bb:do_compile)
NOTE: recipe file-5.46-r0: task do_compile: Started
NOTE: recipe file-5.46-r0: task do_compile: Succeeded
NOTE: Running task 1792 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.46.bb:do_install)
NOTE: recipe file-5.46-r0: task do_install: Started
NOTE: recipe file-5.46-r0: task do_install: Succeeded
NOTE: Running task 1793 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.46.bb:do_populate_sysroot)
NOTE: Running task 1794 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.46.bb:do_package)
NOTE: recipe file-5.46-r0: task do_populate_sysroot: Started
NOTE: recipe file-5.46-r0: task do_package: Started
NOTE: recipe file-5.46-r0: task do_populate_sysroot: Succeeded
NOTE: recipe file-5.46-r0: task do_package: Succeeded
NOTE: Running task 1795 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.46.bb:do_packagedata)
NOTE: recipe file-5.46-r0: task do_packagedata: Started
NOTE: recipe file-5.46-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.46.bb:do_packagedata unihash changed to c79a794d80994e9d57af233f497024b5c3dfa6824f3c2027880001002de92d0e
NOTE: Setscene tasks completed
NOTE: recipe gnutls-3.8.11-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1796 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.11.bb:do_populate_sysroot)
NOTE: Running task 1797 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.11.bb:do_package)
NOTE: recipe gnutls-3.8.11-r0: task do_populate_sysroot: Started
NOTE: recipe gnutls-3.8.11-r0: task do_package: Started
NOTE: recipe gnutls-3.8.11-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1798 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1799 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_configure)
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_configure: Started
NOTE: recipe gnutls-3.8.11-r0: task do_package: Succeeded
NOTE: Running task 1800 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.11.bb:do_packagedata)
NOTE: recipe gnutls-3.8.11-r0: task do_packagedata: Started
NOTE: recipe gnutls-3.8.11-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.11.bb:do_packagedata unihash changed to caa0a20857aaae8ae8ae8e025049ee6486ef0cc14330d340174b9c8c7f62b461
NOTE: Setscene tasks completed
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1801 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_compile)
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_compile: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_compile: Succeeded
NOTE: Running task 1802 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_install)
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_install: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_install: Succeeded
NOTE: Running task 1803 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_populate_sysroot)
NOTE: Running task 1804 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_package)
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_populate_sysroot: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_package: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1805 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.194.bb:do_prepare_recipe_sysroot)
NOTE: recipe elfutils-0.194-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe elfutils-0.194-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1806 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.194.bb:do_configure)
NOTE: recipe elfutils-0.194-r0: task do_configure: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_package: Succeeded
NOTE: Running task 1807 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_packagedata)
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_packagedata: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_packagedata unihash changed to 543d9724f92f8427d13adeed455aba0fbb39bb4c7acc0dd7a1e64890ae9df979
NOTE: Setscene tasks completed
NOTE: recipe elfutils-0.194-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1808 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.194.bb:do_configure_ptest_base)
NOTE: recipe elfutils-0.194-r0: task do_configure_ptest_base: Started
NOTE: recipe elfutils-0.194-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1809 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.194.bb:do_compile)
NOTE: recipe elfutils-0.194-r0: task do_compile: Started
NOTE: recipe elfutils-0.194-r0: task do_compile: Succeeded
NOTE: Running task 1810 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.194.bb:do_compile_ptest_base)
NOTE: recipe elfutils-0.194-r0: task do_compile_ptest_base: Started
NOTE: recipe elfutils-0.194-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1811 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.194.bb:do_install)
NOTE: recipe elfutils-0.194-r0: task do_install: Started
NOTE: recipe elfutils-0.194-r0: task do_install: Succeeded
NOTE: Running task 1812 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.194.bb:do_install_ptest_base)
NOTE: recipe elfutils-0.194-r0: task do_install_ptest_base: Started
NOTE: recipe elfutils-0.194-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1813 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.194.bb:do_populate_sysroot)
NOTE: Running task 1814 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.194.bb:do_package)
NOTE: recipe elfutils-0.194-r0: task do_populate_sysroot: Started
NOTE: recipe elfutils-0.194-r0: task do_package: Started
NOTE: recipe elfutils-0.194-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1815 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.45.bb:do_prepare_recipe_sysroot)
NOTE: recipe binutils-2.45.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe binutils-2.45.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1816 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.45.bb:do_configure)
NOTE: recipe binutils-2.45.1-r0: task do_configure: Started
NOTE: recipe binutils-2.45.1-r0: task do_configure: Succeeded
NOTE: Running task 1817 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.45.bb:do_compile)
NOTE: recipe binutils-2.45.1-r0: task do_compile: Started
NOTE: recipe elfutils-0.194-r0: task do_package: Succeeded
NOTE: Running task 1818 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.194.bb:do_packagedata)
NOTE: recipe elfutils-0.194-r0: task do_packagedata: Started
NOTE: recipe elfutils-0.194-r0: task do_packagedata: Succeeded
NOTE: recipe gcc-15.2.0-r0: task do_compile: Succeeded
NOTE: Running task 1819 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_15.2.bb:do_install)
NOTE: recipe gcc-15.2.0-r0: task do_install: Started
NOTE: recipe binutils-2.45.1-r0: task do_compile: Succeeded
NOTE: Running task 1820 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.45.bb:do_install)
NOTE: recipe binutils-2.45.1-r0: task do_install: Started
NOTE: recipe binutils-2.45.1-r0: task do_install: Succeeded
NOTE: Running task 1821 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.45.bb:do_package)
NOTE: recipe binutils-2.45.1-r0: task do_package: Started
NOTE: recipe gcc-15.2.0-r0: task do_install: Succeeded
NOTE: Running task 1822 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_15.2.bb:do_package)
NOTE: recipe gcc-15.2.0-r0: task do_package: Started
NOTE: recipe binutils-2.45.1-r0: task do_package: Succeeded
NOTE: Running task 1823 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.45.bb:do_packagedata)
NOTE: recipe binutils-2.45.1-r0: task do_packagedata: Started
NOTE: recipe binutils-2.45.1-r0: task do_packagedata: Succeeded
NOTE: recipe gcc-15.2.0-r0: task do_package: Succeeded
NOTE: Running task 1824 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_15.2.bb:do_packagedata)
NOTE: recipe gcc-15.2.0-r0: task do_packagedata: Started
NOTE: recipe gcc-15.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1825 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_package_write_ipk)
NOTE: Running task 1826 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_package_write_deb)
NOTE: Running task 1827 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_package_write_rpm)
NOTE: Running task 1828 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_package_qa)
NOTE: recipe python3-3.13.9-r0: task do_package_write_deb: Started
NOTE: recipe python3-3.13.9-r0: task do_package_write_ipk: Started
NOTE: recipe python3-3.13.9-r0: task do_package_write_rpm: Started
NOTE: recipe python3-3.13.9-r0: task do_package_qa: Started
NOTE: recipe python3-3.13.9-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_package_qa unihash changed to 7f21599e0cce88a939841c668d472613a56b15fd9d655ef4143a5a09d8480c53
NOTE: recipe python3-3.13.9-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-3.13.9-r0: task do_package_write_deb: Succeeded
NOTE: recipe python3-3.13.9-r0: task do_package_write_ipk: Succeeded
NOTE: Running noexec task 1829 of 1829 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-docutils_0.22.4.bb:do_build)
NOTE: Tasks Summary: Attempted 1829 tasks of which 1487 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 39 ERROR messages, returning a non-zero exit code.
ERROR: openssl-3.5.4-r0 do_packagedata_setscene: QA Issue: Package version for package openssl-src went backwards which would break package feeds (from 0:3.6.0-r0 to 0:3.5.4-r0) [version-going-backwards]
ERROR: openssl-3.5.4-r0 do_packagedata_setscene: QA Issue: Package version for package openssl-dbg went backwards which would break package feeds (from 0:3.6.0-r0 to 0:3.5.4-r0) [version-going-backwards]
ERROR: openssl-3.5.4-r0 do_packagedata_setscene: QA Issue: Package version for package libcrypto went backwards which would break package feeds (from 0:3.6.0-r0 to 0:3.5.4-r0) [version-going-backwards]
ERROR: openssl-3.5.4-r0 do_packagedata_setscene: QA Issue: Package version for package libssl went backwards which would break package feeds (from 0:3.6.0-r0 to 0:3.5.4-r0) [version-going-backwards]
ERROR: openssl-3.5.4-r0 do_packagedata_setscene: QA Issue: Package version for package openssl-conf went backwards which would break package feeds (from 0:3.6.0-r0 to 0:3.5.4-r0) [version-going-backwards]
ERROR: openssl-3.5.4-r0 do_packagedata_setscene: QA Issue: Package version for package openssl-engines went backwards which would break package feeds (from 0:3.6.0-r0 to 0:3.5.4-r0) [version-going-backwards]
ERROR: openssl-3.5.4-r0 do_packagedata_setscene: QA Issue: Package version for package openssl-misc went backwards which would break package feeds (from 0:3.6.0-r0 to 0:3.5.4-r0) [version-going-backwards]
ERROR: openssl-3.5.4-r0 do_packagedata_setscene: QA Issue: Package version for package openssl-ossl-module-legacy went backwards which would break package feeds (from 0:3.6.0-r0 to 0:3.5.4-r0) [version-going-backwards]
ERROR: openssl-3.5.4-r0 do_packagedata_setscene: QA Issue: Package version for package openssl-ossl-module-fips went backwards which would break package feeds (from 0:3.6.0-r0 to 0:3.5.4-r0) [version-going-backwards]
ERROR: openssl-3.5.4-r0 do_packagedata_setscene: QA Issue: Package version for package openssl-ptest went backwards which would break package feeds (from 0:3.6.0-r0 to 0:3.5.4-r0) [version-going-backwards]
ERROR: openssl-3.5.4-r0 do_packagedata_setscene: QA Issue: Package version for package openssl-staticdev went backwards which would break package feeds (from 0:3.6.0-r0 to 0:3.5.4-r0) [version-going-backwards]
ERROR: openssl-3.5.4-r0 do_packagedata_setscene: QA Issue: Package version for package openssl-dev went backwards which would break package feeds (from 0:3.6.0-r0 to 0:3.5.4-r0) [version-going-backwards]
ERROR: openssl-3.5.4-r0 do_packagedata_setscene: QA Issue: Package version for package openssl-doc went backwards which would break package feeds (from 0:3.6.0-r0 to 0:3.5.4-r0) [version-going-backwards]
ERROR: openssl-3.5.4-r0 do_packagedata_setscene: QA Issue: Package version for package openssl-locale went backwards which would break package feeds (from 0:3.6.0-r0 to 0:3.5.4-r0) [version-going-backwards]
ERROR: openssl-3.5.4-r0 do_packagedata_setscene: QA Issue: Package version for package openssl-bin went backwards which would break package feeds (from 0:3.6.0-r0 to 0:3.5.4-r0) [version-going-backwards]
ERROR: openssl-3.5.4-r0 do_packagedata_setscene: QA Issue: Package version for package openssl went backwards which would break package feeds (from 0:3.6.0-r0 to 0:3.5.4-r0) [version-going-backwards]
ERROR: openssl-3.5.4-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: ncurses-6.5-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-src went backwards which would break package feeds (from 0:6.6-r0 to 0:6.5-r0) [version-going-backwards]
ERROR: ncurses-6.5-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-dbg went backwards which would break package feeds (from 0:6.6-r0 to 0:6.5-r0) [version-going-backwards]
ERROR: ncurses-6.5-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-libtinfo went backwards which would break package feeds (from 0:6.6-r0 to 0:6.5-r0) [version-going-backwards]
ERROR: ncurses-6.5-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-libncursesw went backwards which would break package feeds (from 0:6.6-r0 to 0:6.5-r0) [version-going-backwards]
ERROR: ncurses-6.5-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-libncurses went backwards which would break package feeds (from 0:6.6-r0 to 0:6.5-r0) [version-going-backwards]
ERROR: ncurses-6.5-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-libticw went backwards which would break package feeds (from 0:6.6-r0 to 0:6.5-r0) [version-going-backwards]
ERROR: ncurses-6.5-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-libtic went backwards which would break package feeds (from 0:6.6-r0 to 0:6.5-r0) [version-going-backwards]
ERROR: ncurses-6.5-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-libpanelw went backwards which would break package feeds (from 0:6.6-r0 to 0:6.5-r0) [version-going-backwards]
ERROR: ncurses-6.5-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-libpanel went backwards which would break package feeds (from 0:6.6-r0 to 0:6.5-r0) [version-going-backwards]
ERROR: ncurses-6.5-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-libmenuw went backwards which would break package feeds (from 0:6.6-r0 to 0:6.5-r0) [version-going-backwards]
ERROR: ncurses-6.5-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-libmenu went backwards which would break package feeds (from 0:6.6-r0 to 0:6.5-r0) [version-going-backwards]
ERROR: ncurses-6.5-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-libformw went backwards which would break package feeds (from 0:6.6-r0 to 0:6.5-r0) [version-going-backwards]
ERROR: ncurses-6.5-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-libform went backwards which would break package feeds (from 0:6.6-r0 to 0:6.5-r0) [version-going-backwards]
ERROR: ncurses-6.5-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-staticdev went backwards which would break package feeds (from 0:6.6-r0 to 0:6.5-r0) [version-going-backwards]
ERROR: ncurses-6.5-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-dev went backwards which would break package feeds (from 0:6.6-r0 to 0:6.5-r0) [version-going-backwards]
ERROR: ncurses-6.5-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-doc went backwards which would break package feeds (from 0:6.6-r0 to 0:6.5-r0) [version-going-backwards]
ERROR: ncurses-6.5-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-locale went backwards which would break package feeds (from 0:6.6-r0 to 0:6.5-r0) [version-going-backwards]
ERROR: ncurses-6.5-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses went backwards which would break package feeds (from 0:6.6-r0 to 0:6.5-r0) [version-going-backwards]
ERROR: ncurses-6.5-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-tools went backwards which would break package feeds (from 0:6.6-r0 to 0:6.5-r0) [version-going-backwards]
ERROR: ncurses-6.5-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-terminfo-base went backwards which would break package feeds (from 0:6.6-r0 to 0:6.5-r0) [version-going-backwards]
ERROR: ncurses-6.5-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-terminfo went backwards which would break package feeds (from 0:6.6-r0 to 0:6.5-r0) [version-going-backwards]
ERROR: ncurses-6.5-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============6609535547252632425==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-docutils/python3-docutils: FILELIST: directory renamed /usr/lib/python3.13/site-packages/docutils-0.22.3.dist-info/licenses -> /usr/lib/python3.13/site-packages/docutils-0.22.4.dist-info/licenses, directory renamed /usr/lib/python3.13/site-packages/docutils-0.22.3.dist-info -> /usr/lib/python3.13/site-packages/docutils-0.22.4.dist-info, directory renamed /usr/lib/python3.13/site-packages/docutils-0.22.3.dist-info/licenses/licenses -> /usr/lib/python3.13/site-packages/docutils-0.22.4.dist-info/licenses/licenses
Changes to packages/x86-64-v3-poky-linux/python3-docutils (sysroot):
  /usr/lib/python3.13/site-packages/docutils-0.22.3.dist-info moved to /usr/lib/python3.13/site-packages/docutils-0.22.4.dist-info

--===============6609535547252632425==--

