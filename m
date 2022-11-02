Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59DD0C6FD23
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 00:40:41 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web09.869.1667349637610010653
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Nov 2022 17:40:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Y1j77jiw;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101018435c866a7-a98b30c6-ccd7-4d9f-b4d9-27106d8645fc-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1667349637;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=hft0LspqAzpZnLEKHTrQFoef4XA5jIYaf1VwMTf+wzw=;
	b=Y1j77jiwAr43TB+mErr8sgbSOUq5qSjn7y3y4Nu/TdAUFrNWiMxV7RyQOvr2jRCi
	TKOT0hikhlJJGzZ1wGVFHT/mSJi7Juw1iV4Z2b4FAOhHZRdWh4nfRG6zkOwJ3QkFITj
	9PlRVA+QhPgMiUfatCCLcN31HCvf/Q0bLIWmU0hA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1667349637;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=hft0LspqAzpZnLEKHTrQFoef4XA5jIYaf1VwMTf+wzw=;
	b=Zd/Z6gnlRA+VFoMwRtvv7lB+pgAY0xeR/ejBdaH4XhrICQL4jmNqvFLrbpULdUvN
	mgqYpFLXIVN6Kiby0gwD2JJ4A6wr2fZ0QqfKBQzNyMf8oveUGhPfOECHj4sFWd42H4d
	Dfr+WB+uCtrjBjNxduqnBzqOM0cJq6uHnfmFUZhQ=
Content-Type: multipart/mixed; boundary="===============2496776198444609166=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] diffoscope: upgrading to 224 SUCCEEDED
Message-ID: <0101018435c866a7-a98b30c6-ccd7-4d9f-b4d9-27106d8645fc-000000@us-west-2.amazonses.com>
Date: Wed, 2 Nov 2022 00:40:36 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.11.02-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Nov 2022 00:40:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172510

--===============2496776198444609166==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *diffoscope* to *224* has Succeeded.

Next steps:
    - apply the patch: git am 0001-diffoscope-upgrade-221-224.patch
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
--===============2496776198444609166==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/diffoscope/diffoscope-dbg: PV changed from "221" to "224"
packages/core2-32-poky-linux/diffoscope/diffoscope-dbg: PKGV changed from 221 [default] to 224 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-dev: PV changed from "221" to "224"
packages/core2-32-poky-linux/diffoscope/diffoscope-dev: PKGV changed from 221 [default] to 224 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-doc: PV changed from "221" to "224"
packages/core2-32-poky-linux/diffoscope/diffoscope-doc: PKGV changed from 221 [default] to 224 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-locale: PV changed from "221" to "224"
packages/core2-32-poky-linux/diffoscope/diffoscope-locale: PKGV changed from 221 [default] to 224 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-src: PV changed from "221" to "224"
packages/core2-32-poky-linux/diffoscope/diffoscope-src: PKGV changed from 221 [default] to 224 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-staticdev: PV changed from "221" to "224"
packages/core2-32-poky-linux/diffoscope/diffoscope-staticdev: PKGV changed from 221 [default] to 224 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope: PV changed from "221" to "224"
packages/core2-32-poky-linux/diffoscope/diffoscope: PKGSIZE changed from 1376175 to 1376339 (+0%)
packages/core2-32-poky-linux/diffoscope/diffoscope: PKGV changed from 221 [default] to 224 [default]
packages/core2-32-poky-linux/diffoscope: PV changed from "221" to "224"
packages/core2-32-poky-linux/diffoscope: SRC_URI changed from "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-221.tar.gz" to "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-224.tar.gz"
packages/core2-32-poky-linux/diffoscope: PKGV changed from 221 [default] to 224 [default]
Changes to packages/core2-32-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.11/site-packages/diffoscope-221.dist-info moved to /usr/lib/python3.11/site-packages/diffoscope-224.dist-info

--===============2496776198444609166==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-diffoscope-upgrade-221-224.patch"

RnJvbSA2YjY1ZTIxNmEzMWUxYzc3ODFlM2JlN2FhMzI5OGEwMjc1YmVlYTc3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBOb3YgMjAyMiAyMzoyOTowMiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGRp
ZmZvc2NvcGU6IHVwZ3JhZGUgMjIxIC0+IDIyNAoKLS0tCiAuLi4vZGlmZm9zY29wZS97ZGlmZm9z
Y29wZV8yMjEuYmIgPT4gZGlmZm9zY29wZV8yMjQuYmJ9ICAgICAgICAgfCAyICstCiAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lw
ZXMtc3VwcG9ydC9kaWZmb3Njb3BlL3tkaWZmb3Njb3BlXzIyMS5iYiA9PiBkaWZmb3Njb3BlXzIy
NC5iYn0gKDkyJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9kaWZmb3Njb3Bl
L2RpZmZvc2NvcGVfMjIxLmJiIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZGlmZm9zY29wZS9kaWZm
b3Njb3BlXzIyNC5iYgpzaW1pbGFyaXR5IGluZGV4IDkyJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lw
ZXMtc3VwcG9ydC9kaWZmb3Njb3BlL2RpZmZvc2NvcGVfMjIxLmJiCnJlbmFtZSB0byBtZXRhL3Jl
Y2lwZXMtc3VwcG9ydC9kaWZmb3Njb3BlL2RpZmZvc2NvcGVfMjI0LmJiCmluZGV4IGM4MDEyMDBk
N2MuLjVkNjM0YjgwNzMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2RpZmZvc2Nv
cGUvZGlmZm9zY29wZV8yMjEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZGlmZm9zY29w
ZS9kaWZmb3Njb3BlXzIyNC5iYgpAQCAtMTIsNyArMTIsNyBAQCBQWVBJX1BBQ0tBR0UgPSAiZGlm
Zm9zY29wZSIKIAogaW5oZXJpdCBweXBpIHNldHVwdG9vbHMzCiAKLVNSQ19VUklbc2hhMjU2c3Vt
XSA9ICI3YjE3MjRlOWIxZTVhYzY1OTdjYWMwN2QwYWNkMjY2MWRiMWJjZjBkNmE5YjJlODdiZTIx
YjVlMzgwNmJlOWY4IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjE5MjBlYmRjYTQwZTg1ZjAxOWE4
NGUwMjIwZTRhNzlmMDBmZmRhZmMwZjc4ZTFmMWUyMjE5MTIzZDVjMDhkZmIiCiAKIFJERVBFTkRT
OiR7UE59ICs9ICJiaW51dGlscyB2aW0gc3F1YXNoZnMtdG9vbHMgcHl0aG9uMy1saWJhcmNoaXZl
LWMgcHl0aG9uMy1tYWdpYyBweXRob24zLXJwbSIKIAotLSAKMi4zMS4xCgo=

--===============2496776198444609166==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.11/site-packages/diffoscope-221.dist-info moved to /usr/lib/python3.11/site-packages/diffoscope-224.dist-info

--===============2496776198444609166==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 886 .bb files complete (0 cached, 886 parsed). 1664 targets, 53 skipped, 0 masked, 0 errors.
Removing 1 recipes from the cortexa15t2hf-neon sysroot...done.
Removing 1 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:374176871ca6bd9ad6745c1a3e12c7b092ac2099"
workspace            = "master:78fd269e6649000b48ef1ef3e86009bad00fa815"

Initialising tasks...done.
Sstate summary: Wanted 92 Local 30 Mirrors 0 Missed 62 Current 641 (32% match, 91% complete)
Removing 1 stale sstate objects for arch qemuarm...done.
Removing 1 stale sstate objects for arch cortexa15t2hf-neon...done.
NOTE: Executing Tasks
NOTE: Running setscene task 688 of 733 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.85.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 694 of 733 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.85.0.bb:do_populate_sysroot_setscene)
NOTE: Running task 1370 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_fetch)
NOTE: Running task 1457 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_fetch)
NOTE: Running task 1458 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_fetch)
NOTE: Running task 1459 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_fetch)
NOTE: Running task 1470 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_224.bb:do_fetch)
NOTE: Running task 1480 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.39.bb:do_fetch)
NOTE: Running task 1481 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_fetch)
NOTE: Running task 1482 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_fetch)
NOTE: Running task 1483 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_fetch)
NOTE: Running task 1484 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_fetch)
NOTE: Running task 1485 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_fetch)
NOTE: recipe curl-7.85.0-r0: task do_packagedata_setscene: Started
NOTE: recipe lua-5.4.4-r0: task do_fetch: Started
NOTE: recipe lua-5.4.4-r0: task do_fetch: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_fetch: Started
NOTE: recipe curl-7.85.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe diffoscope-224-r0: task do_fetch: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_fetch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Started
NOTE: Running task 1555 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_unpack)
NOTE: recipe diffoscope-224-r0: task do_fetch: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_fetch: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_fetch: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Succeeded
NOTE: recipe binutils-2.39-r0: task do_fetch: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_fetch: Succeeded
NOTE: Running task 1556 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_224.bb:do_unpack)
NOTE: recipe rpm-1_4.18.0-r0: task do_fetch: Started
NOTE: Running task 1557 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_unpack)
NOTE: Running task 1558 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_unpack)
NOTE: recipe vim-9.0.0614-r0: task do_fetch: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_fetch: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_fetch: Started
NOTE: recipe binutils-2.39-r0: task do_fetch: Succeeded
NOTE: Running task 1559 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_unpack)
NOTE: recipe python3-magic-0.4.27-r0: task do_fetch: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_fetch: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_fetch: Succeeded
NOTE: Running task 1560 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.39.bb:do_unpack)
NOTE: Running task 1561 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_unpack)
NOTE: Running task 1562 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_unpack)
NOTE: recipe rpm-1_4.18.0-r0: task do_fetch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_unpack: Started
NOTE: Running task 1563 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_unpack)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/curl/7.85.0-r0/temp/log.do_packagedata_setscene.1780631
NOTE: recipe diffoscope-224-r0: task do_unpack: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Started
NOTE: Running task 1564 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_unpack)
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.85.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 730 of 733 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.85.0.bb:do_package_setscene)
NOTE: recipe vim-9.0.0614-r0: task do_fetch: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_unpack: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_unpack: Started
NOTE: recipe curl-7.85.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1565 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_unpack)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_unpack: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_unpack: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_unpack: Started
NOTE: recipe binutils-2.39-r0: task do_unpack: Started
NOTE: recipe diffoscope-224-r0: task do_unpack: Succeeded
NOTE: recipe rpm-1_4.18.0-r0: task do_unpack: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_unpack: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_unpack: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_unpack: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Succeeded
NOTE: Running task 1566 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_patch)
NOTE: recipe libxt-1_1.2.1-r0: task do_unpack: Succeeded
NOTE: Running task 1567 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_patch)
NOTE: Running task 1568 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_patch)
NOTE: Running task 1569 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_224.bb:do_patch)
NOTE: Running task 1570 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_patch)
NOTE: Running task 1571 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_patch)
NOTE: recipe libxt-1_1.2.1-r0: task do_patch: Started
NOTE: recipe vim-9.0.0614-r0: task do_unpack: Started
NOTE: recipe lua-5.4.4-r0: task do_patch: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_patch: Started
NOTE: recipe diffoscope-224-r0: task do_patch: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_unpack: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_patch: Started
NOTE: Running task 1572 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_patch)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_unpack: Succeeded
NOTE: Running task 1573 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_patch)
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Succeeded
NOTE: recipe diffoscope-224-r0: task do_patch: Succeeded
NOTE: Running task 1574 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-magic-0.4.27-r0: task do_patch: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_patch: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_patch: Started
NOTE: Running task 1575 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_224.bb:do_deploy_source_date_epoch)
NOTE: Running task 1576 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_deploy_source_date_epoch)
NOTE: Running task 1577 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1578 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_224.bb:do_populate_lic)
NOTE: recipe libxt-1_1.2.1-r0: task do_patch: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_patch: Started
NOTE: Running task 1579 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lua-5.4.4-r0: task do_patch: Succeeded
NOTE: recipe diffoscope-224-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_patch: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1580 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_deploy_source_date_epoch)
NOTE: recipe diffoscope-224-r0: task do_populate_lic: Started
NOTE: Running task 1581 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libxt-1_1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_unpack: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_patch: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1582 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_patch)
NOTE: recipe lua-5.4.4-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1583 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_deploy_source_date_epoch)
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe diffoscope-224-r0: task do_populate_lic: Succeeded
NOTE: recipe diffoscope-224-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_patch: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_224.bb:do_populate_lic unihash changed to be93776526efe4d2e97073e1067608662b693869202b634e69af5b989fb3a56b
NOTE: recipe libxt-1_1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vim-9.0.0614-r0: task do_unpack: Succeeded
NOTE: Running task 1584 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_patch)
NOTE: recipe vim-9.0.0614-r0: task do_patch: Started
NOTE: recipe curl-7.85.0-r0: task do_package_setscene: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_patch: Succeeded
NOTE: Running task 1585 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_deploy_source_date_epoch)
NOTE: recipe rpm-1_4.18.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vim-9.0.0614-r0: task do_patch: Succeeded
NOTE: Running task 1586 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_deploy_source_date_epoch)
NOTE: recipe rpm-1_4.18.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vim-9.0.0614-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vim-9.0.0614-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe binutils-2.39-r0: task do_unpack: Succeeded
NOTE: Running task 1587 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.39.bb:do_patch)
NOTE: recipe curl-7.85.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 731 of 733 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.36.bb:do_packagedata_setscene)
NOTE: recipe binutils-2.39-r0: task do_patch: Started
NOTE: recipe glibc-2.36-r0: task do_packagedata_setscene: Started
NOTE: recipe glibc-2.36-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1965 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_configure_ptest_base)
NOTE: Running task 2125 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.8.bb:do_compile)
NOTE: Running task 2130 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_compile)
NOTE: Running task 2187 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2278 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.85.0.bb:do_packagedata)
NOTE: recipe libgcrypt-1.10.1-r0: task do_configure_ptest_base: Started
NOTE: Running task 2338 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2339 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gnutls-3.7.8-r0: task do_compile: Started
NOTE: Running task 2340 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2349 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_224.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2393 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2394 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgcrypt-1.10.1-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe libarchive-3.6.1-r0: task do_compile: Started
NOTE: recipe lua-5.4.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe curl-7.85.0-r0: task do_packagedata: Started
NOTE: Running task 2432 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_compile)
NOTE: recipe lz4-1_1.9.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe diffoscope-224-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_compile: Started
NOTE: recipe lua-5.4.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2433 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_configure)
NOTE: Running task 2434 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_configure)
NOTE: recipe binutils-2.39-r0: task do_patch: Succeeded
NOTE: Running task 2435 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.39.bb:do_deploy_source_date_epoch)
NOTE: recipe lua-5.4.4-r0: task do_configure: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_configure: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe curl-7.85.0-r0: task do_packagedata: Succeeded
NOTE: recipe binutils-2.39-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2436 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_configure)
NOTE: recipe libxt-1_1.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_configure: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_configure: Succeeded
NOTE: Running task 2437 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_configure)
NOTE: Running task 2438 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_configure_ptest_base)
NOTE: recipe python3-magic-0.4.27-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2439 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_compile)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe diffoscope-224-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2440 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_configure)
NOTE: Running task 2441 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_configure)
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Started
NOTE: Running task 2442 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_224.bb:do_configure)
NOTE: recipe diffoscope-224-r0: task do_configure: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_configure: Started
NOTE: recipe lua-5.4.4-r0: task do_configure_ptest_base: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_compile: Started
NOTE: recipe lua-5.4.4-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe diffoscope-224-r0: task do_configure: Succeeded
NOTE: Running task 2443 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_compile)
NOTE: Running task 2444 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_224.bb:do_compile)
NOTE: recipe binutils-2.39-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_configure: Started
NOTE: recipe diffoscope-224-r0: task do_compile: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_configure: Started
NOTE: recipe lua-5.4.4-r0: task do_compile: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_configure: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_configure: Succeeded
NOTE: Running task 2445 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_compile)
NOTE: Running task 2446 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_compile)
NOTE: recipe python3-magic-0.4.27-r0: task do_compile: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_compile: Started
NOTE: recipe diffoscope-224-r0: task do_compile: Succeeded
NOTE: Running task 2447 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_224.bb:do_install)
NOTE: recipe diffoscope-224-r0: task do_install: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_compile: Succeeded
NOTE: Running task 2448 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_install)
NOTE: recipe python3-magic-0.4.27-r0: task do_compile: Succeeded
NOTE: Running task 2449 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_install)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_install: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_install: Started
NOTE: recipe lua-5.4.4-r0: task do_compile: Succeeded
NOTE: Running task 2450 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_compile_ptest_base)
NOTE: recipe libarchive-3.6.1-r0: task do_compile: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_compile_ptest_base: Started
NOTE: Running task 2451 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_install)
NOTE: recipe lua-5.4.4-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_install: Succeeded
NOTE: recipe diffoscope-224-r0: task do_install: Succeeded
NOTE: Running task 2452 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_install)
NOTE: recipe python3-magic-0.4.27-r0: task do_install: Succeeded
NOTE: Running task 2453 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_package)
NOTE: Running task 2454 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_224.bb:do_package)
NOTE: recipe libarchive-3.6.1-r0: task do_install: Started
NOTE: Running task 2455 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_package)
NOTE: Running task 2456 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_224.bb:do_populate_sysroot)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package: Started
NOTE: recipe lua-5.4.4-r0: task do_install: Started
NOTE: recipe diffoscope-224-r0: task do_package: Started
NOTE: recipe diffoscope-224-r0: task do_populate_sysroot: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_package: Started
NOTE: recipe lua-5.4.4-r0: task do_install: Succeeded
NOTE: Running task 2457 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_install_ptest_base)
NOTE: recipe lua-5.4.4-r0: task do_install_ptest_base: Started
NOTE: recipe libarchive-3.6.1-r0: task do_install: Succeeded
NOTE: Running task 2458 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_populate_sysroot)
NOTE: Running task 2459 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_package)
NOTE: recipe lua-5.4.4-r0: task do_install_ptest_base: Succeeded
NOTE: recipe diffoscope-224-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2460 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_package)
NOTE: Running task 2461 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_populate_sysroot)
NOTE: recipe libarchive-3.6.1-r0: task do_populate_sysroot: Started
NOTE: recipe libarchive-3.6.1-r0: task do_package: Started
NOTE: recipe lua-5.4.4-r0: task do_populate_sysroot: Started
NOTE: recipe lua-5.4.4-r0: task do_package: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Succeeded
NOTE: Running task 2462 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_compile)
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Started
NOTE: recipe libarchive-3.6.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_package: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package: Succeeded
NOTE: Running task 2463 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_packagedata)
NOTE: Running task 2464 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_packagedata)
NOTE: recipe python3-magic-0.4.27-r0: task do_packagedata: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_packagedata: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Succeeded
NOTE: Running task 2465 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_install)
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_packagedata: Succeeded
NOTE: Running task 2466 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_package_write_rpm)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_package_write_rpm: Started
NOTE: recipe diffoscope-224-r0: task do_package: Succeeded
NOTE: Running task 2467 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_224.bb:do_packagedata)
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Succeeded
NOTE: Running task 2468 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_package)
NOTE: Running task 2469 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_populate_sysroot)
NOTE: recipe diffoscope-224-r0: task do_packagedata: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Started
NOTE: recipe diffoscope-224-r0: task do_packagedata: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_package_write_rpm: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libarchive-3.6.1-r0: task do_package: Succeeded
NOTE: Running task 2470 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_packagedata)
NOTE: recipe libarchive-3.6.1-r0: task do_packagedata: Started
NOTE: recipe lua-5.4.4-r0: task do_package: Succeeded
NOTE: Running task 2471 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_packagedata)
NOTE: recipe lua-5.4.4-r0: task do_packagedata: Started
NOTE: recipe libarchive-3.6.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2472 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_package_write_rpm)
NOTE: recipe lua-5.4.4-r0: task do_packagedata: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Succeeded
NOTE: Running task 2473 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_packagedata)
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_compile: Succeeded
NOTE: Running task 2474 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_compile_ptest_base)
NOTE: recipe libgcrypt-1.10.1-r0: task do_compile_ptest_base: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata: Succeeded
NOTE: Running task 2475 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_install)
NOTE: recipe libgcrypt-1.10.1-r0: task do_install: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_install: Succeeded
NOTE: Running task 2476 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_install_ptest_base)
NOTE: recipe libgcrypt-1.10.1-r0: task do_install_ptest_base: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2477 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_populate_sysroot)
NOTE: Running task 2478 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_package)
NOTE: recipe libgcrypt-1.10.1-r0: task do_populate_sysroot: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_package: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_configure: Succeeded
NOTE: Running task 2479 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_compile)
NOTE: recipe libxt-1_1.2.1-r0: task do_compile: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_compile: Succeeded
NOTE: Running task 2480 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_install)
NOTE: recipe lz4-1_1.9.4-r0: task do_install: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_install: Succeeded
NOTE: Running task 2481 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_package)
NOTE: Running task 2482 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_populate_sysroot)
NOTE: recipe lz4-1_1.9.4-r0: task do_populate_sysroot: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_package: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2483 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxt-1_1.2.1-r0: task do_compile: Succeeded
NOTE: Running task 2484 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_install)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_install: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2485 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_configure)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_configure: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_package: Succeeded
NOTE: Running task 2486 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_packagedata)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_configure: Succeeded
NOTE: Running task 2487 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_compile)
NOTE: recipe libgcrypt-1.10.1-r0: task do_packagedata: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_compile: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_install: Succeeded
NOTE: recipe libgcrypt-1.10.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2488 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_package)
NOTE: Running task 2489 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_populate_sysroot)
NOTE: recipe libxt-1_1.2.1-r0: task do_populate_sysroot: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_package: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_package: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2490 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_packagedata)
NOTE: Running task 2491 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe lz4-1_1.9.4-r0: task do_packagedata: Started
NOTE: recipe vim-9.0.0614-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_packagedata: Succeeded
NOTE: recipe vim-9.0.0614-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2492 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_configure)
NOTE: recipe vim-9.0.0614-r0: task do_configure: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_compile: Succeeded
NOTE: Running task 2493 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_install)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_install: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_install: Succeeded
NOTE: Running task 2494 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_package)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_package: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_package: Succeeded
NOTE: Running task 2495 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_packagedata)
NOTE: recipe libxt-1_1.2.1-r0: task do_packagedata: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_packagedata: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_package: Succeeded
NOTE: Running task 2496 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_packagedata)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_packagedata: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2497 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_package_write_rpm)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_package_write_rpm: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe vim-9.0.0614-r0: task do_configure: Succeeded
NOTE: Running task 2498 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_compile)
NOTE: recipe vim-9.0.0614-r0: task do_compile: Started
NOTE: recipe vim-9.0.0614-r0: task do_compile: Succeeded
NOTE: Running task 2499 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_install)
NOTE: recipe vim-9.0.0614-r0: task do_install: Started
NOTE: recipe gnutls-3.7.8-r0: task do_compile: Succeeded
NOTE: Running task 2500 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.8.bb:do_install)
NOTE: recipe gnutls-3.7.8-r0: task do_install: Started
NOTE: recipe vim-9.0.0614-r0: task do_install: Succeeded
NOTE: Running task 2501 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_package)
NOTE: recipe vim-9.0.0614-r0: task do_package: Started
NOTE: recipe gnutls-3.7.8-r0: task do_install: Succeeded
NOTE: Running task 2502 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.8.bb:do_populate_sysroot)
NOTE: Running task 2503 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.8.bb:do_package)
NOTE: recipe gnutls-3.7.8-r0: task do_populate_sysroot: Started
NOTE: recipe gnutls-3.7.8-r0: task do_package: Started
NOTE: recipe gnutls-3.7.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2504 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_prepare_recipe_sysroot)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2505 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_configure)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_configure: Started
NOTE: recipe gnutls-3.7.8-r0: task do_package: Succeeded
NOTE: Running task 2506 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.8.bb:do_packagedata)
NOTE: recipe gnutls-3.7.8-r0: task do_packagedata: Started
NOTE: recipe gnutls-3.7.8-r0: task do_packagedata: Succeeded
NOTE: recipe vim-9.0.0614-r0: task do_package: Succeeded
NOTE: Running task 2507 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_packagedata)
NOTE: recipe vim-9.0.0614-r0: task do_packagedata: Started
NOTE: recipe vim-9.0.0614-r0: task do_packagedata: Succeeded
NOTE: Running task 2508 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_package_write_rpm)
NOTE: recipe vim-9.0.0614-r0: task do_package_write_rpm: Started
NOTE: recipe vim-9.0.0614-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_configure: Succeeded
NOTE: Running task 2509 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_compile)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_compile: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_compile: Succeeded
NOTE: Running task 2510 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_install)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_install: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_install: Succeeded
NOTE: Running task 2511 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_populate_sysroot)
NOTE: Running task 2512 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_package)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_populate_sysroot: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_package: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2513 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.187.bb:do_prepare_recipe_sysroot)
NOTE: recipe elfutils-0.187-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe elfutils-0.187-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2514 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.187.bb:do_configure)
NOTE: recipe elfutils-0.187-r0: task do_configure: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_package: Succeeded
NOTE: Running task 2515 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_packagedata)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_packagedata: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_packagedata: Succeeded
NOTE: recipe elfutils-0.187-r0: task do_configure: Succeeded
NOTE: Running task 2516 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.187.bb:do_configure_ptest_base)
NOTE: recipe elfutils-0.187-r0: task do_configure_ptest_base: Started
NOTE: recipe elfutils-0.187-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2517 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.187.bb:do_compile)
NOTE: recipe elfutils-0.187-r0: task do_compile: Started
NOTE: recipe elfutils-0.187-r0: task do_compile: Succeeded
NOTE: Running task 2518 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.187.bb:do_compile_ptest_base)
NOTE: recipe elfutils-0.187-r0: task do_compile_ptest_base: Started
NOTE: recipe elfutils-0.187-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2519 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.187.bb:do_install)
NOTE: recipe elfutils-0.187-r0: task do_install: Started
NOTE: recipe elfutils-0.187-r0: task do_install: Succeeded
NOTE: Running task 2520 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.187.bb:do_install_ptest_base)
NOTE: recipe elfutils-0.187-r0: task do_install_ptest_base: Started
NOTE: recipe elfutils-0.187-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2521 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.187.bb:do_package)
NOTE: Running task 2522 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.187.bb:do_populate_sysroot)
NOTE: recipe elfutils-0.187-r0: task do_package: Started
NOTE: recipe elfutils-0.187-r0: task do_populate_sysroot: Started
NOTE: recipe elfutils-0.187-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2523 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.39.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2524 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe binutils-2.39-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe binutils-2.39-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2525 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.39.bb:do_configure)
NOTE: recipe binutils-2.39-r0: task do_configure: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2526 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_configure)
NOTE: recipe rpm-1_4.18.0-r0: task do_configure: Started
NOTE: recipe binutils-2.39-r0: task do_configure: Succeeded
NOTE: Running task 2527 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.39.bb:do_compile)
NOTE: recipe binutils-2.39-r0: task do_compile: Started
NOTE: recipe elfutils-0.187-r0: task do_package: Succeeded
NOTE: Running task 2528 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.187.bb:do_packagedata)
NOTE: recipe elfutils-0.187-r0: task do_packagedata: Started
NOTE: recipe elfutils-0.187-r0: task do_packagedata: Succeeded
NOTE: recipe rpm-1_4.18.0-r0: task do_configure: Succeeded
NOTE: Running task 2529 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_compile)
NOTE: recipe rpm-1_4.18.0-r0: task do_compile: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_compile: Succeeded
NOTE: Running task 2530 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_install)
NOTE: recipe rpm-1_4.18.0-r0: task do_install: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_install: Succeeded
NOTE: Running task 2531 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_package)
NOTE: recipe rpm-1_4.18.0-r0: task do_package: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_package: Succeeded
NOTE: Running task 2532 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_packagedata)
NOTE: recipe rpm-1_4.18.0-r0: task do_packagedata: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2533 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_package_write_rpm)
NOTE: recipe rpm-1_4.18.0-r0: task do_package_write_rpm: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe binutils-2.39-r0: task do_compile: Succeeded
NOTE: Running task 2534 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.39.bb:do_install)
NOTE: recipe binutils-2.39-r0: task do_install: Started
NOTE: recipe binutils-2.39-r0: task do_install: Succeeded
NOTE: Running task 2535 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.39.bb:do_package)
NOTE: recipe binutils-2.39-r0: task do_package: Started
NOTE: recipe binutils-2.39-r0: task do_package: Succeeded
NOTE: Running task 2536 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.39.bb:do_packagedata)
NOTE: recipe binutils-2.39-r0: task do_packagedata: Started
NOTE: recipe binutils-2.39-r0: task do_packagedata: Succeeded
NOTE: Running task 2537 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.39.bb:do_package_write_rpm)
NOTE: Running task 2538 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_224.bb:do_package_write_rpm)
NOTE: Running task 2539 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_224.bb:do_package_qa)
NOTE: recipe binutils-2.39-r0: task do_package_write_rpm: Started
NOTE: recipe diffoscope-224-r0: task do_package_write_rpm: Started
NOTE: recipe diffoscope-224-r0: task do_package_qa: Started
NOTE: recipe diffoscope-224-r0: task do_package_qa: Succeeded
NOTE: recipe diffoscope-224-r0: task do_package_write_rpm: Succeeded
NOTE: recipe binutils-2.39-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2540 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_224.bb:do_build)
NOTE: Tasks Summary: Attempted 2540 tasks of which 2376 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 10 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: curl-7.85.0-r0 do_packagedata_setscene: QA Issue: Package version for package curl-src went backwards which would break package feeds (from 0:7.86.0-r0 to 0:7.85.0-r0) [version-going-backwards]
ERROR: curl-7.85.0-r0 do_packagedata_setscene: QA Issue: Package version for package curl-dbg went backwards which would break package feeds (from 0:7.86.0-r0 to 0:7.85.0-r0) [version-going-backwards]
ERROR: curl-7.85.0-r0 do_packagedata_setscene: QA Issue: Package version for package libcurl went backwards which would break package feeds (from 0:7.86.0-r0 to 0:7.85.0-r0) [version-going-backwards]
ERROR: curl-7.85.0-r0 do_packagedata_setscene: QA Issue: Package version for package curl-ptest went backwards which would break package feeds (from 0:7.86.0-r0 to 0:7.85.0-r0) [version-going-backwards]
ERROR: curl-7.85.0-r0 do_packagedata_setscene: QA Issue: Package version for package curl-staticdev went backwards which would break package feeds (from 0:7.86.0-r0 to 0:7.85.0-r0) [version-going-backwards]
ERROR: curl-7.85.0-r0 do_packagedata_setscene: QA Issue: Package version for package curl-dev went backwards which would break package feeds (from 0:7.86.0-r0 to 0:7.85.0-r0) [version-going-backwards]
ERROR: curl-7.85.0-r0 do_packagedata_setscene: QA Issue: Package version for package curl-doc went backwards which would break package feeds (from 0:7.86.0-r0 to 0:7.85.0-r0) [version-going-backwards]
ERROR: curl-7.85.0-r0 do_packagedata_setscene: QA Issue: Package version for package curl-locale went backwards which would break package feeds (from 0:7.86.0-r0 to 0:7.85.0-r0) [version-going-backwards]
ERROR: curl-7.85.0-r0 do_packagedata_setscene: QA Issue: Package version for package curl went backwards which would break package feeds (from 0:7.86.0-r0 to 0:7.85.0-r0) [version-going-backwards]
ERROR: curl-7.85.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============2496776198444609166==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 886 .bb files complete (0 cached, 886 parsed). 1665 targets, 49 skipped, 0 masked, 0 errors.
Removing 117 recipes from the core2-32 sysroot...done.
Removing 123 recipes from the qemux86 sysroot...done.

Summary: There was 1 WARNING message.
Summary: There was 1 ERROR message, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: Nothing PROVIDES 'diffoscope'
diffoscope was skipped: incompatible with host i686-poky-linux-musl (not in COMPATIBLE_HOST)

--===============2496776198444609166==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 886 .bb files complete (0 cached, 886 parsed). 1664 targets, 63 skipped, 0 masked, 0 errors.
Removing 1 recipes from the mips32r2 sysroot...done.
Removing 1 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:374176871ca6bd9ad6745c1a3e12c7b092ac2099"
workspace            = "master:78fd269e6649000b48ef1ef3e86009bad00fa815"

Initialising tasks...done.
Sstate summary: Wanted 93 Local 30 Mirrors 0 Missed 63 Current 640 (32% match, 91% complete)
Removing 1 stale sstate objects for arch mips32r2...done.
Removing 1 stale sstate objects for arch qemumips...done.
NOTE: Executing Tasks
NOTE: Running setscene task 687 of 733 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.85.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 694 of 733 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.85.0.bb:do_populate_sysroot_setscene)
NOTE: Running task 1368 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_fetch)
NOTE: Running task 1457 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_fetch)
NOTE: Running task 1459 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_fetch)
NOTE: Running task 1460 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_fetch)
NOTE: Running task 1470 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_224.bb:do_fetch)
NOTE: Running task 1480 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_fetch)
NOTE: Running task 1481 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_fetch)
NOTE: Running task 1482 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_fetch)
NOTE: Running task 1483 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_fetch)
NOTE: Running task 1484 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_fetch)
NOTE: Running task 1485 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.39.bb:do_fetch)
NOTE: recipe lua-5.4.4-r0: task do_fetch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Started
NOTE: recipe curl-7.85.0-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-7.85.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_fetch: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_fetch: Started
NOTE: recipe lua-5.4.4-r0: task do_fetch: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Succeeded
NOTE: recipe diffoscope-224-r0: task do_fetch: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_fetch: Succeeded
NOTE: recipe diffoscope-224-r0: task do_fetch: Succeeded
NOTE: recipe vim-9.0.0614-r0: task do_fetch: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_fetch: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_fetch: Started
NOTE: Running task 1555 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_unpack)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_fetch: Started
NOTE: Running task 1556 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_unpack)
NOTE: Running task 1557 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_unpack)
NOTE: recipe python3-magic-0.4.27-r0: task do_fetch: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_fetch: Started
NOTE: Running task 1558 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_224.bb:do_unpack)
NOTE: recipe lz4-1_1.9.4-r0: task do_fetch: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_fetch: Succeeded
NOTE: recipe binutils-2.39-r0: task do_fetch: Started
NOTE: Running task 1559 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_unpack)
NOTE: Running task 1560 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_unpack)
NOTE: Running task 1561 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_unpack)
NOTE: recipe vim-9.0.0614-r0: task do_fetch: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_fetch: Succeeded
NOTE: recipe binutils-2.39-r0: task do_fetch: Succeeded
NOTE: recipe rpm-1_4.18.0-r0: task do_fetch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_unpack: Started
NOTE: Running task 1562 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_unpack)
NOTE: Running task 1563 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_unpack)
NOTE: Running task 1564 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.39.bb:do_unpack)
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_unpack: Started
NOTE: recipe diffoscope-224-r0: task do_unpack: Started
NOTE: recipe curl-7.85.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_unpack: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/curl/7.85.0-r0/temp/log.do_packagedata_setscene.2045848
NOTE: Running task 1565 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_unpack)
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.85.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe python3-libarchive-c-4.0-r0: task do_unpack: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_unpack: Started
NOTE: Running setscene task 730 of 733 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.85.0.bb:do_package_setscene)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_unpack: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_unpack: Succeeded
NOTE: recipe vim-9.0.0614-r0: task do_unpack: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_unpack: Succeeded
NOTE: recipe binutils-2.39-r0: task do_unpack: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_unpack: Started
NOTE: recipe diffoscope-224-r0: task do_unpack: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_unpack: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_unpack: Succeeded
NOTE: Running task 1566 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_patch)
NOTE: Running task 1567 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_patch)
NOTE: Running task 1568 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_patch)
NOTE: Running task 1569 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_224.bb:do_patch)
NOTE: Running task 1570 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_patch)
NOTE: Running task 1571 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_patch)
NOTE: recipe lua-5.4.4-r0: task do_patch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_patch: Started
NOTE: recipe diffoscope-224-r0: task do_patch: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_patch: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_patch: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_unpack: Succeeded
NOTE: Running task 1572 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_patch)
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Succeeded
NOTE: recipe diffoscope-224-r0: task do_patch: Succeeded
NOTE: Running task 1573 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_deploy_source_date_epoch)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_patch: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_patch: Succeeded
NOTE: Running task 1574 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_224.bb:do_deploy_source_date_epoch)
NOTE: Running task 1575 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_224.bb:do_populate_lic)
NOTE: Running task 1576 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_patch)
NOTE: Running task 1577 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_deploy_source_date_epoch)
NOTE: Running task 1578 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe lz4-1_1.9.4-r0: task do_patch: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_patch: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1579 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe diffoscope-224-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lua-5.4.4-r0: task do_patch: Succeeded
NOTE: recipe diffoscope-224-r0: task do_populate_lic: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_patch: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1580 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_deploy_source_date_epoch)
NOTE: recipe lz4-1_1.9.4-r0: task do_patch: Succeeded
NOTE: Running task 1581 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libxt-1_1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lua-5.4.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_unpack: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_patch: Succeeded
NOTE: recipe diffoscope-224-r0: task do_populate_lic: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe diffoscope-224-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1582 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 1583 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_patch)
NOTE: recipe python3-magic-0.4.27-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_224.bb:do_populate_lic unihash changed to be93776526efe4d2e97073e1067608662b693869202b634e69af5b989fb3a56b
NOTE: recipe python3-libarchive-c-4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe rpm-1_4.18.0-r0: task do_patch: Started
NOTE: recipe lua-5.4.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vim-9.0.0614-r0: task do_unpack: Succeeded
NOTE: Running task 1584 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_patch)
NOTE: recipe rpm-1_4.18.0-r0: task do_patch: Succeeded
NOTE: recipe vim-9.0.0614-r0: task do_patch: Started
NOTE: recipe curl-7.85.0-r0: task do_package_setscene: Started
NOTE: Running task 1585 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_deploy_source_date_epoch)
NOTE: recipe rpm-1_4.18.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vim-9.0.0614-r0: task do_patch: Succeeded
NOTE: Running task 1586 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_deploy_source_date_epoch)
NOTE: recipe vim-9.0.0614-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vim-9.0.0614-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe curl-7.85.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 731 of 733 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.36.bb:do_packagedata_setscene)
NOTE: recipe glibc-2.36-r0: task do_packagedata_setscene: Started
NOTE: recipe glibc-2.36-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe binutils-2.39-r0: task do_unpack: Succeeded
NOTE: Running task 1962 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_configure_ptest_base)
NOTE: Running task 2124 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.8.bb:do_compile)
NOTE: Running task 2129 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_compile)
NOTE: Running task 2184 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgcrypt-1.10.1-r0: task do_configure_ptest_base: Started
NOTE: Running task 2275 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.85.0.bb:do_packagedata)
NOTE: Running task 2310 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.45.bb:do_packagedata)
NOTE: Running task 2337 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2339 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2340 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe gnutls-3.7.8-r0: task do_compile: Started
NOTE: recipe libarchive-3.6.1-r0: task do_compile: Started
NOTE: Running task 2346 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.39.bb:do_patch)
NOTE: Running task 2349 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_224.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgcrypt-1.10.1-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2393 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2394 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_compile)
NOTE: Running task 2395 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe curl-7.85.0-r0: task do_packagedata: Started
NOTE: recipe libgpg-error-1.45-r0: task do_packagedata: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe diffoscope-224-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe binutils-2.39-r0: task do_patch: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_compile: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lua-5.4.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2433 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_configure)
NOTE: recipe lz4-1_1.9.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2434 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_configure)
NOTE: recipe lua-5.4.4-r0: task do_configure: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_configure: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2435 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_configure)
NOTE: recipe lz4-1_1.9.4-r0: task do_configure: Succeeded
NOTE: Running task 2436 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_configure)
NOTE: recipe curl-7.85.0-r0: task do_packagedata: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_configure: Succeeded
NOTE: Running task 2437 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_compile)
NOTE: Running task 2438 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_configure_ptest_base)
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Started
NOTE: recipe diffoscope-224-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_configure: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_compile: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2439 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_224.bb:do_configure)
NOTE: Running task 2440 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_configure)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_configure_ptest_base: Started
NOTE: Running task 2441 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_configure)
NOTE: recipe lua-5.4.4-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe diffoscope-224-r0: task do_configure: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_configure: Started
NOTE: Running task 2442 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_compile)
NOTE: recipe libgpg-error-1.45-r0: task do_packagedata: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_configure: Started
NOTE: recipe diffoscope-224-r0: task do_configure: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_configure: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_compile: Started
NOTE: Running task 2443 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_224.bb:do_compile)
NOTE: Running task 2444 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_compile)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_configure: Succeeded
NOTE: Running task 2445 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_compile)
NOTE: recipe python3-magic-0.4.27-r0: task do_compile: Started
NOTE: recipe diffoscope-224-r0: task do_compile: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_compile: Started
NOTE: recipe binutils-2.39-r0: task do_patch: Succeeded
NOTE: Running task 2446 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.39.bb:do_deploy_source_date_epoch)
NOTE: recipe binutils-2.39-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_compile: Succeeded
NOTE: recipe binutils-2.39-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2447 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_install)
NOTE: recipe diffoscope-224-r0: task do_compile: Succeeded
NOTE: Running task 2448 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_224.bb:do_install)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_compile: Succeeded
NOTE: Running task 2449 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_install)
NOTE: recipe python3-magic-0.4.27-r0: task do_install: Started
NOTE: recipe diffoscope-224-r0: task do_install: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_install: Started
NOTE: recipe lua-5.4.4-r0: task do_compile: Succeeded
NOTE: Running task 2450 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_compile_ptest_base)
NOTE: recipe lua-5.4.4-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_install: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2451 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_package)
NOTE: Running task 2452 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_install)
NOTE: recipe libarchive-3.6.1-r0: task do_compile: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_install: Succeeded
NOTE: Running task 2453 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_install)
NOTE: recipe python3-magic-0.4.27-r0: task do_package: Started
NOTE: Running task 2454 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_package)
NOTE: recipe lua-5.4.4-r0: task do_install: Started
NOTE: recipe diffoscope-224-r0: task do_install: Succeeded
NOTE: recipe libarchive-3.6.1-r0: task do_install: Started
NOTE: Running task 2455 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_224.bb:do_package)
NOTE: Running task 2456 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_224.bb:do_populate_sysroot)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package: Started
NOTE: recipe diffoscope-224-r0: task do_populate_sysroot: Started
NOTE: recipe diffoscope-224-r0: task do_package: Started
NOTE: recipe lua-5.4.4-r0: task do_install: Succeeded
NOTE: Running task 2457 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_install_ptest_base)
NOTE: recipe lua-5.4.4-r0: task do_install_ptest_base: Started
NOTE: recipe lua-5.4.4-r0: task do_install_ptest_base: Succeeded
NOTE: recipe libarchive-3.6.1-r0: task do_install: Succeeded
NOTE: Running task 2458 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_package)
NOTE: Running task 2459 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_populate_sysroot)
NOTE: Running task 2460 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_populate_sysroot)
NOTE: Running task 2461 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_package)
NOTE: recipe lua-5.4.4-r0: task do_populate_sysroot: Started
NOTE: recipe lua-5.4.4-r0: task do_package: Started
NOTE: recipe libarchive-3.6.1-r0: task do_populate_sysroot: Started
NOTE: recipe diffoscope-224-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libarchive-3.6.1-r0: task do_package: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Succeeded
NOTE: Running task 2462 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_compile)
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_package: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2463 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_packagedata)
NOTE: recipe libarchive-3.6.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_packagedata: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package: Succeeded
NOTE: Running task 2464 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_packagedata)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_packagedata: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Succeeded
NOTE: Running task 2465 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_install)
NOTE: recipe python3-magic-0.4.27-r0: task do_packagedata: Succeeded
NOTE: Running task 2466 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_package_write_rpm)
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_package_write_rpm: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_packagedata: Succeeded
NOTE: recipe diffoscope-224-r0: task do_package: Succeeded
NOTE: Running task 2467 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_224.bb:do_packagedata)
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Succeeded
NOTE: recipe diffoscope-224-r0: task do_packagedata: Started
NOTE: Running task 2468 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_package)
NOTE: Running task 2469 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_populate_sysroot)
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_package_write_rpm: Succeeded
NOTE: recipe diffoscope-224-r0: task do_packagedata: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_package: Succeeded
NOTE: Running task 2470 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_packagedata)
NOTE: recipe lua-5.4.4-r0: task do_packagedata: Started
NOTE: recipe libarchive-3.6.1-r0: task do_package: Succeeded
NOTE: Running task 2471 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_packagedata)
NOTE: recipe lua-5.4.4-r0: task do_packagedata: Succeeded
NOTE: recipe libarchive-3.6.1-r0: task do_packagedata: Started
NOTE: recipe libarchive-3.6.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2472 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_package_write_rpm)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package_write_rpm: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Succeeded
NOTE: Running task 2473 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_packagedata)
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata: Succeeded
NOTE: recipe libgcrypt-1.10.1-r0: task do_compile: Succeeded
NOTE: Running task 2474 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_compile_ptest_base)
NOTE: recipe libgcrypt-1.10.1-r0: task do_compile_ptest_base: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2475 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_install)
NOTE: recipe libgcrypt-1.10.1-r0: task do_install: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_install: Succeeded
NOTE: Running task 2476 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_install_ptest_base)
NOTE: recipe libgcrypt-1.10.1-r0: task do_install_ptest_base: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_compile: Succeeded
NOTE: Running task 2477 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_install)
NOTE: recipe libgcrypt-1.10.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2478 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_populate_sysroot)
NOTE: recipe lz4-1_1.9.4-r0: task do_install: Started
NOTE: Running task 2479 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_package)
NOTE: recipe libgcrypt-1.10.1-r0: task do_populate_sysroot: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_package: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_install: Succeeded
NOTE: Running task 2480 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_package)
NOTE: Running task 2481 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_populate_sysroot)
NOTE: recipe lz4-1_1.9.4-r0: task do_populate_sysroot: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_package: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2482 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2483 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_configure)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_configure: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_configure: Succeeded
NOTE: Running task 2484 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_compile)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_compile: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_package: Succeeded
NOTE: Running task 2485 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_packagedata)
NOTE: recipe lz4-1_1.9.4-r0: task do_packagedata: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_configure: Succeeded
NOTE: Running task 2486 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_compile)
NOTE: recipe libxt-1_1.2.1-r0: task do_compile: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_packagedata: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_compile: Succeeded
NOTE: Running task 2487 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_install)
NOTE: recipe libxt-1_1.2.1-r0: task do_install: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_compile: Succeeded
NOTE: Running task 2488 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_install)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_install: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_install: Succeeded
NOTE: recipe libgcrypt-1.10.1-r0: task do_package: Succeeded
NOTE: Running task 2489 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_package)
NOTE: Running task 2490 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_packagedata)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_package: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_install: Succeeded
NOTE: recipe libgcrypt-1.10.1-r0: task do_packagedata: Started
NOTE: Running task 2491 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_package)
NOTE: Running task 2492 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_populate_sysroot)
NOTE: recipe libxt-1_1.2.1-r0: task do_populate_sysroot: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_package: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_packagedata: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2493 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe vim-9.0.0614-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_package: Succeeded
NOTE: recipe vim-9.0.0614-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2494 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_configure)
NOTE: Running task 2495 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_packagedata)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_packagedata: Started
NOTE: recipe vim-9.0.0614-r0: task do_configure: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2496 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_package_write_rpm)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_package_write_rpm: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_package: Succeeded
NOTE: Running task 2497 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_packagedata)
NOTE: recipe libxt-1_1.2.1-r0: task do_packagedata: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_packagedata: Succeeded
NOTE: recipe vim-9.0.0614-r0: task do_configure: Succeeded
NOTE: Running task 2498 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_compile)
NOTE: recipe vim-9.0.0614-r0: task do_compile: Started
NOTE: recipe vim-9.0.0614-r0: task do_compile: Succeeded
NOTE: Running task 2499 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_install)
NOTE: recipe vim-9.0.0614-r0: task do_install: Started
NOTE: recipe gnutls-3.7.8-r0: task do_compile: Succeeded
NOTE: Running task 2500 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.8.bb:do_install)
NOTE: recipe vim-9.0.0614-r0: task do_install: Succeeded
NOTE: Running task 2501 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_package)
NOTE: recipe gnutls-3.7.8-r0: task do_install: Started
NOTE: recipe vim-9.0.0614-r0: task do_package: Started
NOTE: recipe gnutls-3.7.8-r0: task do_install: Succeeded
NOTE: Running task 2502 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.8.bb:do_populate_sysroot)
NOTE: Running task 2503 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.8.bb:do_package)
NOTE: recipe gnutls-3.7.8-r0: task do_populate_sysroot: Started
NOTE: recipe gnutls-3.7.8-r0: task do_package: Started
NOTE: recipe gnutls-3.7.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2504 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_prepare_recipe_sysroot)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2505 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_configure)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_configure: Started
NOTE: recipe vim-9.0.0614-r0: task do_package: Succeeded
NOTE: Running task 2506 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_packagedata)
NOTE: recipe vim-9.0.0614-r0: task do_packagedata: Started
NOTE: recipe gnutls-3.7.8-r0: task do_package: Succeeded
NOTE: Running task 2507 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.8.bb:do_packagedata)
NOTE: recipe gnutls-3.7.8-r0: task do_packagedata: Started
NOTE: recipe vim-9.0.0614-r0: task do_packagedata: Succeeded
NOTE: Running task 2508 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_package_write_rpm)
NOTE: recipe vim-9.0.0614-r0: task do_package_write_rpm: Started
NOTE: recipe gnutls-3.7.8-r0: task do_packagedata: Succeeded
NOTE: recipe vim-9.0.0614-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_configure: Succeeded
NOTE: Running task 2509 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_compile)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_compile: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_compile: Succeeded
NOTE: Running task 2510 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_install)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_install: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_install: Succeeded
NOTE: Running task 2511 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_populate_sysroot)
NOTE: Running task 2512 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_package)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_populate_sysroot: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_package: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2513 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.187.bb:do_prepare_recipe_sysroot)
NOTE: recipe elfutils-0.187-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe elfutils-0.187-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2514 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.187.bb:do_configure)
NOTE: recipe elfutils-0.187-r0: task do_configure: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_package: Succeeded
NOTE: Running task 2515 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_packagedata)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_packagedata: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_packagedata: Succeeded
NOTE: recipe elfutils-0.187-r0: task do_configure: Succeeded
NOTE: Running task 2516 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.187.bb:do_configure_ptest_base)
NOTE: recipe elfutils-0.187-r0: task do_configure_ptest_base: Started
NOTE: recipe elfutils-0.187-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2517 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.187.bb:do_compile)
NOTE: recipe elfutils-0.187-r0: task do_compile: Started
NOTE: recipe elfutils-0.187-r0: task do_compile: Succeeded
NOTE: Running task 2518 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.187.bb:do_compile_ptest_base)
NOTE: recipe elfutils-0.187-r0: task do_compile_ptest_base: Started
NOTE: recipe elfutils-0.187-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2519 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.187.bb:do_install)
NOTE: recipe elfutils-0.187-r0: task do_install: Started
NOTE: recipe elfutils-0.187-r0: task do_install: Succeeded
NOTE: Running task 2520 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.187.bb:do_install_ptest_base)
NOTE: recipe elfutils-0.187-r0: task do_install_ptest_base: Started
NOTE: recipe elfutils-0.187-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2521 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.187.bb:do_package)
NOTE: Running task 2522 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.187.bb:do_populate_sysroot)
NOTE: recipe elfutils-0.187-r0: task do_package: Started
NOTE: recipe elfutils-0.187-r0: task do_populate_sysroot: Started
NOTE: recipe elfutils-0.187-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2523 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2524 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.39.bb:do_prepare_recipe_sysroot)
NOTE: recipe rpm-1_4.18.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe binutils-2.39-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe binutils-2.39-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2525 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.39.bb:do_configure)
NOTE: recipe binutils-2.39-r0: task do_configure: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2526 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_configure)
NOTE: recipe rpm-1_4.18.0-r0: task do_configure: Started
NOTE: recipe binutils-2.39-r0: task do_configure: Succeeded
NOTE: Running task 2527 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.39.bb:do_compile)
NOTE: recipe binutils-2.39-r0: task do_compile: Started
NOTE: recipe elfutils-0.187-r0: task do_package: Succeeded
NOTE: Running task 2528 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.187.bb:do_packagedata)
NOTE: recipe elfutils-0.187-r0: task do_packagedata: Started
NOTE: recipe elfutils-0.187-r0: task do_packagedata: Succeeded
NOTE: recipe rpm-1_4.18.0-r0: task do_configure: Succeeded
NOTE: Running task 2529 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_compile)
NOTE: recipe rpm-1_4.18.0-r0: task do_compile: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_compile: Succeeded
NOTE: Running task 2530 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_install)
NOTE: recipe rpm-1_4.18.0-r0: task do_install: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_install: Succeeded
NOTE: Running task 2531 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_package)
NOTE: recipe rpm-1_4.18.0-r0: task do_package: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_package: Succeeded
NOTE: Running task 2532 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_packagedata)
NOTE: recipe rpm-1_4.18.0-r0: task do_packagedata: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2533 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_package_write_rpm)
NOTE: recipe rpm-1_4.18.0-r0: task do_package_write_rpm: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe binutils-2.39-r0: task do_compile: Succeeded
NOTE: Running task 2534 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.39.bb:do_install)
NOTE: recipe binutils-2.39-r0: task do_install: Started
NOTE: recipe binutils-2.39-r0: task do_install: Succeeded
NOTE: Running task 2535 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.39.bb:do_package)
NOTE: recipe binutils-2.39-r0: task do_package: Started
NOTE: recipe binutils-2.39-r0: task do_package: Succeeded
NOTE: Running task 2536 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.39.bb:do_packagedata)
NOTE: recipe binutils-2.39-r0: task do_packagedata: Started
NOTE: recipe binutils-2.39-r0: task do_packagedata: Succeeded
NOTE: Running task 2537 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.39.bb:do_package_write_rpm)
NOTE: Running task 2538 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_224.bb:do_package_write_rpm)
NOTE: Running task 2539 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_224.bb:do_package_qa)
NOTE: recipe binutils-2.39-r0: task do_package_write_rpm: Started
NOTE: recipe diffoscope-224-r0: task do_package_write_rpm: Started
NOTE: recipe diffoscope-224-r0: task do_package_qa: Started
NOTE: recipe diffoscope-224-r0: task do_package_qa: Succeeded
NOTE: recipe diffoscope-224-r0: task do_package_write_rpm: Succeeded
NOTE: recipe binutils-2.39-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2540 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_224.bb:do_build)
NOTE: Tasks Summary: Attempted 2540 tasks of which 2375 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 10 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: curl-7.85.0-r0 do_packagedata_setscene: QA Issue: Package version for package curl-src went backwards which would break package feeds (from 0:7.86.0-r0 to 0:7.85.0-r0) [version-going-backwards]
ERROR: curl-7.85.0-r0 do_packagedata_setscene: QA Issue: Package version for package curl-dbg went backwards which would break package feeds (from 0:7.86.0-r0 to 0:7.85.0-r0) [version-going-backwards]
ERROR: curl-7.85.0-r0 do_packagedata_setscene: QA Issue: Package version for package libcurl went backwards which would break package feeds (from 0:7.86.0-r0 to 0:7.85.0-r0) [version-going-backwards]
ERROR: curl-7.85.0-r0 do_packagedata_setscene: QA Issue: Package version for package curl-ptest went backwards which would break package feeds (from 0:7.86.0-r0 to 0:7.85.0-r0) [version-going-backwards]
ERROR: curl-7.85.0-r0 do_packagedata_setscene: QA Issue: Package version for package curl-staticdev went backwards which would break package feeds (from 0:7.86.0-r0 to 0:7.85.0-r0) [version-going-backwards]
ERROR: curl-7.85.0-r0 do_packagedata_setscene: QA Issue: Package version for package curl-dev went backwards which would break package feeds (from 0:7.86.0-r0 to 0:7.85.0-r0) [version-going-backwards]
ERROR: curl-7.85.0-r0 do_packagedata_setscene: QA Issue: Package version for package curl-doc went backwards which would break package feeds (from 0:7.86.0-r0 to 0:7.85.0-r0) [version-going-backwards]
ERROR: curl-7.85.0-r0 do_packagedata_setscene: QA Issue: Package version for package curl-locale went backwards which would break package feeds (from 0:7.86.0-r0 to 0:7.85.0-r0) [version-going-backwards]
ERROR: curl-7.85.0-r0 do_packagedata_setscene: QA Issue: Package version for package curl went backwards which would break package feeds (from 0:7.86.0-r0 to 0:7.85.0-r0) [version-going-backwards]
ERROR: curl-7.85.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============2496776198444609166==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 886 .bb files complete (0 cached, 886 parsed). 1664 targets, 70 skipped, 0 masked, 0 errors.
Removing 1 recipes from the ppc7400 sysroot...done.
Removing 1 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:374176871ca6bd9ad6745c1a3e12c7b092ac2099"
workspace            = "master:78fd269e6649000b48ef1ef3e86009bad00fa815"

Initialising tasks...done.
Sstate summary: Wanted 93 Local 30 Mirrors 0 Missed 63 Current 640 (32% match, 91% complete)
Removing 1 stale sstate objects for arch ppc7400...done.
Removing 1 stale sstate objects for arch qemuppc...done.
NOTE: Executing Tasks
NOTE: Running setscene task 687 of 733 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.85.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 694 of 733 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.85.0.bb:do_populate_sysroot_setscene)
NOTE: Running task 1370 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_fetch)
NOTE: Running task 1457 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_fetch)
NOTE: Running task 1459 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_fetch)
NOTE: Running task 1460 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_fetch)
NOTE: Running task 1470 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_224.bb:do_fetch)
NOTE: Running task 1480 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_fetch)
NOTE: Running task 1481 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_fetch)
NOTE: Running task 1482 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_fetch)
NOTE: Running task 1483 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_fetch)
NOTE: Running task 1484 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_fetch)
NOTE: Running task 1485 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.39.bb:do_fetch)
NOTE: recipe lua-5.4.4-r0: task do_fetch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_fetch: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_fetch: Started
NOTE: recipe curl-7.85.0-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-7.85.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe diffoscope-224-r0: task do_fetch: Started
NOTE: recipe lua-5.4.4-r0: task do_fetch: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_fetch: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_fetch: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_fetch: Started
NOTE: recipe diffoscope-224-r0: task do_fetch: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_fetch: Succeeded
NOTE: recipe vim-9.0.0614-r0: task do_fetch: Started
NOTE: Running task 1555 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_unpack)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_fetch: Started
NOTE: Running task 1556 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_unpack)
NOTE: Running task 1557 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_unpack)
NOTE: recipe rpm-1_4.18.0-r0: task do_fetch: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_fetch: Succeeded
NOTE: Running task 1558 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_224.bb:do_unpack)
NOTE: Running task 1559 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_unpack)
NOTE: recipe binutils-2.39-r0: task do_fetch: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_fetch: Succeeded
NOTE: Running task 1560 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_unpack)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_fetch: Succeeded
NOTE: recipe binutils-2.39-r0: task do_fetch: Succeeded
NOTE: Running task 1561 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_unpack)
NOTE: recipe vim-9.0.0614-r0: task do_fetch: Succeeded
NOTE: Running task 1562 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.39.bb:do_unpack)
NOTE: recipe lua-5.4.4-r0: task do_unpack: Started
NOTE: Running task 1563 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_unpack)
NOTE: recipe rpm-1_4.18.0-r0: task do_fetch: Succeeded
NOTE: Running task 1564 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_unpack)
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Started
NOTE: Running task 1565 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_unpack)
NOTE: recipe diffoscope-224-r0: task do_unpack: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_unpack: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_unpack: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_unpack: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/curl/7.85.0-r0/temp/log.do_packagedata_setscene.2213016
NOTE: recipe lz4-1_1.9.4-r0: task do_unpack: Started
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.85.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 730 of 733 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.85.0.bb:do_package_setscene)
NOTE: recipe curl-7.85.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_unpack: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_unpack: Succeeded
NOTE: recipe binutils-2.39-r0: task do_unpack: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_unpack: Succeeded
NOTE: recipe vim-9.0.0614-r0: task do_unpack: Started
NOTE: Running task 1566 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_patch)
NOTE: recipe rpm-1_4.18.0-r0: task do_unpack: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Succeeded
NOTE: recipe diffoscope-224-r0: task do_unpack: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_unpack: Succeeded
NOTE: Running task 1567 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_patch)
NOTE: Running task 1568 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_patch)
NOTE: recipe libxt-1_1.2.1-r0: task do_unpack: Succeeded
NOTE: Running task 1569 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_patch)
NOTE: Running task 1570 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_224.bb:do_patch)
NOTE: Running task 1571 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_patch)
NOTE: recipe python3-magic-0.4.27-r0: task do_patch: Started
NOTE: recipe lua-5.4.4-r0: task do_patch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_patch: Started
NOTE: recipe diffoscope-224-r0: task do_patch: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_patch: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_unpack: Succeeded
NOTE: Running task 1572 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_patch)
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_unpack: Succeeded
NOTE: Running task 1573 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-magic-0.4.27-r0: task do_patch: Succeeded
NOTE: Running task 1574 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_patch)
NOTE: Running task 1575 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_deploy_source_date_epoch)
NOTE: recipe diffoscope-224-r0: task do_patch: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_patch: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_patch: Started
NOTE: Running task 1576 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_224.bb:do_deploy_source_date_epoch)
NOTE: Running task 1577 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1578 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_224.bb:do_populate_lic)
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_patch: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_patch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_patch: Succeeded
NOTE: Running task 1579 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe lz4-1_1.9.4-r0: task do_patch: Succeeded
NOTE: recipe diffoscope-224-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe diffoscope-224-r0: task do_populate_lic: Started
NOTE: Running task 1580 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1581 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libxt-1_1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lua-5.4.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_unpack: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_patch: Succeeded
NOTE: Running task 1582 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_patch)
NOTE: Running task 1583 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_deploy_source_date_epoch)
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe diffoscope-224-r0: task do_populate_lic: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_patch: Started
NOTE: recipe diffoscope-224-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_224.bb:do_populate_lic unihash changed to be93776526efe4d2e97073e1067608662b693869202b634e69af5b989fb3a56b
NOTE: recipe python3-libarchive-c-4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vim-9.0.0614-r0: task do_unpack: Succeeded
NOTE: Running task 1584 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_patch)
NOTE: recipe rpm-1_4.18.0-r0: task do_patch: Succeeded
NOTE: Running task 1585 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_deploy_source_date_epoch)
NOTE: recipe curl-7.85.0-r0: task do_package_setscene: Started
NOTE: recipe vim-9.0.0614-r0: task do_patch: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vim-9.0.0614-r0: task do_patch: Succeeded
NOTE: Running task 1586 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_deploy_source_date_epoch)
NOTE: recipe vim-9.0.0614-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vim-9.0.0614-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe curl-7.85.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 731 of 733 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.36.bb:do_packagedata_setscene)
NOTE: recipe glibc-2.36-r0: task do_packagedata_setscene: Started
NOTE: recipe glibc-2.36-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1964 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_configure_ptest_base)
NOTE: recipe binutils-2.39-r0: task do_unpack: Succeeded
NOTE: Running task 2124 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.8.bb:do_compile)
NOTE: Running task 2129 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_compile)
NOTE: Running task 2186 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgcrypt-1.10.1-r0: task do_configure_ptest_base: Started
NOTE: Running task 2277 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.85.0.bb:do_packagedata)
NOTE: Running task 2312 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.45.bb:do_packagedata)
NOTE: Running task 2337 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_prepare_recipe_sysroot)
NOTE: recipe gnutls-3.7.8-r0: task do_compile: Started
NOTE: recipe libarchive-3.6.1-r0: task do_compile: Started
NOTE: Running task 2339 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgcrypt-1.10.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2340 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2346 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.39.bb:do_patch)
NOTE: Running task 2349 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_224.bb:do_prepare_recipe_sysroot)
NOTE: recipe lua-5.4.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2350 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_compile)
NOTE: Running task 2394 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_prepare_recipe_sysroot)
NOTE: recipe curl-7.85.0-r0: task do_packagedata: Started
NOTE: Running task 2395 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgpg-error-1.45-r0: task do_packagedata: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe diffoscope-224-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe binutils-2.39-r0: task do_patch: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_compile: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lua-5.4.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2433 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_configure)
NOTE: recipe lz4-1_1.9.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_configure: Started
NOTE: Running task 2434 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_configure)
NOTE: recipe lz4-1_1.9.4-r0: task do_configure: Started
NOTE: recipe lua-5.4.4-r0: task do_configure: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2435 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_configure_ptest_base)
NOTE: recipe libxt-1_1.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2436 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_configure)
NOTE: recipe lz4-1_1.9.4-r0: task do_configure: Succeeded
NOTE: Running task 2437 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_configure)
NOTE: Running task 2438 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_compile)
NOTE: recipe curl-7.85.0-r0: task do_packagedata: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_configure_ptest_base: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Started
NOTE: recipe diffoscope-224-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_configure: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_compile: Started
NOTE: Running task 2439 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_224.bb:do_configure)
NOTE: recipe lua-5.4.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2440 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_compile)
NOTE: recipe libgpg-error-1.45-r0: task do_packagedata: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2441 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_configure)
NOTE: Running task 2442 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_configure)
NOTE: recipe diffoscope-224-r0: task do_configure: Started
NOTE: recipe lua-5.4.4-r0: task do_compile: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_configure: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_configure: Started
NOTE: recipe diffoscope-224-r0: task do_configure: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_configure: Succeeded
NOTE: Running task 2443 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_224.bb:do_compile)
NOTE: Running task 2444 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_compile)
NOTE: recipe python3-magic-0.4.27-r0: task do_configure: Succeeded
NOTE: Running task 2445 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_compile)
NOTE: recipe diffoscope-224-r0: task do_compile: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_compile: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_compile: Started
NOTE: recipe binutils-2.39-r0: task do_patch: Succeeded
NOTE: Running task 2446 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.39.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_compile: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_compile: Succeeded
NOTE: recipe binutils-2.39-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2447 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_install)
NOTE: recipe diffoscope-224-r0: task do_compile: Succeeded
NOTE: Running task 2448 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_install)
NOTE: Running task 2449 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_224.bb:do_install)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_install: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_install: Started
NOTE: recipe diffoscope-224-r0: task do_install: Started
NOTE: recipe lua-5.4.4-r0: task do_compile: Succeeded
NOTE: Running task 2450 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_compile_ptest_base)
NOTE: recipe binutils-2.39-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_compile_ptest_base: Started
NOTE: recipe lua-5.4.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2451 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_install)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_install: Succeeded
NOTE: Running task 2452 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_package)
NOTE: recipe python3-magic-0.4.27-r0: task do_install: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_install: Started
NOTE: Running task 2453 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_package)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_package: Started
NOTE: recipe libarchive-3.6.1-r0: task do_compile: Succeeded
NOTE: recipe diffoscope-224-r0: task do_install: Succeeded
NOTE: Running task 2454 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_install)
NOTE: recipe lua-5.4.4-r0: task do_install: Succeeded
NOTE: Running task 2455 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_224.bb:do_package)
NOTE: Running task 2456 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_224.bb:do_populate_sysroot)
NOTE: Running task 2457 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_install_ptest_base)
NOTE: recipe libarchive-3.6.1-r0: task do_install: Started
NOTE: recipe diffoscope-224-r0: task do_populate_sysroot: Started
NOTE: recipe diffoscope-224-r0: task do_package: Started
NOTE: recipe lua-5.4.4-r0: task do_install_ptest_base: Started
NOTE: recipe lua-5.4.4-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2458 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_package)
NOTE: Running task 2459 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_populate_sysroot)
NOTE: recipe lua-5.4.4-r0: task do_populate_sysroot: Started
NOTE: recipe lua-5.4.4-r0: task do_package: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Succeeded
NOTE: recipe libarchive-3.6.1-r0: task do_install: Succeeded
NOTE: Running task 2460 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_compile)
NOTE: recipe diffoscope-224-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2461 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_populate_sysroot)
NOTE: Running task 2462 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_package)
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Started
NOTE: recipe libarchive-3.6.1-r0: task do_populate_sysroot: Started
NOTE: recipe libarchive-3.6.1-r0: task do_package: Started
NOTE: recipe lua-5.4.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_package: Succeeded
NOTE: Running task 2463 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_packagedata)
NOTE: Running task 2464 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_packagedata)
NOTE: recipe libarchive-3.6.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_packagedata: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_packagedata: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Succeeded
NOTE: Running task 2465 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_install)
NOTE: recipe python3-magic-0.4.27-r0: task do_packagedata: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_packagedata: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Started
NOTE: Running task 2466 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_package_write_rpm)
NOTE: recipe python3-magic-0.4.27-r0: task do_package_write_rpm: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Succeeded
NOTE: recipe diffoscope-224-r0: task do_package: Succeeded
NOTE: Running task 2467 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_package)
NOTE: Running task 2468 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_populate_sysroot)
NOTE: Running task 2469 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_224.bb:do_packagedata)
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Started
NOTE: recipe diffoscope-224-r0: task do_packagedata: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_package_write_rpm: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot: Succeeded
NOTE: recipe diffoscope-224-r0: task do_packagedata: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_package: Succeeded
NOTE: Running task 2470 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_packagedata)
NOTE: recipe lua-5.4.4-r0: task do_packagedata: Started
NOTE: recipe lua-5.4.4-r0: task do_packagedata: Succeeded
NOTE: recipe libarchive-3.6.1-r0: task do_package: Succeeded
NOTE: Running task 2471 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_packagedata)
NOTE: recipe libarchive-3.6.1-r0: task do_packagedata: Started
NOTE: recipe libarchive-3.6.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2472 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_package_write_rpm)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package_write_rpm: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Succeeded
NOTE: Running task 2473 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_packagedata)
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libgcrypt-1.10.1-r0: task do_compile: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata: Succeeded
NOTE: Running task 2474 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_compile_ptest_base)
NOTE: recipe libgcrypt-1.10.1-r0: task do_compile_ptest_base: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2475 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_install)
NOTE: recipe libgcrypt-1.10.1-r0: task do_install: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_install: Succeeded
NOTE: Running task 2476 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_install_ptest_base)
NOTE: recipe libgcrypt-1.10.1-r0: task do_install_ptest_base: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2477 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_populate_sysroot)
NOTE: Running task 2478 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_package)
NOTE: recipe libgcrypt-1.10.1-r0: task do_populate_sysroot: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_package: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_compile: Succeeded
NOTE: Running task 2479 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_install)
NOTE: recipe lz4-1_1.9.4-r0: task do_install: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_configure: Succeeded
NOTE: Running task 2480 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_compile)
NOTE: recipe lz4-1_1.9.4-r0: task do_install: Succeeded
NOTE: Running task 2481 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_package)
NOTE: recipe libxt-1_1.2.1-r0: task do_compile: Started
NOTE: Running task 2482 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_populate_sysroot)
NOTE: recipe lz4-1_1.9.4-r0: task do_populate_sysroot: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_package: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_package: Succeeded
NOTE: Running task 2483 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_packagedata)
NOTE: recipe lz4-1_1.9.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2484 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgcrypt-1.10.1-r0: task do_packagedata: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2485 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_configure)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_configure: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_packagedata: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_configure: Succeeded
NOTE: Running task 2486 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_compile)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_compile: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_compile: Succeeded
NOTE: Running task 2487 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_install)
NOTE: recipe libxt-1_1.2.1-r0: task do_install: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_package: Succeeded
NOTE: Running task 2488 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_packagedata)
NOTE: recipe lz4-1_1.9.4-r0: task do_packagedata: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_install: Succeeded
NOTE: Running task 2489 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_package)
NOTE: Running task 2490 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_populate_sysroot)
NOTE: recipe libxt-1_1.2.1-r0: task do_package: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_populate_sysroot: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_packagedata: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2491 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe vim-9.0.0614-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_compile: Succeeded
NOTE: Running task 2492 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_install)
NOTE: recipe vim-9.0.0614-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2493 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_configure)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_install: Started
NOTE: recipe vim-9.0.0614-r0: task do_configure: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_install: Succeeded
NOTE: Running task 2494 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_package)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_package: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_package: Succeeded
NOTE: Running task 2495 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_packagedata)
NOTE: recipe libxt-1_1.2.1-r0: task do_packagedata: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_packagedata: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_package: Succeeded
NOTE: Running task 2496 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_packagedata)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_packagedata: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2497 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_package_write_rpm)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_package_write_rpm: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe vim-9.0.0614-r0: task do_configure: Succeeded
NOTE: Running task 2498 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_compile)
NOTE: recipe vim-9.0.0614-r0: task do_compile: Started
NOTE: recipe vim-9.0.0614-r0: task do_compile: Succeeded
NOTE: Running task 2499 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_install)
NOTE: recipe vim-9.0.0614-r0: task do_install: Started
NOTE: recipe gnutls-3.7.8-r0: task do_compile: Succeeded
NOTE: Running task 2500 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.8.bb:do_install)
NOTE: recipe gnutls-3.7.8-r0: task do_install: Started
NOTE: recipe vim-9.0.0614-r0: task do_install: Succeeded
NOTE: Running task 2501 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_package)
NOTE: recipe vim-9.0.0614-r0: task do_package: Started
NOTE: recipe gnutls-3.7.8-r0: task do_install: Succeeded
NOTE: Running task 2502 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.8.bb:do_populate_sysroot)
NOTE: Running task 2503 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.8.bb:do_package)
NOTE: recipe gnutls-3.7.8-r0: task do_populate_sysroot: Started
NOTE: recipe gnutls-3.7.8-r0: task do_package: Started
NOTE: recipe gnutls-3.7.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2504 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_prepare_recipe_sysroot)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2505 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_configure)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_configure: Started
NOTE: recipe vim-9.0.0614-r0: task do_package: Succeeded
NOTE: recipe gnutls-3.7.8-r0: task do_package: Succeeded
NOTE: Running task 2506 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_packagedata)
NOTE: Running task 2507 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.8.bb:do_packagedata)
NOTE: recipe vim-9.0.0614-r0: task do_packagedata: Started
NOTE: recipe gnutls-3.7.8-r0: task do_packagedata: Started
NOTE: recipe vim-9.0.0614-r0: task do_packagedata: Succeeded
NOTE: Running task 2508 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_package_write_rpm)
NOTE: recipe gnutls-3.7.8-r0: task do_packagedata: Succeeded
NOTE: recipe vim-9.0.0614-r0: task do_package_write_rpm: Started
NOTE: recipe vim-9.0.0614-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_configure: Succeeded
NOTE: Running task 2509 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_compile)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_compile: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_compile: Succeeded
NOTE: Running task 2510 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_install)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_install: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_install: Succeeded
NOTE: Running task 2511 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_populate_sysroot)
NOTE: Running task 2512 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_package)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_populate_sysroot: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_package: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2513 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.187.bb:do_prepare_recipe_sysroot)
NOTE: recipe elfutils-0.187-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe elfutils-0.187-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2514 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.187.bb:do_configure)
NOTE: recipe elfutils-0.187-r0: task do_configure: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_package: Succeeded
NOTE: Running task 2515 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_packagedata)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_packagedata: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_packagedata: Succeeded
NOTE: recipe elfutils-0.187-r0: task do_configure: Succeeded
NOTE: Running task 2516 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.187.bb:do_configure_ptest_base)
NOTE: recipe elfutils-0.187-r0: task do_configure_ptest_base: Started
NOTE: recipe elfutils-0.187-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2517 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.187.bb:do_compile)
NOTE: recipe elfutils-0.187-r0: task do_compile: Started
NOTE: recipe elfutils-0.187-r0: task do_compile: Succeeded
NOTE: Running task 2518 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.187.bb:do_compile_ptest_base)
NOTE: recipe elfutils-0.187-r0: task do_compile_ptest_base: Started
NOTE: recipe elfutils-0.187-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2519 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.187.bb:do_install)
NOTE: recipe elfutils-0.187-r0: task do_install: Started
NOTE: recipe elfutils-0.187-r0: task do_install: Succeeded
NOTE: Running task 2520 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.187.bb:do_install_ptest_base)
NOTE: recipe elfutils-0.187-r0: task do_install_ptest_base: Started
NOTE: recipe elfutils-0.187-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2521 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.187.bb:do_package)
NOTE: Running task 2522 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.187.bb:do_populate_sysroot)
NOTE: recipe elfutils-0.187-r0: task do_package: Started
NOTE: recipe elfutils-0.187-r0: task do_populate_sysroot: Started
NOTE: recipe elfutils-0.187-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2523 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2524 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.39.bb:do_prepare_recipe_sysroot)
NOTE: recipe rpm-1_4.18.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe binutils-2.39-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe binutils-2.39-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2525 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.39.bb:do_configure)
NOTE: recipe binutils-2.39-r0: task do_configure: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2526 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_configure)
NOTE: recipe rpm-1_4.18.0-r0: task do_configure: Started
NOTE: recipe binutils-2.39-r0: task do_configure: Succeeded
NOTE: Running task 2527 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.39.bb:do_compile)
NOTE: recipe binutils-2.39-r0: task do_compile: Started
NOTE: recipe elfutils-0.187-r0: task do_package: Succeeded
NOTE: Running task 2528 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.187.bb:do_packagedata)
NOTE: recipe elfutils-0.187-r0: task do_packagedata: Started
NOTE: recipe elfutils-0.187-r0: task do_packagedata: Succeeded
NOTE: recipe rpm-1_4.18.0-r0: task do_configure: Succeeded
NOTE: Running task 2529 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_compile)
NOTE: recipe rpm-1_4.18.0-r0: task do_compile: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_compile: Succeeded
NOTE: Running task 2530 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_install)
NOTE: recipe rpm-1_4.18.0-r0: task do_install: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_install: Succeeded
NOTE: Running task 2531 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_package)
NOTE: recipe rpm-1_4.18.0-r0: task do_package: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_package: Succeeded
NOTE: Running task 2532 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_packagedata)
NOTE: recipe rpm-1_4.18.0-r0: task do_packagedata: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2533 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_package_write_rpm)
NOTE: recipe rpm-1_4.18.0-r0: task do_package_write_rpm: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe binutils-2.39-r0: task do_compile: Succeeded
NOTE: Running task 2534 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.39.bb:do_install)
NOTE: recipe binutils-2.39-r0: task do_install: Started
NOTE: recipe binutils-2.39-r0: task do_install: Succeeded
NOTE: Running task 2535 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.39.bb:do_package)
NOTE: recipe binutils-2.39-r0: task do_package: Started
NOTE: recipe binutils-2.39-r0: task do_package: Succeeded
NOTE: Running task 2536 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.39.bb:do_packagedata)
NOTE: recipe binutils-2.39-r0: task do_packagedata: Started
NOTE: recipe binutils-2.39-r0: task do_packagedata: Succeeded
NOTE: Running task 2537 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.39.bb:do_package_write_rpm)
NOTE: Running task 2538 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_224.bb:do_package_write_rpm)
NOTE: Running task 2539 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_224.bb:do_package_qa)
NOTE: recipe binutils-2.39-r0: task do_package_write_rpm: Started
NOTE: recipe diffoscope-224-r0: task do_package_write_rpm: Started
NOTE: recipe diffoscope-224-r0: task do_package_qa: Started
NOTE: recipe diffoscope-224-r0: task do_package_qa: Succeeded
NOTE: recipe diffoscope-224-r0: task do_package_write_rpm: Succeeded
NOTE: recipe binutils-2.39-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2540 of 2540 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_224.bb:do_build)
NOTE: Tasks Summary: Attempted 2540 tasks of which 2375 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 10 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: curl-7.85.0-r0 do_packagedata_setscene: QA Issue: Package version for package curl-src went backwards which would break package feeds (from 0:7.86.0-r0 to 0:7.85.0-r0) [version-going-backwards]
ERROR: curl-7.85.0-r0 do_packagedata_setscene: QA Issue: Package version for package curl-dbg went backwards which would break package feeds (from 0:7.86.0-r0 to 0:7.85.0-r0) [version-going-backwards]
ERROR: curl-7.85.0-r0 do_packagedata_setscene: QA Issue: Package version for package libcurl went backwards which would break package feeds (from 0:7.86.0-r0 to 0:7.85.0-r0) [version-going-backwards]
ERROR: curl-7.85.0-r0 do_packagedata_setscene: QA Issue: Package version for package curl-ptest went backwards which would break package feeds (from 0:7.86.0-r0 to 0:7.85.0-r0) [version-going-backwards]
ERROR: curl-7.85.0-r0 do_packagedata_setscene: QA Issue: Package version for package curl-staticdev went backwards which would break package feeds (from 0:7.86.0-r0 to 0:7.85.0-r0) [version-going-backwards]
ERROR: curl-7.85.0-r0 do_packagedata_setscene: QA Issue: Package version for package curl-dev went backwards which would break package feeds (from 0:7.86.0-r0 to 0:7.85.0-r0) [version-going-backwards]
ERROR: curl-7.85.0-r0 do_packagedata_setscene: QA Issue: Package version for package curl-doc went backwards which would break package feeds (from 0:7.86.0-r0 to 0:7.85.0-r0) [version-going-backwards]
ERROR: curl-7.85.0-r0 do_packagedata_setscene: QA Issue: Package version for package curl-locale went backwards which would break package feeds (from 0:7.86.0-r0 to 0:7.85.0-r0) [version-going-backwards]
ERROR: curl-7.85.0-r0 do_packagedata_setscene: QA Issue: Package version for package curl went backwards which would break package feeds (from 0:7.86.0-r0 to 0:7.85.0-r0) [version-going-backwards]
ERROR: curl-7.85.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============2496776198444609166==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1665 entries from dependency cache.
Parsing recipes...done.
Parsing of 886 .bb files complete (885 cached, 1 parsed). 1664 targets, 35 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:374176871ca6bd9ad6745c1a3e12c7b092ac2099"
workspace            = "master:78fd269e6649000b48ef1ef3e86009bad00fa815"

Initialising tasks...done.
Sstate summary: Wanted 91 Local 28 Mirrors 0 Missed 63 Current 646 (30% match, 91% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 693 of 737 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.85.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 700 of 737 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.85.0.bb:do_populate_sysroot_setscene)
NOTE: Running task 1563 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_configure_ptest_base)
NOTE: recipe curl-7.85.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1873 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_fetch)
NOTE: Running task 1905 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.8.bb:do_compile)
NOTE: recipe curl-7.85.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_configure_ptest_base: Started
NOTE: Running task 1911 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_compile)
NOTE: recipe libgcrypt-1.10.1-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_fetch: Started
NOTE: Running task 2119 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_fetch)
NOTE: Running task 2121 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_fetch)
NOTE: Running task 2122 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_fetch)
NOTE: Running task 2164 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_224.bb:do_fetch)
NOTE: Running task 2170 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_compile)
NOTE: recipe lua-5.4.4-r0: task do_fetch: Succeeded
NOTE: recipe gnutls-3.7.8-r0: task do_compile: Started
NOTE: recipe libarchive-3.6.1-r0: task do_compile: Started
NOTE: Running task 2171 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_unpack)
NOTE: Running task 2172 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2211 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.45.bb:do_packagedata)
NOTE: Running task 2218 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.39.bb:do_fetch)
NOTE: Running task 2219 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_fetch)
NOTE: Running task 2220 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_fetch)
NOTE: Running task 2221 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_fetch)
NOTE: Running task 2222 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_fetch)
NOTE: Running task 2223 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_fetch)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/curl/7.85.0-r0/temp/log.do_packagedata_setscene.879573
NOTE: recipe lz4-1_1.9.4-r0: task do_fetch: Started
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.85.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe curl-7.85.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_fetch: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_fetch: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Succeeded
NOTE: recipe diffoscope-224-r0: task do_fetch: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_compile: Started
NOTE: recipe diffoscope-224-r0: task do_fetch: Succeeded
NOTE: Running setscene task 736 of 737 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.85.0.bb:do_package_setscene)
NOTE: recipe lua-5.4.4-r0: task do_unpack: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_fetch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vim-9.0.0614-r0: task do_fetch: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_fetch: Started
NOTE: recipe libgpg-error-1.45-r0: task do_packagedata: Started
NOTE: recipe binutils-2.39-r0: task do_fetch: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_fetch: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_fetch: Started
NOTE: Running task 2399 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_unpack)
NOTE: recipe python3-magic-0.4.27-r0: task do_fetch: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_fetch: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_fetch: Started
NOTE: Running task 2400 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_unpack)
NOTE: Running task 2401 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_unpack)
NOTE: Running task 2402 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_224.bb:do_unpack)
NOTE: Running task 2403 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe binutils-2.39-r0: task do_fetch: Succeeded
NOTE: Running task 2404 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_prepare_recipe_sysroot)
NOTE: recipe vim-9.0.0614-r0: task do_fetch: Succeeded
NOTE: recipe rpm-1_4.18.0-r0: task do_fetch: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_fetch: Succeeded
NOTE: Running task 2405 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe lua-5.4.4-r0: task do_unpack: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2406 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_patch)
NOTE: Running task 2407 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.39.bb:do_unpack)
NOTE: Running task 2408 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_unpack)
NOTE: Running task 2409 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_unpack)
NOTE: Running task 2410 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_unpack)
NOTE: Running task 2411 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_unpack)
NOTE: Running task 2412 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_unpack)
NOTE: Running task 2413 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_224.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxt-1_1.2.1-r0: task do_unpack: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2414 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2415 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_prepare_recipe_sysroot)
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_unpack: Started
NOTE: recipe diffoscope-224-r0: task do_unpack: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lua-5.4.4-r0: task do_patch: Started
NOTE: recipe binutils-2.39-r0: task do_unpack: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_unpack: Started
NOTE: recipe vim-9.0.0614-r0: task do_unpack: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_unpack: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_unpack: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_unpack: Started
NOTE: recipe diffoscope-224-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe diffoscope-224-r0: task do_unpack: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_unpack: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Succeeded
NOTE: Running task 2416 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_224.bb:do_patch)
NOTE: Running task 2417 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_patch)
NOTE: Running task 2418 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_patch)
NOTE: Running task 2419 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_patch)
NOTE: recipe lz4-1_1.9.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe diffoscope-224-r0: task do_patch: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_patch: Started
NOTE: Running task 2420 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_patch)
NOTE: recipe libgpg-error-1.45-r0: task do_packagedata: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_patch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_patch: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Succeeded
NOTE: Running task 2421 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_deploy_source_date_epoch)
NOTE: recipe lz4-1_1.9.4-r0: task do_unpack: Succeeded
NOTE: Running task 2422 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_patch)
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe diffoscope-224-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_patch: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_patch: Started
NOTE: recipe diffoscope-224-r0: task do_patch: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_patch: Succeeded
NOTE: Running task 2423 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_deploy_source_date_epoch)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_unpack: Succeeded
NOTE: Running task 2424 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_224.bb:do_deploy_source_date_epoch)
NOTE: Running task 2425 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2426 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_224.bb:do_populate_lic)
NOTE: recipe libxt-1_1.2.1-r0: task do_patch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_patch: Succeeded
NOTE: Running task 2427 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2428 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_patch)
NOTE: Running task 2429 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_deploy_source_date_epoch)
NOTE: recipe lz4-1_1.9.4-r0: task do_patch: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe diffoscope-224-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe diffoscope-224-r0: task do_populate_lic: Started
NOTE: Running task 2430 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libxt-1_1.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_patch: Started
NOTE: recipe lua-5.4.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_unpack: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2431 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_patch)
NOTE: Running task 2432 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_configure)
NOTE: recipe rpm-1_4.18.0-r0: task do_patch: Started
NOTE: recipe diffoscope-224-r0: task do_populate_lic: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_224.bb:do_populate_lic unihash changed to be93776526efe4d2e97073e1067608662b693869202b634e69af5b989fb3a56b
NOTE: recipe python3-magic-0.4.27-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe diffoscope-224-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_patch: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2433 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_configure)
NOTE: Running task 2434 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_configure)
NOTE: recipe vim-9.0.0614-r0: task do_unpack: Succeeded
NOTE: Running task 2435 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_configure)
NOTE: Running task 2436 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_224.bb:do_configure)
NOTE: Running task 2437 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 2438 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_configure)
NOTE: Running task 2439 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_patch)
NOTE: Running task 2440 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_configure)
NOTE: recipe lua-5.4.4-r0: task do_configure: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_configure: Started
NOTE: recipe curl-7.85.0-r0: task do_package_setscene: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_configure: Started
NOTE: recipe diffoscope-224-r0: task do_configure: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vim-9.0.0614-r0: task do_patch: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_configure: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_configure: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_configure: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_configure: Succeeded
NOTE: recipe diffoscope-224-r0: task do_configure: Succeeded
NOTE: Running task 2441 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_compile)
NOTE: Running task 2442 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_configure_ptest_base)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_configure: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_configure: Succeeded
NOTE: Running task 2443 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_224.bb:do_compile)
NOTE: Running task 2444 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_compile)
NOTE: recipe lz4-1_1.9.4-r0: task do_compile: Started
NOTE: Running task 2445 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_compile)
NOTE: recipe lua-5.4.4-r0: task do_configure_ptest_base: Started
NOTE: recipe diffoscope-224-r0: task do_compile: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_compile: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_compile: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2446 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_compile)
NOTE: recipe lua-5.4.4-r0: task do_compile: Started
NOTE: recipe vim-9.0.0614-r0: task do_patch: Succeeded
NOTE: Running task 2447 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_deploy_source_date_epoch)
NOTE: recipe vim-9.0.0614-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libarchive-3.6.1-r0: task do_compile: Succeeded
NOTE: Running task 2448 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_install)
NOTE: recipe curl-7.85.0-r0: task do_package_setscene: Succeeded
NOTE: recipe vim-9.0.0614-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2462 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.85.0.bb:do_packagedata)
NOTE: recipe libarchive-3.6.1-r0: task do_install: Started
NOTE: recipe curl-7.85.0-r0: task do_packagedata: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_patch: Succeeded
NOTE: Running task 2463 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_deploy_source_date_epoch)
NOTE: recipe binutils-2.39-r0: task do_unpack: Succeeded
NOTE: Running task 2464 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.39.bb:do_patch)
NOTE: recipe rpm-1_4.18.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe binutils-2.39-r0: task do_patch: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_compile: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_compile: Succeeded
NOTE: Running task 2465 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_install)
NOTE: Running task 2466 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_install)
NOTE: recipe curl-7.85.0-r0: task do_packagedata: Succeeded
NOTE: recipe diffoscope-224-r0: task do_compile: Succeeded
NOTE: Running task 2467 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_224.bb:do_install)
NOTE: recipe rpm-1_4.18.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_install: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_install: Started
NOTE: recipe libarchive-3.6.1-r0: task do_install: Succeeded
NOTE: Running task 2468 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_populate_sysroot)
NOTE: Running task 2469 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_package)
NOTE: recipe diffoscope-224-r0: task do_install: Started
NOTE: recipe libarchive-3.6.1-r0: task do_populate_sysroot: Started
NOTE: recipe libarchive-3.6.1-r0: task do_package: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_install: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_install: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_compile: Succeeded
NOTE: Running task 2470 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_compile_ptest_base)
NOTE: Running task 2471 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_package)
NOTE: Running task 2472 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_package)
NOTE: recipe lua-5.4.4-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_package: Started
NOTE: recipe lua-5.4.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2473 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_install)
NOTE: recipe libarchive-3.6.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe diffoscope-224-r0: task do_install: Succeeded
NOTE: recipe binutils-2.39-r0: task do_patch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_install: Started
NOTE: Running task 2474 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.39.bb:do_deploy_source_date_epoch)
NOTE: Running task 2475 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_224.bb:do_package)
NOTE: Running task 2476 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_224.bb:do_populate_sysroot)
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Succeeded
NOTE: recipe binutils-2.39-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2477 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_compile)
NOTE: recipe diffoscope-224-r0: task do_package: Started
NOTE: recipe diffoscope-224-r0: task do_populate_sysroot: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Started
NOTE: recipe lua-5.4.4-r0: task do_install: Succeeded
NOTE: recipe binutils-2.39-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2478 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_install_ptest_base)
NOTE: recipe lua-5.4.4-r0: task do_install_ptest_base: Started
NOTE: recipe lua-5.4.4-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2479 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_package)
NOTE: Running task 2480 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_populate_sysroot)
NOTE: recipe lua-5.4.4-r0: task do_populate_sysroot: Started
NOTE: recipe lua-5.4.4-r0: task do_package: Started
NOTE: recipe diffoscope-224-r0: task do_populate_sysroot: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Succeeded
NOTE: Running task 2481 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_install)
NOTE: recipe lua-5.4.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_package: Succeeded
NOTE: Running task 2482 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_packagedata)
NOTE: Running task 2483 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_packagedata)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_packagedata: Started
NOTE: recipe python3-magic-0.4.27-r0: task do_packagedata: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Succeeded
NOTE: Running task 2484 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_package)
NOTE: Running task 2485 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_populate_sysroot)
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot: Started
NOTE: recipe python3-libarchive-c-4.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_packagedata: Succeeded
NOTE: Running task 2486 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-magic_0.4.27.bb:do_package_write_rpm)
NOTE: recipe python3-magic-0.4.27-r0: task do_package_write_rpm: Started
NOTE: recipe diffoscope-224-r0: task do_package: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2487 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_224.bb:do_packagedata)
NOTE: recipe diffoscope-224-r0: task do_packagedata: Started
NOTE: recipe diffoscope-224-r0: task do_packagedata: Succeeded
NOTE: recipe python3-magic-0.4.27-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libarchive-3.6.1-r0: task do_package: Succeeded
NOTE: Running task 2488 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_packagedata)
NOTE: recipe libarchive-3.6.1-r0: task do_packagedata: Started
NOTE: recipe libarchive-3.6.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2489 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-libarchive-c_4.0.bb:do_package_write_rpm)
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package_write_rpm: Started
NOTE: recipe lua-5.4.4-r0: task do_package: Succeeded
NOTE: Running task 2490 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_packagedata)
NOTE: recipe lua-5.4.4-r0: task do_packagedata: Started
NOTE: recipe lua-5.4.4-r0: task do_packagedata: Succeeded
NOTE: recipe python3-libarchive-c-4.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libgcrypt-1.10.1-r0: task do_compile: Succeeded
NOTE: Running task 2491 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_compile_ptest_base)
NOTE: recipe libgcrypt-1.10.1-r0: task do_compile_ptest_base: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Succeeded
NOTE: Running task 2492 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_install)
NOTE: Running task 2493 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_packagedata)
NOTE: recipe libgcrypt-1.10.1-r0: task do_install: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata: Succeeded
NOTE: recipe libgcrypt-1.10.1-r0: task do_install: Succeeded
NOTE: Running task 2494 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_install_ptest_base)
NOTE: recipe libgcrypt-1.10.1-r0: task do_install_ptest_base: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2495 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_populate_sysroot)
NOTE: Running task 2496 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_package)
NOTE: recipe libgcrypt-1.10.1-r0: task do_populate_sysroot: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_package: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe lz4-1_1.9.4-r0: task do_compile: Succeeded
NOTE: Running task 2497 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_install)
NOTE: recipe lz4-1_1.9.4-r0: task do_install: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_install: Succeeded
NOTE: Running task 2498 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_package)
NOTE: Running task 2499 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_populate_sysroot)
NOTE: recipe lz4-1_1.9.4-r0: task do_populate_sysroot: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_package: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2500 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2501 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_configure)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_configure: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_configure: Succeeded
NOTE: Running task 2502 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_compile)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_compile: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_configure: Succeeded
NOTE: Running task 2503 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_compile)
NOTE: recipe libxt-1_1.2.1-r0: task do_compile: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_package: Succeeded
NOTE: Running task 2504 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lz4/lz4_1.9.4.bb:do_packagedata)
NOTE: recipe lz4-1_1.9.4-r0: task do_packagedata: Started
NOTE: recipe lz4-1_1.9.4-r0: task do_packagedata: Succeeded
NOTE: recipe libgcrypt-1.10.1-r0: task do_package: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_compile: Succeeded
NOTE: Running task 2505 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_install)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_compile: Succeeded
NOTE: Running task 2506 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_packagedata)
NOTE: Running task 2507 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_install)
NOTE: recipe libxt-1_1.2.1-r0: task do_install: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_packagedata: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_install: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_install: Succeeded
NOTE: Running task 2508 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_package)
NOTE: recipe libgcrypt-1.10.1-r0: task do_packagedata: Succeeded
NOTE: recipe squashfs-tools-4.5.1-r0: task do_package: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_install: Succeeded
NOTE: Running task 2509 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_package)
NOTE: Running task 2510 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_populate_sysroot)
NOTE: recipe libxt-1_1.2.1-r0: task do_populate_sysroot: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_package: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2511 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe vim-9.0.0614-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_package: Succeeded
NOTE: Running task 2512 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_packagedata)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_packagedata: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2513 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb:do_package_write_rpm)
NOTE: recipe squashfs-tools-4.5.1-r0: task do_package_write_rpm: Started
NOTE: recipe vim-9.0.0614-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2514 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_configure)
NOTE: recipe vim-9.0.0614-r0: task do_configure: Started
NOTE: recipe squashfs-tools-4.5.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxt-1_1.2.1-r0: task do_package: Succeeded
NOTE: Running task 2515 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxt_1.2.1.bb:do_packagedata)
NOTE: recipe libxt-1_1.2.1-r0: task do_packagedata: Started
NOTE: recipe libxt-1_1.2.1-r0: task do_packagedata: Succeeded
NOTE: recipe vim-9.0.0614-r0: task do_configure: Succeeded
NOTE: Running task 2516 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_compile)
NOTE: recipe vim-9.0.0614-r0: task do_compile: Started
NOTE: recipe vim-9.0.0614-r0: task do_compile: Succeeded
NOTE: Running task 2517 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_install)
NOTE: recipe vim-9.0.0614-r0: task do_install: Started
NOTE: recipe gnutls-3.7.8-r0: task do_compile: Succeeded
NOTE: Running task 2518 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.8.bb:do_install)
NOTE: recipe gnutls-3.7.8-r0: task do_install: Started
NOTE: recipe vim-9.0.0614-r0: task do_install: Succeeded
NOTE: Running task 2519 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_package)
NOTE: recipe vim-9.0.0614-r0: task do_package: Started
NOTE: recipe gnutls-3.7.8-r0: task do_install: Succeeded
NOTE: Running task 2520 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.8.bb:do_populate_sysroot)
NOTE: Running task 2521 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.8.bb:do_package)
NOTE: recipe gnutls-3.7.8-r0: task do_populate_sysroot: Started
NOTE: recipe gnutls-3.7.8-r0: task do_package: Started
NOTE: recipe gnutls-3.7.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2522 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_prepare_recipe_sysroot)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2523 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_configure)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_configure: Started
NOTE: recipe gnutls-3.7.8-r0: task do_package: Succeeded
NOTE: Running task 2524 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.8.bb:do_packagedata)
NOTE: recipe gnutls-3.7.8-r0: task do_packagedata: Started
NOTE: recipe vim-9.0.0614-r0: task do_package: Succeeded
NOTE: Running task 2525 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_packagedata)
NOTE: recipe vim-9.0.0614-r0: task do_packagedata: Started
NOTE: recipe gnutls-3.7.8-r0: task do_packagedata: Succeeded
NOTE: recipe vim-9.0.0614-r0: task do_packagedata: Succeeded
NOTE: Running task 2526 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/vim/vim_9.0.bb:do_package_write_rpm)
NOTE: recipe vim-9.0.0614-r0: task do_package_write_rpm: Started
NOTE: recipe vim-9.0.0614-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_configure: Succeeded
NOTE: Running task 2527 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_compile)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_compile: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_compile: Succeeded
NOTE: Running task 2528 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_install)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_install: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_install: Succeeded
NOTE: Running task 2529 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_populate_sysroot)
NOTE: Running task 2530 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_package)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_populate_sysroot: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_package: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2531 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.187.bb:do_prepare_recipe_sysroot)
NOTE: recipe elfutils-0.187-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe elfutils-0.187-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2532 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.187.bb:do_configure)
NOTE: recipe elfutils-0.187-r0: task do_configure: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_package: Succeeded
NOTE: Running task 2533 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_packagedata)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_packagedata: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_packagedata: Succeeded
NOTE: recipe elfutils-0.187-r0: task do_configure: Succeeded
NOTE: Running task 2534 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.187.bb:do_configure_ptest_base)
NOTE: recipe elfutils-0.187-r0: task do_configure_ptest_base: Started
NOTE: recipe elfutils-0.187-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2535 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.187.bb:do_compile)
NOTE: recipe elfutils-0.187-r0: task do_compile: Started
NOTE: recipe elfutils-0.187-r0: task do_compile: Succeeded
NOTE: Running task 2536 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.187.bb:do_compile_ptest_base)
NOTE: recipe elfutils-0.187-r0: task do_compile_ptest_base: Started
NOTE: recipe elfutils-0.187-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2537 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.187.bb:do_install)
NOTE: recipe elfutils-0.187-r0: task do_install: Started
NOTE: recipe elfutils-0.187-r0: task do_install: Succeeded
NOTE: Running task 2538 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.187.bb:do_install_ptest_base)
NOTE: recipe elfutils-0.187-r0: task do_install_ptest_base: Started
NOTE: recipe elfutils-0.187-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2539 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.187.bb:do_package)
NOTE: Running task 2540 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.187.bb:do_populate_sysroot)
NOTE: recipe elfutils-0.187-r0: task do_package: Started
NOTE: recipe elfutils-0.187-r0: task do_populate_sysroot: Started
NOTE: recipe elfutils-0.187-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2541 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.39.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2542 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe binutils-2.39-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe binutils-2.39-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2543 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.39.bb:do_configure)
NOTE: recipe binutils-2.39-r0: task do_configure: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2544 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_configure)
NOTE: recipe rpm-1_4.18.0-r0: task do_configure: Started
NOTE: recipe binutils-2.39-r0: task do_configure: Succeeded
NOTE: Running task 2545 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.39.bb:do_compile)
NOTE: recipe binutils-2.39-r0: task do_compile: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_configure: Succeeded
NOTE: Running task 2546 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_compile)
NOTE: recipe rpm-1_4.18.0-r0: task do_compile: Started
NOTE: recipe elfutils-0.187-r0: task do_package: Succeeded
NOTE: Running task 2547 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.187.bb:do_packagedata)
NOTE: recipe elfutils-0.187-r0: task do_packagedata: Started
NOTE: recipe elfutils-0.187-r0: task do_packagedata: Succeeded
NOTE: recipe rpm-1_4.18.0-r0: task do_compile: Succeeded
NOTE: Running task 2548 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_install)
NOTE: recipe rpm-1_4.18.0-r0: task do_install: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_install: Succeeded
NOTE: Running task 2549 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_package)
NOTE: recipe rpm-1_4.18.0-r0: task do_package: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_package: Succeeded
NOTE: Running task 2550 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_packagedata)
NOTE: recipe rpm-1_4.18.0-r0: task do_packagedata: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2551 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.18.0.bb:do_package_write_rpm)
NOTE: recipe rpm-1_4.18.0-r0: task do_package_write_rpm: Started
NOTE: recipe rpm-1_4.18.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe binutils-2.39-r0: task do_compile: Succeeded
NOTE: Running task 2552 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.39.bb:do_install)
NOTE: recipe binutils-2.39-r0: task do_install: Started
NOTE: recipe binutils-2.39-r0: task do_install: Succeeded
NOTE: Running task 2553 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.39.bb:do_package)
NOTE: recipe binutils-2.39-r0: task do_package: Started
NOTE: recipe binutils-2.39-r0: task do_package: Succeeded
NOTE: Running task 2554 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.39.bb:do_packagedata)
NOTE: recipe binutils-2.39-r0: task do_packagedata: Started
NOTE: recipe binutils-2.39-r0: task do_packagedata: Succeeded
NOTE: Running task 2555 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.39.bb:do_package_write_rpm)
NOTE: Running task 2556 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_224.bb:do_package_write_rpm)
NOTE: Running task 2557 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_224.bb:do_package_qa)
NOTE: recipe binutils-2.39-r0: task do_package_write_rpm: Started
NOTE: recipe diffoscope-224-r0: task do_package_write_rpm: Started
NOTE: recipe diffoscope-224-r0: task do_package_qa: Started
NOTE: recipe diffoscope-224-r0: task do_package_qa: Succeeded
NOTE: recipe diffoscope-224-r0: task do_package_write_rpm: Succeeded
NOTE: recipe binutils-2.39-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2558 of 2558 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/diffoscope/diffoscope_224.bb:do_build)
NOTE: Tasks Summary: Attempted 2558 tasks of which 2393 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: There was 1 WARNING message.
Summary: There were 10 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: curl-7.85.0-r0 do_packagedata_setscene: QA Issue: Package version for package curl-src went backwards which would break package feeds (from 0:7.86.0-r0 to 0:7.85.0-r0) [version-going-backwards]
ERROR: curl-7.85.0-r0 do_packagedata_setscene: QA Issue: Package version for package curl-dbg went backwards which would break package feeds (from 0:7.86.0-r0 to 0:7.85.0-r0) [version-going-backwards]
ERROR: curl-7.85.0-r0 do_packagedata_setscene: QA Issue: Package version for package libcurl went backwards which would break package feeds (from 0:7.86.0-r0 to 0:7.85.0-r0) [version-going-backwards]
ERROR: curl-7.85.0-r0 do_packagedata_setscene: QA Issue: Package version for package curl-ptest went backwards which would break package feeds (from 0:7.86.0-r0 to 0:7.85.0-r0) [version-going-backwards]
ERROR: curl-7.85.0-r0 do_packagedata_setscene: QA Issue: Package version for package curl-staticdev went backwards which would break package feeds (from 0:7.86.0-r0 to 0:7.85.0-r0) [version-going-backwards]
ERROR: curl-7.85.0-r0 do_packagedata_setscene: QA Issue: Package version for package curl-dev went backwards which would break package feeds (from 0:7.86.0-r0 to 0:7.85.0-r0) [version-going-backwards]
ERROR: curl-7.85.0-r0 do_packagedata_setscene: QA Issue: Package version for package curl-doc went backwards which would break package feeds (from 0:7.86.0-r0 to 0:7.85.0-r0) [version-going-backwards]
ERROR: curl-7.85.0-r0 do_packagedata_setscene: QA Issue: Package version for package curl-locale went backwards which would break package feeds (from 0:7.86.0-r0 to 0:7.85.0-r0) [version-going-backwards]
ERROR: curl-7.85.0-r0 do_packagedata_setscene: QA Issue: Package version for package curl went backwards which would break package feeds (from 0:7.86.0-r0 to 0:7.85.0-r0) [version-going-backwards]
ERROR: curl-7.85.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============2496776198444609166==--

