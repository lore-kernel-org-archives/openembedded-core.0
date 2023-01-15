Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E29FC7113E
	for <webhook@archiver.kernel.org>; Sun, 15 Jan 2023 18:02:31 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.145840.1673805745026277582
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Jan 2023 10:02:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=M0papfme;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 01010185b698c894-7eeb1d87-618d-4098-880f-6cfce63f5332-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1673805744;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=2l5NlSN6RxExY1bjfGJcaU9tnzpPOSsAh3ygzjHzV4w=;
	b=M0papfmeSTCxWIwJjZGfrHsQwKW+kD6unYNe6qAFz58umBZn+5EulSsH0FVB+VDK
	NMoW2Ewo7HCctF64Xb88KSIcwd0GkIN5mEZ/b/m4DOAzdrdAyMTI/Wc3+yL1BSrefaY
	UgNg9aaHsi1E1/uDH4G5M0BelJiKDwupz9GHEB7Y=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1673805744;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=2l5NlSN6RxExY1bjfGJcaU9tnzpPOSsAh3ygzjHzV4w=;
	b=gTsqfAidiX0u5YQ0PX92WwJrBERNm831YAdLs9MmhozIZh8R6lo0NrJMJ8hxB1BC
	xKUTz0yzEg158LCptvFi2v8VKQJ+xyp82aTHI4zHL0ShaDGFoizKqBN9HZHpRPSySAt
	WN61v/msKMas09Z+q+UNp4hJ2oJsLP/KY7sCVTCU=
Content-Type: multipart/mixed; boundary="===============0143140115218122505=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] piglit: upgrading to d8cc3f2da5b429ac199438454ec7feaf7eff1bf3
 SUCCEEDED
Message-ID: <01010185b698c894-7eeb1d87-618d-4098-880f-6cfce63f5332-000000@us-west-2.amazonses.com>
Date: Sun, 15 Jan 2023 18:02:24 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.01.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Jan 2023 18:02:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175923

--===============0143140115218122505==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *piglit* to *d8cc3f2da5b429ac199438454ec7feaf7eff1bf3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-piglit-upgrade-to-latest-revision.patch
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
--===============0143140115218122505==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/piglit: PKGV changed from 1.0+gitrAUTOINC+e300648a80 [default] to 1.0+gitrAUTOINC+d8cc3f2da5 [default]
packages/core2-32-poky-linux/piglit: PV changed from "1.0+gitrAUTOINC+e300648a80" to "1.0+gitrAUTOINC+d8cc3f2da5"
packages/core2-32-poky-linux/piglit/piglit-bash-completion: PV changed from "1.0+gitrAUTOINC+e300648a80" to "1.0+gitrAUTOINC+d8cc3f2da5"
packages/core2-32-poky-linux/piglit/piglit-bash-completion: PKGV changed from 1.0+gitr0+e300648a80 to 1.0+gitr0+d8cc3f2da5
packages/core2-32-poky-linux/piglit/piglit-dbg: PV changed from "1.0+gitrAUTOINC+e300648a80" to "1.0+gitrAUTOINC+d8cc3f2da5"
packages/core2-32-poky-linux/piglit/piglit-dbg: PKGV changed from 1.0+gitr0+e300648a80 to 1.0+gitr0+d8cc3f2da5
packages/core2-32-poky-linux/piglit/piglit-dev: PV changed from "1.0+gitrAUTOINC+e300648a80" to "1.0+gitrAUTOINC+d8cc3f2da5"
packages/core2-32-poky-linux/piglit/piglit-dev: RRECOMMENDS: removed "piglit (['= 1.0+gitr0+e300648a80-r0'])", added "piglit (['= 1.0+gitr0+d8cc3f2da5-r0'])"
packages/core2-32-poky-linux/piglit/piglit-dev: PKGV changed from 1.0+gitr0+e300648a80 to 1.0+gitr0+d8cc3f2da5
packages/core2-32-poky-linux/piglit/piglit-doc: PV changed from "1.0+gitrAUTOINC+e300648a80" to "1.0+gitrAUTOINC+d8cc3f2da5"
packages/core2-32-poky-linux/piglit/piglit-doc: PKGV changed from 1.0+gitr0+e300648a80 to 1.0+gitr0+d8cc3f2da5
packages/core2-32-poky-linux/piglit/piglit-locale: PV changed from "1.0+gitrAUTOINC+e300648a80" to "1.0+gitrAUTOINC+d8cc3f2da5"
packages/core2-32-poky-linux/piglit/piglit-locale: PKGV changed from 1.0+gitr0+e300648a80 to 1.0+gitr0+d8cc3f2da5
packages/core2-32-poky-linux/piglit/piglit-src: PV changed from "1.0+gitrAUTOINC+e300648a80" to "1.0+gitrAUTOINC+d8cc3f2da5"
packages/core2-32-poky-linux/piglit/piglit-src: PKGV changed from 1.0+gitr0+e300648a80 to 1.0+gitr0+d8cc3f2da5
packages/core2-32-poky-linux/piglit/piglit-staticdev: PV changed from "1.0+gitrAUTOINC+e300648a80" to "1.0+gitrAUTOINC+d8cc3f2da5"
packages/core2-32-poky-linux/piglit/piglit-staticdev: PKGV changed from 1.0+gitr0+e300648a80 to 1.0+gitr0+d8cc3f2da5
packages/core2-32-poky-linux/piglit/piglit-staticdev: RDEPENDS: removed "piglit-dev (['= 1.0+gitr0+e300648a80-r0'])", added "piglit-dev (['= 1.0+gitr0+d8cc3f2da5-r0'])"
packages/core2-32-poky-linux/piglit/piglit: PKGSIZE changed from 2048217950 to 2048224163 (+0%)
packages/core2-32-poky-linux/piglit/piglit: FILELIST: added "/usr/lib/piglit/tests/spec/glsl-1.10/execution/vs-loop-complex-no-unroll.shader_test /usr/lib/piglit/tests/spec/glsl-1.10/execution/variable-indexing/vs-output-array-vec2-index-wr-no-unroll.shader_test /usr/lib/piglit/tests/cl/program/execute/non-entry-block-alloca.cl"
packages/core2-32-poky-linux/piglit/piglit: PV changed from "1.0+gitrAUTOINC+e300648a80" to "1.0+gitrAUTOINC+d8cc3f2da5"
packages/core2-32-poky-linux/piglit/piglit: PKGV changed from 1.0+gitr0+e300648a80 to 1.0+gitr0+d8cc3f2da5

--===============0143140115218122505==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/piglit/piglit-bash-completion: PKGV changed from 1.0+gitr0+e300648a80 to 1.0+gitr0+d8cc3f2da5
packages/core2-32-poky-linux/piglit/piglit-dbg: PKGV changed from 1.0+gitr0+e300648a80 to 1.0+gitr0+d8cc3f2da5
packages/core2-32-poky-linux/piglit/piglit-dev: PKGV changed from 1.0+gitr0+e300648a80 to 1.0+gitr0+d8cc3f2da5
packages/core2-32-poky-linux/piglit/piglit-dev: RRECOMMENDS: removed "piglit (['= 1.0+gitr0+e300648a80-r0'])", added "piglit (['= 1.0+gitr0+d8cc3f2da5-r0'])"
packages/core2-32-poky-linux/piglit/piglit-doc: PKGV changed from 1.0+gitr0+e300648a80 to 1.0+gitr0+d8cc3f2da5
packages/core2-32-poky-linux/piglit/piglit-locale: PKGV changed from 1.0+gitr0+e300648a80 to 1.0+gitr0+d8cc3f2da5
packages/core2-32-poky-linux/piglit/piglit-src: PKGV changed from 1.0+gitr0+e300648a80 to 1.0+gitr0+d8cc3f2da5
packages/core2-32-poky-linux/piglit/piglit-staticdev: RDEPENDS: removed "piglit-dev (['= 1.0+gitr0+e300648a80-r0'])", added "piglit-dev (['= 1.0+gitr0+d8cc3f2da5-r0'])"
packages/core2-32-poky-linux/piglit/piglit-staticdev: PKGV changed from 1.0+gitr0+e300648a80 to 1.0+gitr0+d8cc3f2da5
packages/core2-32-poky-linux/piglit/piglit: FILELIST: added "/usr/lib/piglit/tests/spec/glsl-1.10/execution/vs-loop-complex-no-unroll.shader_test /usr/lib/piglit/tests/cl/program/execute/non-entry-block-alloca.cl /usr/lib/piglit/tests/spec/glsl-1.10/execution/variable-indexing/vs-output-array-vec2-index-wr-no-unroll.shader_test"
packages/core2-32-poky-linux/piglit/piglit: PKGV changed from 1.0+gitr0+e300648a80 to 1.0+gitr0+d8cc3f2da5

--===============0143140115218122505==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-piglit-upgrade-to-latest-revision.patch"

RnJvbSA5ZjFjMWRmMmE0MTA3MTYzNGE4OTAzNTAyNmRiM2QwODhhMzRiZjdjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgSmFuIDIwMjMgMTY6MTA6NTggKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
aWdsaXQ6IHVwZ3JhZGUgdG8gbGF0ZXN0IHJldmlzaW9uCgotLS0KIG1ldGEvcmVjaXBlcy1ncmFw
aGljcy9waWdsaXQvcGlnbGl0X2dpdC5iYiB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGlj
cy9waWdsaXQvcGlnbGl0X2dpdC5iYiBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9waWdsaXQvcGln
bGl0X2dpdC5iYgppbmRleCA3ODU4ZmEwYjA4Li42Y2M1YjNlN2Q0IDEwMDY0NAotLS0gYS9tZXRh
L3JlY2lwZXMtZ3JhcGhpY3MvcGlnbGl0L3BpZ2xpdF9naXQuYmIKKysrIGIvbWV0YS9yZWNpcGVz
LWdyYXBoaWNzL3BpZ2xpdC9waWdsaXRfZ2l0LmJiCkBAIC0xMyw3ICsxMyw3IEBAIFNSQ19VUkkg
PSAiZ2l0Oi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9tZXNhL3BpZ2xpdC5naXQ7cHJvdG9jb2w9
aHR0cHM7YnJhbmNoPW1hCiAgICAgICAgICAgICIKIFVQU1RSRUFNX0NIRUNLX0NPTU1JVFMgPSAi
MSIKIAotU1JDUkVWID0gImUzMDA2NDhhODA1ZDYyMTAxZGUzNDEyMzJkOTliZmVjMWNjZTc4YzUi
CitTUkNSRVYgPSAiZDhjYzNmMmRhNWI0MjlhYzE5OTQzODQ1NGVjN2ZlYWY3ZWZmMWJmMyIKICMg
KHdoZW4gUFYgZ29lcyBhYm92ZSAxLjAgcmVtb3ZlIHRoZSB0cmFpbGluZyByKQogUFYgPSAiMS4w
K2dpdHIke1NSQ1BWfSIKIAotLSAKMi4zNy4zCgo=

--===============0143140115218122505==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1696 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (897 cached, 1 parsed). 1696 targets, 41 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:dfabdc99231f6a083c56676fb945568738e788c7"
workspace            = "master:11698e027d71967153b272bf34996bee8f3908e5"

Initialising tasks...done.
Sstate summary: Wanted 187 Local 180 Mirrors 0 Missed 7 Current 365 (96% match, 98% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1632 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_fetch)
NOTE: recipe piglit-1.0+gitrAUTOINC+d8cc3f2da5-r0: task do_fetch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d8cc3f2da5-r0: task do_fetch: Succeeded
NOTE: Running task 1950 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_unpack)
NOTE: Running task 1951 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe piglit-1.0+gitrAUTOINC+d8cc3f2da5-r0: task do_unpack: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d8cc3f2da5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d8cc3f2da5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+d8cc3f2da5-r0: task do_unpack: Succeeded
NOTE: Running task 1952 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_patch)
NOTE: recipe piglit-1.0+gitrAUTOINC+d8cc3f2da5-r0: task do_patch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d8cc3f2da5-r0: task do_patch: Succeeded
NOTE: Running task 1953 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 1954 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_generate_toolchain_file)
NOTE: Running task 1955 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic)
NOTE: recipe piglit-1.0+gitrAUTOINC+d8cc3f2da5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d8cc3f2da5-r0: task do_generate_toolchain_file: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d8cc3f2da5-r0: task do_populate_lic: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d8cc3f2da5-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+d8cc3f2da5-r0: task do_populate_lic: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+d8cc3f2da5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1956 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_configure)
NOTE: recipe piglit-1.0+gitrAUTOINC+d8cc3f2da5-r0: task do_configure: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d8cc3f2da5-r0: task do_configure: Succeeded
NOTE: Running task 1957 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_compile)
NOTE: recipe piglit-1.0+gitrAUTOINC+d8cc3f2da5-r0: task do_compile: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d8cc3f2da5-r0: task do_compile: Succeeded
NOTE: Running task 1958 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_install)
NOTE: recipe piglit-1.0+gitrAUTOINC+d8cc3f2da5-r0: task do_install: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d8cc3f2da5-r0: task do_install: Succeeded
NOTE: Running task 1959 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_package)
NOTE: Running task 1960 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_sysroot)
NOTE: recipe piglit-1.0+gitrAUTOINC+d8cc3f2da5-r0: task do_package: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d8cc3f2da5-r0: task do_populate_sysroot: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d8cc3f2da5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+d8cc3f2da5-r0: task do_package: Succeeded
NOTE: Running task 1961 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_packagedata)
NOTE: recipe piglit-1.0+gitrAUTOINC+d8cc3f2da5-r0: task do_packagedata: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+d8cc3f2da5-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 1961 tasks of which 1948 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: piglit-1.0+gitrAUTOINC+d8cc3f2da5-r0 do_packagedata: QA Issue: Package version for package piglit-src went backwards which would break package feeds (from 0:1.0+gitr0+e300648a80-r0 to 0:1.0+gitr0+d8cc3f2da5-r0) [version-going-backwards]
ERROR: piglit-1.0+gitrAUTOINC+d8cc3f2da5-r0 do_packagedata: QA Issue: Package version for package piglit-dbg went backwards which would break package feeds (from 0:1.0+gitr0+e300648a80-r0 to 0:1.0+gitr0+d8cc3f2da5-r0) [version-going-backwards]
ERROR: piglit-1.0+gitrAUTOINC+d8cc3f2da5-r0 do_packagedata: QA Issue: Package version for package piglit-staticdev went backwards which would break package feeds (from 0:1.0+gitr0+e300648a80-r0 to 0:1.0+gitr0+d8cc3f2da5-r0) [version-going-backwards]
ERROR: piglit-1.0+gitrAUTOINC+d8cc3f2da5-r0 do_packagedata: QA Issue: Package version for package piglit-dev went backwards which would break package feeds (from 0:1.0+gitr0+e300648a80-r0 to 0:1.0+gitr0+d8cc3f2da5-r0) [version-going-backwards]
ERROR: piglit-1.0+gitrAUTOINC+d8cc3f2da5-r0 do_packagedata: QA Issue: Package version for package piglit-doc went backwards which would break package feeds (from 0:1.0+gitr0+e300648a80-r0 to 0:1.0+gitr0+d8cc3f2da5-r0) [version-going-backwards]
ERROR: piglit-1.0+gitrAUTOINC+d8cc3f2da5-r0 do_packagedata: QA Issue: Package version for package piglit-locale went backwards which would break package feeds (from 0:1.0+gitr0+e300648a80-r0 to 0:1.0+gitr0+d8cc3f2da5-r0) [version-going-backwards]
ERROR: piglit-1.0+gitrAUTOINC+d8cc3f2da5-r0 do_packagedata: QA Issue: Package version for package piglit went backwards which would break package feeds (from 0:1.0+gitr0+e300648a80-r0 to 0:1.0+gitr0+d8cc3f2da5-r0) [version-going-backwards]
ERROR: piglit-1.0+gitrAUTOINC+d8cc3f2da5-r0 do_packagedata: QA Issue: Package version for package piglit-bash-completion went backwards which would break package feeds (from 0:1.0+gitr0+e300648a80-r0 to 0:1.0+gitr0+d8cc3f2da5-r0) [version-going-backwards]
ERROR: piglit-1.0+gitrAUTOINC+d8cc3f2da5-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/piglit/1.0+gitrAUTOINC+d8cc3f2da5-r0/temp/log.do_packagedata.2512528
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_packagedata) failed with exit code '1'

--===============0143140115218122505==--

