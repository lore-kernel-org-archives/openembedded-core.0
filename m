Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A95BC54F41
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 14:37:10 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.14612.1700059028574308590
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Nov 2023 06:37:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=aAmjutWD;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=r4IJqnJQ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101018bd36a18a7-24b3a87b-318c-4ea4-b365-df52cd9a20ea-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1700059027;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=trWXXru+MTqNaG64e939U+pSLBAcEo9RLERUSIyd218=;
	b=aAmjutWDccsc+eQCYxCfFiuwcme8DRVcS6wofmmQMpu9JrJtxaKPY11LSrngkM7R
	EMxTVtK50k8jCGiXSfH9gHTuVHO61S76XYdg2AGOIKCEyY256ewN+TnB3oGtNsAQXSp
	x5m4Rlr+dscg8Mtb1EGMTUnJscJ5RtO4lO2zUon0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1700059027;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=trWXXru+MTqNaG64e939U+pSLBAcEo9RLERUSIyd218=;
	b=r4IJqnJQcMbJUAZKTcDq7Jye0fgrCkJk4cDAZ/QA90wD6f8YhQMRyQo92kYlKp8P
	CYlKVJXEpkN5BmgxY/M1ZMLshgzaoEjffIA2Ju9hl97G8KimVpaKlrflAcEYAUWc++s
	kpQI/NHa/gKlvNvmMwqstjaQxqBRE7wrPYYCRa7I=
Content-Type: multipart/mixed; boundary="===============4154553021462473000=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] usbutils: upgrading to 017 FAILED
Message-ID: <0101018bd36a18a7-24b3a87b-318c-4ea4-b365-df52cd9a20ea-000000@us-west-2.amazonses.com>
Date: Wed, 15 Nov 2023 14:37:07 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 14:37:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190606

--===============4154553021462473000==
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
From 9032d5700a3e4f7de786d8d6f99ee63f6b792ef7 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Nov 2023 05:03:42 +0000
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


--===============4154553021462473000==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-usbutils-upgrade-015-017.patch"

RnJvbSA5MDMyZDU3MDBhM2U0ZjdkZTc4NmQ4ZDZmOTllZTYzZjZiNzkyZWY3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgTm92IDIwMjMgMDU6MDM6NDIgKzAwMDAKU3ViamVjdDogW1BBVENIXSB1
c2J1dGlsczogdXBncmFkZSAwMTUgLT4gMDE3CgotLS0KIG1ldGEvcmVjaXBlcy1ic3AvdXNidXRp
bHMve3VzYnV0aWxzXzAxNS5iYiA9PiB1c2J1dGlsc18wMTcuYmJ9IHwgMiArLQogMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVz
LWJzcC91c2J1dGlscy97dXNidXRpbHNfMDE1LmJiID0+IHVzYnV0aWxzXzAxNy5iYn0gKDkyJSkK
CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtYnNwL3VzYnV0aWxzL3VzYnV0aWxzXzAxNS5iYiBi
L21ldGEvcmVjaXBlcy1ic3AvdXNidXRpbHMvdXNidXRpbHNfMDE3LmJiCnNpbWlsYXJpdHkgaW5k
ZXggOTIlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1ic3AvdXNidXRpbHMvdXNidXRpbHNfMDE1
LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtYnNwL3VzYnV0aWxzL3VzYnV0aWxzXzAxNy5iYgpp
bmRleCBhMzAwMzdiNjkzLi4xYTNlYTgwMTNjIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtYnNw
L3VzYnV0aWxzL3VzYnV0aWxzXzAxNS5iYgorKysgYi9tZXRhL3JlY2lwZXMtYnNwL3VzYnV0aWxz
L3VzYnV0aWxzXzAxNy5iYgpAQCAtMTMsNyArMTMsNyBAQCBERVBFTkRTID0gImxpYnVzYjEgdmly
dHVhbC9saWJpY29udiB1ZGV2IgogCiBTUkNfVVJJID0gIiR7S0VSTkVMT1JHX01JUlJPUn0vbGlu
dXgvdXRpbHMvdXNiL3VzYnV0aWxzL3VzYnV0aWxzLSR7UFZ9LnRhci5neiBcCiAgICAgICAgICAg
IgotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjJiODE0MDY2NDU3OGYzOWMzZjZmMDE2NmExYjk1MGY4
NjU1MzA0ZTYzZTNkN2Y4OTg5OWFjYjk5YmM1Y2I4ZTciCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAi
ZjcwNGM0Y2I3OGEwNjBkYjg4YjQzYWFjNmViZmQzZDkzYzJjNWNmMWQ2ZGQwZTQyOTM2ZmFhZjAw
ODE0YWIwMCIKIAogaW5oZXJpdCBhdXRvdG9vbHMgcGtnY29uZmlnIHVwZGF0ZS1hbHRlcm5hdGl2
ZXMKIAotLSAKMi4zOS4yCgo=

--===============4154553021462473000==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1844 entries from dependency cache.
Parsing recipes...done.
Parsing of 911 .bb files complete (910 cached, 1 parsed). 1843 targets, 38 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "4.3+snapshot-577ab316e4b9cc956aedd3b21dc19aae586c9c4f"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:577ab316e4b9cc956aedd3b21dc19aae586c9c4f"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 462 Local 449 Mirrors 0 Missed 13 Current 433 (97% match, 98% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1975 of 2499 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-bsp/usbutils/usbutils_017.bb:do_recipe_qa)
NOTE: recipe usbutils-017-r0: task do_recipe_qa: Started
NOTE: recipe usbutils-017-r0: task do_recipe_qa: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-bsp/usbutils/usbutils_017.bb:do_recipe_qa unihash changed to 4aa44c6add47e5333d790131045e7f600dc1d559502cc315e6911f4baf13600b
NOTE: Setscene tasks completed
NOTE: Running task 2480 of 2499 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-bsp/usbutils/usbutils_017.bb:do_fetch)
NOTE: recipe usbutils-017-r0: task do_fetch: Started
NOTE: recipe usbutils-017-r0: task do_fetch: Succeeded
NOTE: Running task 2481 of 2499 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-bsp/usbutils/usbutils_017.bb:do_unpack)
NOTE: Running task 2482 of 2499 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-bsp/usbutils/usbutils_017.bb:do_prepare_recipe_sysroot)
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
NOTE: Running task 2485 of 2499 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-bsp/usbutils/usbutils_017.bb:do_deploy_source_date_epoch)
NOTE: Running task 2486 of 2499 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-bsp/usbutils/usbutils_017.bb:do_populate_lic)
NOTE: recipe usbutils-017-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe usbutils-017-r0: task do_populate_lic: Started
NOTE: recipe usbutils-017-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-bsp/usbutils/usbutils_017.bb:do_populate_lic unihash changed to fae4ea25058fe563d5bcc16331a339ac6ed057044e36d5caf8d40055f58db7f0
NOTE: recipe usbutils-017-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-bsp/usbutils/usbutils_017.bb:do_deploy_source_date_epoch unihash changed to bc39c8ee42a97f3149fa20ab3b1e96730410d2951d616d96e28a7d73c2aacaf6
NOTE: Setscene tasks completed
NOTE: Running task 2487 of 2499 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-bsp/usbutils/usbutils_017.bb:do_configure)
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
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-bsp/usbutils/usbutils_017.bb:do_packagedata unihash changed to 94e6503bfbbe9b4e09dc1042df671942819b9eadff15275a4d2fecdd5fddfa0a
NOTE: Setscene tasks completed
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
NOTE: recipe usbutils-017-r0: task do_package_qa: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-bsp/usbutils/usbutils_017.bb:do_package_qa unihash changed to 5bbf6397f174b9105ddc70390fa862ddc66f0a94b7357f564cf401c640206b2c
NOTE: recipe usbutils-017-r0: task do_package_write_ipk: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-bsp/usbutils/usbutils_017.bb:do_package_write_ipk unihash changed to e6d28d114eeb8babec5923b7d66eaa14baa6da6390e204b353a4412dd0b49cf2
NOTE: recipe usbutils-017-r0: task do_create_runtime_spdx: Started
NOTE: recipe usbutils-017-r0: task do_package_write_deb: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-bsp/usbutils/usbutils_017.bb:do_package_write_deb unihash changed to b905edcc4703cedbd08be36ecafd0652454a63137d5aee9b3782e82376de6b6f
NOTE: recipe usbutils-017-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe usbutils-017-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-bsp/usbutils/usbutils_017.bb:do_package_write_rpm unihash changed to 7fc1446f1c88e1c3160ed8ffd09c8061503640cbc1384102865043b4103d41b8
NOTE: recipe usbutils-017-r0: task do_populate_sysroot: Failed
NOTE: Tasks Summary: Attempted 2498 tasks of which 2478 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20231115050315.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20231115050315.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-bsp/usbutils/usbutils_017.bb:do_populate_sysroot
Summary: There was 1 WARNING message.
Summary: There were 4 ERROR messages, returning a non-zero exit code.
ERROR: usbutils-017-r0 do_populate_sysroot: QA Issue: usbutils.pc failed sanity test (tmpdir) in path /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/usbutils/017/sysroot-destdir/usr/lib/pkgconfig [pkgconfig]
ERROR: usbutils-017-r0 do_populate_sysroot: QA Issue: usbutils.pc failed sanity test (tmpdir) in path /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/usbutils/017/sysroot-destdir/usr/lib/pkgconfig [pkgconfig]
ERROR: usbutils-017-r0 do_populate_sysroot: QA Issue: usbutils.pc failed sanity test (tmpdir) in path /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/usbutils/017/sysroot-destdir/usr/lib/pkgconfig [pkgconfig]
ERROR: usbutils-017-r0 do_populate_sysroot: do_populate_sysroot for this recipe installed files with QA issues
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/usbutils/017/temp/log.do_populate_sysroot.3133657
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-bsp/usbutils/usbutils_017.bb:do_populate_sysroot) failed with exit code '1'

--===============4154553021462473000==--

