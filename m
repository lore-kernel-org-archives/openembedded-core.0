Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7A27CA9EDF
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 08:10:45 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.7519.1685693430907126789
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jun 2023 01:10:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=auqyJZwH;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101887b288028-b26c6805-5fc3-4e46-91aa-201b5ca571ed-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1685693432;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ZwjrcyafKtv317VnD7TouATVZpwUR5Z729R0EUomkHU=;
	b=auqyJZwHcVS4TR7KHQAdjVspn7Ha+AQwI48aZS3Q01mbher28PGRF2xAocnqWsKd
	BSwN/jhNoFSf7wtukZiDzAuAJMkFnZo4L7aqeqthe7Yr6aXVP5aTImb2Os9mW9MOg7K
	DoSEPSNE1nOaXRQKhBH+oD0dLqDLd6iMC/oAvUP4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1685693432;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ZwjrcyafKtv317VnD7TouATVZpwUR5Z729R0EUomkHU=;
	b=Y6kWVr62kxTjI5zAgHDxvZlFZdK9BD++dTfEZ5ZkhqYrc2fYNWt6/jJWUjRzoLoH
	ywKNC6bWku8brwUHebNFWy0aP3/+N97RfcvtT+VkIWP2zmcQPrJ4yesDhCfD687+QP9
	0pbvu+bwmLBAWFhLSDUs8EsJRnKGCJxu9g7CpGhI=
Content-Type: multipart/mixed; boundary="===============1096167191136486511=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] mmc-utils: upgrading to
 958227890690290ee766aaad1b92f3413f67048c SUCCEEDED
Message-ID: <010101887b288028-b26c6805-5fc3-4e46-91aa-201b5ca571ed-000000@us-west-2.amazonses.com>
Date: Fri, 2 Jun 2023 08:10:31 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.06.02-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 08:10:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182180

--===============1096167191136486511==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *mmc-utils* to *958227890690290ee766aaad1b92f3413f67048c* has Succeeded.

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
--===============1096167191136486511==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-mmc-utils-upgrade-to-latest-revision.patch"

RnJvbSBiYjA0NDRlNWY2YmNhZjcwZmQwM2Y3NjNlZGNhMWNhMjY0YmRjNmU5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBKdW4gMjAyMyAxMzoxMzoxNCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIG1t
Yy11dGlsczogdXBncmFkZSB0byBsYXRlc3QgcmV2aXNpb24KCi0tLQogbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL21tYy9tbWMtdXRpbHNfZ2l0LmJiIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL21tYy9tbWMtdXRpbHNfZ2l0LmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL21tYy9tbWMt
dXRpbHNfZ2l0LmJiCmluZGV4IDFlMmUxN2JmZDMuLjM3M2FkYTIwMjYgMTAwNjQ0Ci0tLSBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9tbWMvbW1jLXV0aWxzX2dpdC5iYgorKysgYi9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvbW1jL21tYy11dGlsc19naXQuYmIKQEAgLTUsNyArNSw3IEBAIExJQ0VOU0Ug
PSAiR1BMLTIuMC1vbmx5IgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vbW1jLmM7YmVnaW5s
aW5lPTE7ZW5kbGluZT0yMDttZDU9ZmFlMzI3OTJlMjBmNGQyN2FkZTFjNWE3NjJkMTZiN2QiCiAK
IFNSQ0JSQU5DSCA/PSAibWFzdGVyIgotU1JDUkVWID0gImQ0YzI5MTA5ODFmZjk5Yjk4MzczNDQy
NmRmYTk5NjMyZmI4MWFjNmIiCitTUkNSRVYgPSAiOTU4MjI3ODkwNjkwMjkwZWU3NjZhYWFkMWI5
MmYzNDEzZjY3MDQ4YyIKIAogUFYgPSAiMC4xK2dpdCR7U1JDUFZ9IgogCi0tIAoyLjM5LjIKCg==

--===============1096167191136486511==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1800 entries from dependency cache.
Parsing recipes...done.
Parsing of 897 .bb files complete (896 cached, 1 parsed). 1800 targets, 37 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:50c959cb8abd2ecc0abb52a6ae9f5371a89088d4"
workspace            = "master:09505f876856471aa46774237bd3f0888615b89f"

Initialising tasks...done.
Sstate summary: Wanted 26 Local 19 Mirrors 0 Missed 7 Current 140 (73% match, 95% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 662 of 693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/mmc/mmc-utils_git.bb:do_fetch)
NOTE: recipe mmc-utils-0.1+gitAUTOINC+9582278906-r0: task do_fetch: Started
NOTE: recipe mmc-utils-0.1+gitAUTOINC+9582278906-r0: task do_fetch: Succeeded
NOTE: Running task 680 of 693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/mmc/mmc-utils_git.bb:do_unpack)
NOTE: Running task 681 of 693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/mmc/mmc-utils_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe mmc-utils-0.1+gitAUTOINC+9582278906-r0: task do_unpack: Started
NOTE: recipe mmc-utils-0.1+gitAUTOINC+9582278906-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mmc-utils-0.1+gitAUTOINC+9582278906-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe mmc-utils-0.1+gitAUTOINC+9582278906-r0: task do_unpack: Succeeded
NOTE: Running task 682 of 693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/mmc/mmc-utils_git.bb:do_patch)
NOTE: recipe mmc-utils-0.1+gitAUTOINC+9582278906-r0: task do_patch: Started
NOTE: recipe mmc-utils-0.1+gitAUTOINC+9582278906-r0: task do_patch: Succeeded
NOTE: Running task 683 of 693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/mmc/mmc-utils_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 684 of 693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/mmc/mmc-utils_git.bb:do_populate_lic)
NOTE: recipe mmc-utils-0.1+gitAUTOINC+9582278906-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mmc-utils-0.1+gitAUTOINC+9582278906-r0: task do_populate_lic: Started
NOTE: recipe mmc-utils-0.1+gitAUTOINC+9582278906-r0: task do_populate_lic: Succeeded
NOTE: recipe mmc-utils-0.1+gitAUTOINC+9582278906-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 685 of 693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/mmc/mmc-utils_git.bb:do_configure)
NOTE: recipe mmc-utils-0.1+gitAUTOINC+9582278906-r0: task do_configure: Started
NOTE: recipe mmc-utils-0.1+gitAUTOINC+9582278906-r0: task do_configure: Succeeded
NOTE: Running task 686 of 693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/mmc/mmc-utils_git.bb:do_compile)
NOTE: recipe mmc-utils-0.1+gitAUTOINC+9582278906-r0: task do_compile: Started
NOTE: recipe mmc-utils-0.1+gitAUTOINC+9582278906-r0: task do_compile: Succeeded
NOTE: Running task 687 of 693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/mmc/mmc-utils_git.bb:do_install)
NOTE: recipe mmc-utils-0.1+gitAUTOINC+9582278906-r0: task do_install: Started
NOTE: recipe mmc-utils-0.1+gitAUTOINC+9582278906-r0: task do_install: Succeeded
NOTE: Running task 688 of 693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/mmc/mmc-utils_git.bb:do_package)
NOTE: Running task 689 of 693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/mmc/mmc-utils_git.bb:do_populate_sysroot)
NOTE: recipe mmc-utils-0.1+gitAUTOINC+9582278906-r0: task do_package: Started
NOTE: recipe mmc-utils-0.1+gitAUTOINC+9582278906-r0: task do_populate_sysroot: Started
NOTE: recipe mmc-utils-0.1+gitAUTOINC+9582278906-r0: task do_populate_sysroot: Succeeded
NOTE: recipe mmc-utils-0.1+gitAUTOINC+9582278906-r0: task do_package: Succeeded
NOTE: Running task 690 of 693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/mmc/mmc-utils_git.bb:do_packagedata)
NOTE: recipe mmc-utils-0.1+gitAUTOINC+9582278906-r0: task do_packagedata: Started
NOTE: recipe mmc-utils-0.1+gitAUTOINC+9582278906-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 690 tasks of which 678 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/mmc/mmc-utils_git.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: mmc-utils-0.1+gitAUTOINC+9582278906-r0 do_packagedata: QA Issue: Package version for package mmc-utils-src went backwards which would break package feeds (from 0:0.1+git0+d4c2910981-r0 to 0:0.1+git0+9582278906-r0) [version-going-backwards]
ERROR: mmc-utils-0.1+gitAUTOINC+9582278906-r0 do_packagedata: QA Issue: Package version for package mmc-utils-dbg went backwards which would break package feeds (from 0:0.1+git0+d4c2910981-r0 to 0:0.1+git0+9582278906-r0) [version-going-backwards]
ERROR: mmc-utils-0.1+gitAUTOINC+9582278906-r0 do_packagedata: QA Issue: Package version for package mmc-utils-staticdev went backwards which would break package feeds (from 0:0.1+git0+d4c2910981-r0 to 0:0.1+git0+9582278906-r0) [version-going-backwards]
ERROR: mmc-utils-0.1+gitAUTOINC+9582278906-r0 do_packagedata: QA Issue: Package version for package mmc-utils-dev went backwards which would break package feeds (from 0:0.1+git0+d4c2910981-r0 to 0:0.1+git0+9582278906-r0) [version-going-backwards]
ERROR: mmc-utils-0.1+gitAUTOINC+9582278906-r0 do_packagedata: QA Issue: Package version for package mmc-utils-doc went backwards which would break package feeds (from 0:0.1+git0+d4c2910981-r0 to 0:0.1+git0+9582278906-r0) [version-going-backwards]
ERROR: mmc-utils-0.1+gitAUTOINC+9582278906-r0 do_packagedata: QA Issue: Package version for package mmc-utils-locale went backwards which would break package feeds (from 0:0.1+git0+d4c2910981-r0 to 0:0.1+git0+9582278906-r0) [version-going-backwards]
ERROR: mmc-utils-0.1+gitAUTOINC+9582278906-r0 do_packagedata: QA Issue: Package version for package mmc-utils went backwards which would break package feeds (from 0:0.1+git0+d4c2910981-r0 to 0:0.1+git0+9582278906-r0) [version-going-backwards]
ERROR: mmc-utils-0.1+gitAUTOINC+9582278906-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/mmc-utils/0.1+gitAUTOINC+9582278906-r0/temp/log.do_packagedata.1636722
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/mmc/mmc-utils_git.bb:do_packagedata) failed with exit code '1'

--===============1096167191136486511==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/mmc-utils/mmc-utils-dbg: PKGV changed from 0.1+git0+d4c2910981 to 0.1+git0+9582278906
packages/core2-32-poky-linux/mmc-utils/mmc-utils-dev: PKGV changed from 0.1+git0+d4c2910981 to 0.1+git0+9582278906
packages/core2-32-poky-linux/mmc-utils/mmc-utils-dev: RRECOMMENDS: removed "mmc-utils (['= 0.1+git0+d4c2910981-r0'])", added "mmc-utils (['= 0.1+git0+9582278906-r0'])"
packages/core2-32-poky-linux/mmc-utils/mmc-utils-doc: PKGV changed from 0.1+git0+d4c2910981 to 0.1+git0+9582278906
packages/core2-32-poky-linux/mmc-utils/mmc-utils-locale: PKGV changed from 0.1+git0+d4c2910981 to 0.1+git0+9582278906
packages/core2-32-poky-linux/mmc-utils/mmc-utils-src: PKGV changed from 0.1+git0+d4c2910981 to 0.1+git0+9582278906
packages/core2-32-poky-linux/mmc-utils/mmc-utils-staticdev: PKGV changed from 0.1+git0+d4c2910981 to 0.1+git0+9582278906
packages/core2-32-poky-linux/mmc-utils/mmc-utils-staticdev: RDEPENDS: removed "mmc-utils-dev (['= 0.1+git0+d4c2910981-r0'])", added "mmc-utils-dev (['= 0.1+git0+9582278906-r0'])"
packages/core2-32-poky-linux/mmc-utils/mmc-utils: PKGV changed from 0.1+git0+d4c2910981 to 0.1+git0+9582278906

--===============1096167191136486511==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/mmc-utils: PKGV changed from 0.1+gitAUTOINC+d4c2910981 [default] to 0.1+gitAUTOINC+9582278906 [default]
packages/core2-32-poky-linux/mmc-utils: PV changed from "0.1+gitAUTOINC+d4c2910981" to "0.1+gitAUTOINC+9582278906"
packages/core2-32-poky-linux/mmc-utils/mmc-utils-dbg: PKGV changed from 0.1+git0+d4c2910981 to 0.1+git0+9582278906
packages/core2-32-poky-linux/mmc-utils/mmc-utils-dbg: PV changed from "0.1+gitAUTOINC+d4c2910981" to "0.1+gitAUTOINC+9582278906"
packages/core2-32-poky-linux/mmc-utils/mmc-utils-dbg: PKGSIZE changed from 243696 to 243680 (-0%)
packages/core2-32-poky-linux/mmc-utils/mmc-utils-dev: PKGV changed from 0.1+git0+d4c2910981 to 0.1+git0+9582278906
packages/core2-32-poky-linux/mmc-utils/mmc-utils-dev: RRECOMMENDS: removed "mmc-utils (['= 0.1+git0+d4c2910981-r0'])", added "mmc-utils (['= 0.1+git0+9582278906-r0'])"
packages/core2-32-poky-linux/mmc-utils/mmc-utils-dev: PV changed from "0.1+gitAUTOINC+d4c2910981" to "0.1+gitAUTOINC+9582278906"
packages/core2-32-poky-linux/mmc-utils/mmc-utils-doc: PKGV changed from 0.1+git0+d4c2910981 to 0.1+git0+9582278906
packages/core2-32-poky-linux/mmc-utils/mmc-utils-doc: PV changed from "0.1+gitAUTOINC+d4c2910981" to "0.1+gitAUTOINC+9582278906"
packages/core2-32-poky-linux/mmc-utils/mmc-utils-locale: PKGV changed from 0.1+git0+d4c2910981 to 0.1+git0+9582278906
packages/core2-32-poky-linux/mmc-utils/mmc-utils-locale: PV changed from "0.1+gitAUTOINC+d4c2910981" to "0.1+gitAUTOINC+9582278906"
packages/core2-32-poky-linux/mmc-utils/mmc-utils-src: PKGV changed from 0.1+git0+d4c2910981 to 0.1+git0+9582278906
packages/core2-32-poky-linux/mmc-utils/mmc-utils-src: PV changed from "0.1+gitAUTOINC+d4c2910981" to "0.1+gitAUTOINC+9582278906"
packages/core2-32-poky-linux/mmc-utils/mmc-utils-src: PKGSIZE changed from 216175 to 216257 (+0%)
packages/core2-32-poky-linux/mmc-utils/mmc-utils-staticdev: PKGV changed from 0.1+git0+d4c2910981 to 0.1+git0+9582278906
packages/core2-32-poky-linux/mmc-utils/mmc-utils-staticdev: RDEPENDS: removed "mmc-utils-dev (['= 0.1+git0+d4c2910981-r0'])", added "mmc-utils-dev (['= 0.1+git0+9582278906-r0'])"
packages/core2-32-poky-linux/mmc-utils/mmc-utils-staticdev: PV changed from "0.1+gitAUTOINC+d4c2910981" to "0.1+gitAUTOINC+9582278906"
packages/core2-32-poky-linux/mmc-utils/mmc-utils: PKGV changed from 0.1+git0+d4c2910981 to 0.1+git0+9582278906
packages/core2-32-poky-linux/mmc-utils/mmc-utils: PV changed from "0.1+gitAUTOINC+d4c2910981" to "0.1+gitAUTOINC+9582278906"
packages/core2-32-poky-linux/mmc-utils/mmc-utils: PKGSIZE changed from 143172 to 143204 (+0%)

--===============1096167191136486511==--

