Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 127C2C64ED9
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 00:40:40 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web12.871.1667349631673906006
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Nov 2022 17:40:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=JP7y4rYD;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018435c85460-d1417f6d-f5f2-4e1d-9930-9af2ef2ea640-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1667349632;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=MI9ZvTQQ25v5QYY8ZhZgH+6TY4EF5P84HbjPJ1HNguQ=;
	b=JP7y4rYDLB0UCy2pgFzv5FiDuX0BWqQyVRKGUot835fylMD8MMsowm/nicLN9XvK
	3L6pscQs9OE6+TZOnrAG6JtaJnCSEaqVpyz2/Lqf5gdnzFjPO0YpDgwXl6CJDgy/bJM
	VdnaLD8sl2FdwQtqMDIsLD0KrtpNW2cHBFcUUBDk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1667349632;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=MI9ZvTQQ25v5QYY8ZhZgH+6TY4EF5P84HbjPJ1HNguQ=;
	b=ehlj4QaKC1smKMVGsuFpdbllQSWxUxyGAAiPbZHQwladUcDjuTVgwVOozIsHtNj2
	dLPrQpwNAPZPDhyrZYUsYD9BGM2+BbFYdai84/Jve+84LLR9IwS0XZyXzhN/qus80PO
	YcOxfBaCEgK7j1CcpnyIMoZtMHEyWSl7s/SwQ5kw=
Content-Type: multipart/mixed; boundary="===============1091441532530969284=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] mmc-utils: upgrading to
 4a32d090dcf6fec6ef0948e59094c4de406906cd SUCCEEDED
Message-ID: <0101018435c85460-d1417f6d-f5f2-4e1d-9930-9af2ef2ea640-000000@us-west-2.amazonses.com>
Date: Wed, 2 Nov 2022 00:40:32 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.11.02-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Nov 2022 00:40:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172412

--===============1091441532530969284==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *mmc-utils* to *4a32d090dcf6fec6ef0948e59094c4de406906cd* has Succeeded.

Next steps:
    - apply the patch: git am 0001-mmc-utils-upgrade-to-latest-revision.patch
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
--===============1091441532530969284==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/mmc-utils: PV changed from "0.1+gitAUTOINC+d7b343fd26" to "0.1+gitAUTOINC+4a32d090dc"
packages/core2-32-poky-linux/mmc-utils: PKGV changed from 0.1+gitAUTOINC+d7b343fd26 [default] to 0.1+gitAUTOINC+4a32d090dc [default]
packages/core2-32-poky-linux/mmc-utils/mmc-utils-dbg: PV changed from "0.1+gitAUTOINC+d7b343fd26" to "0.1+gitAUTOINC+4a32d090dc"
packages/core2-32-poky-linux/mmc-utils/mmc-utils-dbg: PKGV changed from 0.1+git0+d7b343fd26 to 0.1+git0+4a32d090dc
packages/core2-32-poky-linux/mmc-utils/mmc-utils-dbg: PKGSIZE changed from 229664 to 230988 (+1%)
packages/core2-32-poky-linux/mmc-utils/mmc-utils-dev: RRECOMMENDS: removed "mmc-utils (['= 0.1+git0+d7b343fd26-r0'])", added "mmc-utils (['= 0.1+git0+4a32d090dc-r0'])"
packages/core2-32-poky-linux/mmc-utils/mmc-utils-dev: PV changed from "0.1+gitAUTOINC+d7b343fd26" to "0.1+gitAUTOINC+4a32d090dc"
packages/core2-32-poky-linux/mmc-utils/mmc-utils-dev: PKGV changed from 0.1+git0+d7b343fd26 to 0.1+git0+4a32d090dc
packages/core2-32-poky-linux/mmc-utils/mmc-utils-doc: PV changed from "0.1+gitAUTOINC+d7b343fd26" to "0.1+gitAUTOINC+4a32d090dc"
packages/core2-32-poky-linux/mmc-utils/mmc-utils-doc: PKGV changed from 0.1+git0+d7b343fd26 to 0.1+git0+4a32d090dc
packages/core2-32-poky-linux/mmc-utils/mmc-utils-locale: PV changed from "0.1+gitAUTOINC+d7b343fd26" to "0.1+gitAUTOINC+4a32d090dc"
packages/core2-32-poky-linux/mmc-utils/mmc-utils-locale: PKGV changed from 0.1+git0+d7b343fd26 to 0.1+git0+4a32d090dc
packages/core2-32-poky-linux/mmc-utils/mmc-utils-src: PV changed from "0.1+gitAUTOINC+d7b343fd26" to "0.1+gitAUTOINC+4a32d090dc"
packages/core2-32-poky-linux/mmc-utils/mmc-utils-src: PKGV changed from 0.1+git0+d7b343fd26 to 0.1+git0+4a32d090dc
packages/core2-32-poky-linux/mmc-utils/mmc-utils-src: PKGSIZE changed from 210197 to 211694 (+1%)
packages/core2-32-poky-linux/mmc-utils/mmc-utils-staticdev: PV changed from "0.1+gitAUTOINC+d7b343fd26" to "0.1+gitAUTOINC+4a32d090dc"
packages/core2-32-poky-linux/mmc-utils/mmc-utils-staticdev: PKGV changed from 0.1+git0+d7b343fd26 to 0.1+git0+4a32d090dc
packages/core2-32-poky-linux/mmc-utils/mmc-utils-staticdev: RDEPENDS: removed "mmc-utils-dev (['= 0.1+git0+d7b343fd26-r0'])", added "mmc-utils-dev (['= 0.1+git0+4a32d090dc-r0'])"
packages/core2-32-poky-linux/mmc-utils/mmc-utils: PV changed from "0.1+gitAUTOINC+d7b343fd26" to "0.1+gitAUTOINC+4a32d090dc"
packages/core2-32-poky-linux/mmc-utils/mmc-utils: PKGV changed from 0.1+git0+d7b343fd26 to 0.1+git0+4a32d090dc
packages/core2-32-poky-linux/mmc-utils/mmc-utils: PKGSIZE changed from 134884 to 134948 (+0%)

--===============1091441532530969284==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/mmc-utils/mmc-utils-dbg: PKGV changed from 0.1+git0+d7b343fd26 to 0.1+git0+4a32d090dc
packages/core2-32-poky-linux/mmc-utils/mmc-utils-dev: PKGV changed from 0.1+git0+d7b343fd26 to 0.1+git0+4a32d090dc
packages/core2-32-poky-linux/mmc-utils/mmc-utils-dev: RRECOMMENDS: removed "mmc-utils (['= 0.1+git0+d7b343fd26-r0'])", added "mmc-utils (['= 0.1+git0+4a32d090dc-r0'])"
packages/core2-32-poky-linux/mmc-utils/mmc-utils-doc: PKGV changed from 0.1+git0+d7b343fd26 to 0.1+git0+4a32d090dc
packages/core2-32-poky-linux/mmc-utils/mmc-utils-locale: PKGV changed from 0.1+git0+d7b343fd26 to 0.1+git0+4a32d090dc
packages/core2-32-poky-linux/mmc-utils/mmc-utils-src: PKGV changed from 0.1+git0+d7b343fd26 to 0.1+git0+4a32d090dc
packages/core2-32-poky-linux/mmc-utils/mmc-utils-staticdev: RDEPENDS: removed "mmc-utils-dev (['= 0.1+git0+d7b343fd26-r0'])", added "mmc-utils-dev (['= 0.1+git0+4a32d090dc-r0'])"
packages/core2-32-poky-linux/mmc-utils/mmc-utils-staticdev: PKGV changed from 0.1+git0+d7b343fd26 to 0.1+git0+4a32d090dc
packages/core2-32-poky-linux/mmc-utils/mmc-utils: PKGV changed from 0.1+git0+d7b343fd26 to 0.1+git0+4a32d090dc

--===============1091441532530969284==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-mmc-utils-upgrade-to-latest-revision.patch"

RnJvbSAwY2RjYmRmMzdmNGRlNzk0OWU0OGJjYzk3OGY2ZDY1YmZmNWQwZGNlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBOb3YgMjAyMiAwODoxNTo0NyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIG1t
Yy11dGlsczogdXBncmFkZSB0byBsYXRlc3QgcmV2aXNpb24KCi0tLQogbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL21tYy9tbWMtdXRpbHNfZ2l0LmJiIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL21tYy9tbWMtdXRpbHNfZ2l0LmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL21tYy9tbWMt
dXRpbHNfZ2l0LmJiCmluZGV4IDBiYjk0YWI5M2EuLmQyNTkwZDQwMGEgMTAwNjQ0Ci0tLSBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9tbWMvbW1jLXV0aWxzX2dpdC5iYgorKysgYi9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvbW1jL21tYy11dGlsc19naXQuYmIKQEAgLTUsNyArNSw3IEBAIExJQ0VOU0Ug
PSAiR1BMLTIuMC1vbmx5IgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vbW1jLmM7YmVnaW5s
aW5lPTE7ZW5kbGluZT0yMDttZDU9ZmFlMzI3OTJlMjBmNGQyN2FkZTFjNWE3NjJkMTZiN2QiCiAK
IFNSQ0JSQU5DSCA/PSAibWFzdGVyIgotU1JDUkVWID0gImQ3YjM0M2ZkMjYyODgwOTk0ZjA0MWNl
MjMzNTQ0MmU3YmQxMDcxZjUiCitTUkNSRVYgPSAiNGEzMmQwOTBkY2Y2ZmVjNmVmMDk0OGU1OTA5
NGM0ZGU0MDY5MDZjZCIKIAogUFYgPSAiMC4xK2dpdCR7U1JDUFZ9IgogCi0tIAoyLjMxLjEKCg==

--===============1091441532530969284==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1664 entries from dependency cache.
Parsing recipes...done.
Parsing of 886 .bb files complete (885 cached, 1 parsed). 1664 targets, 36 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-32 sysroot...done.
Removing 1 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:3719cd017ac72a9f6158799e2e79c0e60f6059cf"
workspace            = "master:78fd269e6649000b48ef1ef3e86009bad00fa815"

Initialising tasks...done.
Sstate summary: Wanted 24 Local 17 Mirrors 0 Missed 7 Current 129 (70% match, 95% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 606 of 637 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/mmc/mmc-utils_git.bb:do_fetch)
NOTE: recipe mmc-utils-0.1+gitAUTOINC+4a32d090dc-r0: task do_fetch: Started
NOTE: recipe mmc-utils-0.1+gitAUTOINC+4a32d090dc-r0: task do_fetch: Succeeded
NOTE: Running task 624 of 637 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/mmc/mmc-utils_git.bb:do_unpack)
NOTE: Running task 625 of 637 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/mmc/mmc-utils_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe mmc-utils-0.1+gitAUTOINC+4a32d090dc-r0: task do_unpack: Started
NOTE: recipe mmc-utils-0.1+gitAUTOINC+4a32d090dc-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mmc-utils-0.1+gitAUTOINC+4a32d090dc-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe mmc-utils-0.1+gitAUTOINC+4a32d090dc-r0: task do_unpack: Succeeded
NOTE: Running task 626 of 637 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/mmc/mmc-utils_git.bb:do_patch)
NOTE: recipe mmc-utils-0.1+gitAUTOINC+4a32d090dc-r0: task do_patch: Started
NOTE: recipe mmc-utils-0.1+gitAUTOINC+4a32d090dc-r0: task do_patch: Succeeded
NOTE: Running task 627 of 637 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/mmc/mmc-utils_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 628 of 637 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/mmc/mmc-utils_git.bb:do_populate_lic)
NOTE: recipe mmc-utils-0.1+gitAUTOINC+4a32d090dc-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mmc-utils-0.1+gitAUTOINC+4a32d090dc-r0: task do_populate_lic: Started
NOTE: recipe mmc-utils-0.1+gitAUTOINC+4a32d090dc-r0: task do_populate_lic: Succeeded
NOTE: recipe mmc-utils-0.1+gitAUTOINC+4a32d090dc-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 629 of 637 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/mmc/mmc-utils_git.bb:do_configure)
NOTE: recipe mmc-utils-0.1+gitAUTOINC+4a32d090dc-r0: task do_configure: Started
NOTE: recipe mmc-utils-0.1+gitAUTOINC+4a32d090dc-r0: task do_configure: Succeeded
NOTE: Running task 630 of 637 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/mmc/mmc-utils_git.bb:do_compile)
NOTE: recipe mmc-utils-0.1+gitAUTOINC+4a32d090dc-r0: task do_compile: Started
NOTE: recipe mmc-utils-0.1+gitAUTOINC+4a32d090dc-r0: task do_compile: Succeeded
NOTE: Running task 631 of 637 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/mmc/mmc-utils_git.bb:do_install)
NOTE: recipe mmc-utils-0.1+gitAUTOINC+4a32d090dc-r0: task do_install: Started
NOTE: recipe mmc-utils-0.1+gitAUTOINC+4a32d090dc-r0: task do_install: Succeeded
NOTE: Running task 632 of 637 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/mmc/mmc-utils_git.bb:do_package)
NOTE: Running task 633 of 637 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/mmc/mmc-utils_git.bb:do_populate_sysroot)
NOTE: recipe mmc-utils-0.1+gitAUTOINC+4a32d090dc-r0: task do_populate_sysroot: Started
NOTE: recipe mmc-utils-0.1+gitAUTOINC+4a32d090dc-r0: task do_package: Started
NOTE: recipe mmc-utils-0.1+gitAUTOINC+4a32d090dc-r0: task do_populate_sysroot: Succeeded
NOTE: recipe mmc-utils-0.1+gitAUTOINC+4a32d090dc-r0: task do_package: Succeeded
NOTE: Running task 634 of 637 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/mmc/mmc-utils_git.bb:do_packagedata)
NOTE: recipe mmc-utils-0.1+gitAUTOINC+4a32d090dc-r0: task do_packagedata: Started
NOTE: recipe mmc-utils-0.1+gitAUTOINC+4a32d090dc-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 634 tasks of which 622 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/mmc/mmc-utils_git.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: mmc-utils-0.1+gitAUTOINC+4a32d090dc-r0 do_packagedata: QA Issue: Package version for package mmc-utils-src went backwards which would break package feeds (from 0:0.1+git0+d7b343fd26-r0 to 0:0.1+git0+4a32d090dc-r0) [version-going-backwards]
ERROR: mmc-utils-0.1+gitAUTOINC+4a32d090dc-r0 do_packagedata: QA Issue: Package version for package mmc-utils-dbg went backwards which would break package feeds (from 0:0.1+git0+d7b343fd26-r0 to 0:0.1+git0+4a32d090dc-r0) [version-going-backwards]
ERROR: mmc-utils-0.1+gitAUTOINC+4a32d090dc-r0 do_packagedata: QA Issue: Package version for package mmc-utils-staticdev went backwards which would break package feeds (from 0:0.1+git0+d7b343fd26-r0 to 0:0.1+git0+4a32d090dc-r0) [version-going-backwards]
ERROR: mmc-utils-0.1+gitAUTOINC+4a32d090dc-r0 do_packagedata: QA Issue: Package version for package mmc-utils-dev went backwards which would break package feeds (from 0:0.1+git0+d7b343fd26-r0 to 0:0.1+git0+4a32d090dc-r0) [version-going-backwards]
ERROR: mmc-utils-0.1+gitAUTOINC+4a32d090dc-r0 do_packagedata: QA Issue: Package version for package mmc-utils-doc went backwards which would break package feeds (from 0:0.1+git0+d7b343fd26-r0 to 0:0.1+git0+4a32d090dc-r0) [version-going-backwards]
ERROR: mmc-utils-0.1+gitAUTOINC+4a32d090dc-r0 do_packagedata: QA Issue: Package version for package mmc-utils-locale went backwards which would break package feeds (from 0:0.1+git0+d7b343fd26-r0 to 0:0.1+git0+4a32d090dc-r0) [version-going-backwards]
ERROR: mmc-utils-0.1+gitAUTOINC+4a32d090dc-r0 do_packagedata: QA Issue: Package version for package mmc-utils went backwards which would break package feeds (from 0:0.1+git0+d7b343fd26-r0 to 0:0.1+git0+4a32d090dc-r0) [version-going-backwards]
ERROR: mmc-utils-0.1+gitAUTOINC+4a32d090dc-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/mmc-utils/0.1+gitAUTOINC+4a32d090dc-r0/temp/log.do_packagedata.1963049
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/mmc/mmc-utils_git.bb:do_packagedata) failed with exit code '1'

--===============1091441532530969284==--

