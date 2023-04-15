Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BBE1C87FF1
	for <webhook@archiver.kernel.org>; Sat, 15 Apr 2023 18:01:30 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.13533.1681581686499989895
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Apr 2023 11:01:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=CIauDZfG;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018786143b8f-23abb65d-2856-4a11-9fd9-2812239b7a20-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1681581685;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=WN9pZYDHYU3GuYz0L96n0EUXyqRFHaNgL3IQPb4IW8o=;
	b=CIauDZfGXta6hBcujFb6vzE8YkF/a3Ezmj+rMfxQarykC+OHNdLIFDAX/wdxfgSJ
	zbUSBpSnBzCRPWRiBo6vZSCmVLg6lZC8RBkcoJeDNEhzNnvl9AUgSiqGxGzIrp8wOEE
	aWo/t0yexF3O6u8ODGuPmjgxiDB+FjHNdBmcVF0E=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1681581685;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=WN9pZYDHYU3GuYz0L96n0EUXyqRFHaNgL3IQPb4IW8o=;
	b=K+5ND6AqyywuL1SdxXrG7eXJPjam6hlt8qg3m32L2BVFcD6NwBKCJYeZL6WLqr+l
	XbbfXBpDwY+0youUl2IoVKjQzOPZH5IAFDtC8Ek8Oxyd0yWks2laB2V4p+/YT9+W78+
	4r0PrkRPv6iuFw1SX+JE18sY18KxoZ9Glyex+mH0=
Content-Type: multipart/mixed; boundary="===============3068783051535867558=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] glslang: upgrading to 1.3.243.0 FAILED
Message-ID: <0101018786143b8f-23abb65d-2856-4a11-9fd9-2812239b7a20-000000@us-west-2.amazonses.com>
Date: Sat, 15 Apr 2023 18:01:25 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.04.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Apr 2023 18:01:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180068

--===============3068783051535867558==
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
--===============3068783051535867558==
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
meta-yocto-bsp       = "tmp-auh-upgrades:a13df9167584bb5c0d151295916691326eb0c1bc"
workspace            = "master:ff633ce7a7ffc0d39b86043caeb63a9ffcef99b8"

Initialising tasks...done.
Sstate summary: Wanted 24 Local 17 Mirrors 0 Missed 7 Current 136 (70% match, 95% complete)
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
NOTE: recipe glslang-1_1.3.243.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe glslang-1_1.3.243.0-r0: task do_populate_lic: Started
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
ERROR: glslang-1_1.3.243.0-r0 do_package_qa: QA Issue: non -dev/-dbg/nativesdk- package glslang contains symlink .so '/usr/lib/libHLSL.so'
non -dev/-dbg/nativesdk- package glslang contains symlink .so '/usr/lib/libSPVRemapper.so'
non -dev/-dbg/nativesdk- package glslang contains symlink .so '/usr/lib/libglslang-default-resource-limits.so'
non -dev/-dbg/nativesdk- package glslang contains symlink .so '/usr/lib/libSPIRV.so' [dev-so]
ERROR: glslang-1_1.3.243.0-r0 do_package_qa: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/glslang/1_1.3.243.0-r0/temp/log.do_package_qa.104018
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/glslang/glslang_1.3.243.0.bb:do_package_qa) failed with exit code '1'

--===============3068783051535867558==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-glslang-upgrade-1.3.239.0-1.3.243.0.patch"

RnJvbSAzZjk2MzYwMmM0NDRiNmI5YmQzZWE3ZGY3MGE1Y2M5MTY5Y2FmZTY4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgQXByIDIwMjMgMTM6NTA6NDAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
bHNsYW5nOiB1cGdyYWRlIDEuMy4yMzkuMCAtPiAxLjMuMjQzLjAKCi0tLQogLi4uL2dsc2xhbmcv
e2dsc2xhbmdfMS4zLjIzOS4wLmJiID0+IGdsc2xhbmdfMS4zLjI0My4wLmJifSAgICAgIHwgMiAr
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUg
bWV0YS9yZWNpcGVzLWdyYXBoaWNzL2dsc2xhbmcve2dsc2xhbmdfMS4zLjIzOS4wLmJiID0+IGds
c2xhbmdfMS4zLjI0My4wLmJifSAoOTUlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFw
aGljcy9nbHNsYW5nL2dsc2xhbmdfMS4zLjIzOS4wLmJiIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNz
L2dsc2xhbmcvZ2xzbGFuZ18xLjMuMjQzLjAuYmIKc2ltaWxhcml0eSBpbmRleCA5NSUKcmVuYW1l
IGZyb20gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2dsc2xhbmcvZ2xzbGFuZ18xLjMuMjM5LjAuYmIK
cmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1ncmFwaGljcy9nbHNsYW5nL2dsc2xhbmdfMS4zLjI0My4w
LmJiCmluZGV4IDZiY2RlNTIxZTIuLmYzYjBkNjQ2Y2UgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBl
cy1ncmFwaGljcy9nbHNsYW5nL2dsc2xhbmdfMS4zLjIzOS4wLmJiCisrKyBiL21ldGEvcmVjaXBl
cy1ncmFwaGljcy9nbHNsYW5nL2dsc2xhbmdfMS4zLjI0My4wLmJiCkBAIC04LDcgKzgsNyBAQCBI
T01FUEFHRSA9ICJodHRwczovL3d3dy5raHJvbm9zLm9yZy9vcGVuZ2xlcy9zZGsvdG9vbHMvUmVm
ZXJlbmNlLUNvbXBpbGVyIgogTElDRU5TRSA9ICJCU0QtMy1DbGF1c2UgJiBCU0QtMi1DbGF1c2Ug
JiBNSVQgJiBBcGFjaGUtMi4wICYgR1BMLTMtd2l0aC1iaXNvbi1leGNlcHRpb24iCiBMSUNfRklM
RVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFLnR4dDttZDU9MmEyYjVhY2Q3YmM0ODQ0OTY0Y2Zk
YTQ1ZmU4MDdkYzMiCiAKLVNSQ1JFViA9ICJjYThkMDdkMGJjMWM2MzkwYjgzOTE1NzAwNDM5ZmE3
NzE5ZGU2YTJhIgorU1JDUkVWID0gIjE0ZTVhMDRlNzAwNTc5NzJlZWY4YTQwZGY0MjJlMzBhM2I3
MGU0YjUiCiBTUkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20vS2hyb25vc0dyb3VwL2dsc2xhbmcu
Z2l0O3Byb3RvY29sPWh0dHBzO2JyYW5jaD1tYWluIFwKICAgICAgICAgICAgZmlsZTovLzAwMDEt
Z2VuZXJhdGUtZ2xzbGFuZy1wa2ctY29uZmlnLnBhdGNoIFwKICAgICAgICAgICAgIgotLSAKMi4z
OS4yCgo=

--===============3068783051535867558==--

