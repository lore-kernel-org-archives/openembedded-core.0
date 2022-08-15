Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C70FC49EC0
	for <webhook@archiver.kernel.org>; Mon, 15 Aug 2022 18:57:03 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com
 (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.6267.1660589822202034108
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Aug 2022 11:57:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=POS9QzcX;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30,
 mailfrom: 01010182a2ddcd45-f049dfea-f085-4ca1-a1a6-4ea54eeb3c79-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1660589821;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=NYY2/tNRtAMT1a3OaE3Qo0vmF0V1s5k16MwjVq5qh2U=;
	b=POS9QzcXyVC5vgMeWzw4O3Ar3XaWbWWO1Y6HU4++Rvr/T6wVkrToK5N5eJ0avN9W
	t5hcJyMOCPkVrYxJnLxKBD8sKwxb7xTNtPQEQSwbnzGcxJeTUCQ4cu8EXZJMHXQlvUa
	3IUVRVpME9qt6mUxsBg982MRmPi8BFYnvTFOTmdg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1660589821;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=NYY2/tNRtAMT1a3OaE3Qo0vmF0V1s5k16MwjVq5qh2U=;
	b=K7A8V/LYQAhJlD8jC5ICz3YeHuAC/NN6wzaKKHrelvdlhTjxmxu7jJW0zXLJI9NS
	wdv3h330TZ011PhCELGHAqHNhkYnfMbzPX7FFRjiYQgEUlPADT49hdlYUE8a3FAn7se
	vG11xzXsS1iQ0yFnXg5ygpRt9Uvdxx/aExLGie60=
Content-Type: multipart/mixed; boundary="===============5899733968143485559=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] piglit: upgrading to 6403e90dc7da02d486906cddab8d02c2552a8d46
 SUCCEEDED
Message-ID: 
 <01010182a2ddcd45-f049dfea-f085-4ca1-a1a6-4ea54eeb3c79-000000@us-west-2.amazonses.com>
Date: Mon, 15 Aug 2022 18:57:01 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.08.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Aug 2022 18:57:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169397

--===============5899733968143485559==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *piglit* to *6403e90dc7da02d486906cddab8d02c2552a8d46* has Succeeded.

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
--===============5899733968143485559==
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
DISTRO_VERSION       = "4.1+snapshot-21868ccc763af3bc0ac1c3f7ff4a4104998ff4a9"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:21868ccc763af3bc0ac1c3f7ff4a4104998ff4a9"
workspace            = "master:21cfb871f7da604f1fab957d7747cb03b113b971"

Initialising tasks...done.
Sstate summary: Wanted 166 Local 159 Mirrors 0 Missed 7 Current 373 (95% match, 98% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1588 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_fetch)
NOTE: recipe piglit-1.0+gitrAUTOINC+6403e90dc7-r0: task do_fetch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+6403e90dc7-r0: task do_fetch: Succeeded
NOTE: Running task 1906 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_unpack)
NOTE: Running task 1907 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe piglit-1.0+gitrAUTOINC+6403e90dc7-r0: task do_unpack: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+6403e90dc7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+6403e90dc7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+6403e90dc7-r0: task do_unpack: Succeeded
NOTE: Running task 1908 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_patch)
NOTE: recipe piglit-1.0+gitrAUTOINC+6403e90dc7-r0: task do_patch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+6403e90dc7-r0: task do_patch: Succeeded
NOTE: Running task 1909 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 1910 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_generate_toolchain_file)
NOTE: Running task 1911 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic)
NOTE: recipe piglit-1.0+gitrAUTOINC+6403e90dc7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+6403e90dc7-r0: task do_generate_toolchain_file: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+6403e90dc7-r0: task do_populate_lic: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+6403e90dc7-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+6403e90dc7-r0: task do_populate_lic: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+6403e90dc7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1912 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_configure)
NOTE: recipe piglit-1.0+gitrAUTOINC+6403e90dc7-r0: task do_configure: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+6403e90dc7-r0: task do_configure: Succeeded
NOTE: Running task 1913 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_compile)
NOTE: recipe piglit-1.0+gitrAUTOINC+6403e90dc7-r0: task do_compile: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+6403e90dc7-r0: task do_compile: Succeeded
NOTE: Running task 1914 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_install)
NOTE: recipe piglit-1.0+gitrAUTOINC+6403e90dc7-r0: task do_install: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+6403e90dc7-r0: task do_install: Succeeded
NOTE: Running task 1915 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_package)
NOTE: Running task 1916 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_sysroot)
NOTE: recipe piglit-1.0+gitrAUTOINC+6403e90dc7-r0: task do_package: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+6403e90dc7-r0: task do_populate_sysroot: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+6403e90dc7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+6403e90dc7-r0: task do_package: Succeeded
NOTE: Running task 1917 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_packagedata)
NOTE: recipe piglit-1.0+gitrAUTOINC+6403e90dc7-r0: task do_packagedata: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+6403e90dc7-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 1917 tasks of which 1904 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 9 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: piglit-1.0+gitrAUTOINC+6403e90dc7-r0 do_packagedata: QA Issue: Package version for package piglit-src went backwards which would break package feeds (from 0:1.0+gitr0+b95782f470-r0 to 0:1.0+gitr0+6403e90dc7-r0) [version-going-backwards]
ERROR: piglit-1.0+gitrAUTOINC+6403e90dc7-r0 do_packagedata: QA Issue: Package version for package piglit-dbg went backwards which would break package feeds (from 0:1.0+gitr0+b95782f470-r0 to 0:1.0+gitr0+6403e90dc7-r0) [version-going-backwards]
ERROR: piglit-1.0+gitrAUTOINC+6403e90dc7-r0 do_packagedata: QA Issue: Package version for package piglit-staticdev went backwards which would break package feeds (from 0:1.0+gitr0+b95782f470-r0 to 0:1.0+gitr0+6403e90dc7-r0) [version-going-backwards]
ERROR: piglit-1.0+gitrAUTOINC+6403e90dc7-r0 do_packagedata: QA Issue: Package version for package piglit-dev went backwards which would break package feeds (from 0:1.0+gitr0+b95782f470-r0 to 0:1.0+gitr0+6403e90dc7-r0) [version-going-backwards]
ERROR: piglit-1.0+gitrAUTOINC+6403e90dc7-r0 do_packagedata: QA Issue: Package version for package piglit-doc went backwards which would break package feeds (from 0:1.0+gitr0+b95782f470-r0 to 0:1.0+gitr0+6403e90dc7-r0) [version-going-backwards]
ERROR: piglit-1.0+gitrAUTOINC+6403e90dc7-r0 do_packagedata: QA Issue: Package version for package piglit-locale went backwards which would break package feeds (from 0:1.0+gitr0+b95782f470-r0 to 0:1.0+gitr0+6403e90dc7-r0) [version-going-backwards]
ERROR: piglit-1.0+gitrAUTOINC+6403e90dc7-r0 do_packagedata: QA Issue: Package version for package piglit went backwards which would break package feeds (from 0:1.0+gitr0+b95782f470-r0 to 0:1.0+gitr0+6403e90dc7-r0) [version-going-backwards]
ERROR: piglit-1.0+gitrAUTOINC+6403e90dc7-r0 do_packagedata: QA Issue: Package version for package piglit-bash-completion went backwards which would break package feeds (from 0:1.0+gitr0+b95782f470-r0 to 0:1.0+gitr0+6403e90dc7-r0) [version-going-backwards]
ERROR: piglit-1.0+gitrAUTOINC+6403e90dc7-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/piglit/1.0+gitrAUTOINC+6403e90dc7-r0/temp/log.do_packagedata.1902929
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_packagedata) failed with exit code '1'

--===============5899733968143485559==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/piglit: PKGV changed from 1.0+gitrAUTOINC+b95782f470 [default] to 1.0+gitrAUTOINC+6403e90dc7 [default]
packages/core2-32-poky-linux/piglit: PV changed from "1.0+gitrAUTOINC+b95782f470" to "1.0+gitrAUTOINC+6403e90dc7"
packages/core2-32-poky-linux/piglit/piglit-bash-completion: PKGV changed from 1.0+gitr0+b95782f470 to 1.0+gitr0+6403e90dc7
packages/core2-32-poky-linux/piglit/piglit-bash-completion: PV changed from "1.0+gitrAUTOINC+b95782f470" to "1.0+gitrAUTOINC+6403e90dc7"
packages/core2-32-poky-linux/piglit/piglit-dbg: PKGV changed from 1.0+gitr0+b95782f470 to 1.0+gitr0+6403e90dc7
packages/core2-32-poky-linux/piglit/piglit-dbg: PV changed from "1.0+gitrAUTOINC+b95782f470" to "1.0+gitrAUTOINC+6403e90dc7"
packages/core2-32-poky-linux/piglit/piglit-dev: PKGV changed from 1.0+gitr0+b95782f470 to 1.0+gitr0+6403e90dc7
packages/core2-32-poky-linux/piglit/piglit-dev: RRECOMMENDS: removed "piglit (['= 1.0+gitr0+b95782f470-r0'])", added "piglit (['= 1.0+gitr0+6403e90dc7-r0'])"
packages/core2-32-poky-linux/piglit/piglit-dev: PV changed from "1.0+gitrAUTOINC+b95782f470" to "1.0+gitrAUTOINC+6403e90dc7"
packages/core2-32-poky-linux/piglit/piglit-doc: PKGV changed from 1.0+gitr0+b95782f470 to 1.0+gitr0+6403e90dc7
packages/core2-32-poky-linux/piglit/piglit-doc: PV changed from "1.0+gitrAUTOINC+b95782f470" to "1.0+gitrAUTOINC+6403e90dc7"
packages/core2-32-poky-linux/piglit/piglit-locale: PKGV changed from 1.0+gitr0+b95782f470 to 1.0+gitr0+6403e90dc7
packages/core2-32-poky-linux/piglit/piglit-locale: PV changed from "1.0+gitrAUTOINC+b95782f470" to "1.0+gitrAUTOINC+6403e90dc7"
packages/core2-32-poky-linux/piglit/piglit-src: PKGV changed from 1.0+gitr0+b95782f470 to 1.0+gitr0+6403e90dc7
packages/core2-32-poky-linux/piglit/piglit-src: PV changed from "1.0+gitrAUTOINC+b95782f470" to "1.0+gitrAUTOINC+6403e90dc7"
packages/core2-32-poky-linux/piglit/piglit-staticdev: PKGV changed from 1.0+gitr0+b95782f470 to 1.0+gitr0+6403e90dc7
packages/core2-32-poky-linux/piglit/piglit-staticdev: RDEPENDS: removed "piglit-dev (['= 1.0+gitr0+b95782f470-r0'])", added "piglit-dev (['= 1.0+gitr0+6403e90dc7-r0'])"
packages/core2-32-poky-linux/piglit/piglit-staticdev: PV changed from "1.0+gitrAUTOINC+b95782f470" to "1.0+gitrAUTOINC+6403e90dc7"
packages/core2-32-poky-linux/piglit/piglit: PKGSIZE changed from 2048047151 to 2048052157 (+0%)
packages/core2-32-poky-linux/piglit/piglit: FILELIST: added "/usr/lib/piglit/bin/amd_gpu_shader_half_float-explicit-offset-bufferstorage"
packages/core2-32-poky-linux/piglit/piglit: PKGV changed from 1.0+gitr0+b95782f470 to 1.0+gitr0+6403e90dc7
packages/core2-32-poky-linux/piglit/piglit: PV changed from "1.0+gitrAUTOINC+b95782f470" to "1.0+gitrAUTOINC+6403e90dc7"

--===============5899733968143485559==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-piglit-upgrade-to-latest-revision.patch"

RnJvbSA3YTU3OGM3ZTMyZjEzM2RiMGE2MzMxOTEwZmM0MDZlMDU5OTY4NmE4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgQXVnIDIwMjIgMTU6MDM6MjQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
aWdsaXQ6IHVwZ3JhZGUgdG8gbGF0ZXN0IHJldmlzaW9uCgotLS0KIG1ldGEvcmVjaXBlcy1ncmFw
aGljcy9waWdsaXQvcGlnbGl0X2dpdC5iYiB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGlj
cy9waWdsaXQvcGlnbGl0X2dpdC5iYiBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9waWdsaXQvcGln
bGl0X2dpdC5iYgppbmRleCBiMWU5NDhlYTY5Li43YzFiYzg5YzIyIDEwMDY0NAotLS0gYS9tZXRh
L3JlY2lwZXMtZ3JhcGhpY3MvcGlnbGl0L3BpZ2xpdF9naXQuYmIKKysrIGIvbWV0YS9yZWNpcGVz
LWdyYXBoaWNzL3BpZ2xpdC9waWdsaXRfZ2l0LmJiCkBAIC0xNCw3ICsxNCw3IEBAIFNSQ19VUkkg
PSAiZ2l0Oi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9tZXNhL3BpZ2xpdC5naXQ7cHJvdG9jb2w9
aHR0cHM7YnJhbmNoPW1hCiAgICAgICAgICAgICIKIFVQU1RSRUFNX0NIRUNLX0NPTU1JVFMgPSAi
MSIKIAotU1JDUkVWID0gImI5NTc4MmY0NzBjYTI5MTViMGQ5YjkwNzlmOWNkNmQ4MWJhZTA5MmMi
CitTUkNSRVYgPSAiNjQwM2U5MGRjN2RhMDJkNDg2OTA2Y2RkYWI4ZDAyYzI1NTJhOGQ0NiIKICMg
KHdoZW4gUFYgZ29lcyBhYm92ZSAxLjAgcmVtb3ZlIHRoZSB0cmFpbGluZyByKQogUFYgPSAiMS4w
K2dpdHIke1NSQ1BWfSIKIAotLSAKMi4zMS4xCgo=

--===============5899733968143485559==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/piglit/piglit-bash-completion: PKGV changed from 1.0+gitr0+b95782f470 to 1.0+gitr0+6403e90dc7
packages/core2-32-poky-linux/piglit/piglit-dbg: PKGV changed from 1.0+gitr0+b95782f470 to 1.0+gitr0+6403e90dc7
packages/core2-32-poky-linux/piglit/piglit-dev: PKGV changed from 1.0+gitr0+b95782f470 to 1.0+gitr0+6403e90dc7
packages/core2-32-poky-linux/piglit/piglit-dev: RRECOMMENDS: removed "piglit (['= 1.0+gitr0+b95782f470-r0'])", added "piglit (['= 1.0+gitr0+6403e90dc7-r0'])"
packages/core2-32-poky-linux/piglit/piglit-doc: PKGV changed from 1.0+gitr0+b95782f470 to 1.0+gitr0+6403e90dc7
packages/core2-32-poky-linux/piglit/piglit-locale: PKGV changed from 1.0+gitr0+b95782f470 to 1.0+gitr0+6403e90dc7
packages/core2-32-poky-linux/piglit/piglit-src: PKGV changed from 1.0+gitr0+b95782f470 to 1.0+gitr0+6403e90dc7
packages/core2-32-poky-linux/piglit/piglit-staticdev: PKGV changed from 1.0+gitr0+b95782f470 to 1.0+gitr0+6403e90dc7
packages/core2-32-poky-linux/piglit/piglit-staticdev: RDEPENDS: removed "piglit-dev (['= 1.0+gitr0+b95782f470-r0'])", added "piglit-dev (['= 1.0+gitr0+6403e90dc7-r0'])"
packages/core2-32-poky-linux/piglit/piglit: FILELIST: added "/usr/lib/piglit/bin/amd_gpu_shader_half_float-explicit-offset-bufferstorage"
packages/core2-32-poky-linux/piglit/piglit: PKGV changed from 1.0+gitr0+b95782f470 to 1.0+gitr0+6403e90dc7

--===============5899733968143485559==--

