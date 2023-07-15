Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BB9EC00528
	for <webhook@archiver.kernel.org>; Sat, 15 Jul 2023 21:27:38 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.5948.1689456455265522325
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Jul 2023 14:27:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=ABZtVASW;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101895b73b03a-c71e701d-d4bf-490e-bffb-a40a53404b62-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1689456456;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=mq+xQbvfAEUdE9NM7DDu2VPSaS/sgC0hNbCF9GJVhWE=;
	b=ABZtVASW5lgiquDy2YCzLkgxTM0AaGaMK+ueUf8+iNT5yyWbpI/SqXxfM2G7HFTx
	wY0WAQKSKRU7iu1iTtwg6lunIChv13W2S4tAIOJNqOe7cfNoP40lmQNDmA+xPHH4iqF
	0F9RSjsz6y+ADvofL8PZMiT2FhKIHkFVwJ3/9TnY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1689456456;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=mq+xQbvfAEUdE9NM7DDu2VPSaS/sgC0hNbCF9GJVhWE=;
	b=aNPEeWRyxfzk9nXFy/BHxBqEFmjQbZpLdbu2rNg1tsiGa4G/l6uvnYegtAyacghN
	oSjuYeOxwqvrc0NY5tQhi4AjV/qLAZeAzAoQNrOff2eSUiH/UumUJmIhMW2uwFLs+Sx
	/k9RuQquLWZr7fjE5lrq4mNwBt1FQUELJV0fawXs=
Content-Type: multipart/mixed; boundary="===============5545169055873701861=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] spirv-tools: upgrading to 1.3.250.1 SUCCEEDED
Message-ID: <010101895b73b03a-c71e701d-d4bf-490e-bffb-a40a53404b62-000000@us-west-2.amazonses.com>
Date: Sat, 15 Jul 2023 21:27:35 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.07.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Jul 2023 21:27:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184397

--===============5545169055873701861==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *spirv-tools* to *1.3.250.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-spirv-tools-upgrade-1.3.250.0-1.3.250.1.patch
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
From 414271d2c770c6c4941c6b3aa5128f5769b4461e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Jul 2023 18:35:45 +0000
Subject: [PATCH] spirv-tools: upgrade 1.3.250.0 -> 1.3.250.1

---
 .../spir/{spirv-tools_1.3.250.0.bb => spirv-tools_1.3.250.1.bb}   | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta/recipes-graphics/spir/{spirv-tools_1.3.250.0.bb => spirv-tools_1.3.250.1.bb} (100%)

diff --git a/meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb b/meta/recipes-graphics/spir/spirv-tools_1.3.250.1.bb
similarity index 100%
rename from meta/recipes-graphics/spir/spirv-tools_1.3.250.0.bb
rename to meta/recipes-graphics/spir/spirv-tools_1.3.250.1.bb
-- 
2.39.2


--===============5545169055873701861==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/spirv-tools: PV changed from "1.3.250.0" to "1.3.250.1"
packages/core2-32-poky-linux/spirv-tools: PKGV changed from 1.3.250.0 [default] to 1.3.250.1 [default]
packages/core2-32-poky-linux/spirv-tools/spirv-tools-dbg: PV changed from "1.3.250.0" to "1.3.250.1"
packages/core2-32-poky-linux/spirv-tools/spirv-tools-dbg: PKGV changed from 1.3.250.0 [default] to 1.3.250.1 [default]
packages/core2-32-poky-linux/spirv-tools/spirv-tools-dev: PV changed from "1.3.250.0" to "1.3.250.1"
packages/core2-32-poky-linux/spirv-tools/spirv-tools-dev: PKGV changed from 1.3.250.0 [default] to 1.3.250.1 [default]
packages/core2-32-poky-linux/spirv-tools/spirv-tools-doc: PV changed from "1.3.250.0" to "1.3.250.1"
packages/core2-32-poky-linux/spirv-tools/spirv-tools-doc: PKGV changed from 1.3.250.0 [default] to 1.3.250.1 [default]
packages/core2-32-poky-linux/spirv-tools/spirv-tools-lesspipe: PV changed from "1.3.250.0" to "1.3.250.1"
packages/core2-32-poky-linux/spirv-tools/spirv-tools-lesspipe: PKGV changed from 1.3.250.0 [default] to 1.3.250.1 [default]
packages/core2-32-poky-linux/spirv-tools/spirv-tools-locale: PV changed from "1.3.250.0" to "1.3.250.1"
packages/core2-32-poky-linux/spirv-tools/spirv-tools-locale: PKGV changed from 1.3.250.0 [default] to 1.3.250.1 [default]
packages/core2-32-poky-linux/spirv-tools/spirv-tools-src: PV changed from "1.3.250.0" to "1.3.250.1"
packages/core2-32-poky-linux/spirv-tools/spirv-tools-src: PKGV changed from 1.3.250.0 [default] to 1.3.250.1 [default]
packages/core2-32-poky-linux/spirv-tools/spirv-tools-staticdev: PV changed from "1.3.250.0" to "1.3.250.1"
packages/core2-32-poky-linux/spirv-tools/spirv-tools-staticdev: PKGV changed from 1.3.250.0 [default] to 1.3.250.1 [default]
packages/core2-32-poky-linux/spirv-tools/spirv-tools: PV changed from "1.3.250.0" to "1.3.250.1"
packages/core2-32-poky-linux/spirv-tools/spirv-tools: PKGV changed from 1.3.250.0 [default] to 1.3.250.1 [default]

--===============5545169055873701861==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-spirv-tools-upgrade-1.3.250.0-1.3.250.1.patch"

RnJvbSA0MTQyNzFkMmM3NzBjNmM0OTQxYzZiM2FhNTEyOGY1NzY5YjQ0NjFlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgSnVsIDIwMjMgMTg6MzU6NDUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBz
cGlydi10b29sczogdXBncmFkZSAxLjMuMjUwLjAgLT4gMS4zLjI1MC4xCgotLS0KIC4uLi9zcGly
L3tzcGlydi10b29sc18xLjMuMjUwLjAuYmIgPT4gc3BpcnYtdG9vbHNfMS4zLjI1MC4xLmJifSAg
IHwgMAogMSBmaWxlIGNoYW5nZWQsIDAgaW5zZXJ0aW9ucygrKSwgMCBkZWxldGlvbnMoLSkKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvc3Bpci97c3BpcnYtdG9vbHNfMS4zLjI1MC4wLmJi
ID0+IHNwaXJ2LXRvb2xzXzEuMy4yNTAuMS5iYn0gKDEwMCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLWdyYXBoaWNzL3NwaXIvc3BpcnYtdG9vbHNfMS4zLjI1MC4wLmJiIGIvbWV0YS9yZWNp
cGVzLWdyYXBoaWNzL3NwaXIvc3BpcnYtdG9vbHNfMS4zLjI1MC4xLmJiCnNpbWlsYXJpdHkgaW5k
ZXggMTAwJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvc3Bpci9zcGlydi10b29s
c18xLjMuMjUwLjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1ncmFwaGljcy9zcGlyL3NwaXJ2
LXRvb2xzXzEuMy4yNTAuMS5iYgotLSAKMi4zOS4yCgo=

--===============5545169055873701861==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (0 cached, 899 parsed). 1804 targets, 70 skipped, 0 masked, 0 errors.
Removing 1 recipes from the ppc7400 sysroot...done.
Removing 1 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:509cc11999e194ba8d107a476f11b535a41618df"
workspace            = "master:e6d4b610fc24ae009bf6d0710fc429a61a38aa34"

Initialising tasks...done.
Sstate summary: Wanted 29 Local 15 Mirrors 0 Missed 14 Current 299 (51% match, 95% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 833 of 1170 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_fetch)
NOTE: Running task 856 of 1170 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.1.bb:do_fetch)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_fetch: Started
NOTE: recipe spirv-tools-1_1.3.250.1-r0: task do_fetch: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_fetch: Succeeded
NOTE: Running task 1140 of 1170 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_unpack)
NOTE: recipe spirv-tools-1_1.3.250.1-r0: task do_fetch: Succeeded
NOTE: Running task 1141 of 1170 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1142 of 1170 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.1.bb:do_unpack)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_unpack: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe spirv-tools-1_1.3.250.1-r0: task do_unpack: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_unpack: Succeeded
NOTE: Running task 1143 of 1170 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_patch)
NOTE: Running task 1144 of 1170 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_collect_spdx_deps)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_patch: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_patch: Succeeded
NOTE: Running task 1145 of 1170 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_generate_toolchain_file)
NOTE: Running task 1146 of 1170 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_deploy_source_date_epoch)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe spirv-tools-1_1.3.250.1-r0: task do_unpack: Succeeded
NOTE: Running task 1147 of 1170 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.1.bb:do_patch)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe spirv-tools-1_1.3.250.1-r0: task do_patch: Started
NOTE: recipe spirv-tools-1_1.3.250.1-r0: task do_patch: Succeeded
NOTE: Running task 1148 of 1170 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1149 of 1170 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.1.bb:do_generate_toolchain_file)
NOTE: Running task 1150 of 1170 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.1.bb:do_populate_lic)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1151 of 1170 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_configure)
NOTE: recipe spirv-tools-1_1.3.250.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe spirv-tools-1_1.3.250.1-r0: task do_populate_lic: Started
NOTE: recipe spirv-tools-1_1.3.250.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_configure: Started
NOTE: recipe spirv-tools-1_1.3.250.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe spirv-tools-1_1.3.250.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.1.bb:do_populate_lic unihash changed to ff0f35050f49fb3bda11830163ee045bccfe1d840951f96704ee0218bd17871e
NOTE: recipe spirv-tools-1_1.3.250.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_configure: Succeeded
NOTE: Running task 1152 of 1170 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_compile)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_compile: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_compile: Succeeded
NOTE: Running task 1153 of 1170 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_install)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_install: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_install: Succeeded
NOTE: Running task 1154 of 1170 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_package)
NOTE: Running task 1155 of 1170 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_populate_sysroot)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_populate_sysroot: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_package: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1156 of 1170 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe spirv-tools-1_1.3.250.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe spirv-tools-1_1.3.250.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1157 of 1170 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.1.bb:do_configure)
NOTE: recipe spirv-tools-1_1.3.250.1-r0: task do_configure: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_package: Succeeded
NOTE: Running task 1158 of 1170 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_packagedata)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_packagedata: Started
NOTE: recipe spirv-tools-1_1.3.250.1-r0: task do_configure: Succeeded
NOTE: Running task 1159 of 1170 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.1.bb:do_compile)
NOTE: recipe spirv-tools-1_1.3.250.1-r0: task do_compile: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_packagedata: Failed
NOTE: recipe spirv-tools-1_1.3.250.1-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1159 tasks of which 1137 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: spirv-headers-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package spirv-headers-src went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: spirv-headers-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package spirv-headers-dbg went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: spirv-headers-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package spirv-headers-staticdev went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: spirv-headers-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package spirv-headers-dev went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: spirv-headers-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package spirv-headers-doc went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: spirv-headers-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package spirv-headers-locale went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: spirv-headers-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package spirv-headers went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: spirv-headers-1_1.3.250.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/spirv-headers/1_1.3.250.0-r0/temp/log.do_packagedata.2757174
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_packagedata) failed with exit code '1'

--===============5545169055873701861==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (0 cached, 899 parsed). 1804 targets, 54 skipped, 0 masked, 0 errors.
Removing 1 recipes from the cortexa15t2hf-neon sysroot...done.
Removing 1 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:509cc11999e194ba8d107a476f11b535a41618df"
workspace            = "master:e6d4b610fc24ae009bf6d0710fc429a61a38aa34"

Initialising tasks...done.
Sstate summary: Wanted 29 Local 15 Mirrors 0 Missed 14 Current 299 (51% match, 95% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 833 of 1170 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_fetch)
NOTE: Running task 856 of 1170 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.1.bb:do_fetch)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_fetch: Started
NOTE: recipe spirv-tools-1_1.3.250.1-r0: task do_fetch: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_fetch: Succeeded
NOTE: Running task 1140 of 1170 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_unpack)
NOTE: Running task 1141 of 1170 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe spirv-tools-1_1.3.250.1-r0: task do_fetch: Succeeded
NOTE: Running task 1142 of 1170 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.1.bb:do_unpack)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_unpack: Started
NOTE: recipe spirv-tools-1_1.3.250.1-r0: task do_unpack: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_unpack: Succeeded
NOTE: Running task 1143 of 1170 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_patch)
NOTE: Running task 1144 of 1170 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_collect_spdx_deps)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_patch: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_patch: Succeeded
NOTE: Running task 1145 of 1170 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_generate_toolchain_file)
NOTE: Running task 1146 of 1170 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_deploy_source_date_epoch)
NOTE: recipe spirv-tools-1_1.3.250.1-r0: task do_unpack: Succeeded
NOTE: Running task 1147 of 1170 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.1.bb:do_patch)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe spirv-tools-1_1.3.250.1-r0: task do_patch: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe spirv-tools-1_1.3.250.1-r0: task do_patch: Succeeded
NOTE: Running task 1148 of 1170 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1149 of 1170 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.1.bb:do_generate_toolchain_file)
NOTE: Running task 1150 of 1170 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.1.bb:do_populate_lic)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1151 of 1170 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_configure)
NOTE: recipe spirv-tools-1_1.3.250.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe spirv-tools-1_1.3.250.1-r0: task do_populate_lic: Started
NOTE: recipe spirv-tools-1_1.3.250.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe spirv-tools-1_1.3.250.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_configure: Started
NOTE: recipe spirv-tools-1_1.3.250.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.1.bb:do_populate_lic unihash changed to ff0f35050f49fb3bda11830163ee045bccfe1d840951f96704ee0218bd17871e
NOTE: recipe spirv-tools-1_1.3.250.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_configure: Succeeded
NOTE: Running task 1152 of 1170 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_compile)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_compile: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_compile: Succeeded
NOTE: Running task 1153 of 1170 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_install)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_install: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_install: Succeeded
NOTE: Running task 1154 of 1170 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_package)
NOTE: Running task 1155 of 1170 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_populate_sysroot)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_populate_sysroot: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_package: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1156 of 1170 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe spirv-tools-1_1.3.250.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe spirv-tools-1_1.3.250.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1157 of 1170 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.1.bb:do_configure)
NOTE: recipe spirv-tools-1_1.3.250.1-r0: task do_configure: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_package: Succeeded
NOTE: Running task 1158 of 1170 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_packagedata)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_packagedata: Started
NOTE: recipe spirv-tools-1_1.3.250.1-r0: task do_configure: Succeeded
NOTE: Running task 1159 of 1170 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.1.bb:do_compile)
NOTE: recipe spirv-tools-1_1.3.250.1-r0: task do_compile: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_packagedata: Failed
NOTE: recipe spirv-tools-1_1.3.250.1-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1159 tasks of which 1137 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: spirv-headers-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package spirv-headers-src went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: spirv-headers-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package spirv-headers-dbg went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: spirv-headers-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package spirv-headers-staticdev went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: spirv-headers-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package spirv-headers-dev went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: spirv-headers-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package spirv-headers-doc went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: spirv-headers-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package spirv-headers-locale went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: spirv-headers-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package spirv-headers went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: spirv-headers-1_1.3.250.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/spirv-headers/1_1.3.250.0-r0/temp/log.do_packagedata.2750430
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_packagedata) failed with exit code '1'

--===============5545169055873701861==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (0 cached, 899 parsed). 1804 targets, 48 skipped, 0 masked, 0 errors.
Removing 9 recipes from the core2-32 sysroot...done.
Removing 31 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:509cc11999e194ba8d107a476f11b535a41618df"
workspace            = "master:e6d4b610fc24ae009bf6d0710fc429a61a38aa34"

Initialising tasks...done.
Sstate summary: Wanted 155 Local 141 Mirrors 0 Missed 14 Current 169 (90% match, 95% complete)
Removing 3 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 170 of 324 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 171 of 324 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 172 of 324 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 174 of 324 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_create_spdx_setscene)
NOTE: Running task 665 of 1155 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_fetch)
NOTE: Running task 666 of 1155 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.1.bb:do_fetch)
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_fetch: Started
NOTE: recipe spirv-tools-1_1.3.250.1-r0: task do_fetch: Started
NOTE: recipe bash-5.2.15-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bash-5.2.15-r0: task do_create_spdx_setscene: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_fetch: Succeeded
NOTE: recipe spirv-tools-1_1.3.250.1-r0: task do_fetch: Succeeded
NOTE: Running task 709 of 1155 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_unpack)
NOTE: Running task 710 of 1155 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.1.bb:do_unpack)
NOTE: recipe bash-5.2.15-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 195 of 324 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 196 of 324 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 197 of 324 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 198 of 324 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 199 of 324 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 200 of 324 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 204 of 324 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 205 of 324 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_packagedata_setscene)
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_unpack: Started
NOTE: recipe spirv-tools-1_1.3.250.1-r0: task do_unpack: Started
NOTE: recipe make-4.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+8259375d30-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.36.1-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.3-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.1.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-runtime-13.1.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 208 of 324 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+8259375d30-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 210 of 324 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 212 of 324 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 213 of 324 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.4+gitAUTOINC+718f363bc2-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.4+gitAUTOINC+718f363bc2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 225 of 324 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.1.bb:do_create_spdx_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Succeeded
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_unpack: Succeeded
NOTE: recipe coreutils-9.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 741 of 1155 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_patch)
NOTE: Running setscene task 230 of 324 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 232 of 324 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 234 of 324 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.69.bb:do_packagedata_setscene)
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-cross-i686-13.1.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_patch: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe spirv-tools-1_1.3.250.1-r0: task do_unpack: Succeeded
NOTE: Running task 750 of 1155 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.1.bb:do_patch)
NOTE: recipe gcc-cross-i686-13.1.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_patch: Succeeded
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 751 of 1155 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_generate_toolchain_file)
NOTE: Running task 752 of 1155 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe spirv-tools-1_1.3.250.1-r0: task do_patch: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 248 of 324 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe spirv-tools-1_1.3.250.1-r0: task do_patch: Succeeded
NOTE: Running task 769 of 1155 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 770 of 1155 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.1.bb:do_generate_toolchain_file)
NOTE: Running task 771 of 1155 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.1.bb:do_populate_lic)
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 251 of 324 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 253 of 324 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 256 of 324 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 258 of 324 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 260 of 324 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_packagedata_setscene)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe spirv-tools-1_1.3.250.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe spirv-tools-1_1.3.250.1-r0: task do_populate_lic: Started
NOTE: recipe spirv-tools-1_1.3.250.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe spirv-tools-1_1.3.250.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe spirv-tools-1_1.3.250.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.1.bb:do_populate_lic unihash changed to ff0f35050f49fb3bda11830163ee045bccfe1d840951f96704ee0218bd17871e
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe spirv-tools-1_1.3.250.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 273 of 324 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe perl-5.36.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 279 of 324 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 281 of 324 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 284 of 324 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 291 of 324 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 293 of 324 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-13.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-13.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 297 of 324 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.1.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-13.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 299 of 324 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-13.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-13.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 301 of 324 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.4+gitAUTOINC+718f363bc2-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 302 of 324 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.4+gitAUTOINC+718f363bc2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.4+gitAUTOINC+718f363bc2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 305 of 324 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 306 of 324 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 307 of 324 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.4.bb:do_packagedata_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.4+gitAUTOINC+718f363bc2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 308 of 324 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 309 of 324 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 318 of 324 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-13.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-13.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 321 of 324 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.4.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 322 of 324 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.40.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 991 of 1155 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1083 of 1155 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_collect_spdx_deps)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1136 of 1155 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_configure)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_configure: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_configure: Succeeded
NOTE: Running task 1137 of 1155 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_compile)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_compile: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_compile: Succeeded
NOTE: Running task 1138 of 1155 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_install)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_install: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_install: Succeeded
NOTE: Running task 1139 of 1155 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_package)
NOTE: Running task 1140 of 1155 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_populate_sysroot)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_populate_sysroot: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_package: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1141 of 1155 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe spirv-tools-1_1.3.250.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe spirv-tools-1_1.3.250.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1142 of 1155 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.1.bb:do_configure)
NOTE: recipe spirv-tools-1_1.3.250.1-r0: task do_configure: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_package: Succeeded
NOTE: Running task 1143 of 1155 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_packagedata)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_packagedata: Started
NOTE: recipe spirv-tools-1_1.3.250.1-r0: task do_configure: Succeeded
NOTE: Running task 1144 of 1155 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.1.bb:do_compile)
NOTE: recipe spirv-tools-1_1.3.250.1-r0: task do_compile: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_packagedata: Failed
NOTE: recipe spirv-tools-1_1.3.250.1-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1144 tasks of which 1122 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: spirv-headers-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package spirv-headers-src went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: spirv-headers-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package spirv-headers-dbg went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: spirv-headers-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package spirv-headers-staticdev went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: spirv-headers-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package spirv-headers-dev went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: spirv-headers-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package spirv-headers-doc went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: spirv-headers-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package spirv-headers-locale went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: spirv-headers-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package spirv-headers went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: spirv-headers-1_1.3.250.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/spirv-headers/1_1.3.250.0-r0/temp/log.do_packagedata.2763751
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_packagedata) failed with exit code '1'

--===============5545169055873701861==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1806 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (898 cached, 1 parsed). 1804 targets, 37 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:509cc11999e194ba8d107a476f11b535a41618df"
workspace            = "master:e6d4b610fc24ae009bf6d0710fc429a61a38aa34"

Initialising tasks...done.
Sstate summary: Wanted 29 Local 15 Mirrors 0 Missed 14 Current 299 (51% match, 95% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 833 of 1170 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_fetch)
NOTE: Running task 856 of 1170 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.1.bb:do_fetch)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_fetch: Started
NOTE: recipe spirv-tools-1_1.3.250.1-r0: task do_fetch: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_fetch: Succeeded
NOTE: Running task 1140 of 1170 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_unpack)
NOTE: Running task 1141 of 1170 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe spirv-tools-1_1.3.250.1-r0: task do_fetch: Succeeded
NOTE: Running task 1142 of 1170 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.1.bb:do_unpack)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_unpack: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe spirv-tools-1_1.3.250.1-r0: task do_unpack: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_unpack: Succeeded
NOTE: Running task 1143 of 1170 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_patch)
NOTE: Running task 1144 of 1170 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_collect_spdx_deps)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_patch: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_patch: Succeeded
NOTE: Running task 1145 of 1170 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_generate_toolchain_file)
NOTE: Running task 1146 of 1170 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_deploy_source_date_epoch)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe spirv-tools-1_1.3.250.1-r0: task do_unpack: Succeeded
NOTE: Running task 1147 of 1170 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.1.bb:do_patch)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe spirv-tools-1_1.3.250.1-r0: task do_patch: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe spirv-tools-1_1.3.250.1-r0: task do_patch: Succeeded
NOTE: Running task 1148 of 1170 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1149 of 1170 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.1.bb:do_generate_toolchain_file)
NOTE: Running task 1150 of 1170 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.1.bb:do_populate_lic)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1151 of 1170 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_configure)
NOTE: recipe spirv-tools-1_1.3.250.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe spirv-tools-1_1.3.250.1-r0: task do_populate_lic: Started
NOTE: recipe spirv-tools-1_1.3.250.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe spirv-tools-1_1.3.250.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_configure: Started
NOTE: recipe spirv-tools-1_1.3.250.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.1.bb:do_populate_lic unihash changed to ff0f35050f49fb3bda11830163ee045bccfe1d840951f96704ee0218bd17871e
NOTE: recipe spirv-tools-1_1.3.250.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_configure: Succeeded
NOTE: Running task 1152 of 1170 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_compile)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_compile: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_compile: Succeeded
NOTE: Running task 1153 of 1170 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_install)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_install: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_install: Succeeded
NOTE: Running task 1154 of 1170 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_package)
NOTE: Running task 1155 of 1170 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_populate_sysroot)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_populate_sysroot: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_package: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1156 of 1170 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe spirv-tools-1_1.3.250.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe spirv-tools-1_1.3.250.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1157 of 1170 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.1.bb:do_configure)
NOTE: recipe spirv-tools-1_1.3.250.1-r0: task do_configure: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_package: Succeeded
NOTE: Running task 1158 of 1170 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_packagedata)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_packagedata: Started
NOTE: recipe spirv-tools-1_1.3.250.1-r0: task do_configure: Succeeded
NOTE: Running task 1159 of 1170 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.1.bb:do_compile)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_packagedata: Failed
NOTE: recipe spirv-tools-1_1.3.250.1-r0: task do_compile: Started
NOTE: recipe spirv-tools-1_1.3.250.1-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1159 tasks of which 1137 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: spirv-headers-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package spirv-headers-src went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: spirv-headers-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package spirv-headers-dbg went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: spirv-headers-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package spirv-headers-staticdev went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: spirv-headers-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package spirv-headers-dev went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: spirv-headers-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package spirv-headers-doc went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: spirv-headers-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package spirv-headers-locale went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: spirv-headers-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package spirv-headers went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: spirv-headers-1_1.3.250.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/spirv-headers/1_1.3.250.0-r0/temp/log.do_packagedata.2747037
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_packagedata) failed with exit code '1'

--===============5545169055873701861==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (0 cached, 899 parsed). 1804 targets, 64 skipped, 0 masked, 0 errors.
Removing 1 recipes from the mips32r2 sysroot...done.
Removing 1 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:509cc11999e194ba8d107a476f11b535a41618df"
workspace            = "master:e6d4b610fc24ae009bf6d0710fc429a61a38aa34"

Initialising tasks...done.
Sstate summary: Wanted 29 Local 15 Mirrors 0 Missed 14 Current 299 (51% match, 95% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 833 of 1170 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_fetch)
NOTE: Running task 856 of 1170 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.1.bb:do_fetch)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_fetch: Started
NOTE: recipe spirv-tools-1_1.3.250.1-r0: task do_fetch: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_fetch: Succeeded
NOTE: Running task 1140 of 1170 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_unpack)
NOTE: Running task 1141 of 1170 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe spirv-tools-1_1.3.250.1-r0: task do_fetch: Succeeded
NOTE: Running task 1142 of 1170 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.1.bb:do_unpack)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_unpack: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe spirv-tools-1_1.3.250.1-r0: task do_unpack: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_unpack: Succeeded
NOTE: Running task 1143 of 1170 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_patch)
NOTE: Running task 1144 of 1170 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_collect_spdx_deps)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_patch: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_patch: Succeeded
NOTE: Running task 1145 of 1170 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_generate_toolchain_file)
NOTE: Running task 1146 of 1170 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_deploy_source_date_epoch)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe spirv-tools-1_1.3.250.1-r0: task do_unpack: Succeeded
NOTE: Running task 1147 of 1170 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.1.bb:do_patch)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe spirv-tools-1_1.3.250.1-r0: task do_patch: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe spirv-tools-1_1.3.250.1-r0: task do_patch: Succeeded
NOTE: Running task 1148 of 1170 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1149 of 1170 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.1.bb:do_generate_toolchain_file)
NOTE: Running task 1150 of 1170 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.1.bb:do_populate_lic)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1151 of 1170 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_configure)
NOTE: recipe spirv-tools-1_1.3.250.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe spirv-tools-1_1.3.250.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe spirv-tools-1_1.3.250.1-r0: task do_populate_lic: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_configure: Started
NOTE: recipe spirv-tools-1_1.3.250.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe spirv-tools-1_1.3.250.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.1.bb:do_populate_lic unihash changed to ff0f35050f49fb3bda11830163ee045bccfe1d840951f96704ee0218bd17871e
NOTE: recipe spirv-tools-1_1.3.250.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_configure: Succeeded
NOTE: Running task 1152 of 1170 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_compile)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_compile: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_compile: Succeeded
NOTE: Running task 1153 of 1170 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_install)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_install: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_install: Succeeded
NOTE: Running task 1154 of 1170 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_package)
NOTE: Running task 1155 of 1170 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_populate_sysroot)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_populate_sysroot: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_package: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1156 of 1170 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe spirv-tools-1_1.3.250.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe spirv-tools-1_1.3.250.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1157 of 1170 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.1.bb:do_configure)
NOTE: recipe spirv-tools-1_1.3.250.1-r0: task do_configure: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_package: Succeeded
NOTE: Running task 1158 of 1170 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_packagedata)
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_packagedata: Started
NOTE: recipe spirv-tools-1_1.3.250.1-r0: task do_configure: Succeeded
NOTE: Running task 1159 of 1170 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-tools_1.3.250.1.bb:do_compile)
NOTE: recipe spirv-tools-1_1.3.250.1-r0: task do_compile: Started
NOTE: recipe spirv-headers-1_1.3.250.0-r0: task do_packagedata: Failed
NOTE: recipe spirv-tools-1_1.3.250.1-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1159 tasks of which 1137 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: spirv-headers-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package spirv-headers-src went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: spirv-headers-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package spirv-headers-dbg went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: spirv-headers-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package spirv-headers-staticdev went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: spirv-headers-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package spirv-headers-dev went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: spirv-headers-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package spirv-headers-doc went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: spirv-headers-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package spirv-headers-locale went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: spirv-headers-1_1.3.250.0-r0 do_packagedata: QA Issue: Package version for package spirv-headers went backwards which would break package feeds (from 1:1.3.250.1-r0 to 1:1.3.250.0-r0) [version-going-backwards]
ERROR: spirv-headers-1_1.3.250.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/spirv-headers/1_1.3.250.0-r0/temp/log.do_packagedata.2753821
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/spir/spirv-headers_1.3.250.0.bb:do_packagedata) failed with exit code '1'

--===============5545169055873701861==--

