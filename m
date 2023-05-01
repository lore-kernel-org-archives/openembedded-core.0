Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BD04CA9ED1
	for <webhook@archiver.kernel.org>; Mon,  1 May 2023 21:26:05 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.107886.1682976349700546316
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 May 2023 14:25:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=KSVSpsGO;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 01010187d935276c-7e939b46-79b2-443c-a815-23bc90ac6255-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1682976352;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=EKGvC04t+ocpk/9ZWa0bsZVMxZNhQ2+uDNWuHoLo+SU=;
	b=KSVSpsGOUAicAziP4jF4zAZcGShTKPfcL46YkS49gITOvwfsgv/puIBT44qA+j8H
	nd/Uq0NWrKlkLoKoTTmMzVGlEi9zeIR07Nn00ru0dTiaUrIVnSCzlS+FUB5Bqh+SQss
	l11vum83RgRA7pd/nFC3grABq6RALUlJVzJhLD5w=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1682976352;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=EKGvC04t+ocpk/9ZWa0bsZVMxZNhQ2+uDNWuHoLo+SU=;
	b=IOTvS/7469KSoZUG8XmpJUNR9UfIBajAj0MWrxnU0hAMWokIeY0vEgYpvE3ranII
	P9GL6Du2/E2EkOeilC/WGhXXXTp9t2fJmch/gsolB+q6/Ksjd/jnbUVhqmdanEY1T0S
	pKhwMvbOUJgvOdN2czLTLVZWb3qqbDk03j1F1xhA=
Content-Type: multipart/mixed; boundary="===============8087184353440921627=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] glslang: upgrading to 1.3.243.0 FAILED
Message-ID: <01010187d935276c-7e939b46-79b2-443c-a815-23bc90ac6255-000000@us-west-2.amazonses.com>
Date: Mon, 1 May 2023 21:25:52 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.05.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 May 2023 21:26:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180652

--===============8087184353440921627==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *glslang* to *1.3.243.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-glslang-upgrade-1.3.239.0-1.3.243.0.patch
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
--===============8087184353440921627==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

Loading cache...done.
Loaded 1798 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (898 cached, 1 parsed). 1798 targets, 40 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-32 sysroot...done.
Removing 1 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:9b8aeefcf966baef90071ab24588df145772f9c8"
workspace            = "master:cce6db2a59d309f77c1f9ca173fc674c506062d0"

Initialising tasks...done.
Sstate summary: Wanted 26 Local 19 Mirrors 0 Missed 7 Current 134 (73% match, 95% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 607 of 666 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_fetch)
NOTE: recipe glslang-1_1.3.243.0-r0: task do_fetch: Started
NOTE: recipe glslang-1_1.3.243.0-r0: task do_fetch: Succeeded
NOTE: Running task 652 of 666 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_unpack)
NOTE: Running task 653 of 666 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe glslang-1_1.3.243.0-r0: task do_unpack: Started
NOTE: recipe glslang-1_1.3.243.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glslang-1_1.3.243.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe glslang-1_1.3.243.0-r0: task do_unpack: Succeeded
NOTE: Running task 654 of 666 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_patch)
NOTE: recipe glslang-1_1.3.243.0-r0: task do_patch: Started
NOTE: recipe glslang-1_1.3.243.0-r0: task do_patch: Succeeded
NOTE: Running task 655 of 666 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 656 of 666 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_generate_toolchain_file)
NOTE: Running task 657 of 666 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_populate_lic)
NOTE: recipe glslang-1_1.3.243.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glslang-1_1.3.243.0-r0: task do_populate_lic: Started
NOTE: recipe glslang-1_1.3.243.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe glslang-1_1.3.243.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe glslang-1_1.3.243.0-r0: task do_populate_lic: Succeeded
NOTE: recipe glslang-1_1.3.243.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 658 of 666 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_configure)
NOTE: recipe glslang-1_1.3.243.0-r0: task do_configure: Started
NOTE: recipe glslang-1_1.3.243.0-r0: task do_configure: Succeeded
NOTE: Running task 659 of 666 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_compile)
NOTE: recipe glslang-1_1.3.243.0-r0: task do_compile: Started
NOTE: recipe glslang-1_1.3.243.0-r0: task do_compile: Succeeded
NOTE: Running task 660 of 666 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_install)
NOTE: recipe glslang-1_1.3.243.0-r0: task do_install: Started
NOTE: recipe glslang-1_1.3.243.0-r0: task do_install: Succeeded
NOTE: Running task 661 of 666 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_package)
NOTE: Running task 662 of 666 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_populate_sysroot)
NOTE: recipe glslang-1_1.3.243.0-r0: task do_populate_sysroot: Started
NOTE: recipe glslang-1_1.3.243.0-r0: task do_package: Started
NOTE: recipe glslang-1_1.3.243.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe glslang-1_1.3.243.0-r0: task do_package: Succeeded
NOTE: Running task 663 of 666 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_packagedata)
NOTE: recipe glslang-1_1.3.243.0-r0: task do_packagedata: Started
NOTE: recipe glslang-1_1.3.243.0-r0: task do_packagedata: Succeeded
NOTE: Running task 664 of 666 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_package_write_rpm)
NOTE: Running task 665 of 666 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_package_qa)
NOTE: recipe glslang-1_1.3.243.0-r0: task do_package_write_rpm: Started
NOTE: recipe glslang-1_1.3.243.0-r0: task do_package_qa: Started
NOTE: recipe glslang-1_1.3.243.0-r0: task do_package_qa: Failed
NOTE: recipe glslang-1_1.3.243.0-r0: task do_package_write_rpm: Succeeded
NOTE: Tasks Summary: Attempted 665 tasks of which 650 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_package_qa
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: glslang-1_1.3.243.0-r0 do_package_qa: QA Issue: non -dev/-dbg/nativesdk- package glslang contains symlink .so '/usr/lib/libSPIRV.so'
non -dev/-dbg/nativesdk- package glslang contains symlink .so '/usr/lib/libglslang-default-resource-limits.so'
non -dev/-dbg/nativesdk- package glslang contains symlink .so '/usr/lib/libHLSL.so'
non -dev/-dbg/nativesdk- package glslang contains symlink .so '/usr/lib/libSPVRemapper.so' [dev-so]
ERROR: glslang-1_1.3.243.0-r0 do_package_qa: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/glslang/1_1.3.243.0-r0/temp/log.do_package_qa.1379980
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_package_qa) failed with exit code '1'

--===============8087184353440921627==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-glslang-upgrade-1.3.239.0-1.3.243.0.patch"

RnJvbSAzZjMzY2E2MTcxOTljZjZhZmZmNzQyZGJiNjk1ODE5MzQ2ZWY2ZTZmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBNYXkgMjAyMyAxNjo1NTo0NyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGds
c2xhbmc6IHVwZ3JhZGUgMS4zLjIzOS4wIC0+IDEuMy4yNDMuMAoKLS0tCiAuLi4vZ2xzbGFuZy97
Z2xzbGFuZ18xLjMuMjM5LjAuYmIgPT4gZ2xzbGFuZ18xLjMuMjQzLjAuYmJ9ICAgICAgfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtZ3JhcGhpY3MvZ2xzbGFuZy97Z2xzbGFuZ18xLjMuMjM5LjAuYmIgPT4gZ2xz
bGFuZ18xLjMuMjQzLjAuYmJ9ICg5NSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBo
aWNzL2dsc2xhbmcvZ2xzbGFuZ18xLjMuMjM5LjAuYmIgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mv
Z2xzbGFuZy9nbHNsYW5nXzEuMy4yNDMuMC5iYgpzaW1pbGFyaXR5IGluZGV4IDk1JQpyZW5hbWUg
ZnJvbSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvZ2xzbGFuZy9nbHNsYW5nXzEuMy4yMzkuMC5iYgpy
ZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2dsc2xhbmcvZ2xzbGFuZ18xLjMuMjQzLjAu
YmIKaW5kZXggNmJjZGU1MjFlMi4uZjNiMGQ2NDZjZSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LWdyYXBoaWNzL2dsc2xhbmcvZ2xzbGFuZ18xLjMuMjM5LjAuYmIKKysrIGIvbWV0YS9yZWNpcGVz
LWdyYXBoaWNzL2dsc2xhbmcvZ2xzbGFuZ18xLjMuMjQzLjAuYmIKQEAgLTgsNyArOCw3IEBAIEhP
TUVQQUdFID0gImh0dHBzOi8vd3d3Lmtocm9ub3Mub3JnL29wZW5nbGVzL3Nkay90b29scy9SZWZl
cmVuY2UtQ29tcGlsZXIiCiBMSUNFTlNFID0gIkJTRC0zLUNsYXVzZSAmIEJTRC0yLUNsYXVzZSAm
IE1JVCAmIEFwYWNoZS0yLjAgJiBHUEwtMy13aXRoLWJpc29uLWV4Y2VwdGlvbiIKIExJQ19GSUxF
U19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0UudHh0O21kNT0yYTJiNWFjZDdiYzQ4NDQ5NjRjZmRh
NDVmZTgwN2RjMyIKIAotU1JDUkVWID0gImNhOGQwN2QwYmMxYzYzOTBiODM5MTU3MDA0MzlmYTc3
MTlkZTZhMmEiCitTUkNSRVYgPSAiMTRlNWEwNGU3MDA1Nzk3MmVlZjhhNDBkZjQyMmUzMGEzYjcw
ZTRiNSIKIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS9LaHJvbm9zR3JvdXAvZ2xzbGFuZy5n
aXQ7cHJvdG9jb2w9aHR0cHM7YnJhbmNoPW1haW4gXAogICAgICAgICAgICBmaWxlOi8vMDAwMS1n
ZW5lcmF0ZS1nbHNsYW5nLXBrZy1jb25maWcucGF0Y2ggXAogICAgICAgICAgICAiCi0tIAoyLjM5
LjIKCg==

--===============8087184353440921627==--

