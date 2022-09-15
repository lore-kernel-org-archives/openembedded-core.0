Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 692AFC6FD26
	for <webhook@archiver.kernel.org>; Thu, 15 Sep 2022 14:18:43 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com
 (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web08.10728.1663251513106095709
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Sep 2022 07:18:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=HUjytLO9;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31,
 mailfrom: 01010183418400ab-763f75a7-aa9a-43f0-b14e-ed0819d53091-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1663251513;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=E9PBr5CJW/dsv0GRiNw5PU3ahl7vCHZ4Vo70NNy6uig=;
	b=HUjytLO9OHqPJGZWsg2DZk/ZKAqJ5H8VtMvvSPLIF6JOY4BJM0KRp1gHe8yTH+7/
	t13EOd9k+TdxZ0to8KXosk779g7/MW3YjgEsO1dOGqGY6pcDdaJoGl4fzodtA4H//I7
	TV+kuGOvE4cpeytwN111vWQNQV9fpTuUYMNxdHoo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1663251513;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=E9PBr5CJW/dsv0GRiNw5PU3ahl7vCHZ4Vo70NNy6uig=;
	b=HWYDFQLgeRaXeHGIeG1VpYAewwA9bYyASCTzFUPTwX3UJkR2Fe5SV5lzXZZdl9ZA
	HSXuE8DPStEceq2ffgYN+Jf3ckaX6x/13VG62HqjQpMMx4ZCVR/AFjDwCgCjQ7zzx+u
	0epQgK69fk/NDQj1WN72IN0VHI/o1MbT9jE6eNp0=
Content-Type: multipart/mixed; boundary="===============2448908612480226555=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] piglit: upgrading to 5a3658a589196b41f09f0037ac14d8910462a06c
 SUCCEEDED
Message-ID: 
 <01010183418400ab-763f75a7-aa9a-43f0-b14e-ed0819d53091-000000@us-west-2.amazonses.com>
Date: Thu, 15 Sep 2022 14:18:33 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.09.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Sep 2022 14:18:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170737

--===============2448908612480226555==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *piglit* to *5a3658a589196b41f09f0037ac14d8910462a06c* has Succeeded.

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
--===============2448908612480226555==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-piglit-upgrade-to-latest-revision.patch"

RnJvbSAyNmUyNDkxYjQyZTkzZGFlYTgyNDczYmZjMmY0ZTlhMWE4NDM4N2NiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgU2VwIDIwMjIgMTI6MDY6MjEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
aWdsaXQ6IHVwZ3JhZGUgdG8gbGF0ZXN0IHJldmlzaW9uCgotLS0KIG1ldGEvcmVjaXBlcy1ncmFw
aGljcy9waWdsaXQvcGlnbGl0X2dpdC5iYiB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGlj
cy9waWdsaXQvcGlnbGl0X2dpdC5iYiBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9waWdsaXQvcGln
bGl0X2dpdC5iYgppbmRleCBmNzU4MjA4YzZiLi5iYTcxMTFmMzZlIDEwMDY0NAotLS0gYS9tZXRh
L3JlY2lwZXMtZ3JhcGhpY3MvcGlnbGl0L3BpZ2xpdF9naXQuYmIKKysrIGIvbWV0YS9yZWNpcGVz
LWdyYXBoaWNzL3BpZ2xpdC9waWdsaXRfZ2l0LmJiCkBAIC0xNCw3ICsxNCw3IEBAIFNSQ19VUkkg
PSAiZ2l0Oi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9tZXNhL3BpZ2xpdC5naXQ7cHJvdG9jb2w9
aHR0cHM7YnJhbmNoPW1hCiAgICAgICAgICAgICIKIFVQU1RSRUFNX0NIRUNLX0NPTU1JVFMgPSAi
MSIKIAotU1JDUkVWID0gIjI2NTg5NmM4NmY5MGNiNzJlOGYyMThiYTZhMzYxN2ZjYThiOWExZTMi
CitTUkNSRVYgPSAiNWEzNjU4YTU4OTE5NmI0MWYwOWYwMDM3YWMxNGQ4OTEwNDYyYTA2YyIKICMg
KHdoZW4gUFYgZ29lcyBhYm92ZSAxLjAgcmVtb3ZlIHRoZSB0cmFpbGluZyByKQogUFYgPSAiMS4w
K2dpdHIke1NSQ1BWfSIKIAotLSAKMi4zMS4xCgo=

--===============2448908612480226555==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/piglit/piglit-bash-completion: PKGV changed from 1.0+gitr0+265896c86f to 1.0+gitr0+5a3658a589
packages/core2-32-poky-linux/piglit/piglit-dbg: PKGV changed from 1.0+gitr0+265896c86f to 1.0+gitr0+5a3658a589
packages/core2-32-poky-linux/piglit/piglit-dev: RRECOMMENDS: removed "piglit (['= 1.0+gitr0+265896c86f-r0'])", added "piglit (['= 1.0+gitr0+5a3658a589-r0'])"
packages/core2-32-poky-linux/piglit/piglit-dev: PKGV changed from 1.0+gitr0+265896c86f to 1.0+gitr0+5a3658a589
packages/core2-32-poky-linux/piglit/piglit-doc: PKGV changed from 1.0+gitr0+265896c86f to 1.0+gitr0+5a3658a589
packages/core2-32-poky-linux/piglit/piglit-locale: PKGV changed from 1.0+gitr0+265896c86f to 1.0+gitr0+5a3658a589
packages/core2-32-poky-linux/piglit/piglit-src: PKGV changed from 1.0+gitr0+265896c86f to 1.0+gitr0+5a3658a589
packages/core2-32-poky-linux/piglit/piglit-staticdev: PKGV changed from 1.0+gitr0+265896c86f to 1.0+gitr0+5a3658a589
packages/core2-32-poky-linux/piglit/piglit-staticdev: RDEPENDS: removed "piglit-dev (['= 1.0+gitr0+265896c86f-r0'])", added "piglit-dev (['= 1.0+gitr0+5a3658a589-r0'])"
packages/core2-32-poky-linux/piglit/piglit: FILELIST: added "/usr/lib/piglit/bin/arb_separate_shader_object-xfb-explicit-location-array"
packages/core2-32-poky-linux/piglit/piglit: PKGV changed from 1.0+gitr0+265896c86f to 1.0+gitr0+5a3658a589

--===============2448908612480226555==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/piglit: PKGV changed from 1.0+gitrAUTOINC+265896c86f [default] to 1.0+gitrAUTOINC+5a3658a589 [default]
packages/core2-32-poky-linux/piglit: PV changed from "1.0+gitrAUTOINC+265896c86f" to "1.0+gitrAUTOINC+5a3658a589"
packages/core2-32-poky-linux/piglit/piglit-bash-completion: PKGV changed from 1.0+gitr0+265896c86f to 1.0+gitr0+5a3658a589
packages/core2-32-poky-linux/piglit/piglit-bash-completion: PV changed from "1.0+gitrAUTOINC+265896c86f" to "1.0+gitrAUTOINC+5a3658a589"
packages/core2-32-poky-linux/piglit/piglit-dbg: PKGV changed from 1.0+gitr0+265896c86f to 1.0+gitr0+5a3658a589
packages/core2-32-poky-linux/piglit/piglit-dbg: PV changed from "1.0+gitrAUTOINC+265896c86f" to "1.0+gitrAUTOINC+5a3658a589"
packages/core2-32-poky-linux/piglit/piglit-dev: PKGV changed from 1.0+gitr0+265896c86f to 1.0+gitr0+5a3658a589
packages/core2-32-poky-linux/piglit/piglit-dev: RRECOMMENDS: removed "piglit (['= 1.0+gitr0+265896c86f-r0'])", added "piglit (['= 1.0+gitr0+5a3658a589-r0'])"
packages/core2-32-poky-linux/piglit/piglit-dev: PV changed from "1.0+gitrAUTOINC+265896c86f" to "1.0+gitrAUTOINC+5a3658a589"
packages/core2-32-poky-linux/piglit/piglit-doc: PKGV changed from 1.0+gitr0+265896c86f to 1.0+gitr0+5a3658a589
packages/core2-32-poky-linux/piglit/piglit-doc: PV changed from "1.0+gitrAUTOINC+265896c86f" to "1.0+gitrAUTOINC+5a3658a589"
packages/core2-32-poky-linux/piglit/piglit-locale: PKGV changed from 1.0+gitr0+265896c86f to 1.0+gitr0+5a3658a589
packages/core2-32-poky-linux/piglit/piglit-locale: PV changed from "1.0+gitrAUTOINC+265896c86f" to "1.0+gitrAUTOINC+5a3658a589"
packages/core2-32-poky-linux/piglit/piglit-src: PKGV changed from 1.0+gitr0+265896c86f to 1.0+gitr0+5a3658a589
packages/core2-32-poky-linux/piglit/piglit-src: PV changed from "1.0+gitrAUTOINC+265896c86f" to "1.0+gitrAUTOINC+5a3658a589"
packages/core2-32-poky-linux/piglit/piglit-staticdev: RDEPENDS: removed "piglit-dev (['= 1.0+gitr0+265896c86f-r0'])", added "piglit-dev (['= 1.0+gitr0+5a3658a589-r0'])"
packages/core2-32-poky-linux/piglit/piglit-staticdev: PKGV changed from 1.0+gitr0+265896c86f to 1.0+gitr0+5a3658a589
packages/core2-32-poky-linux/piglit/piglit-staticdev: PV changed from "1.0+gitrAUTOINC+265896c86f" to "1.0+gitrAUTOINC+5a3658a589"
packages/core2-32-poky-linux/piglit/piglit: PKGSIZE changed from 2048106290 to 2048120027 (+0%)
packages/core2-32-poky-linux/piglit/piglit: FILELIST: added "/usr/lib/piglit/bin/arb_separate_shader_object-xfb-explicit-location-array"
packages/core2-32-poky-linux/piglit/piglit: PKGV changed from 1.0+gitr0+265896c86f to 1.0+gitr0+5a3658a589
packages/core2-32-poky-linux/piglit/piglit: PV changed from "1.0+gitrAUTOINC+265896c86f" to "1.0+gitrAUTOINC+5a3658a589"

--===============2448908612480226555==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1661 entries from dependency cache.
Parsing recipes...done.
Parsing of 885 .bb files complete (884 cached, 1 parsed). 1661 targets, 36 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "4.1+snapshot-dc02a3cb55e9d5dd0f3c47dbc8506b5e88229047"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:dc02a3cb55e9d5dd0f3c47dbc8506b5e88229047"
workspace            = "master:6a27236fed8e7c27974c2313366bdbfd8edfa927"

Initialising tasks...done.
Sstate summary: Wanted 174 Local 167 Mirrors 0 Missed 7 Current 365 (95% match, 98% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1588 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_fetch)
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_fetch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_fetch: Succeeded
NOTE: Running task 1906 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_unpack)
NOTE: Running task 1907 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_unpack: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_unpack: Succeeded
NOTE: Running task 1908 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_patch)
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_patch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_patch: Succeeded
NOTE: Running task 1909 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 1910 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_generate_toolchain_file)
NOTE: Running task 1911 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic)
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_generate_toolchain_file: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_populate_lic: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_populate_lic: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1912 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_configure)
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_configure: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_configure: Succeeded
NOTE: Running task 1913 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_compile)
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_compile: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_compile: Succeeded
NOTE: Running task 1914 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_install)
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_install: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_install: Succeeded
NOTE: Running task 1915 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_package)
NOTE: Running task 1916 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_sysroot)
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_package: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_populate_sysroot: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_populate_sysroot: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_package: Succeeded
NOTE: Running task 1917 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_packagedata)
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_packagedata: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 1917 tasks of which 1904 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 9 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: piglit-1.0+gitrAUTOINC+5a3658a589-r0 do_packagedata: QA Issue: Package version for package piglit-src went backwards which would break package feeds (from 0:1.0+gitr0+265896c86f-r0 to 0:1.0+gitr0+5a3658a589-r0) [version-going-backwards]
ERROR: piglit-1.0+gitrAUTOINC+5a3658a589-r0 do_packagedata: QA Issue: Package version for package piglit-dbg went backwards which would break package feeds (from 0:1.0+gitr0+265896c86f-r0 to 0:1.0+gitr0+5a3658a589-r0) [version-going-backwards]
ERROR: piglit-1.0+gitrAUTOINC+5a3658a589-r0 do_packagedata: QA Issue: Package version for package piglit-staticdev went backwards which would break package feeds (from 0:1.0+gitr0+265896c86f-r0 to 0:1.0+gitr0+5a3658a589-r0) [version-going-backwards]
ERROR: piglit-1.0+gitrAUTOINC+5a3658a589-r0 do_packagedata: QA Issue: Package version for package piglit-dev went backwards which would break package feeds (from 0:1.0+gitr0+265896c86f-r0 to 0:1.0+gitr0+5a3658a589-r0) [version-going-backwards]
ERROR: piglit-1.0+gitrAUTOINC+5a3658a589-r0 do_packagedata: QA Issue: Package version for package piglit-doc went backwards which would break package feeds (from 0:1.0+gitr0+265896c86f-r0 to 0:1.0+gitr0+5a3658a589-r0) [version-going-backwards]
ERROR: piglit-1.0+gitrAUTOINC+5a3658a589-r0 do_packagedata: QA Issue: Package version for package piglit-locale went backwards which would break package feeds (from 0:1.0+gitr0+265896c86f-r0 to 0:1.0+gitr0+5a3658a589-r0) [version-going-backwards]
ERROR: piglit-1.0+gitrAUTOINC+5a3658a589-r0 do_packagedata: QA Issue: Package version for package piglit went backwards which would break package feeds (from 0:1.0+gitr0+265896c86f-r0 to 0:1.0+gitr0+5a3658a589-r0) [version-going-backwards]
ERROR: piglit-1.0+gitrAUTOINC+5a3658a589-r0 do_packagedata: QA Issue: Package version for package piglit-bash-completion went backwards which would break package feeds (from 0:1.0+gitr0+265896c86f-r0 to 0:1.0+gitr0+5a3658a589-r0) [version-going-backwards]
ERROR: piglit-1.0+gitrAUTOINC+5a3658a589-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/piglit/1.0+gitrAUTOINC+5a3658a589-r0/temp/log.do_packagedata.1308561
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_packagedata) failed with exit code '1'

--===============2448908612480226555==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1661 entries from dependency cache.
Parsing recipes...done.
Parsing of 885 .bb files complete (884 cached, 1 parsed). 1661 targets, 35 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-dc02a3cb55e9d5dd0f3c47dbc8506b5e88229047"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:dc02a3cb55e9d5dd0f3c47dbc8506b5e88229047"
workspace            = "master:6a27236fed8e7c27974c2313366bdbfd8edfa927"

Initialising tasks...done.
Sstate summary: Wanted 60 Local 25 Mirrors 0 Missed 35 Current 479 (41% match, 93% complete)
Removing 3 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 495 of 539 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: Running setscene task 517 of 539 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.1.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 519 of 539 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.1.6.bb:do_populate_sysroot_setscene)
NOTE: recipe tzdata-2022b-r0: task do_packagedata_setscene: Started
NOTE: Running task 1444 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_fetch)
NOTE: recipe mesa-2_22.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_22.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1501 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_fetch)
NOTE: Running task 1523 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libglu-2_9.0.2-r0: task do_fetch: Started
NOTE: recipe tzdata-2022b-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_fetch: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_fetch: Started
NOTE: recipe waffle-1.7.0-r0: task do_fetch: Succeeded
NOTE: recipe mesa-2_22.1.6-r0: task do_populate_sysroot_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/mesa/2_22.1.6-r0/temp/log.do_packagedata_setscene.1309069
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.1.6.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 538 of 539 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.1.6.bb:do_package_setscene)
NOTE: Running task 1525 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_unpack)
NOTE: Running task 1563 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_unpack)
NOTE: Running task 1572 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_fetch)
NOTE: Running task 1574 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_fetch)
NOTE: Running task 1636 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_write_config)
NOTE: Running task 1638 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.2.bb:do_fetch)
NOTE: Running task 1640 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_fetch)
NOTE: Running task 1721 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.13.0.bb:do_fetch)
NOTE: Running task 1731 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_write_config)
NOTE: recipe libglu-2_9.0.2-r0: task do_unpack: Started
NOTE: Running task 1820 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_package_write_rpm)
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_fetch: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_fetch: Started
NOTE: recipe waffle-1.7.0-r0: task do_unpack: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-mako-1.2.2-r0: task do_fetch: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_fetch: Started
NOTE: recipe waffle-1.7.0-r0: task do_write_config: Started
NOTE: Running task 1821 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_unpack)
NOTE: recipe libglu-2_9.0.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-mako-1.2.2-r0: task do_fetch: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-pygments-2.13.0-r0: task do_fetch: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_write_config: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_fetch: Succeeded
NOTE: recipe python3-pygments-2.13.0-r0: task do_fetch: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_write_config: Succeeded
NOTE: Running task 1822 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_patch)
NOTE: recipe mesa-demos-8.5.0-r0: task do_write_config: Succeeded
NOTE: Running task 1823 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_unpack)
NOTE: Running task 1824 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe waffle-1.7.0-r0: task do_unpack: Succeeded
NOTE: Running task 1825 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_patch)
NOTE: Running task 1826 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.2.bb:do_unpack)
NOTE: Running task 1827 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_unpack)
NOTE: Running task 1828 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1829 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.13.0.bb:do_unpack)
NOTE: Running task 1830 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.13.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libglu-2_9.0.2-r0: task do_patch: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_unpack: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe python3-mako-1.2.2-r0: task do_unpack: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe waffle-1.7.0-r0: task do_patch: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_unpack: Started
NOTE: recipe python3-mako-1.2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-six-1.16.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pygments-2.13.0-r0: task do_unpack: Started
NOTE: recipe mesa-2_22.1.6-r0: task do_package_setscene: Started
NOTE: recipe python3-pygments-2.13.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-mako-1.2.2-r0: task do_unpack: Succeeded
NOTE: Running task 1833 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_patch)
NOTE: Running task 1834 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.2.bb:do_patch)
NOTE: recipe libglu-2_9.0.2-r0: task do_patch: Succeeded
NOTE: Running task 1835 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_patch: Started
NOTE: recipe python3-mako-1.2.2-r0: task do_patch: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe waffle-1.7.0-r0: task do_patch: Succeeded
NOTE: Running task 1836 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pygments-2.13.0-r0: task do_unpack: Succeeded
NOTE: Running task 1837 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.13.0.bb:do_patch)
NOTE: recipe waffle-1.7.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: recipe python3-pygments-2.13.0-r0: task do_patch: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1838 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 1839 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pygments-2.13.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_patch: Succeeded
NOTE: recipe python3-mako-1.2.2-r0: task do_patch: Succeeded
NOTE: recipe python3-pygments-2.13.0-r0: task do_patch: Succeeded
NOTE: Running task 1840 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1841 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1842 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.13.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-mako-1.2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-mako-1.2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pygments-2.13.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-six-1.16.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 6a2f7344df4addf08e390387895171c67af112e36164285797bde01b6406dbb6
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pygments-2.13.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-mako-1.2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1848 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_configure)
NOTE: Running task 1849 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.13.0.bb:do_configure)
NOTE: Running task 1850 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.2.bb:do_configure)
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_configure: Started
NOTE: recipe python3-pygments-2.13.0-r0: task do_configure: Started
NOTE: recipe python3-mako-1.2.2-r0: task do_configure: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_configure: Succeeded
NOTE: recipe python3-pygments-2.13.0-r0: task do_configure: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_unpack: Succeeded
NOTE: recipe python3-mako-1.2.2-r0: task do_configure: Succeeded
NOTE: Running task 1851 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_configure_ptest_base)
NOTE: Running task 1852 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.13.0.bb:do_compile)
NOTE: Running task 1853 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_patch)
NOTE: Running task 1854 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.2.bb:do_compile)
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-pygments-2.13.0-r0: task do_compile: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_patch: Started
NOTE: recipe python3-mako-1.2.2-r0: task do_compile: Started
NOTE: recipe mesa-2_22.1.6-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1866 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.1.6.bb:do_packagedata)
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 1867 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1868 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1869 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: Running task 1870 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_compile)
NOTE: recipe libglu-2_9.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-2_22.1.6-r0: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe waffle-1.7.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_compile: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_unpack: Succeeded
NOTE: Running task 1871 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_patch)
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_patch: Succeeded
NOTE: Running task 1872 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 1873 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_generate_toolchain_file)
NOTE: Running task 1874 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_patch: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to c3c2a2502f0c01863129693fb8df3aff62917c09cdbe1a9ac099d9842d61e258
NOTE: Running task 1877 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_package_write_rpm)
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_generate_toolchain_file: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_populate_lic: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe mesa-2_22.1.6-r0: task do_packagedata: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_populate_lic: Succeeded
NOTE: recipe bash-5.1.16-r0: task do_package_write_rpm: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic unihash changed to 312d83fab7b59cdf0c26c072309dcb460708214513dc92edccefce78d7bc9919
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_patch: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1878 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_configure)
NOTE: Running task 1879 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libglu-2_9.0.2-r0: task do_configure: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1880 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_configure)
NOTE: recipe waffle-1.7.0-r0: task do_configure: Started
NOTE: recipe python3-pygments-2.13.0-r0: task do_compile: Succeeded
NOTE: Running task 1881 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.13.0.bb:do_install)
NOTE: recipe python3-pygments-2.13.0-r0: task do_install: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_compile: Succeeded
NOTE: Running task 1882 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_compile_ptest_base)
NOTE: recipe python3-mako-1.2.2-r0: task do_compile: Succeeded
NOTE: Running task 1883 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.2.bb:do_install)
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1884 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_install)
NOTE: recipe python3-mako-1.2.2-r0: task do_install: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_install: Started
NOTE: recipe python3-mako-1.2.2-r0: task do_install: Succeeded
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_install: Succeeded
NOTE: Running task 1885 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.2.bb:do_package)
NOTE: Running task 1886 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_install_ptest_base)
NOTE: recipe python3-mako-1.2.2-r0: task do_package: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_install_ptest_base: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1887 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_package)
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_package: Started
NOTE: recipe python3-pygments-2.13.0-r0: task do_install: Succeeded
NOTE: Running task 1888 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.13.0.bb:do_package)
NOTE: recipe python3-pygments-2.13.0-r0: task do_package: Started
NOTE: recipe waffle-1.7.0-r0: task do_configure: Succeeded
NOTE: Running task 1889 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_compile)
NOTE: recipe waffle-1.7.0-r0: task do_compile: Started
NOTE: recipe bash-5.1.16-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-mako-1.2.2-r0: task do_package: Succeeded
NOTE: Running task 1890 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.2.bb:do_packagedata)
NOTE: recipe python3-mako-1.2.2-r0: task do_packagedata: Started
NOTE: recipe waffle-1.7.0-r0: task do_compile: Succeeded
NOTE: Running task 1891 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_install)
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_package: Succeeded
NOTE: recipe python3-mako-1.2.2-r0: task do_packagedata: Succeeded
NOTE: Running task 1892 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_packagedata)
NOTE: recipe waffle-1.7.0-r0: task do_install: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_packagedata: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_packagedata: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_install: Succeeded
NOTE: Running task 1893 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_package)
NOTE: Running task 1894 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_populate_sysroot)
NOTE: recipe waffle-1.7.0-r0: task do_package: Started
NOTE: recipe waffle-1.7.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pygments-2.13.0-r0: task do_package: Succeeded
NOTE: Running task 1895 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.13.0.bb:do_packagedata)
NOTE: recipe python3-pygments-2.13.0-r0: task do_packagedata: Started
NOTE: recipe waffle-1.7.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-pygments-2.13.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1896 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.2.bb:do_package_write_rpm)
NOTE: recipe python3-mako-1.2.2-r0: task do_package_write_rpm: Started
NOTE: recipe python3-mako-1.2.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_package: Succeeded
NOTE: Running task 1897 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_packagedata)
NOTE: recipe waffle-1.7.0-r0: task do_packagedata: Started
NOTE: recipe waffle-1.7.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1898 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_package_write_rpm)
NOTE: recipe waffle-1.7.0-r0: task do_package_write_rpm: Started
NOTE: recipe waffle-1.7.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_configure: Succeeded
NOTE: Running task 1899 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_compile)
NOTE: recipe libglu-2_9.0.2-r0: task do_compile: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_compile: Succeeded
NOTE: Running task 1900 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_install)
NOTE: recipe libglu-2_9.0.2-r0: task do_install: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_install: Succeeded
NOTE: Running task 1901 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_package)
NOTE: Running task 1902 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_populate_sysroot)
NOTE: recipe libglu-2_9.0.2-r0: task do_populate_sysroot: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_package: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1903 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1904 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1905 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_configure)
NOTE: recipe mesa-demos-8.5.0-r0: task do_configure: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1906 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_configure)
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_configure: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_package: Succeeded
NOTE: Running task 1907 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_packagedata)
NOTE: recipe libglu-2_9.0.2-r0: task do_packagedata: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_packagedata: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_configure: Succeeded
NOTE: Running task 1908 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_compile)
NOTE: recipe mesa-demos-8.5.0-r0: task do_compile: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_compile: Succeeded
NOTE: Running task 1909 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_install)
NOTE: recipe mesa-demos-8.5.0-r0: task do_install: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_install: Succeeded
NOTE: Running task 1910 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_package)
NOTE: recipe mesa-demos-8.5.0-r0: task do_package: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_package: Succeeded
NOTE: Running task 1911 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_packagedata)
NOTE: recipe mesa-demos-8.5.0-r0: task do_packagedata: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1912 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_package_write_rpm)
NOTE: recipe mesa-demos-8.5.0-r0: task do_package_write_rpm: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_configure: Succeeded
NOTE: Running task 1913 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_compile)
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_compile: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_compile: Succeeded
NOTE: Running task 1914 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_install)
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_install: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_install: Succeeded
NOTE: Running task 1915 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_package)
NOTE: Running task 1916 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_sysroot)
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_package: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_populate_sysroot: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_populate_sysroot: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_package: Succeeded
NOTE: Running task 1917 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_packagedata)
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_packagedata: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_packagedata: Succeeded
NOTE: Running task 1918 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_package_write_rpm)
NOTE: Running task 1919 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_package_qa)
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_package_write_rpm: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_package_qa: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_package_qa: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1920 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_build)
NOTE: Tasks Summary: Attempted 1920 tasks of which 1827 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 31 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: mesa-2_22.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-src went backwards which would break package feeds (from 2:22.1.7-r0 to 2:22.1.6-r0) [version-going-backwards]
ERROR: mesa-2_22.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-dbg went backwards which would break package feeds (from 2:22.1.7-r0 to 2:22.1.6-r0) [version-going-backwards]
ERROR: mesa-2_22.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package libegl-mesa went backwards which would break package feeds (from 2:22.1.7-r0 to 2:22.1.6-r0) [version-going-backwards]
ERROR: mesa-2_22.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package libegl-mesa-dev went backwards which would break package feeds (from 2:22.1.7-r0 to 2:22.1.6-r0) [version-going-backwards]
ERROR: mesa-2_22.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package libosmesa went backwards which would break package feeds (from 2:22.1.7-r0 to 2:22.1.6-r0) [version-going-backwards]
ERROR: mesa-2_22.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package libosmesa-dev went backwards which would break package feeds (from 2:22.1.7-r0 to 2:22.1.6-r0) [version-going-backwards]
ERROR: mesa-2_22.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package libgl-mesa went backwards which would break package feeds (from 2:22.1.7-r0 to 2:22.1.6-r0) [version-going-backwards]
ERROR: mesa-2_22.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package libgl-mesa-dev went backwards which would break package feeds (from 2:22.1.7-r0 to 2:22.1.6-r0) [version-going-backwards]
ERROR: mesa-2_22.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package libglapi went backwards which would break package feeds (from 2:22.1.7-r0 to 2:22.1.6-r0) [version-going-backwards]
ERROR: mesa-2_22.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package libglapi-dev went backwards which would break package feeds (from 2:22.1.7-r0 to 2:22.1.6-r0) [version-going-backwards]
ERROR: mesa-2_22.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package libgbm went backwards which would break package feeds (from 2:22.1.7-r0 to 2:22.1.6-r0) [version-going-backwards]
ERROR: mesa-2_22.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package libgbm-dev went backwards which would break package feeds (from 2:22.1.7-r0 to 2:22.1.6-r0) [version-going-backwards]
ERROR: mesa-2_22.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package libgles1-mesa went backwards which would break package feeds (from 2:22.1.7-r0 to 2:22.1.6-r0) [version-going-backwards]
ERROR: mesa-2_22.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package libgles1-mesa-dev went backwards which would break package feeds (from 2:22.1.7-r0 to 2:22.1.6-r0) [version-going-backwards]
ERROR: mesa-2_22.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package libgles2-mesa went backwards which would break package feeds (from 2:22.1.7-r0 to 2:22.1.6-r0) [version-going-backwards]
ERROR: mesa-2_22.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package libgles2-mesa-dev went backwards which would break package feeds (from 2:22.1.7-r0 to 2:22.1.6-r0) [version-going-backwards]
ERROR: mesa-2_22.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package libgles3-mesa went backwards which would break package feeds (from 2:22.1.7-r0 to 2:22.1.6-r0) [version-going-backwards]
ERROR: mesa-2_22.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package libgles3-mesa-dev went backwards which would break package feeds (from 2:22.1.7-r0 to 2:22.1.6-r0) [version-going-backwards]
ERROR: mesa-2_22.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package libopencl-mesa went backwards which would break package feeds (from 2:22.1.7-r0 to 2:22.1.6-r0) [version-going-backwards]
ERROR: mesa-2_22.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package libopencl-mesa-dev went backwards which would break package feeds (from 2:22.1.7-r0 to 2:22.1.6-r0) [version-going-backwards]
ERROR: mesa-2_22.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package libxatracker went backwards which would break package feeds (from 2:22.1.7-r0 to 2:22.1.6-r0) [version-going-backwards]
ERROR: mesa-2_22.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package libxatracker-dev went backwards which would break package feeds (from 2:22.1.7-r0 to 2:22.1.6-r0) [version-going-backwards]
ERROR: mesa-2_22.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-megadriver went backwards which would break package feeds (from 2:22.1.7-r0 to 2:22.1.6-r0) [version-going-backwards]
ERROR: mesa-2_22.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-vulkan-drivers went backwards which would break package feeds (from 2:22.1.7-r0 to 2:22.1.6-r0) [version-going-backwards]
ERROR: mesa-2_22.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-vdpau-drivers went backwards which would break package feeds (from 2:22.1.7-r0 to 2:22.1.6-r0) [version-going-backwards]
ERROR: mesa-2_22.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-staticdev went backwards which would break package feeds (from 2:22.1.7-r0 to 2:22.1.6-r0) [version-going-backwards]
ERROR: mesa-2_22.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-dev went backwards which would break package feeds (from 2:22.1.7-r0 to 2:22.1.6-r0) [version-going-backwards]
ERROR: mesa-2_22.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-doc went backwards which would break package feeds (from 2:22.1.7-r0 to 2:22.1.6-r0) [version-going-backwards]
ERROR: mesa-2_22.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-locale went backwards which would break package feeds (from 2:22.1.7-r0 to 2:22.1.6-r0) [version-going-backwards]
ERROR: mesa-2_22.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package mesa went backwards which would break package feeds (from 2:22.1.7-r0 to 2:22.1.6-r0) [version-going-backwards]
ERROR: mesa-2_22.1.6-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============2448908612480226555==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 885 .bb files complete (0 cached, 885 parsed). 1661 targets, 53 skipped, 0 masked, 0 errors.
Removing 1 recipes from the cortexa15t2hf-neon sysroot...done.
Removing 1 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-dc02a3cb55e9d5dd0f3c47dbc8506b5e88229047"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:dc02a3cb55e9d5dd0f3c47dbc8506b5e88229047"
workspace            = "master:6a27236fed8e7c27974c2313366bdbfd8edfa927"

Initialising tasks...done.
Sstate summary: Wanted 59 Local 24 Mirrors 0 Missed 35 Current 480 (40% match, 93% complete)
Removing 3 stale sstate objects for arch qemuarm...done.
NOTE: Executing Tasks
NOTE: Running setscene task 495 of 539 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: Running setscene task 517 of 539 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.1.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 519 of 539 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.1.6.bb:do_populate_sysroot_setscene)
NOTE: Running task 1444 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_fetch)
NOTE: Running task 1501 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_fetch)
NOTE: Running task 1522 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe tzdata-2022b-r0: task do_packagedata_setscene: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_fetch: Started
NOTE: recipe mesa-2_22.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_22.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_fetch: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_fetch: Started
NOTE: Running task 1524 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_unpack)
NOTE: recipe waffle-1.7.0-r0: task do_fetch: Succeeded
NOTE: recipe tzdata-2022b-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mesa-2_22.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1563 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_unpack)
NOTE: Running task 1572 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_fetch)
NOTE: Running task 1574 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_fetch)
NOTE: Running task 1636 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_write_config)
NOTE: Running task 1638 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.2.bb:do_fetch)
NOTE: Running task 1639 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_fetch)
NOTE: Running task 1721 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.13.0.bb:do_fetch)
NOTE: Running task 1730 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_write_config)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/mesa/2_22.1.6-r0/temp/log.do_packagedata_setscene.1395784
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.1.6.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 538 of 539 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.1.6.bb:do_package_setscene)
NOTE: recipe libglu-2_9.0.2-r0: task do_unpack: Started
NOTE: Running task 1820 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_package_write_rpm)
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_fetch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_fetch: Started
NOTE: recipe waffle-1.7.0-r0: task do_unpack: Started
NOTE: recipe python3-mako-1.2.2-r0: task do_fetch: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_fetch: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_unpack: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_fetch: Started
NOTE: recipe waffle-1.7.0-r0: task do_write_config: Started
NOTE: recipe python3-mako-1.2.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-pygments-2.13.0-r0: task do_fetch: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_fetch: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_write_config: Started
NOTE: recipe python3-pygments-2.13.0-r0: task do_fetch: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_fetch: Succeeded
NOTE: Running task 1822 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_patch)
NOTE: recipe waffle-1.7.0-r0: task do_write_config: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_write_config: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_unpack: Succeeded
NOTE: Running task 1823 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_patch)
NOTE: Running task 1824 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_unpack)
NOTE: Running task 1825 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_unpack)
NOTE: Running task 1826 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1827 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.2.bb:do_unpack)
NOTE: Running task 1828 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_unpack)
NOTE: Running task 1829 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1830 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.13.0.bb:do_unpack)
NOTE: Running task 1831 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.13.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_patch: Started
NOTE: recipe waffle-1.7.0-r0: task do_patch: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_unpack: Started
NOTE: recipe python3-six-1.16.0-r0: task do_package_write_rpm: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_unpack: Started
NOTE: recipe python3-mako-1.2.2-r0: task do_unpack: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-2_22.1.6-r0: task do_package_setscene: Started
NOTE: recipe python3-mako-1.2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_unpack: Started
NOTE: recipe python3-pygments-2.13.0-r0: task do_unpack: Started
NOTE: recipe python3-pygments-2.13.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-mako-1.2.2-r0: task do_unpack: Succeeded
NOTE: Running task 1833 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_patch)
NOTE: recipe libglu-2_9.0.2-r0: task do_patch: Succeeded
NOTE: Running task 1834 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.2.bb:do_patch)
NOTE: Running task 1835 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_patch: Started
NOTE: recipe python3-mako-1.2.2-r0: task do_patch: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe waffle-1.7.0-r0: task do_patch: Succeeded
NOTE: Running task 1836 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pygments-2.13.0-r0: task do_unpack: Succeeded
NOTE: Running task 1837 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.13.0.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 1838 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 1839 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe waffle-1.7.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pygments-2.13.0-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_patch: Succeeded
NOTE: recipe python3-mako-1.2.2-r0: task do_patch: Succeeded
NOTE: Running task 1840 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1841 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pygments-2.13.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-mako-1.2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pygments-2.13.0-r0: task do_patch: Succeeded
NOTE: Running task 1842 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.13.0.bb:do_deploy_source_date_epoch)
NOTE: recipe waffle-1.7.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-mako-1.2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-six-1.16.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pygments-2.13.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 6e6911b2f7ff116fbe7ae075bcff8bb1d8a06c871a8a70cab51a5a4d1a0b67d1
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-mako-1.2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mesa-2_22.1.6-r0: task do_package_setscene: Succeeded
NOTE: Running task 1848 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_configure)
NOTE: Running task 1849 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.2.bb:do_configure)
NOTE: Setscene tasks completed
NOTE: recipe python3-pygments-2.13.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1861 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.1.6.bb:do_packagedata)
NOTE: Running task 1862 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1863 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1864 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.13.0.bb:do_configure)
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_configure: Started
NOTE: recipe python3-mako-1.2.2-r0: task do_configure: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-2_22.1.6-r0: task do_packagedata: Started
NOTE: recipe python3-pygments-2.13.0-r0: task do_configure: Started
NOTE: recipe waffle-1.7.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_configure: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_unpack: Succeeded
NOTE: Running task 1865 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_patch)
NOTE: Running task 1866 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_configure_ptest_base)
NOTE: recipe python3-mako-1.2.2-r0: task do_configure: Succeeded
NOTE: Running task 1867 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.2.bb:do_compile)
NOTE: recipe python3-pygments-2.13.0-r0: task do_configure: Succeeded
NOTE: Running task 1868 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.13.0.bb:do_compile)
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_patch: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-mako-1.2.2-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: recipe python3-pygments-2.13.0-r0: task do_compile: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1869 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_compile)
NOTE: Running task 1870 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe mesa-2_22.1.6-r0: task do_packagedata: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_compile: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_unpack: Succeeded
NOTE: Running task 1871 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_patch)
NOTE: recipe libglu-2_9.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1872 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_configure)
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_patch: Succeeded
NOTE: Running task 1873 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 1874 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_generate_toolchain_file)
NOTE: Running task 1875 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic)
NOTE: recipe mesa-demos-8.5.0-r0: task do_patch: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_configure: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_generate_toolchain_file: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_populate_lic: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to d98d5a14ebcf50970289c9564cc48d11da39a512ff81f72d3c143b582d6c0bf0
NOTE: Running task 1878 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_package_write_rpm)
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_patch: Succeeded
NOTE: Running task 1879 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_deploy_source_date_epoch)
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic unihash changed to 312d83fab7b59cdf0c26c072309dcb460708214513dc92edccefce78d7bc9919
NOTE: recipe bash-5.1.16-r0: task do_package_write_rpm: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1880 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_configure)
NOTE: recipe waffle-1.7.0-r0: task do_configure: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pygments-2.13.0-r0: task do_compile: Succeeded
NOTE: Running task 1881 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.13.0.bb:do_install)
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_compile: Succeeded
NOTE: Running task 1882 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_compile_ptest_base)
NOTE: recipe python3-pygments-2.13.0-r0: task do_install: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-mako-1.2.2-r0: task do_compile: Succeeded
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1883 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.2.bb:do_install)
NOTE: Running task 1884 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_install)
NOTE: recipe python3-mako-1.2.2-r0: task do_install: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_install: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_install: Succeeded
NOTE: recipe python3-mako-1.2.2-r0: task do_install: Succeeded
NOTE: Running task 1885 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.2.bb:do_package)
NOTE: Running task 1886 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_install_ptest_base)
NOTE: recipe python3-mako-1.2.2-r0: task do_package: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_install_ptest_base: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1887 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_package)
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_package: Started
NOTE: recipe waffle-1.7.0-r0: task do_configure: Succeeded
NOTE: Running task 1888 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_compile)
NOTE: recipe python3-pygments-2.13.0-r0: task do_install: Succeeded
NOTE: Running task 1889 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.13.0.bb:do_package)
NOTE: recipe waffle-1.7.0-r0: task do_compile: Started
NOTE: recipe python3-pygments-2.13.0-r0: task do_package: Started
NOTE: recipe bash-5.1.16-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-mako-1.2.2-r0: task do_package: Succeeded
NOTE: Running task 1890 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.2.bb:do_packagedata)
NOTE: recipe waffle-1.7.0-r0: task do_compile: Succeeded
NOTE: Running task 1891 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_install)
NOTE: recipe python3-mako-1.2.2-r0: task do_packagedata: Started
NOTE: recipe waffle-1.7.0-r0: task do_install: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_package: Succeeded
NOTE: Running task 1892 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_packagedata)
NOTE: recipe python3-mako-1.2.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_packagedata: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_packagedata: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_install: Succeeded
NOTE: Running task 1893 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_package)
NOTE: Running task 1894 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_populate_sysroot)
NOTE: recipe waffle-1.7.0-r0: task do_populate_sysroot: Started
NOTE: recipe waffle-1.7.0-r0: task do_package: Started
NOTE: recipe waffle-1.7.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-pygments-2.13.0-r0: task do_package: Succeeded
NOTE: Running task 1895 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.13.0.bb:do_packagedata)
NOTE: recipe python3-pygments-2.13.0-r0: task do_packagedata: Started
NOTE: recipe python3-pygments-2.13.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1896 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.2.bb:do_package_write_rpm)
NOTE: recipe python3-mako-1.2.2-r0: task do_package_write_rpm: Started
NOTE: recipe python3-mako-1.2.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_package: Succeeded
NOTE: Running task 1897 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_packagedata)
NOTE: recipe waffle-1.7.0-r0: task do_packagedata: Started
NOTE: recipe waffle-1.7.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1898 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_package_write_rpm)
NOTE: recipe waffle-1.7.0-r0: task do_package_write_rpm: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_configure: Succeeded
NOTE: Running task 1899 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_compile)
NOTE: recipe waffle-1.7.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_compile: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_compile: Succeeded
NOTE: Running task 1900 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_install)
NOTE: recipe libglu-2_9.0.2-r0: task do_install: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_install: Succeeded
NOTE: Running task 1901 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_package)
NOTE: Running task 1902 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_populate_sysroot)
NOTE: recipe libglu-2_9.0.2-r0: task do_package: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_populate_sysroot: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1903 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1904 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1905 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_configure)
NOTE: recipe mesa-demos-8.5.0-r0: task do_configure: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1906 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_configure)
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_configure: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_package: Succeeded
NOTE: Running task 1907 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_packagedata)
NOTE: recipe libglu-2_9.0.2-r0: task do_packagedata: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_packagedata: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_configure: Succeeded
NOTE: Running task 1908 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_compile)
NOTE: recipe mesa-demos-8.5.0-r0: task do_compile: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_compile: Succeeded
NOTE: Running task 1909 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_install)
NOTE: recipe mesa-demos-8.5.0-r0: task do_install: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_install: Succeeded
NOTE: Running task 1910 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_package)
NOTE: recipe mesa-demos-8.5.0-r0: task do_package: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_package: Succeeded
NOTE: Running task 1911 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_packagedata)
NOTE: recipe mesa-demos-8.5.0-r0: task do_packagedata: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1912 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_package_write_rpm)
NOTE: recipe mesa-demos-8.5.0-r0: task do_package_write_rpm: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_configure: Succeeded
NOTE: Running task 1913 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_compile)
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_compile: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_compile: Succeeded
NOTE: Running task 1914 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_install)
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_install: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_install: Succeeded
NOTE: Running task 1915 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_package)
NOTE: Running task 1916 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_sysroot)
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_package: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_populate_sysroot: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_populate_sysroot: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_package: Succeeded
NOTE: Running task 1917 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_packagedata)
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_packagedata: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_packagedata: Succeeded
NOTE: Running task 1918 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_package_write_rpm)
NOTE: Running task 1919 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_package_qa)
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_package_write_rpm: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_package_qa: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_package_qa: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1920 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_build)
NOTE: Tasks Summary: Attempted 1920 tasks of which 1827 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 31 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: mesa-2_22.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-src went backwards which would break package feeds (from 2:22.1.7-r0 to 2:22.1.6-r0) [version-going-backwards]
ERROR: mesa-2_22.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-dbg went backwards which would break package feeds (from 2:22.1.7-r0 to 2:22.1.6-r0) [version-going-backwards]
ERROR: mesa-2_22.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package libegl-mesa went backwards which would break package feeds (from 2:22.1.7-r0 to 2:22.1.6-r0) [version-going-backwards]
ERROR: mesa-2_22.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package libegl-mesa-dev went backwards which would break package feeds (from 2:22.1.7-r0 to 2:22.1.6-r0) [version-going-backwards]
ERROR: mesa-2_22.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package libosmesa went backwards which would break package feeds (from 2:22.1.7-r0 to 2:22.1.6-r0) [version-going-backwards]
ERROR: mesa-2_22.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package libosmesa-dev went backwards which would break package feeds (from 2:22.1.7-r0 to 2:22.1.6-r0) [version-going-backwards]
ERROR: mesa-2_22.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package libgl-mesa went backwards which would break package feeds (from 2:22.1.7-r0 to 2:22.1.6-r0) [version-going-backwards]
ERROR: mesa-2_22.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package libgl-mesa-dev went backwards which would break package feeds (from 2:22.1.7-r0 to 2:22.1.6-r0) [version-going-backwards]
ERROR: mesa-2_22.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package libglapi went backwards which would break package feeds (from 2:22.1.7-r0 to 2:22.1.6-r0) [version-going-backwards]
ERROR: mesa-2_22.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package libglapi-dev went backwards which would break package feeds (from 2:22.1.7-r0 to 2:22.1.6-r0) [version-going-backwards]
ERROR: mesa-2_22.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package libgbm went backwards which would break package feeds (from 2:22.1.7-r0 to 2:22.1.6-r0) [version-going-backwards]
ERROR: mesa-2_22.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package libgbm-dev went backwards which would break package feeds (from 2:22.1.7-r0 to 2:22.1.6-r0) [version-going-backwards]
ERROR: mesa-2_22.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package libgles1-mesa went backwards which would break package feeds (from 2:22.1.7-r0 to 2:22.1.6-r0) [version-going-backwards]
ERROR: mesa-2_22.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package libgles1-mesa-dev went backwards which would break package feeds (from 2:22.1.7-r0 to 2:22.1.6-r0) [version-going-backwards]
ERROR: mesa-2_22.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package libgles2-mesa went backwards which would break package feeds (from 2:22.1.7-r0 to 2:22.1.6-r0) [version-going-backwards]
ERROR: mesa-2_22.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package libgles2-mesa-dev went backwards which would break package feeds (from 2:22.1.7-r0 to 2:22.1.6-r0) [version-going-backwards]
ERROR: mesa-2_22.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package libgles3-mesa went backwards which would break package feeds (from 2:22.1.7-r0 to 2:22.1.6-r0) [version-going-backwards]
ERROR: mesa-2_22.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package libgles3-mesa-dev went backwards which would break package feeds (from 2:22.1.7-r0 to 2:22.1.6-r0) [version-going-backwards]
ERROR: mesa-2_22.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package libopencl-mesa went backwards which would break package feeds (from 2:22.1.7-r0 to 2:22.1.6-r0) [version-going-backwards]
ERROR: mesa-2_22.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package libopencl-mesa-dev went backwards which would break package feeds (from 2:22.1.7-r0 to 2:22.1.6-r0) [version-going-backwards]
ERROR: mesa-2_22.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package libxatracker went backwards which would break package feeds (from 2:22.1.7-r0 to 2:22.1.6-r0) [version-going-backwards]
ERROR: mesa-2_22.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package libxatracker-dev went backwards which would break package feeds (from 2:22.1.7-r0 to 2:22.1.6-r0) [version-going-backwards]
ERROR: mesa-2_22.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-megadriver went backwards which would break package feeds (from 2:22.1.7-r0 to 2:22.1.6-r0) [version-going-backwards]
ERROR: mesa-2_22.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-vulkan-drivers went backwards which would break package feeds (from 2:22.1.7-r0 to 2:22.1.6-r0) [version-going-backwards]
ERROR: mesa-2_22.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-vdpau-drivers went backwards which would break package feeds (from 2:22.1.7-r0 to 2:22.1.6-r0) [version-going-backwards]
ERROR: mesa-2_22.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-staticdev went backwards which would break package feeds (from 2:22.1.7-r0 to 2:22.1.6-r0) [version-going-backwards]
ERROR: mesa-2_22.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-dev went backwards which would break package feeds (from 2:22.1.7-r0 to 2:22.1.6-r0) [version-going-backwards]
ERROR: mesa-2_22.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-doc went backwards which would break package feeds (from 2:22.1.7-r0 to 2:22.1.6-r0) [version-going-backwards]
ERROR: mesa-2_22.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-locale went backwards which would break package feeds (from 2:22.1.7-r0 to 2:22.1.6-r0) [version-going-backwards]
ERROR: mesa-2_22.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package mesa went backwards which would break package feeds (from 2:22.1.7-r0 to 2:22.1.6-r0) [version-going-backwards]
ERROR: mesa-2_22.1.6-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============2448908612480226555==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 885 .bb files complete (0 cached, 885 parsed). 1661 targets, 63 skipped, 0 masked, 0 errors.
Removing 1 recipes from the mips32r2 sysroot...done.
Removing 1 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-dc02a3cb55e9d5dd0f3c47dbc8506b5e88229047"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:dc02a3cb55e9d5dd0f3c47dbc8506b5e88229047"
workspace            = "master:6a27236fed8e7c27974c2313366bdbfd8edfa927"

Initialising tasks...done.
Sstate summary: Wanted 63 Local 28 Mirrors 0 Missed 35 Current 472 (44% match, 93% complete)
Removing 3 stale sstate objects for arch qemumips...done.
NOTE: Executing Tasks
NOTE: Running setscene task 489 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: Running setscene task 511 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.1.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 513 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.1.6.bb:do_populate_sysroot_setscene)
NOTE: Running task 1434 of 1906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_fetch)
NOTE: Running task 1491 of 1906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_fetch)
NOTE: Running task 1511 of 1906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe tzdata-2022b-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_22.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_22.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_fetch: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_fetch: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_fetch: Started
NOTE: Running task 1513 of 1906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_unpack)
NOTE: recipe waffle-1.7.0-r0: task do_fetch: Succeeded
NOTE: recipe tzdata-2022b-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mesa-2_22.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1552 of 1906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_unpack)
NOTE: Running task 1561 of 1906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_fetch)
NOTE: Running task 1563 of 1906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_fetch)
NOTE: Running task 1624 of 1906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_write_config)
NOTE: Running task 1626 of 1906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.2.bb:do_fetch)
NOTE: Running task 1627 of 1906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_fetch)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/mesa/2_22.1.6-r0/temp/log.do_packagedata_setscene.1482606
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.1.6.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 534 of 535 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.1.6.bb:do_package_setscene)
NOTE: Running task 1707 of 1906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.13.0.bb:do_fetch)
NOTE: Running task 1716 of 1906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_write_config)
NOTE: recipe libglu-2_9.0.2-r0: task do_unpack: Started
NOTE: Running task 1806 of 1906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_package_write_rpm)
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_fetch: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_fetch: Started
NOTE: recipe waffle-1.7.0-r0: task do_unpack: Started
NOTE: recipe python3-mako-1.2.2-r0: task do_fetch: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_fetch: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_write_config: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_unpack: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_fetch: Started
NOTE: recipe python3-mako-1.2.2-r0: task do_fetch: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-pygments-2.13.0-r0: task do_fetch: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_write_config: Started
NOTE: Running task 1808 of 1906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_patch)
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_fetch: Succeeded
NOTE: recipe python3-pygments-2.13.0-r0: task do_fetch: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_write_config: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_write_config: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_unpack: Succeeded
NOTE: Running task 1809 of 1906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_patch)
NOTE: Running task 1810 of 1906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_unpack)
NOTE: Running task 1811 of 1906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_unpack)
NOTE: Running task 1812 of 1906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1813 of 1906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.2.bb:do_unpack)
NOTE: Running task 1814 of 1906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_unpack)
NOTE: Running task 1815 of 1906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1816 of 1906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.13.0.bb:do_unpack)
NOTE: Running task 1817 of 1906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.13.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe waffle-1.7.0-r0: task do_patch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_unpack: Started
NOTE: recipe python3-mako-1.2.2-r0: task do_unpack: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_unpack: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe python3-mako-1.2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_unpack: Started
NOTE: recipe python3-six-1.16.0-r0: task do_package_write_rpm: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_patch: Started
NOTE: recipe python3-pygments-2.13.0-r0: task do_unpack: Started
NOTE: recipe mesa-2_22.1.6-r0: task do_package_setscene: Started
NOTE: recipe python3-pygments-2.13.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-mako-1.2.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_unpack: Succeeded
NOTE: Running task 1819 of 1906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.2.bb:do_patch)
NOTE: Running task 1820 of 1906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_patch)
NOTE: recipe libglu-2_9.0.2-r0: task do_patch: Succeeded
NOTE: Running task 1821 of 1906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-mako-1.2.2-r0: task do_patch: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_patch: Started
NOTE: recipe waffle-1.7.0-r0: task do_patch: Succeeded
NOTE: Running task 1822 of 1906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libglu-2_9.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pygments-2.13.0-r0: task do_unpack: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1823 of 1906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.13.0.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: Running task 1824 of 1906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 1825 of 1906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe python3-pygments-2.13.0-r0: task do_patch: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-mako-1.2.2-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_patch: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1826 of 1906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pygments-2.13.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1827 of 1906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe python3-pygments-2.13.0-r0: task do_patch: Succeeded
NOTE: recipe python3-mako-1.2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1828 of 1906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.13.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-mako-1.2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-six-1.16.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pygments-2.13.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-mako-1.2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1829 of 1906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.2.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Running task 1830 of 1906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_configure)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to a9988de57889591c8896fe9d70b9af048988777f21609f3e8fd0ea8388434a07
NOTE: recipe python3-pygments-2.13.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1836 of 1906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.13.0.bb:do_configure)
NOTE: recipe mesa-2_22.1.6-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1848 of 1906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.1.6.bb:do_packagedata)
NOTE: Running task 1849 of 1906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-mako-1.2.2-r0: task do_configure: Started
NOTE: Running task 1850 of 1906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_configure: Started
NOTE: recipe python3-pygments-2.13.0-r0: task do_configure: Started
NOTE: recipe python3-mako-1.2.2-r0: task do_configure: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1851 of 1906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.2.bb:do_compile)
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_configure: Succeeded
NOTE: recipe mesa-2_22.1.6-r0: task do_packagedata: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_unpack: Succeeded
NOTE: Running task 1852 of 1906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_configure_ptest_base)
NOTE: recipe waffle-1.7.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1853 of 1906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_patch)
NOTE: recipe python3-pygments-2.13.0-r0: task do_configure: Succeeded
NOTE: Running task 1854 of 1906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.13.0.bb:do_compile)
NOTE: recipe python3-mako-1.2.2-r0: task do_compile: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_configure_ptest_base: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_patch: Started
NOTE: recipe python3-pygments-2.13.0-r0: task do_compile: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1855 of 1906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_compile)
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 1856 of 1906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_compile: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_unpack: Succeeded
NOTE: Running task 1857 of 1906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe mesa-2_22.1.6-r0: task do_packagedata: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1858 of 1906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_configure)
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_patch: Succeeded
NOTE: Running task 1859 of 1906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 1860 of 1906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_generate_toolchain_file)
NOTE: Running task 1861 of 1906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic)
NOTE: recipe mesa-demos-8.5.0-r0: task do_patch: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_configure: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_generate_toolchain_file: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_populate_lic: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 37aaf5f2a2c75c4a5dda7d2b975ac097acd69dc106711c820f21ede2b5cba8c2
NOTE: Running task 1864 of 1906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_package_write_rpm)
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_patch: Succeeded
NOTE: Running task 1865 of 1906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_deploy_source_date_epoch)
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic unihash changed to 312d83fab7b59cdf0c26c072309dcb460708214513dc92edccefce78d7bc9919
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bash-5.1.16-r0: task do_package_write_rpm: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe waffle-1.7.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1866 of 1906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_configure)
NOTE: recipe mesa-demos-8.5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_configure: Started
NOTE: recipe python3-pygments-2.13.0-r0: task do_compile: Succeeded
NOTE: Running task 1867 of 1906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.13.0.bb:do_install)
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_compile: Succeeded
NOTE: Running task 1868 of 1906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_compile_ptest_base)
NOTE: recipe python3-pygments-2.13.0-r0: task do_install: Started
NOTE: recipe python3-mako-1.2.2-r0: task do_compile: Succeeded
NOTE: Running task 1869 of 1906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.2.bb:do_install)
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1870 of 1906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_install)
NOTE: recipe python3-mako-1.2.2-r0: task do_install: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_install: Started
NOTE: recipe python3-mako-1.2.2-r0: task do_install: Succeeded
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_install: Succeeded
NOTE: Running task 1871 of 1906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.2.bb:do_package)
NOTE: Running task 1872 of 1906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_install_ptest_base)
NOTE: recipe python3-mako-1.2.2-r0: task do_package: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_install_ptest_base: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1873 of 1906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_package)
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_package: Started
NOTE: recipe python3-pygments-2.13.0-r0: task do_install: Succeeded
NOTE: Running task 1874 of 1906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.13.0.bb:do_package)
NOTE: recipe waffle-1.7.0-r0: task do_configure: Succeeded
NOTE: Running task 1875 of 1906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_compile)
NOTE: recipe python3-pygments-2.13.0-r0: task do_package: Started
NOTE: recipe waffle-1.7.0-r0: task do_compile: Started
NOTE: recipe python3-mako-1.2.2-r0: task do_package: Succeeded
NOTE: Running task 1876 of 1906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.2.bb:do_packagedata)
NOTE: recipe bash-5.1.16-r0: task do_package_write_rpm: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_compile: Succeeded
NOTE: Running task 1877 of 1906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_install)
NOTE: recipe python3-mako-1.2.2-r0: task do_packagedata: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_package: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_install: Started
NOTE: Running task 1878 of 1906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_packagedata)
NOTE: recipe python3-mako-1.2.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_packagedata: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_packagedata: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_install: Succeeded
NOTE: Running task 1879 of 1906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_package)
NOTE: Running task 1880 of 1906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_populate_sysroot)
NOTE: recipe waffle-1.7.0-r0: task do_package: Started
NOTE: recipe waffle-1.7.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pygments-2.13.0-r0: task do_package: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1881 of 1906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.13.0.bb:do_packagedata)
NOTE: recipe python3-pygments-2.13.0-r0: task do_packagedata: Started
NOTE: recipe python3-pygments-2.13.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1882 of 1906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.2.bb:do_package_write_rpm)
NOTE: recipe python3-mako-1.2.2-r0: task do_package_write_rpm: Started
NOTE: recipe python3-mako-1.2.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_package: Succeeded
NOTE: Running task 1883 of 1906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_packagedata)
NOTE: recipe waffle-1.7.0-r0: task do_packagedata: Started
NOTE: recipe waffle-1.7.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1884 of 1906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_package_write_rpm)
NOTE: recipe waffle-1.7.0-r0: task do_package_write_rpm: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_configure: Succeeded
NOTE: Running task 1885 of 1906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_compile)
NOTE: recipe libglu-2_9.0.2-r0: task do_compile: Started
NOTE: recipe waffle-1.7.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_compile: Succeeded
NOTE: Running task 1886 of 1906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_install)
NOTE: recipe libglu-2_9.0.2-r0: task do_install: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_install: Succeeded
NOTE: Running task 1887 of 1906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_package)
NOTE: Running task 1888 of 1906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_populate_sysroot)
NOTE: recipe libglu-2_9.0.2-r0: task do_package: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_populate_sysroot: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1889 of 1906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1890 of 1906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1891 of 1906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_configure)
NOTE: recipe mesa-demos-8.5.0-r0: task do_configure: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1892 of 1906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_configure)
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_configure: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_package: Succeeded
NOTE: Running task 1893 of 1906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_packagedata)
NOTE: recipe libglu-2_9.0.2-r0: task do_packagedata: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_packagedata: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_configure: Succeeded
NOTE: Running task 1894 of 1906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_compile)
NOTE: recipe mesa-demos-8.5.0-r0: task do_compile: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_compile: Succeeded
NOTE: Running task 1895 of 1906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_install)
NOTE: recipe mesa-demos-8.5.0-r0: task do_install: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_install: Succeeded
NOTE: Running task 1896 of 1906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_package)
NOTE: recipe mesa-demos-8.5.0-r0: task do_package: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_package: Succeeded
NOTE: Running task 1897 of 1906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_packagedata)
NOTE: recipe mesa-demos-8.5.0-r0: task do_packagedata: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1898 of 1906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_package_write_rpm)
NOTE: recipe mesa-demos-8.5.0-r0: task do_package_write_rpm: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_configure: Succeeded
NOTE: Running task 1899 of 1906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_compile)
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_compile: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_compile: Succeeded
NOTE: Running task 1900 of 1906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_install)
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_install: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_install: Succeeded
NOTE: Running task 1901 of 1906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_package)
NOTE: Running task 1902 of 1906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_sysroot)
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_package: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_populate_sysroot: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_populate_sysroot: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_package: Succeeded
NOTE: Running task 1903 of 1906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_packagedata)
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_packagedata: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_packagedata: Succeeded
NOTE: Running task 1904 of 1906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_package_write_rpm)
NOTE: Running task 1905 of 1906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_package_qa)
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_package_write_rpm: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_package_qa: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_package_qa: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1906 of 1906 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_build)
NOTE: Tasks Summary: Attempted 1906 tasks of which 1813 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 31 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: mesa-2_22.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-src went backwards which would break package feeds (from 2:22.1.7-r0 to 2:22.1.6-r0) [version-going-backwards]
ERROR: mesa-2_22.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-dbg went backwards which would break package feeds (from 2:22.1.7-r0 to 2:22.1.6-r0) [version-going-backwards]
ERROR: mesa-2_22.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package libegl-mesa went backwards which would break package feeds (from 2:22.1.7-r0 to 2:22.1.6-r0) [version-going-backwards]
ERROR: mesa-2_22.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package libegl-mesa-dev went backwards which would break package feeds (from 2:22.1.7-r0 to 2:22.1.6-r0) [version-going-backwards]
ERROR: mesa-2_22.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package libosmesa went backwards which would break package feeds (from 2:22.1.7-r0 to 2:22.1.6-r0) [version-going-backwards]
ERROR: mesa-2_22.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package libosmesa-dev went backwards which would break package feeds (from 2:22.1.7-r0 to 2:22.1.6-r0) [version-going-backwards]
ERROR: mesa-2_22.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package libgl-mesa went backwards which would break package feeds (from 2:22.1.7-r0 to 2:22.1.6-r0) [version-going-backwards]
ERROR: mesa-2_22.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package libgl-mesa-dev went backwards which would break package feeds (from 2:22.1.7-r0 to 2:22.1.6-r0) [version-going-backwards]
ERROR: mesa-2_22.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package libglapi went backwards which would break package feeds (from 2:22.1.7-r0 to 2:22.1.6-r0) [version-going-backwards]
ERROR: mesa-2_22.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package libglapi-dev went backwards which would break package feeds (from 2:22.1.7-r0 to 2:22.1.6-r0) [version-going-backwards]
ERROR: mesa-2_22.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package libgbm went backwards which would break package feeds (from 2:22.1.7-r0 to 2:22.1.6-r0) [version-going-backwards]
ERROR: mesa-2_22.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package libgbm-dev went backwards which would break package feeds (from 2:22.1.7-r0 to 2:22.1.6-r0) [version-going-backwards]
ERROR: mesa-2_22.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package libgles1-mesa went backwards which would break package feeds (from 2:22.1.7-r0 to 2:22.1.6-r0) [version-going-backwards]
ERROR: mesa-2_22.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package libgles1-mesa-dev went backwards which would break package feeds (from 2:22.1.7-r0 to 2:22.1.6-r0) [version-going-backwards]
ERROR: mesa-2_22.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package libgles2-mesa went backwards which would break package feeds (from 2:22.1.7-r0 to 2:22.1.6-r0) [version-going-backwards]
ERROR: mesa-2_22.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package libgles2-mesa-dev went backwards which would break package feeds (from 2:22.1.7-r0 to 2:22.1.6-r0) [version-going-backwards]
ERROR: mesa-2_22.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package libgles3-mesa went backwards which would break package feeds (from 2:22.1.7-r0 to 2:22.1.6-r0) [version-going-backwards]
ERROR: mesa-2_22.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package libgles3-mesa-dev went backwards which would break package feeds (from 2:22.1.7-r0 to 2:22.1.6-r0) [version-going-backwards]
ERROR: mesa-2_22.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package libopencl-mesa went backwards which would break package feeds (from 2:22.1.7-r0 to 2:22.1.6-r0) [version-going-backwards]
ERROR: mesa-2_22.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package libopencl-mesa-dev went backwards which would break package feeds (from 2:22.1.7-r0 to 2:22.1.6-r0) [version-going-backwards]
ERROR: mesa-2_22.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package libxatracker went backwards which would break package feeds (from 2:22.1.7-r0 to 2:22.1.6-r0) [version-going-backwards]
ERROR: mesa-2_22.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package libxatracker-dev went backwards which would break package feeds (from 2:22.1.7-r0 to 2:22.1.6-r0) [version-going-backwards]
ERROR: mesa-2_22.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-megadriver went backwards which would break package feeds (from 2:22.1.7-r0 to 2:22.1.6-r0) [version-going-backwards]
ERROR: mesa-2_22.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-vulkan-drivers went backwards which would break package feeds (from 2:22.1.7-r0 to 2:22.1.6-r0) [version-going-backwards]
ERROR: mesa-2_22.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-vdpau-drivers went backwards which would break package feeds (from 2:22.1.7-r0 to 2:22.1.6-r0) [version-going-backwards]
ERROR: mesa-2_22.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-staticdev went backwards which would break package feeds (from 2:22.1.7-r0 to 2:22.1.6-r0) [version-going-backwards]
ERROR: mesa-2_22.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-dev went backwards which would break package feeds (from 2:22.1.7-r0 to 2:22.1.6-r0) [version-going-backwards]
ERROR: mesa-2_22.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-doc went backwards which would break package feeds (from 2:22.1.7-r0 to 2:22.1.6-r0) [version-going-backwards]
ERROR: mesa-2_22.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-locale went backwards which would break package feeds (from 2:22.1.7-r0 to 2:22.1.6-r0) [version-going-backwards]
ERROR: mesa-2_22.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package mesa went backwards which would break package feeds (from 2:22.1.7-r0 to 2:22.1.6-r0) [version-going-backwards]
ERROR: mesa-2_22.1.6-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============2448908612480226555==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 885 .bb files complete (0 cached, 885 parsed). 1661 targets, 70 skipped, 0 masked, 0 errors.
Removing 1 recipes from the ppc7400 sysroot...done.
Removing 1 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-dc02a3cb55e9d5dd0f3c47dbc8506b5e88229047"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:dc02a3cb55e9d5dd0f3c47dbc8506b5e88229047"
workspace            = "master:6a27236fed8e7c27974c2313366bdbfd8edfa927"

Initialising tasks...done.
Sstate summary: Wanted 61 Local 26 Mirrors 0 Missed 35 Current 478 (42% match, 93% complete)
Removing 3 stale sstate objects for arch qemuppc...done.
NOTE: Executing Tasks
NOTE: Running setscene task 494 of 539 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: Running setscene task 516 of 539 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.1.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 518 of 539 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.1.6.bb:do_populate_sysroot_setscene)
NOTE: Running task 1444 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_fetch)
NOTE: Running task 1501 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_fetch)
NOTE: Running task 1522 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe tzdata-2022b-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_22.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_22.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_fetch: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_fetch: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_fetch: Started
NOTE: Running task 1524 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_unpack)
NOTE: recipe waffle-1.7.0-r0: task do_fetch: Succeeded
NOTE: recipe tzdata-2022b-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mesa-2_22.1.6-r0: task do_populate_sysroot_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/mesa/2_22.1.6-r0/temp/log.do_packagedata_setscene.1569553
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.1.6.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 538 of 539 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.1.6.bb:do_package_setscene)
NOTE: Running task 1563 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_unpack)
NOTE: Running task 1572 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_fetch)
NOTE: Running task 1574 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_fetch)
NOTE: Running task 1636 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_write_config)
NOTE: Running task 1638 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.2.bb:do_fetch)
NOTE: Running task 1640 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_fetch)
NOTE: recipe libglu-2_9.0.2-r0: task do_unpack: Started
NOTE: Running task 1721 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.13.0.bb:do_fetch)
NOTE: Running task 1731 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_write_config)
NOTE: recipe waffle-1.7.0-r0: task do_unpack: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_fetch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_fetch: Started
NOTE: Running task 1820 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_package_write_rpm)
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_fetch: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_unpack: Succeeded
NOTE: recipe python3-mako-1.2.2-r0: task do_fetch: Started
NOTE: recipe waffle-1.7.0-r0: task do_write_config: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_fetch: Started
NOTE: recipe python3-mako-1.2.2-r0: task do_fetch: Succeeded
NOTE: Running task 1821 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_patch)
NOTE: recipe python3-pygments-2.13.0-r0: task do_fetch: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_fetch: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_fetch: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_write_config: Started
NOTE: recipe python3-pygments-2.13.0-r0: task do_fetch: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_write_config: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_write_config: Succeeded
NOTE: Running task 1822 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_unpack)
NOTE: Running task 1823 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_unpack)
NOTE: Running task 1824 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe waffle-1.7.0-r0: task do_unpack: Succeeded
NOTE: Running task 1825 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_patch)
NOTE: Running task 1826 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.2.bb:do_unpack)
NOTE: Running task 1827 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_unpack)
NOTE: Running task 1828 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1829 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.13.0.bb:do_unpack)
NOTE: Running task 1830 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.13.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libglu-2_9.0.2-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_unpack: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_unpack: Started
NOTE: recipe python3-mako-1.2.2-r0: task do_unpack: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-six-1.16.0-r0: task do_package_write_rpm: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_unpack: Started
NOTE: recipe python3-mako-1.2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pygments-2.13.0-r0: task do_unpack: Started
NOTE: recipe waffle-1.7.0-r0: task do_patch: Started
NOTE: recipe mesa-2_22.1.6-r0: task do_package_setscene: Started
NOTE: recipe python3-pygments-2.13.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-mako-1.2.2-r0: task do_unpack: Succeeded
NOTE: Running task 1833 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_patch)
NOTE: recipe libglu-2_9.0.2-r0: task do_patch: Succeeded
NOTE: Running task 1834 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.2.bb:do_patch)
NOTE: Running task 1835 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_patch: Started
NOTE: recipe python3-mako-1.2.2-r0: task do_patch: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe waffle-1.7.0-r0: task do_patch: Succeeded
NOTE: Running task 1836 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pygments-2.13.0-r0: task do_unpack: Succeeded
NOTE: Running task 1837 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.13.0.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1838 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 1839 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe libglu-2_9.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pygments-2.13.0-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe python3-pygments-2.13.0-r0: task do_patch: Succeeded
NOTE: recipe python3-pygments-2.13.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1840 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.13.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-six-1.16.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-mako-1.2.2-r0: task do_patch: Succeeded
NOTE: recipe python3-mako-1.2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1841 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_patch: Succeeded
NOTE: Running task 1842 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pygments-2.13.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-mako-1.2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 202c3e995bd6d3a405f209cd197d1feda656d8144537c96a5e7315f91a1ee322
NOTE: recipe python3-pygments-2.13.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1848 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.13.0.bb:do_configure)
NOTE: recipe mesa-2_22.1.6-r0: task do_package_setscene: Succeeded
NOTE: recipe python3-mako-1.2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1860 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.1.6.bb:do_packagedata)
NOTE: Running task 1861 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1862 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pygments-2.13.0-r0: task do_configure: Started
NOTE: Running task 1863 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_configure)
NOTE: Running task 1864 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.2.bb:do_configure)
NOTE: recipe libglu-2_9.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-2_22.1.6-r0: task do_packagedata: Started
NOTE: recipe waffle-1.7.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pygments-2.13.0-r0: task do_configure: Succeeded
NOTE: recipe python3-mako-1.2.2-r0: task do_configure: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_configure: Started
NOTE: Running task 1865 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.13.0.bb:do_compile)
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_unpack: Succeeded
NOTE: Running task 1866 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_patch)
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_configure: Succeeded
NOTE: recipe python3-mako-1.2.2-r0: task do_configure: Succeeded
NOTE: recipe python3-pygments-2.13.0-r0: task do_compile: Started
NOTE: Running task 1867 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_configure_ptest_base)
NOTE: Running task 1868 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.2.bb:do_compile)
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_patch: Started
NOTE: Running task 1869 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe python3-mako-1.2.2-r0: task do_compile: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_configure_ptest_base: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1870 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_compile)
NOTE: recipe mesa-2_22.1.6-r0: task do_packagedata: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_compile: Started
NOTE: Running task 1871 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_patch)
NOTE: recipe libglu-2_9.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1872 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_patch: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_patch: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to ec25511add6dcce912d80f36cadc3e30b56f0a9efcc0d2577f3090654f1daf58
NOTE: Running task 1875 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 1876 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_generate_toolchain_file)
NOTE: Running task 1877 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_package_write_rpm)
NOTE: Running task 1878 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic)
NOTE: recipe libglu-2_9.0.2-r0: task do_configure: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_generate_toolchain_file: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_populate_lic: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe bash-5.1.16-r0: task do_package_write_rpm: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_patch: Succeeded
NOTE: Running task 1879 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_deploy_source_date_epoch)
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic unihash changed to 312d83fab7b59cdf0c26c072309dcb460708214513dc92edccefce78d7bc9919
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe waffle-1.7.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1880 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_configure)
NOTE: recipe mesa-demos-8.5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_configure: Started
NOTE: recipe python3-pygments-2.13.0-r0: task do_compile: Succeeded
NOTE: Running task 1881 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.13.0.bb:do_install)
NOTE: recipe python3-pygments-2.13.0-r0: task do_install: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_compile: Succeeded
NOTE: Running task 1882 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_compile_ptest_base)
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-mako-1.2.2-r0: task do_compile: Succeeded
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1883 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.2.bb:do_install)
NOTE: Running task 1884 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_install)
NOTE: recipe python3-mako-1.2.2-r0: task do_install: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_install: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_install: Succeeded
NOTE: Running task 1885 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_install_ptest_base)
NOTE: recipe python3-mako-1.2.2-r0: task do_install: Succeeded
NOTE: Running task 1886 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.2.bb:do_package)
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_install_ptest_base: Started
NOTE: recipe python3-mako-1.2.2-r0: task do_package: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1887 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_package)
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_package: Started
NOTE: recipe python3-pygments-2.13.0-r0: task do_install: Succeeded
NOTE: Running task 1888 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.13.0.bb:do_package)
NOTE: recipe python3-pygments-2.13.0-r0: task do_package: Started
NOTE: recipe waffle-1.7.0-r0: task do_configure: Succeeded
NOTE: Running task 1889 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_compile)
NOTE: recipe waffle-1.7.0-r0: task do_compile: Started
NOTE: recipe bash-5.1.16-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-mako-1.2.2-r0: task do_package: Succeeded
NOTE: Running task 1890 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.2.bb:do_packagedata)
NOTE: recipe waffle-1.7.0-r0: task do_compile: Succeeded
NOTE: Running task 1891 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_install)
NOTE: recipe python3-mako-1.2.2-r0: task do_packagedata: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_package: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_install: Started
NOTE: Running task 1892 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_packagedata)
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_packagedata: Started
NOTE: recipe python3-mako-1.2.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_packagedata: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_install: Succeeded
NOTE: Running task 1893 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_package)
NOTE: Running task 1894 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_populate_sysroot)
NOTE: recipe waffle-1.7.0-r0: task do_package: Started
NOTE: recipe waffle-1.7.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pygments-2.13.0-r0: task do_package: Succeeded
NOTE: Running task 1895 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.13.0.bb:do_packagedata)
NOTE: recipe waffle-1.7.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-pygments-2.13.0-r0: task do_packagedata: Started
NOTE: recipe python3-pygments-2.13.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1896 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.2.bb:do_package_write_rpm)
NOTE: recipe python3-mako-1.2.2-r0: task do_package_write_rpm: Started
NOTE: recipe python3-mako-1.2.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_package: Succeeded
NOTE: Running task 1897 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_packagedata)
NOTE: recipe waffle-1.7.0-r0: task do_packagedata: Started
NOTE: recipe waffle-1.7.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1898 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_package_write_rpm)
NOTE: recipe waffle-1.7.0-r0: task do_package_write_rpm: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_configure: Succeeded
NOTE: Running task 1899 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_compile)
NOTE: recipe waffle-1.7.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_compile: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_compile: Succeeded
NOTE: Running task 1900 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_install)
NOTE: recipe libglu-2_9.0.2-r0: task do_install: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_install: Succeeded
NOTE: Running task 1901 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_package)
NOTE: Running task 1902 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_populate_sysroot)
NOTE: recipe libglu-2_9.0.2-r0: task do_populate_sysroot: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_package: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1903 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1904 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1905 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_configure)
NOTE: recipe mesa-demos-8.5.0-r0: task do_configure: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1906 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_configure)
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_configure: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_package: Succeeded
NOTE: Running task 1907 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_packagedata)
NOTE: recipe libglu-2_9.0.2-r0: task do_packagedata: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_packagedata: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_configure: Succeeded
NOTE: Running task 1908 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_compile)
NOTE: recipe mesa-demos-8.5.0-r0: task do_compile: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_compile: Succeeded
NOTE: Running task 1909 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_install)
NOTE: recipe mesa-demos-8.5.0-r0: task do_install: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_install: Succeeded
NOTE: Running task 1910 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_package)
NOTE: recipe mesa-demos-8.5.0-r0: task do_package: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_package: Succeeded
NOTE: Running task 1911 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_packagedata)
NOTE: recipe mesa-demos-8.5.0-r0: task do_packagedata: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1912 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_package_write_rpm)
NOTE: recipe mesa-demos-8.5.0-r0: task do_package_write_rpm: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_configure: Succeeded
NOTE: Running task 1913 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_compile)
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_compile: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_compile: Succeeded
NOTE: Running task 1914 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_install)
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_install: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_install: Succeeded
NOTE: Running task 1915 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_package)
NOTE: Running task 1916 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_sysroot)
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_package: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_populate_sysroot: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_populate_sysroot: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_package: Succeeded
NOTE: Running task 1917 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_packagedata)
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_packagedata: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_packagedata: Succeeded
NOTE: Running task 1918 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_package_write_rpm)
NOTE: Running task 1919 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_package_qa)
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_package_write_rpm: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_package_qa: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_package_qa: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1920 of 1920 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_build)
NOTE: Tasks Summary: Attempted 1920 tasks of which 1827 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 31 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: mesa-2_22.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-src went backwards which would break package feeds (from 2:22.1.7-r0 to 2:22.1.6-r0) [version-going-backwards]
ERROR: mesa-2_22.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-dbg went backwards which would break package feeds (from 2:22.1.7-r0 to 2:22.1.6-r0) [version-going-backwards]
ERROR: mesa-2_22.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package libegl-mesa went backwards which would break package feeds (from 2:22.1.7-r0 to 2:22.1.6-r0) [version-going-backwards]
ERROR: mesa-2_22.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package libegl-mesa-dev went backwards which would break package feeds (from 2:22.1.7-r0 to 2:22.1.6-r0) [version-going-backwards]
ERROR: mesa-2_22.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package libosmesa went backwards which would break package feeds (from 2:22.1.7-r0 to 2:22.1.6-r0) [version-going-backwards]
ERROR: mesa-2_22.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package libosmesa-dev went backwards which would break package feeds (from 2:22.1.7-r0 to 2:22.1.6-r0) [version-going-backwards]
ERROR: mesa-2_22.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package libgl-mesa went backwards which would break package feeds (from 2:22.1.7-r0 to 2:22.1.6-r0) [version-going-backwards]
ERROR: mesa-2_22.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package libgl-mesa-dev went backwards which would break package feeds (from 2:22.1.7-r0 to 2:22.1.6-r0) [version-going-backwards]
ERROR: mesa-2_22.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package libglapi went backwards which would break package feeds (from 2:22.1.7-r0 to 2:22.1.6-r0) [version-going-backwards]
ERROR: mesa-2_22.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package libglapi-dev went backwards which would break package feeds (from 2:22.1.7-r0 to 2:22.1.6-r0) [version-going-backwards]
ERROR: mesa-2_22.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package libgbm went backwards which would break package feeds (from 2:22.1.7-r0 to 2:22.1.6-r0) [version-going-backwards]
ERROR: mesa-2_22.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package libgbm-dev went backwards which would break package feeds (from 2:22.1.7-r0 to 2:22.1.6-r0) [version-going-backwards]
ERROR: mesa-2_22.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package libgles1-mesa went backwards which would break package feeds (from 2:22.1.7-r0 to 2:22.1.6-r0) [version-going-backwards]
ERROR: mesa-2_22.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package libgles1-mesa-dev went backwards which would break package feeds (from 2:22.1.7-r0 to 2:22.1.6-r0) [version-going-backwards]
ERROR: mesa-2_22.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package libgles2-mesa went backwards which would break package feeds (from 2:22.1.7-r0 to 2:22.1.6-r0) [version-going-backwards]
ERROR: mesa-2_22.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package libgles2-mesa-dev went backwards which would break package feeds (from 2:22.1.7-r0 to 2:22.1.6-r0) [version-going-backwards]
ERROR: mesa-2_22.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package libgles3-mesa went backwards which would break package feeds (from 2:22.1.7-r0 to 2:22.1.6-r0) [version-going-backwards]
ERROR: mesa-2_22.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package libgles3-mesa-dev went backwards which would break package feeds (from 2:22.1.7-r0 to 2:22.1.6-r0) [version-going-backwards]
ERROR: mesa-2_22.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package libopencl-mesa went backwards which would break package feeds (from 2:22.1.7-r0 to 2:22.1.6-r0) [version-going-backwards]
ERROR: mesa-2_22.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package libopencl-mesa-dev went backwards which would break package feeds (from 2:22.1.7-r0 to 2:22.1.6-r0) [version-going-backwards]
ERROR: mesa-2_22.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package libxatracker went backwards which would break package feeds (from 2:22.1.7-r0 to 2:22.1.6-r0) [version-going-backwards]
ERROR: mesa-2_22.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package libxatracker-dev went backwards which would break package feeds (from 2:22.1.7-r0 to 2:22.1.6-r0) [version-going-backwards]
ERROR: mesa-2_22.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-megadriver went backwards which would break package feeds (from 2:22.1.7-r0 to 2:22.1.6-r0) [version-going-backwards]
ERROR: mesa-2_22.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-vulkan-drivers went backwards which would break package feeds (from 2:22.1.7-r0 to 2:22.1.6-r0) [version-going-backwards]
ERROR: mesa-2_22.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-vdpau-drivers went backwards which would break package feeds (from 2:22.1.7-r0 to 2:22.1.6-r0) [version-going-backwards]
ERROR: mesa-2_22.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-staticdev went backwards which would break package feeds (from 2:22.1.7-r0 to 2:22.1.6-r0) [version-going-backwards]
ERROR: mesa-2_22.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-dev went backwards which would break package feeds (from 2:22.1.7-r0 to 2:22.1.6-r0) [version-going-backwards]
ERROR: mesa-2_22.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-doc went backwards which would break package feeds (from 2:22.1.7-r0 to 2:22.1.6-r0) [version-going-backwards]
ERROR: mesa-2_22.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-locale went backwards which would break package feeds (from 2:22.1.7-r0 to 2:22.1.6-r0) [version-going-backwards]
ERROR: mesa-2_22.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package mesa went backwards which would break package feeds (from 2:22.1.7-r0 to 2:22.1.6-r0) [version-going-backwards]
ERROR: mesa-2_22.1.6-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============2448908612480226555==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 885 .bb files complete (0 cached, 885 parsed). 1662 targets, 49 skipped, 0 masked, 0 errors.
Removing 72 recipes from the core2-32 sysroot...done.
Removing 79 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-dc02a3cb55e9d5dd0f3c47dbc8506b5e88229047"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:dc02a3cb55e9d5dd0f3c47dbc8506b5e88229047"
workspace            = "master:6a27236fed8e7c27974c2313366bdbfd8edfa927"

Initialising tasks...done.
Sstate summary: Wanted 325 Local 283 Mirrors 0 Missed 42 Current 186 (87% match, 91% complete)
Removing 2 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 196 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 200 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 201 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 202 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 203 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.12.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 214 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 230 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 231 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.1.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 233 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 234 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.1.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 244 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_packagedata_setscene)
NOTE: Running setscene task 245 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 246 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package_write_rpm_setscene)
NOTE: Running task 788 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_fetch)
NOTE: Running task 790 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.36.bb:do_fetch)
NOTE: Running task 793 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_fetch)
NOTE: Running task 796 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.1.bb:do_fetch)
NOTE: Running task 808 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_fetch)
NOTE: Running task 809 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_fetch)
NOTE: Running task 820 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.36.bb:do_write_config)
NOTE: Running task 821 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_write_config)
NOTE: Running task 823 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_fetch)
NOTE: Running task 824 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.2.bb:do_fetch)
NOTE: Running task 830 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.1.bb:do_write_config)
NOTE: Running task 855 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.13.0.bb:do_fetch)
NOTE: Running task 858 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_write_config)
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.12.1-r0: task do_packagedata_setscene: Started
NOTE: recipe eudev-3.2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.36.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.37-r0: task do_packagedata_setscene: Started
NOTE: recipe eudev-3.2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpng-1.6.37-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_fetch: Started
NOTE: recipe mesa-2_22.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.36-r0: task do_fetch: Started
NOTE: recipe libxkbcommon-1.4.1-r0: task do_fetch: Started
NOTE: recipe waffle-1.7.0-r0: task do_fetch: Started
NOTE: recipe mesa-2_22.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_fetch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_fetch: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_fetch: Succeeded
NOTE: recipe xkeyboard-config-2.36-r0: task do_write_config: Started
NOTE: recipe python3-mako-1.2.2-r0: task do_fetch: Started
NOTE: recipe waffle-1.7.0-r0: task do_write_config: Started
NOTE: recipe python3-3.10.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_fetch: Started
NOTE: recipe xkeyboard-config-2.36-r0: task do_fetch: Succeeded
NOTE: recipe libxkbcommon-1.4.1-r0: task do_fetch: Succeeded
NOTE: recipe libxkbcommon-1.4.1-r0: task do_write_config: Started
NOTE: Running task 891 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_unpack)
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_fetch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-mako-1.2.2-r0: task do_fetch: Succeeded
NOTE: recipe python3-pygments-2.13.0-r0: task do_fetch: Started
NOTE: Running task 892 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe mesa-demos-8.5.0-r0: task do_write_config: Started
NOTE: Running task 893 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.36.bb:do_unpack)
NOTE: recipe mesa-demos-8.5.0-r0: task do_fetch: Succeeded
NOTE: Running task 894 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.1.bb:do_unpack)
NOTE: Running task 895 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_unpack)
NOTE: Running task 896 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.2.bb:do_unpack)
NOTE: recipe python3-pygments-2.13.0-r0: task do_fetch: Succeeded
NOTE: Running task 897 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_unpack)
NOTE: recipe waffle-1.7.0-r0: task do_fetch: Succeeded
NOTE: Running task 898 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.13.0.bb:do_unpack)
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_fetch: Succeeded
NOTE: recipe xkeyboard-config-2.36-r0: task do_write_config: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_write_config: Succeeded
NOTE: Running task 899 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_unpack)
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 900 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_unpack)
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxkbcommon-1.4.1-r0: task do_write_config: Succeeded
NOTE: Running setscene task 256 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_package_setscene)
NOTE: recipe mesa-demos-8.5.0-r0: task do_write_config: Succeeded
NOTE: recipe eudev-3.2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_unpack: Started
NOTE: recipe libpng-1.6.37-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 258 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: recipe xkeyboard-config-2.36-r0: task do_unpack: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_unpack: Started
NOTE: recipe libpng-1.6.37-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe eudev-3.2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_fetch: Succeeded
NOTE: recipe libxkbcommon-1.4.1-r0: task do_unpack: Started
NOTE: Running setscene task 259 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 261 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 262 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 263 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_packagedata_setscene)
NOTE: recipe python3-pygments-2.13.0-r0: task do_unpack: Started
NOTE: recipe python3-mako-1.2.2-r0: task do_unpack: Started
NOTE: Running setscene task 264 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_populate_sysroot_setscene)
NOTE: Running task 909 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 910 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe mesa-demos-8.5.0-r0: task do_unpack: Started
NOTE: recipe python3-3.10.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_unpack: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_unpack: Started
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_unpack: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_unpack: Started
NOTE: Running setscene task 267 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_packagedata_setscene)
NOTE: recipe mesa-2_22.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-mako-1.2.2-r0: task do_unpack: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/mesa/2_22.1.6-r0/temp/log.do_packagedata_setscene.1656451
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.1.6.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe shadow-4.12.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 270 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_packagedata_setscene)
NOTE: Running setscene task 271 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 274 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 275 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.1.6.bb:do_package_setscene)
NOTE: Running setscene task 276 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: Running task 911 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_patch)
NOTE: Running task 912 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_patch)
NOTE: recipe libxkbcommon-1.4.1-r0: task do_unpack: Succeeded
NOTE: recipe xkeyboard-config-2.36-r0: task do_unpack: Succeeded
NOTE: Running task 913 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.36.bb:do_patch)
NOTE: Running task 914 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.1.bb:do_patch)
NOTE: Running task 915 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.2.bb:do_patch)
NOTE: recipe python3-pygments-2.13.0-r0: task do_unpack: Succeeded
NOTE: Running task 924 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.13.0.bb:do_patch)
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Started
NOTE: recipe kmod-30-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-30-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.1.16-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_patch: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_patch: Started
NOTE: recipe libxkbcommon-1.4.1-r0: task do_patch: Started
NOTE: recipe xkeyboard-config-2.36-r0: task do_patch: Started
NOTE: recipe python3-mako-1.2.2-r0: task do_patch: Started
NOTE: recipe python3-pygments-2.13.0-r0: task do_patch: Started
NOTE: recipe libxkbcommon-1.4.1-r0: task do_patch: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_unpack: Succeeded
NOTE: recipe xkeyboard-config-2.36-r0: task do_patch: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 925 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 934 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_patch)
NOTE: recipe kmod-30-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 935 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.36.bb:do_deploy_source_date_epoch)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_patch: Succeeded
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_patch: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_unpack: Succeeded
NOTE: recipe python3-mako-1.2.2-r0: task do_patch: Succeeded
NOTE: Running task 939 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pygments-2.13.0-r0: task do_patch: Succeeded
NOTE: Running task 940 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_deploy_source_date_epoch)
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe kmod-30-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-5.1.16-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 952 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 953 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: Running task 954 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.13.0.bb:do_deploy_source_date_epoch)
NOTE: Running setscene task 285 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_package_setscene)
NOTE: recipe libxkbcommon-1.4.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe waffle-1.7.0-r0: task do_patch: Started
NOTE: recipe xkeyboard-config-2.36-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r89: task do_patch: Started
NOTE: recipe python3-mako-1.2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pygments-2.13.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 290 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 292 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 294 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.65.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_patch: Succeeded
NOTE: Running task 964 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe libxkbcommon-1.4.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xkeyboard-config-2.36-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libcap-2.65-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_configure: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 965 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-pygments-2.13.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-mako-1.2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_configure: Succeeded
NOTE: Running task 966 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe libcap-2.65-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 302 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_compile: Started
NOTE: recipe base-files-3.0.14-r89: task do_compile: Succeeded
NOTE: Running task 979 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 306 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 307 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 308 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 309 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 310 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 311 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe waffle-1.7.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_unpack: Succeeded
NOTE: Running task 984 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_patch)
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_install: Started
NOTE: recipe python3-six-1.16.0-r0: task do_package_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_patch: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.1.16-r0: task do_package_setscene: Started
NOTE: recipe mesa-2_22.1.6-r0: task do_package_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 318 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe mesa-demos-8.5.0-r0: task do_unpack: Succeeded
NOTE: Running task 997 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_install: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_patch: Started
NOTE: Running task 998 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_patch: Succeeded
NOTE: Running task 999 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 1000 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_generate_toolchain_file)
NOTE: Running task 1001 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic)
NOTE: recipe python3-six-1.16.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_generate_toolchain_file: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_populate_lic: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_patch: Succeeded
NOTE: recipe bash-5.1.16-r0: task do_package_setscene: Succeeded
NOTE: Running task 1006 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_deploy_source_date_epoch)
NOTE: Running setscene task 319 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic unihash changed to 312d83fab7b59cdf0c26c072309dcb460708214513dc92edccefce78d7bc9919
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bash-5.1.16-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 321 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 322 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 323 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 324 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-5.1.16-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe cracklib-2.9.8-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe cracklib-2.9.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cracklib-2.9.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mesa-2_22.1.6-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 330 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.112.bb:do_packagedata_setscene)
NOTE: Running setscene task 331 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.112.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 333 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 334 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 335 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 336 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 337 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 338 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 339 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 340 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 341 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 342 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libdrm-2.4.112-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.112-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.21.0-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.21.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 344 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_packagedata_setscene)
NOTE: recipe wayland-1.21.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 347 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 348 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 349 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: recipe libdrm-2.4.112-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libdrm-2.4.112-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 353 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_populate_sysroot_setscene)
NOTE: recipe wayland-1.21.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 357 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_packagedata_setscene)
NOTE: Running setscene task 358 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 359 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.8.bb:do_populate_sysroot_setscene)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 360 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.14.bb:do_populate_sysroot_setscene)
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.4.8-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 364 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxml2-2.9.14-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata_setscene: Started
NOTE: recipe libpciaccess-0.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.4.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.9.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfixes-1_6.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 367 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 368 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_packagedata_setscene)
NOTE: recipe expat-2.4.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.9.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 373 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.6.bb:do_packagedata_setscene)
NOTE: recipe libpciaccess-0.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.4.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.9.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 377 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 378 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 380 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_populate_sysroot_setscene)
NOTE: recipe perl-5.36.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.10.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 385 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.1.bb:do_packagedata_setscene)
NOTE: recipe python3-3.10.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_package: Succeeded
NOTE: Running task 1079 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe libx11-1_1.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 386 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.1.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Started
NOTE: recipe libx11-1_1.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 390 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 391 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata_setscene)
NOTE: recipe libx11-1_1.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.10.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 393 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 394 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 395 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 396 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 397 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 398 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 399 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 400 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 401 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 402 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.39.2.bb:do_packagedata_setscene)
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.10.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 403 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 404 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 405 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 406 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 408 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 409 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 410 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 411 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 412 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 413 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.39.2.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata: Succeeded
NOTE: recipe libx11-1_1.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.2.12-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.0.5-r0: task do_packagedata_setscene: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 37f0cea51a37bcf9803a9cc53e5f8267b79969d6ff757d0b1da180c1e7a446bc
NOTE: Running setscene task 415 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 416 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.39.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.2.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.2.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.39.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.2.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 419 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_packagedata_setscene)
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 423 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 425 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 426 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 427 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 428 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.4.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.39.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.2.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe readline-8.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 434 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_populate_sysroot_setscene)
NOTE: recipe libffi-3.4.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 437 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.39.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.10-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.2.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 447 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 448 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 450 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 451 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.3+20220423-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 458 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 459 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_packagedata_setscene)
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 461 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.3+20220423-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 464 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxau-1_1.0.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 468 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 469 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_populate_sysroot_setscene)
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2022.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 474 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 476 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: recipe xorgproto-2022.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 480 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_packagedata_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 481 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 484 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+37e18b7bf3-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 486 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+37e18b7bf3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 488 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 489 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 490 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.19.bb:do_packagedata_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.19-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.19-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 494 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+37e18b7bf3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+37e18b7bf3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 496 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 497 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 503 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 506 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.19.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 507 of 511 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.39.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.39-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.39-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1635 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.1.6.bb:do_packagedata)
NOTE: Running task 1645 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1655 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.36.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1664 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1682 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1707 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1735 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.13.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1755 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_package_write_rpm)
NOTE: recipe libglu-2_9.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1756 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_package_write_rpm)
NOTE: recipe mesa-2_22.1.6-r0: task do_packagedata: Started
NOTE: recipe xkeyboard-config-2.36-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe waffle-1.7.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-mako-1.2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pygments-2.13.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-six-1.16.0-r0: task do_package_write_rpm: Started
NOTE: recipe bash-5.1.16-r0: task do_package_write_rpm: Started
NOTE: recipe mesa-2_22.1.6-r0: task do_packagedata: Succeeded
NOTE: recipe xkeyboard-config-2.36-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1759 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.36.bb:do_configure)
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-mako-1.2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pygments-2.13.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1760 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_configure)
NOTE: Running task 1761 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.2.bb:do_configure)
NOTE: recipe libglu-2_9.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1762 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.13.0.bb:do_configure)
NOTE: Running task 1763 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_configure)
NOTE: recipe xkeyboard-config-2.36-r0: task do_configure: Started
NOTE: recipe python3-mako-1.2.2-r0: task do_configure: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_configure: Started
NOTE: recipe python3-pygments-2.13.0-r0: task do_configure: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_configure: Started
NOTE: recipe python3-mako-1.2.2-r0: task do_configure: Succeeded
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_configure: Succeeded
NOTE: recipe python3-pygments-2.13.0-r0: task do_configure: Succeeded
NOTE: Running task 1764 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_configure_ptest_base)
NOTE: recipe waffle-1.7.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1765 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.2.bb:do_compile)
NOTE: Running task 1766 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_configure)
NOTE: Running task 1767 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.13.0.bb:do_compile)
NOTE: recipe python3-mako-1.2.2-r0: task do_compile: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_configure_ptest_base: Started
NOTE: recipe waffle-1.7.0-r0: task do_configure: Started
NOTE: recipe python3-pygments-2.13.0-r0: task do_compile: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1768 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_compile)
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_compile: Started
NOTE: recipe python3-six-1.16.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe xkeyboard-config-2.36-r0: task do_configure: Succeeded
NOTE: Running task 1769 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.36.bb:do_compile)
NOTE: recipe xkeyboard-config-2.36-r0: task do_compile: Started
NOTE: recipe xkeyboard-config-2.36-r0: task do_compile: Succeeded
NOTE: Running task 1770 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.36.bb:do_install)
NOTE: recipe xkeyboard-config-2.36-r0: task do_install: Started
NOTE: recipe python3-pygments-2.13.0-r0: task do_compile: Succeeded
NOTE: Running task 1771 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.13.0.bb:do_install)
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_compile: Succeeded
NOTE: Running task 1772 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_compile_ptest_base)
NOTE: recipe python3-pygments-2.13.0-r0: task do_install: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1773 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_install)
NOTE: recipe python3-mako-1.2.2-r0: task do_compile: Succeeded
NOTE: Running task 1774 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.2.bb:do_install)
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_install: Started
NOTE: recipe waffle-1.7.0-r0: task do_configure: Succeeded
NOTE: Running task 1775 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_compile)
NOTE: recipe python3-mako-1.2.2-r0: task do_install: Started
NOTE: recipe waffle-1.7.0-r0: task do_compile: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_install: Succeeded
NOTE: Running task 1776 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_install_ptest_base)
NOTE: recipe python3-mako-1.2.2-r0: task do_install: Succeeded
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_install_ptest_base: Started
NOTE: Running task 1777 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.2.bb:do_package)
NOTE: recipe xkeyboard-config-2.36-r0: task do_install: Succeeded
NOTE: Running task 1778 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.36.bb:do_populate_sysroot)
NOTE: Running task 1779 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.36.bb:do_package)
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1780 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_package)
NOTE: recipe python3-mako-1.2.2-r0: task do_package: Started
NOTE: recipe xkeyboard-config-2.36-r0: task do_populate_sysroot: Started
NOTE: recipe xkeyboard-config-2.36-r0: task do_package: Started
NOTE: recipe waffle-1.7.0-r0: task do_compile: Succeeded
NOTE: Running task 1781 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_install)
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_package: Started
NOTE: recipe waffle-1.7.0-r0: task do_install: Started
NOTE: recipe bash-5.1.16-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pygments-2.13.0-r0: task do_install: Succeeded
NOTE: recipe xkeyboard-config-2.36-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1782 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.13.0.bb:do_package)
NOTE: Running task 1783 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pygments-2.13.0-r0: task do_package: Started
NOTE: recipe libxkbcommon-1.4.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe waffle-1.7.0-r0: task do_install: Succeeded
NOTE: Running task 1784 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_package)
NOTE: Running task 1785 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_populate_sysroot)
NOTE: recipe waffle-1.7.0-r0: task do_package: Started
NOTE: recipe waffle-1.7.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxkbcommon-1.4.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1786 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.1.bb:do_configure)
NOTE: recipe python3-mako-1.2.2-r0: task do_package: Succeeded
NOTE: recipe libxkbcommon-1.4.1-r0: task do_configure: Started
NOTE: Running task 1787 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.2.bb:do_packagedata)
NOTE: recipe python3-mako-1.2.2-r0: task do_packagedata: Started
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_package: Succeeded
NOTE: Running task 1788 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_packagedata)
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_packagedata: Started
NOTE: recipe waffle-1.7.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-mako-1.2.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-markupsafe-2.1.1-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pygments-2.13.0-r0: task do_package: Succeeded
NOTE: Running task 1789 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pygments_2.13.0.bb:do_packagedata)
NOTE: recipe python3-pygments-2.13.0-r0: task do_packagedata: Started
NOTE: recipe xkeyboard-config-2.36-r0: task do_package: Succeeded
NOTE: Running task 1790 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.36.bb:do_packagedata)
NOTE: recipe xkeyboard-config-2.36-r0: task do_packagedata: Started
NOTE: recipe waffle-1.7.0-r0: task do_package: Succeeded
NOTE: recipe python3-pygments-2.13.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1791 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-mako_1.2.2.bb:do_package_write_rpm)
NOTE: Running task 1792 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_packagedata)
NOTE: recipe python3-mako-1.2.2-r0: task do_package_write_rpm: Started
NOTE: recipe waffle-1.7.0-r0: task do_packagedata: Started
NOTE: recipe libxkbcommon-1.4.1-r0: task do_configure: Succeeded
NOTE: Running task 1793 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.1.bb:do_compile)
NOTE: recipe libxkbcommon-1.4.1-r0: task do_compile: Started
NOTE: recipe xkeyboard-config-2.36-r0: task do_packagedata: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1794 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/waffle/waffle_1.7.0.bb:do_package_write_rpm)
NOTE: recipe waffle-1.7.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-mako-1.2.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe waffle-1.7.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libxkbcommon-1.4.1-r0: task do_compile: Succeeded
NOTE: Running task 1795 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.1.bb:do_install)
NOTE: recipe libxkbcommon-1.4.1-r0: task do_install: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_configure: Succeeded
NOTE: Running task 1796 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_compile)
NOTE: recipe libglu-2_9.0.2-r0: task do_compile: Started
NOTE: recipe libxkbcommon-1.4.1-r0: task do_install: Succeeded
NOTE: Running task 1797 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.1.bb:do_populate_sysroot)
NOTE: Running task 1798 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.1.bb:do_package)
NOTE: recipe libxkbcommon-1.4.1-r0: task do_populate_sysroot: Started
NOTE: recipe libxkbcommon-1.4.1-r0: task do_package: Started
NOTE: recipe libxkbcommon-1.4.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxkbcommon-1.4.1-r0: task do_package: Succeeded
NOTE: Running task 1799 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.1.bb:do_packagedata)
NOTE: recipe libxkbcommon-1.4.1-r0: task do_packagedata: Started
NOTE: recipe libxkbcommon-1.4.1-r0: task do_packagedata: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_compile: Succeeded
NOTE: Running task 1800 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_install)
NOTE: recipe libglu-2_9.0.2-r0: task do_install: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_install: Succeeded
NOTE: Running task 1801 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_package)
NOTE: Running task 1802 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_populate_sysroot)
NOTE: recipe libglu-2_9.0.2-r0: task do_populate_sysroot: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_package: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1803 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1804 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1805 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_configure)
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1806 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_configure)
NOTE: recipe mesa-demos-8.5.0-r0: task do_configure: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_configure: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_package: Succeeded
NOTE: Running task 1807 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_packagedata)
NOTE: recipe libglu-2_9.0.2-r0: task do_packagedata: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_packagedata: Succeeded
NOTE: recipe mesa-demos-8.5.0-r0: task do_configure: Succeeded
NOTE: Running task 1808 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_compile)
NOTE: recipe mesa-demos-8.5.0-r0: task do_compile: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_compile: Succeeded
NOTE: Running task 1809 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_install)
NOTE: recipe mesa-demos-8.5.0-r0: task do_install: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_install: Succeeded
NOTE: Running task 1810 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_package)
NOTE: recipe mesa-demos-8.5.0-r0: task do_package: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_package: Succeeded
NOTE: Running task 1811 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_packagedata)
NOTE: recipe mesa-demos-8.5.0-r0: task do_packagedata: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1812 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb:do_package_write_rpm)
NOTE: recipe mesa-demos-8.5.0-r0: task do_package_write_rpm: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_configure: Succeeded
NOTE: Running task 1813 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_compile)
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_compile: Started
NOTE: recipe mesa-demos-8.5.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_compile: Succeeded
NOTE: Running task 1814 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_install)
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_install: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_install: Succeeded
NOTE: Running task 1815 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_package)
NOTE: Running task 1816 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_sysroot)
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_populate_sysroot: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_package: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_populate_sysroot: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_package: Succeeded
NOTE: Running task 1817 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_packagedata)
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_packagedata: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_packagedata: Succeeded
NOTE: Running task 1818 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_package_write_rpm)
NOTE: Running task 1819 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_package_qa)
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_package_write_rpm: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_package_qa: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_package_qa: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+5a3658a589-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1820 of 1820 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_build)
NOTE: Tasks Summary: Attempted 1820 tasks of which 1698 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 31 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: mesa-2_22.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-src went backwards which would break package feeds (from 2:22.1.7-r0 to 2:22.1.6-r0) [version-going-backwards]
ERROR: mesa-2_22.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-dbg went backwards which would break package feeds (from 2:22.1.7-r0 to 2:22.1.6-r0) [version-going-backwards]
ERROR: mesa-2_22.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package libegl-mesa went backwards which would break package feeds (from 2:22.1.7-r0 to 2:22.1.6-r0) [version-going-backwards]
ERROR: mesa-2_22.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package libegl-mesa-dev went backwards which would break package feeds (from 2:22.1.7-r0 to 2:22.1.6-r0) [version-going-backwards]
ERROR: mesa-2_22.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package libosmesa went backwards which would break package feeds (from 2:22.1.7-r0 to 2:22.1.6-r0) [version-going-backwards]
ERROR: mesa-2_22.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package libosmesa-dev went backwards which would break package feeds (from 2:22.1.7-r0 to 2:22.1.6-r0) [version-going-backwards]
ERROR: mesa-2_22.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package libgl-mesa went backwards which would break package feeds (from 2:22.1.7-r0 to 2:22.1.6-r0) [version-going-backwards]
ERROR: mesa-2_22.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package libgl-mesa-dev went backwards which would break package feeds (from 2:22.1.7-r0 to 2:22.1.6-r0) [version-going-backwards]
ERROR: mesa-2_22.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package libglapi went backwards which would break package feeds (from 2:22.1.7-r0 to 2:22.1.6-r0) [version-going-backwards]
ERROR: mesa-2_22.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package libglapi-dev went backwards which would break package feeds (from 2:22.1.7-r0 to 2:22.1.6-r0) [version-going-backwards]
ERROR: mesa-2_22.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package libgbm went backwards which would break package feeds (from 2:22.1.7-r0 to 2:22.1.6-r0) [version-going-backwards]
ERROR: mesa-2_22.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package libgbm-dev went backwards which would break package feeds (from 2:22.1.7-r0 to 2:22.1.6-r0) [version-going-backwards]
ERROR: mesa-2_22.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package libgles1-mesa went backwards which would break package feeds (from 2:22.1.7-r0 to 2:22.1.6-r0) [version-going-backwards]
ERROR: mesa-2_22.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package libgles1-mesa-dev went backwards which would break package feeds (from 2:22.1.7-r0 to 2:22.1.6-r0) [version-going-backwards]
ERROR: mesa-2_22.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package libgles2-mesa went backwards which would break package feeds (from 2:22.1.7-r0 to 2:22.1.6-r0) [version-going-backwards]
ERROR: mesa-2_22.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package libgles2-mesa-dev went backwards which would break package feeds (from 2:22.1.7-r0 to 2:22.1.6-r0) [version-going-backwards]
ERROR: mesa-2_22.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package libgles3-mesa went backwards which would break package feeds (from 2:22.1.7-r0 to 2:22.1.6-r0) [version-going-backwards]
ERROR: mesa-2_22.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package libgles3-mesa-dev went backwards which would break package feeds (from 2:22.1.7-r0 to 2:22.1.6-r0) [version-going-backwards]
ERROR: mesa-2_22.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package libopencl-mesa went backwards which would break package feeds (from 2:22.1.7-r0 to 2:22.1.6-r0) [version-going-backwards]
ERROR: mesa-2_22.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package libopencl-mesa-dev went backwards which would break package feeds (from 2:22.1.7-r0 to 2:22.1.6-r0) [version-going-backwards]
ERROR: mesa-2_22.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package libxatracker went backwards which would break package feeds (from 2:22.1.7-r0 to 2:22.1.6-r0) [version-going-backwards]
ERROR: mesa-2_22.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package libxatracker-dev went backwards which would break package feeds (from 2:22.1.7-r0 to 2:22.1.6-r0) [version-going-backwards]
ERROR: mesa-2_22.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-megadriver went backwards which would break package feeds (from 2:22.1.7-r0 to 2:22.1.6-r0) [version-going-backwards]
ERROR: mesa-2_22.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-vulkan-drivers went backwards which would break package feeds (from 2:22.1.7-r0 to 2:22.1.6-r0) [version-going-backwards]
ERROR: mesa-2_22.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-vdpau-drivers went backwards which would break package feeds (from 2:22.1.7-r0 to 2:22.1.6-r0) [version-going-backwards]
ERROR: mesa-2_22.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-staticdev went backwards which would break package feeds (from 2:22.1.7-r0 to 2:22.1.6-r0) [version-going-backwards]
ERROR: mesa-2_22.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-dev went backwards which would break package feeds (from 2:22.1.7-r0 to 2:22.1.6-r0) [version-going-backwards]
ERROR: mesa-2_22.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-doc went backwards which would break package feeds (from 2:22.1.7-r0 to 2:22.1.6-r0) [version-going-backwards]
ERROR: mesa-2_22.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package mesa-locale went backwards which would break package feeds (from 2:22.1.7-r0 to 2:22.1.6-r0) [version-going-backwards]
ERROR: mesa-2_22.1.6-r0 do_packagedata_setscene: QA Issue: Package version for package mesa went backwards which would break package feeds (from 2:22.1.7-r0 to 2:22.1.6-r0) [version-going-backwards]
ERROR: mesa-2_22.1.6-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============2448908612480226555==--

