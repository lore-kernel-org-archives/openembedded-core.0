Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 436CCC25B60
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 14:25:17 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.8640.1698848702617669836
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Nov 2023 07:25:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=F6e23pDG;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=KehTrKPY;
 spf=pass (domain: automation.yoctoproject.org, ip: 54.240.27.193, mailfrom: 0101018b8b45fcc9-c22f5cbe-fc8d-4477-9aab-8ed401d390f8-000000@automation.yoctoproject.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1698848701;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=3Kl4leyh4lyqA0JMkK7v7N+GrU/LFBtS+gf2KDpfjZg=;
	b=F6e23pDGjPh8tjMhL2s4N3eJV2ZcRVHYUZWnDv6ew+dSgfDZKnHmYyVliyXS5ctg
	0t6XdHNaA1Xt3zqyXGQ/qLbj4H/AGEOhVvlimmh3r1ERji1v+573Dvy7/L9Eh7ab1Um
	aZL0FzsI4zJs8PtEETCUvA9viMubFRi3d6Cm6sRw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1698848701;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=3Kl4leyh4lyqA0JMkK7v7N+GrU/LFBtS+gf2KDpfjZg=;
	b=KehTrKPYI/2Mq9OvL9bzOT3s7YMDHApPYcxOeUFJEEowDRrP4AAwzm5/SxfueyT0
	4k8MVUyGqoyUztujPgZQTO/WUpmprf1ew1VM93zRThh7kd7/la6T73a1geoOwu2jShZ
	AJ+4bUXi7+3HQaEqn+5Mn+srXjGIcj6eTCQKbJCs=
Content-Type: multipart/mixed; boundary="===============6622740232520245986=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] usbutils: upgrading to 017 FAILED
Message-ID: <0101018b8b45fcc9-c22f5cbe-fc8d-4477-9aab-8ed401d390f8-000000@us-west-2.amazonses.com>
Date: Wed, 1 Nov 2023 14:25:01 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Nov 2023 14:25:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189920

--===============6622740232520245986==
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
From 3c7d15b47dd05dc11c088f4e8f29755cabaad060 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Nov 2023 05:40:59 +0000
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


--===============6622740232520245986==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1843 entries from dependency cache.
Parsing recipes...done.
Parsing of 911 .bb files complete (910 cached, 1 parsed). 1842 targets, 38 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "4.3+snapshot-3a7b408178439482d49d573113cc61a69fb28147"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:3a7b408178439482d49d573113cc61a69fb28147"
workspace            = "master:3a7b408178439482d49d573113cc61a69fb28147"

Initialising tasks...done.
Sstate summary: Wanted 10 Local 0 Mirrors 0 Missed 10 Current 873 (0% match, 98% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1924 of 2473 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/usbutils/usbutils_017.bb:do_recipe_qa)
NOTE: recipe usbutils-017-r0: task do_recipe_qa: Started
NOTE: recipe usbutils-017-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2456 of 2473 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/usbutils/usbutils_017.bb:do_fetch)
NOTE: recipe usbutils-017-r0: task do_fetch: Started
NOTE: recipe usbutils-017-r0: task do_fetch: Succeeded
NOTE: Running task 2457 of 2473 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/usbutils/usbutils_017.bb:do_unpack)
NOTE: Running task 2458 of 2473 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/usbutils/usbutils_017.bb:do_prepare_recipe_sysroot)
NOTE: recipe usbutils-017-r0: task do_unpack: Started
NOTE: recipe usbutils-017-r0: task do_unpack: Succeeded
NOTE: recipe usbutils-017-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2459 of 2473 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/usbutils/usbutils_017.bb:do_patch)
NOTE: Running task 2460 of 2473 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/usbutils/usbutils_017.bb:do_collect_spdx_deps)
NOTE: recipe usbutils-017-r0: task do_patch: Started
NOTE: recipe usbutils-017-r0: task do_collect_spdx_deps: Started
NOTE: recipe usbutils-017-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe usbutils-017-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe usbutils-017-r0: task do_patch: Succeeded
NOTE: Running task 2461 of 2473 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/usbutils/usbutils_017.bb:do_deploy_source_date_epoch)
NOTE: Running task 2462 of 2473 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/usbutils/usbutils_017.bb:do_populate_lic)
NOTE: recipe usbutils-017-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe usbutils-017-r0: task do_populate_lic: Started
NOTE: recipe usbutils-017-r0: task do_populate_lic: Succeeded
NOTE: recipe usbutils-017-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2463 of 2473 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/usbutils/usbutils_017.bb:do_configure)
NOTE: recipe usbutils-017-r0: task do_configure: Started
NOTE: recipe usbutils-017-r0: task do_configure: Succeeded
NOTE: Running task 2464 of 2473 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/usbutils/usbutils_017.bb:do_compile)
NOTE: recipe usbutils-017-r0: task do_compile: Started
NOTE: recipe usbutils-017-r0: task do_compile: Succeeded
NOTE: Running task 2465 of 2473 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/usbutils/usbutils_017.bb:do_install)
NOTE: recipe usbutils-017-r0: task do_install: Started
NOTE: recipe usbutils-017-r0: task do_install: Succeeded
NOTE: Running task 2466 of 2473 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/usbutils/usbutils_017.bb:do_package)
NOTE: Running task 2467 of 2473 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/usbutils/usbutils_017.bb:do_populate_sysroot)
NOTE: recipe usbutils-017-r0: task do_package: Started
NOTE: recipe usbutils-017-r0: task do_populate_sysroot: Started
NOTE: recipe usbutils-017-r0: task do_populate_sysroot: Failed
NOTE: recipe usbutils-017-r0: task do_package: Succeeded
NOTE: Tasks Summary: Attempted 2467 tasks of which 2454 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/usbutils/usbutils_017.bb:do_populate_sysroot
Summary: There were 4 ERROR messages, returning a non-zero exit code.
ERROR: usbutils-017-r0 do_populate_sysroot: QA Issue: usbutils.pc failed sanity test (tmpdir) in path /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/usbutils/017/sysroot-destdir/usr/lib/pkgconfig [pkgconfig]
ERROR: usbutils-017-r0 do_populate_sysroot: QA Issue: usbutils.pc failed sanity test (tmpdir) in path /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/usbutils/017/sysroot-destdir/usr/lib/pkgconfig [pkgconfig]
ERROR: usbutils-017-r0 do_populate_sysroot: QA Issue: usbutils.pc failed sanity test (tmpdir) in path /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/usbutils/017/sysroot-destdir/usr/lib/pkgconfig [pkgconfig]
ERROR: usbutils-017-r0 do_populate_sysroot: do_populate_sysroot for this recipe installed files with QA issues
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/usbutils/017/temp/log.do_populate_sysroot.3914069
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/usbutils/usbutils_017.bb:do_populate_sysroot) failed with exit code '1'

--===============6622740232520245986==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-usbutils-upgrade-015-017.patch"

RnJvbSAzYzdkMTViNDdkZDA1ZGMxMWMwODhmNGU4ZjI5NzU1Y2FiYWFkMDYwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBOb3YgMjAyMyAwNTo0MDo1OSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHVz
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

--===============6622740232520245986==--

