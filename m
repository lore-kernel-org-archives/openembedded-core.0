Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D0A1C32789
	for <webhook@archiver.kernel.org>; Mon, 15 Aug 2022 18:57:03 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com
 (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web09.6459.1660589819561818253
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Aug 2022 11:56:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=eo+c8Mll;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33,
 mailfrom: 01010182a2ddc268-ab49aac4-a01b-49e1-bdea-629aca8c94e7-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1660589818;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=52O1ydgLVLpqmq40Kx/46fNc6YDFe/gfLVZ6gwd2ffM=;
	b=eo+c8MllOlb/pO9zN2fuluhor61i07SXjwZy0TKv9RUSDXLWBxpQwLGPClg/ZAS4
	zND5UEx1Wo0wfor7ltcnMySome/XmsDquQBRsig4NiikqvavTccqhxMk+FbZKchb4o0
	LZ0rOdvUuwMK31E/buCUO0iM1dpZzkL/Lf5XHW+w=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1660589818;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=52O1ydgLVLpqmq40Kx/46fNc6YDFe/gfLVZ6gwd2ffM=;
	b=gIjBfIm87RiKlAb/p1C0Ih+XR9h5Hm7BlC4NGxRHi5FPMtn7XyhdG4fIYyw67Akb
	kt35OP2igX0rEkUkyc3d851UnSuLc1e6/rIis60edAGudL/RLyAjgZP40g/NrkTJFZR
	5uqguc6BIpscd5ejFqXaFulujMuQ890LQSDSPmWU=
Content-Type: multipart/mixed; boundary="===============0089746403900109140=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] nfs-utils: upgrading to 2.6.2 FAILED
Message-ID: 
 <01010182a2ddc268-ab49aac4-a01b-49e1-bdea-629aca8c94e7-000000@us-west-2.amazonses.com>
Date: Mon, 15 Aug 2022 18:56:58 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.08.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Aug 2022 18:57:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169362

--===============0089746403900109140==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *nfs-utils* to *2.6.2* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-nfs-utils-upgrade-2.6.1-2.6.2.patch
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
--===============0089746403900109140==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-nfs-utils-upgrade-2.6.1-2.6.2.patch"

RnJvbSBjZWYyNGNmZGY3MWRlMmNkOWEzNGY4MzU1MWY5N2MwZGNjNmU3YjNmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgQXVnIDIwMjIgMDY6MDI6MjYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBu
ZnMtdXRpbHM6IHVwZ3JhZGUgMi42LjEgLT4gMi42LjIKCi0tLQogLi4uL25mcy11dGlscy97bmZz
LXV0aWxzXzIuNi4xLmJiID0+IG5mcy11dGlsc18yLjYuMi5iYn0gICAgICAgIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLWNvbm5lY3Rpdml0eS9uZnMtdXRpbHMve25mcy11dGlsc18yLjYuMS5iYiA9PiBuZnMt
dXRpbHNfMi42LjIuYmJ9ICg5OCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rp
dml0eS9uZnMtdXRpbHMvbmZzLXV0aWxzXzIuNi4xLmJiIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rp
dml0eS9uZnMtdXRpbHMvbmZzLXV0aWxzXzIuNi4yLmJiCnNpbWlsYXJpdHkgaW5kZXggOTglCnJl
bmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvbmZzLXV0aWxzL25mcy11dGlsc18y
LjYuMS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9uZnMtdXRpbHMvbmZz
LXV0aWxzXzIuNi4yLmJiCmluZGV4IGJiZWQ1YWVhNTkuLmYzYzZlOTdiZGEgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvbmZzLXV0aWxzL25mcy11dGlsc18yLjYuMS5iYgor
KysgYi9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L25mcy11dGlscy9uZnMtdXRpbHNfMi42LjIu
YmIKQEAgLTMxLDcgKzMxLDcgQEAgU1JDX1VSSSA9ICIke0tFUk5FTE9SR19NSVJST1J9L2xpbnV4
L3V0aWxzL25mcy11dGlscy8ke1BWfS9uZnMtdXRpbHMtJHtQVn0udGFyLngKICAgICAgICAgICAg
ZmlsZTovLzAwMDEtTWFrZWZpbGUuYW0tZml4LXVuZGVmaW5lZC1mdW5jdGlvbi1mb3ItbGlibnNt
LmEucGF0Y2ggXAogICAgICAgICAgICBmaWxlOi8vY2xhbmctd2FybmluZ3MucGF0Y2ggXAogICAg
ICAgICAgICAiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiNjBkZmNkOTRhOWYzZDcyYTEyYmM3MDU4
ZDgxMTc4N2VjODdhNmQ1OTNkNzBkYTIxMjNmYWY5YWFkM2Q3YTFkZiIKK1NSQ19VUklbc2hhMjU2
c3VtXSA9ICI1MjAwODczZTgxYzRkNjEwZTI0NjJmYzI2MmZlMTgxMzVmMmRiZTc4Yjc5NzlmOTVh
Y2NkMTU5YWU2NGQ1MDExIgogCiAjIE9ubHkga2VybmVsLW1vZHVsZS1uZnNkIGlzIHJlcXVpcmVk
IGhlcmUgKGJ1dCBjYW4gYmUgYnVpbHQtaW4pICAtIHRoZSBuZnNkIG1vZHVsZSB3aWxsCiAjIHB1
bGwgaW4gdGhlIHJlbWFpbmRlciBvZiB0aGUgZGVwZW5kZW5jaWVzLgotLSAKMi4zMS4xCgo=

--===============0089746403900109140==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1658 entries from dependency cache.
Parsing recipes...done.
Parsing of 884 .bb files complete (883 cached, 1 parsed). 1658 targets, 36 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-32 sysroot...done.
Removing 1 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-0090365a73a7260943268d6b9daf72c8ec54a643"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:0090365a73a7260943268d6b9daf72c8ec54a643"
workspace            = "master:21cfb871f7da604f1fab957d7747cb03b113b971"

Initialising tasks...done.
Sstate summary: Wanted 20 Local 13 Mirrors 0 Missed 7 Current 485 (65% match, 98% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1584 of 1830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/nfs-utils/nfs-utils_2.6.2.bb:do_fetch)
NOTE: recipe nfs-utils-2.6.2-r0: task do_fetch: Started
NOTE: recipe nfs-utils-2.6.2-r0: task do_fetch: Succeeded
NOTE: Running task 1817 of 1830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/nfs-utils/nfs-utils_2.6.2.bb:do_unpack)
NOTE: Running task 1818 of 1830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/nfs-utils/nfs-utils_2.6.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe nfs-utils-2.6.2-r0: task do_unpack: Started
NOTE: recipe nfs-utils-2.6.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe nfs-utils-2.6.2-r0: task do_unpack: Succeeded
NOTE: Running task 1819 of 1830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/nfs-utils/nfs-utils_2.6.2.bb:do_patch)
NOTE: recipe nfs-utils-2.6.2-r0: task do_patch: Started
NOTE: recipe nfs-utils-2.6.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe nfs-utils-2.6.2-r0: task do_patch: Succeeded
NOTE: Running task 1820 of 1830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/nfs-utils/nfs-utils_2.6.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1821 of 1830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/nfs-utils/nfs-utils_2.6.2.bb:do_populate_lic)
NOTE: recipe nfs-utils-2.6.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe nfs-utils-2.6.2-r0: task do_populate_lic: Started
NOTE: recipe nfs-utils-2.6.2-r0: task do_populate_lic: Succeeded
NOTE: recipe nfs-utils-2.6.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1822 of 1830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/nfs-utils/nfs-utils_2.6.2.bb:do_configure)
NOTE: recipe nfs-utils-2.6.2-r0: task do_configure: Started
NOTE: recipe nfs-utils-2.6.2-r0: task do_configure: Succeeded
NOTE: Running task 1823 of 1830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/nfs-utils/nfs-utils_2.6.2.bb:do_compile)
NOTE: recipe nfs-utils-2.6.2-r0: task do_compile: Started
NOTE: recipe nfs-utils-2.6.2-r0: task do_compile: Succeeded
NOTE: Running task 1824 of 1830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/nfs-utils/nfs-utils_2.6.2.bb:do_install)
NOTE: recipe nfs-utils-2.6.2-r0: task do_install: Started
NOTE: recipe nfs-utils-2.6.2-r0: task do_install: Succeeded
NOTE: Running task 1825 of 1830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/nfs-utils/nfs-utils_2.6.2.bb:do_package)
NOTE: Running task 1826 of 1830 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/nfs-utils/nfs-utils_2.6.2.bb:do_populate_sysroot)
NOTE: recipe nfs-utils-2.6.2-r0: task do_populate_sysroot: Started
NOTE: recipe nfs-utils-2.6.2-r0: task do_package: Started
NOTE: recipe nfs-utils-2.6.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe nfs-utils-2.6.2-r0: task do_package: Failed
NOTE: Tasks Summary: Attempted 1826 tasks of which 1815 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/nfs-utils/nfs-utils_2.6.2.bb:do_package
Summary: There was 1 WARNING message.
Summary: There were 2 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: nfs-utils-2.6.2-r0 do_package: QA Issue: nfs-utils: Files/directories were installed but not shipped in any package:
  /usr/lib/modprobe.d
  /usr/lib/modprobe.d/50-nfs.conf
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
nfs-utils: 2 installed and not shipped files. [installed-vs-shipped]
ERROR: nfs-utils-2.6.2-r0 do_package: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/nfs-utils/2.6.2-r0/temp/log.do_package.973956
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/nfs-utils/nfs-utils_2.6.2.bb:do_package) failed with exit code '1'

--===============0089746403900109140==--

