Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 359BFC54E62
	for <webhook@archiver.kernel.org>; Thu, 15 Aug 2024 18:59:05 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.131451.1723748336240659724
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Aug 2024 11:58:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=PbIcfVj4;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=vjtPmr8R;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019157684035-d61a21dd-e7be-4497-96d0-10aa1537a38c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1723748335;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Nohryu0K8RLImd72TJ3GwerMr9O6aIGFkO3qzq6FrJY=;
	b=PbIcfVj4AUB7E8oYrGqhpmvFfduD8n7N6YEddvxj+UlUF0XGqD+eETxvQJTcMrIQ
	BsUyZv//twWPTxkPm8ZtF80Aqb/ubFPWJJxU0K82Mk9F2HfU1aBzx6zWUlmb2fhVGUp
	KzynUwReOu0LPu2zPMsxLZg7cH0dOoq36Ax1gu1U=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1723748335;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Nohryu0K8RLImd72TJ3GwerMr9O6aIGFkO3qzq6FrJY=;
	b=vjtPmr8RUY330BXvwIIGc/IT9RCJfQIHoZKY7FLIuIv+dcJSNwifzjXZog6bXZ2C
	oy2FcUwaWESQWRM2LskvuDtMJZaMFzjByWc4wkRxi23QVawd2PfeZahnZ+RhfK34piD
	cpyzAwna+EHH3o4ezxMLCIgJm8n/fCKl1HpvnD4k=
Content-Type: multipart/mixed; boundary="===============1746095242133787102=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libxslt: upgrading to 1.1.42 FAILED
Message-ID: <0101019157684035-d61a21dd-e7be-4497-96d0-10aa1537a38c-000000@us-west-2.amazonses.com>
Date: Thu, 15 Aug 2024 18:58:55 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.08.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Aug 2024 18:59:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203446

--===============1746095242133787102==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libxslt* to *1.1.42* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-libxslt-upgrade-1.1.39-1.1.42.patch
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
From c0ead478eeaa04bb05a5af013123eefca96fa8fb Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Aug 2024 18:32:43 +0000
Subject: [PATCH] libxslt: upgrade 1.1.39 -> 1.1.42

---
 .../libxslt/{libxslt_1.1.39.bb => libxslt_1.1.42.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libxslt/{libxslt_1.1.39.bb => libxslt_1.1.42.bb} (95%)

diff --git a/meta/recipes-support/libxslt/libxslt_1.1.39.bb b/meta/recipes-support/libxslt/libxslt_1.1.42.bb
similarity index 95%
rename from meta/recipes-support/libxslt/libxslt_1.1.39.bb
rename to meta/recipes-support/libxslt/libxslt_1.1.42.bb
index 2cc0c84bec..6c5864e63a 100644
--- a/meta/recipes-support/libxslt/libxslt_1.1.39.bb
+++ b/meta/recipes-support/libxslt/libxslt_1.1.42.bb
@@ -15,7 +15,7 @@ DEPENDS = "libxml2"
 
 SRC_URI = "https://download.gnome.org/sources/libxslt/1.1/libxslt-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "2a20ad621148339b0759c4d4e96719362dee64c9a096dbba625ba053846349f0"
+SRC_URI[sha256sum] = "85ca62cac0d41fc77d3f6033da9df6fd73d20ea2fc18b0a3609ffb4110e1baeb"
 
 UPSTREAM_CHECK_REGEX = "libxslt-(?P<pver>\d+(\.\d+)+)\.tar"
 
-- 
2.44.0


--===============1746095242133787102==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libxslt-upgrade-1.1.39-1.1.42.patch"

RnJvbSBjMGVhZDQ3OGVlYWEwNGJiMDVhNWFmMDEzMTIzZWVmY2E5NmZhOGZiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgQXVnIDIwMjQgMTg6MzI6NDMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJ4c2x0OiB1cGdyYWRlIDEuMS4zOSAtPiAxLjEuNDIKCi0tLQogLi4uL2xpYnhzbHQve2xpYnhz
bHRfMS4xLjM5LmJiID0+IGxpYnhzbHRfMS4xLjQyLmJifSAgICAgICAgICAgIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvbGlieHNsdC97bGlieHNsdF8xLjEuMzkuYmIgPT4gbGlieHNsdF8xLjEu
NDIuYmJ9ICg5NSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGlieHNsdC9s
aWJ4c2x0XzEuMS4zOS5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYnhzbHQvbGlieHNsdF8x
LjEuNDIuYmIKc2ltaWxhcml0eSBpbmRleCA5NSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLXN1
cHBvcnQvbGlieHNsdC9saWJ4c2x0XzEuMS4zOS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLXN1
cHBvcnQvbGlieHNsdC9saWJ4c2x0XzEuMS40Mi5iYgppbmRleCAyY2MwYzg0YmVjLi42YzU4NjRl
NjNhIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJ4c2x0L2xpYnhzbHRfMS4x
LjM5LmJiCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYnhzbHQvbGlieHNsdF8xLjEuNDIu
YmIKQEAgLTE1LDcgKzE1LDcgQEAgREVQRU5EUyA9ICJsaWJ4bWwyIgogCiBTUkNfVVJJID0gImh0
dHBzOi8vZG93bmxvYWQuZ25vbWUub3JnL3NvdXJjZXMvbGlieHNsdC8xLjEvbGlieHNsdC0ke1BW
fS50YXIueHoiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIyYTIwYWQ2MjExNDgzMzliMDc1OWM0
ZDRlOTY3MTkzNjJkZWU2NGM5YTA5NmRiYmE2MjViYTA1Mzg0NjM0OWYwIgorU1JDX1VSSVtzaGEy
NTZzdW1dID0gIjg1Y2E2MmNhYzBkNDFmYzc3ZDNmNjAzM2RhOWRmNmZkNzNkMjBlYTJmYzE4YjBh
MzYwOWZmYjQxMTBlMWJhZWIiCiAKIFVQU1RSRUFNX0NIRUNLX1JFR0VYID0gImxpYnhzbHQtKD9Q
PHB2ZXI+XGQrKFwuXGQrKSspXC50YXIiCiAKLS0gCjIuNDQuMAoK

--===============1746095242133787102==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1869 entries from dependency cache.
Parsing recipes...done.
Parsing of 916 .bb files complete (915 cached, 1 parsed). 1867 targets, 40 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-43fd302a4adac20eb0778396260c3cb032267ef4"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:43fd302a4adac20eb0778396260c3cb032267ef4"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 156 Local 145 Mirrors 0 Missed 11 Current 261 (92% match, 97% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 268 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.12.8.bb:do_create_spdx_setscene)
NOTE: Running setscene task 278 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libxslt/libxslt_1.1.42.bb:do_recipe_qa_setscene)
NOTE: recipe libxslt-1.1.42-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.12.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxslt-1.1.42-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 742 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libxslt/libxslt_1.1.42.bb:do_fetch)
NOTE: recipe libxml2-2.12.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 379 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.1.bb:do_create_spdx_setscene)
NOTE: recipe libxslt-1.1.42-r0: task do_fetch: Started
NOTE: recipe libxslt-1.1.42-r0: task do_fetch: Succeeded
NOTE: recipe libtool-cross-2.5.1-r0: task do_create_spdx_setscene: Started
NOTE: Running task 812 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libxslt/libxslt_1.1.42.bb:do_unpack)
NOTE: recipe libtool-cross-2.5.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 382 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_create_spdx_setscene)
NOTE: recipe libxslt-1.1.42-r0: task do_unpack: Started
NOTE: Running setscene task 383 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 387 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.40.bb:do_create_spdx_setscene)
NOTE: recipe libtool-cross-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 391 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxslt-1.1.42-r0: task do_unpack: Succeeded
NOTE: Running task 815 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libxslt/libxslt_1.1.42.bb:do_patch)
NOTE: recipe libtool-cross-2.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glibc-2.40+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxslt-1.1.42-r0: task do_patch: Started
NOTE: recipe libtool-cross-2.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxslt-1.1.42-r0: task do_patch: Succeeded
NOTE: Running task 821 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libxslt/libxslt_1.1.42.bb:do_deploy_source_date_epoch)
NOTE: Running task 822 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libxslt/libxslt_1.1.42.bb:do_populate_lic)
NOTE: recipe glibc-2.40+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 396 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_create_spdx_setscene)
NOTE: recipe libxslt-1.1.42-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxslt-1.1.42-r0: task do_populate_lic: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 401 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxslt-1.1.42-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libxslt/libxslt_1.1.42.bb:do_populate_lic unihash changed to 53e15d54a49a2d8e6023f2a9a2588cf5fcaff948c55e1942622be7cf014a311d
NOTE: recipe libxslt-1.1.42-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libxslt/libxslt_1.1.42.bb:do_deploy_source_date_epoch unihash changed to 24414536b390669bbfb5e22b3fc595b022f4eb15f7e70595d7ca3f9d65ede447
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 412 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.43.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 414 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.43-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.43-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 417 of 417 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.43.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.43-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.43-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1154 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libxslt/libxslt_1.1.42.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1187 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libxslt/libxslt_1.1.42.bb:do_collect_spdx_deps)
NOTE: recipe libxslt-1.1.42-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxslt-1.1.42-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxslt-1.1.42-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxslt-1.1.42-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1188 of 1200 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libxslt/libxslt_1.1.42.bb:do_configure)
NOTE: recipe libxslt-1.1.42-r0: task do_configure: Started
NOTE: recipe libxslt-1.1.42-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 1188 tasks of which 1180 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240815183218.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240815183218.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libxslt/libxslt_1.1.42.bb:do_configure
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: libxslt-1.1.42-r0 do_configure: QA Issue: libxslt: configure was passed unrecognised options: --without-mem-debug [unknown-configure-option]
ERROR: libxslt-1.1.42-r0 do_configure: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libxslt/1.1.42/temp/log.do_configure.4075851
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libxslt/libxslt_1.1.42.bb:do_configure) failed with exit code '1'

--===============1746095242133787102==--

