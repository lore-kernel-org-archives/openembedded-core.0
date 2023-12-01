Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B5B3C25B63
	for <webhook@archiver.kernel.org>; Fri,  1 Dec 2023 13:15:00 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.22311.1701436490326875064
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Dec 2023 05:14:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=WY0hJMP1;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=q3KrVtVG;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101018c25847e6e-b56d0163-0e73-449f-9530-6b66f2f17c3e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1701436489;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=6z/TX5Iv7bFq6nf1c0yYD18AhlasByou4qUOaDcSBC4=;
	b=WY0hJMP17LDKuM9eyEchPF68i74TdPdB039qJUnFvuARS/jPNHf/AbXmCptUaV3i
	Csk8rkRV8gs6IlBEHL9gGdyeAaBAPkifmIYUg/l2OhKAKScK+427zOOOCDtH70TpI6j
	KGlgMI/cLQsF6DmqJjtC+ogRGndNnlCfwNbVMyBQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1701436489;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=6z/TX5Iv7bFq6nf1c0yYD18AhlasByou4qUOaDcSBC4=;
	b=q3KrVtVGRmf7Lxp3xWv+gxVnuOWtrVzJIGsgMlzz20zIn3aQnmpnl+jslRj4+nG/
	/9+HcU9lSCC4hcza9QgQ2CH+WDlrm6xdLO9dyg319eZkJempq479Z9m08kJ4UNPJrbX
	pCivkySSswfpyarQ7/KJPxZgaGGE/8d95hBs9JwQ=
Content-Type: multipart/mixed; boundary="===============0628581784374960361=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] usbutils: upgrading to 017 FAILED
Message-ID: <0101018c25847e6e-b56d0163-0e73-449f-9530-6b66f2f17c3e-000000@us-west-2.amazonses.com>
Date: Fri, 1 Dec 2023 13:14:49 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.12.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Dec 2023 13:15:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191573

--===============0628581784374960361==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *usbutils* to *017* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-usbutils-upgrade-015-017.patch
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
From 18383c9d0d07502e5dade463a9b37d16bac48160 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Dec 2023 05:08:21 +0000
Subject: [PATCH] usbutils: upgrade 015 -> 017

---
 meta/recipes-bsp/usbutils/{usbutils_015.bb => usbutils_017.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-bsp/usbutils/{usbutils_015.bb => usbutils_017.bb} (92%)

diff --git a/meta/recipes-bsp/usbutils/usbutils_015.bb b/meta/recipes-bsp/usbutils/usbutils_017.bb
similarity index 92%
rename from meta/recipes-bsp/usbutils/usbutils_015.bb
rename to meta/recipes-bsp/usbutils/usbutils_017.bb
index a30037b693..1a3ea8013c 100644
--- a/meta/recipes-bsp/usbutils/usbutils_015.bb
+++ b/meta/recipes-bsp/usbutils/usbutils_017.bb
@@ -13,7 +13,7 @@ DEPENDS = "libusb1 virtual/libiconv udev"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/usb/usbutils/usbutils-${PV}.tar.gz \
           "
-SRC_URI[sha256sum] = "2b8140664578f39c3f6f0166a1b950f8655304e63e3d7f89899acb99bc5cb8e7"
+SRC_URI[sha256sum] = "f704c4cb78a060db88b43aac6ebfd3d93c2c5cf1d6dd0e42936faaf00814ab00"
 
 inherit autotools pkgconfig update-alternatives
 
-- 
2.39.2


--===============0628581784374960361==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-usbutils-upgrade-015-017.patch"

RnJvbSAxODM4M2M5ZDBkMDc1MDJlNWRhZGU0NjNhOWIzN2QxNmJhYzQ4MTYwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBEZWMgMjAyMyAwNTowODoyMSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHVz
YnV0aWxzOiB1cGdyYWRlIDAxNSAtPiAwMTcKCi0tLQogbWV0YS9yZWNpcGVzLWJzcC91c2J1dGls
cy97dXNidXRpbHNfMDE1LmJiID0+IHVzYnV0aWxzXzAxNy5iYn0gfCAyICstCiAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMt
YnNwL3VzYnV0aWxzL3t1c2J1dGlsc18wMTUuYmIgPT4gdXNidXRpbHNfMDE3LmJifSAoOTIlKQoK
ZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ic3AvdXNidXRpbHMvdXNidXRpbHNfMDE1LmJiIGIv
bWV0YS9yZWNpcGVzLWJzcC91c2J1dGlscy91c2J1dGlsc18wMTcuYmIKc2ltaWxhcml0eSBpbmRl
eCA5MiUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWJzcC91c2J1dGlscy91c2J1dGlsc18wMTUu
YmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1ic3AvdXNidXRpbHMvdXNidXRpbHNfMDE3LmJiCmlu
ZGV4IGEzMDAzN2I2OTMuLjFhM2VhODAxM2MgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ic3Av
dXNidXRpbHMvdXNidXRpbHNfMDE1LmJiCisrKyBiL21ldGEvcmVjaXBlcy1ic3AvdXNidXRpbHMv
dXNidXRpbHNfMDE3LmJiCkBAIC0xMyw3ICsxMyw3IEBAIERFUEVORFMgPSAibGlidXNiMSB2aXJ0
dWFsL2xpYmljb252IHVkZXYiCiAKIFNSQ19VUkkgPSAiJHtLRVJORUxPUkdfTUlSUk9SfS9saW51
eC91dGlscy91c2IvdXNidXRpbHMvdXNidXRpbHMtJHtQVn0udGFyLmd6IFwKICAgICAgICAgICAi
Ci1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiMmI4MTQwNjY0NTc4ZjM5YzNmNmYwMTY2YTFiOTUwZjg2
NTUzMDRlNjNlM2Q3Zjg5ODk5YWNiOTliYzVjYjhlNyIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJm
NzA0YzRjYjc4YTA2MGRiODhiNDNhYWM2ZWJmZDNkOTNjMmM1Y2YxZDZkZDBlNDI5MzZmYWFmMDA4
MTRhYjAwIgogCiBpbmhlcml0IGF1dG90b29scyBwa2djb25maWcgdXBkYXRlLWFsdGVybmF0aXZl
cwogCi0tIAoyLjM5LjIKCg==

--===============0628581784374960361==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1845 entries from dependency cache.
Parsing recipes...done.
Parsing of 912 .bb files complete (911 cached, 1 parsed). 1844 targets, 38 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-d069eb3af4f8a20ca4bad84b5e529e92d152ccef"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:d069eb3af4f8a20ca4bad84b5e529e92d152ccef"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 462 Local 452 Mirrors 0 Missed 10 Current 433 (97% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 442 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-bsp/usbutils/usbutils_017.bb:do_populate_lic_setscene)
NOTE: Running setscene task 444 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-bsp/usbutils/usbutils_017.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe usbutils-017-r0: task do_populate_lic_setscene: Started
NOTE: recipe usbutils-017-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe usbutils-017-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe usbutils-017-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 895 of 895 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-bsp/usbutils/usbutils_017.bb:do_recipe_qa_setscene)
NOTE: recipe usbutils-017-r0: task do_recipe_qa_setscene: Started
NOTE: recipe usbutils-017-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1978 of 2499 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-bsp/usbutils/usbutils_017.bb:do_fetch)
NOTE: recipe usbutils-017-r0: task do_fetch: Started
NOTE: recipe usbutils-017-r0: task do_fetch: Succeeded
NOTE: Running task 2383 of 2499 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-bsp/usbutils/usbutils_017.bb:do_unpack)
NOTE: Running task 2384 of 2499 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-bsp/usbutils/usbutils_017.bb:do_prepare_recipe_sysroot)
NOTE: recipe usbutils-017-r0: task do_unpack: Started
NOTE: recipe usbutils-017-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe usbutils-017-r0: task do_unpack: Succeeded
NOTE: Running task 2483 of 2499 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-bsp/usbutils/usbutils_017.bb:do_patch)
NOTE: Running task 2484 of 2499 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-bsp/usbutils/usbutils_017.bb:do_collect_spdx_deps)
NOTE: recipe usbutils-017-r0: task do_patch: Started
NOTE: recipe usbutils-017-r0: task do_collect_spdx_deps: Started
NOTE: recipe usbutils-017-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe usbutils-017-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe usbutils-017-r0: task do_patch: Succeeded
NOTE: Running task 2486 of 2499 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-bsp/usbutils/usbutils_017.bb:do_configure)
NOTE: recipe usbutils-017-r0: task do_configure: Started
NOTE: recipe usbutils-017-r0: task do_configure: Succeeded
NOTE: Running task 2488 of 2499 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-bsp/usbutils/usbutils_017.bb:do_compile)
NOTE: recipe usbutils-017-r0: task do_compile: Started
NOTE: recipe usbutils-017-r0: task do_compile: Succeeded
NOTE: Running task 2489 of 2499 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-bsp/usbutils/usbutils_017.bb:do_install)
NOTE: recipe usbutils-017-r0: task do_install: Started
NOTE: recipe usbutils-017-r0: task do_install: Succeeded
NOTE: Running task 2490 of 2499 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-bsp/usbutils/usbutils_017.bb:do_package)
NOTE: Running task 2491 of 2499 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-bsp/usbutils/usbutils_017.bb:do_populate_sysroot)
NOTE: recipe usbutils-017-r0: task do_package: Started
NOTE: recipe usbutils-017-r0: task do_populate_sysroot: Started
NOTE: recipe usbutils-017-r0: task do_package: Succeeded
NOTE: Running task 2492 of 2499 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-bsp/usbutils/usbutils_017.bb:do_packagedata)
NOTE: recipe usbutils-017-r0: task do_packagedata: Started
NOTE: recipe usbutils-017-r0: task do_packagedata: Succeeded
NOTE: Running task 2493 of 2499 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-bsp/usbutils/usbutils_017.bb:do_create_spdx)
NOTE: Running task 2494 of 2499 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-bsp/usbutils/usbutils_017.bb:do_package_write_ipk)
NOTE: Running task 2495 of 2499 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-bsp/usbutils/usbutils_017.bb:do_package_write_deb)
NOTE: Running task 2496 of 2499 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-bsp/usbutils/usbutils_017.bb:do_package_write_rpm)
NOTE: Running task 2497 of 2499 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-bsp/usbutils/usbutils_017.bb:do_package_qa)
NOTE: recipe usbutils-017-r0: task do_create_spdx: Started
NOTE: recipe usbutils-017-r0: task do_package_write_ipk: Started
NOTE: recipe usbutils-017-r0: task do_package_write_deb: Started
NOTE: recipe usbutils-017-r0: task do_package_write_rpm: Started
NOTE: recipe usbutils-017-r0: task do_package_qa: Started
WARNING: usbutils-017-r0 do_package_qa: QA Issue: File /usr/lib/pkgconfig/usbutils.pc in package usbutils-dev contains reference to TMPDIR [buildpaths]
NOTE: recipe usbutils-017-r0: task do_create_spdx: Succeeded
NOTE: Running task 2498 of 2499 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-bsp/usbutils/usbutils_017.bb:do_create_runtime_spdx)
NOTE: recipe usbutils-017-r0: task do_create_runtime_spdx: Started
NOTE: recipe usbutils-017-r0: task do_package_qa: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-bsp/usbutils/usbutils_017.bb:do_package_qa unihash changed to 5bbf6397f174b9105ddc70390fa862ddc66f0a94b7357f564cf401c640206b2c
NOTE: recipe usbutils-017-r0: task do_package_write_ipk: Succeeded
NOTE: recipe usbutils-017-r0: task do_package_write_deb: Succeeded
NOTE: recipe usbutils-017-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe usbutils-017-r0: task do_package_write_rpm: Succeeded
NOTE: recipe usbutils-017-r0: task do_populate_sysroot: Failed
NOTE: Tasks Summary: Attempted 2498 tasks of which 2481 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20231201050746.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20231201050746.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-bsp/usbutils/usbutils_017.bb:do_populate_sysroot
Summary: There was 1 WARNING message.
Summary: There were 4 ERROR messages, returning a non-zero exit code.
ERROR: usbutils-017-r0 do_populate_sysroot: QA Issue: usbutils.pc failed sanity test (tmpdir) in path /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/usbutils/017/sysroot-destdir/usr/lib/pkgconfig [pkgconfig]
ERROR: usbutils-017-r0 do_populate_sysroot: QA Issue: usbutils.pc failed sanity test (tmpdir) in path /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/usbutils/017/sysroot-destdir/usr/lib/pkgconfig [pkgconfig]
ERROR: usbutils-017-r0 do_populate_sysroot: QA Issue: usbutils.pc failed sanity test (tmpdir) in path /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/usbutils/017/sysroot-destdir/usr/lib/pkgconfig [pkgconfig]
ERROR: usbutils-017-r0 do_populate_sysroot: do_populate_sysroot for this recipe installed files with QA issues
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/usbutils/017/temp/log.do_populate_sysroot.1797878
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-bsp/usbutils/usbutils_017.bb:do_populate_sysroot) failed with exit code '1'

--===============0628581784374960361==--

