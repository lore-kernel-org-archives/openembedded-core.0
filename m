Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2025EC7618E
	for <webhook@archiver.kernel.org>; Thu, 16 Feb 2023 00:46:46 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.10145.1676508395954440717
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Feb 2023 16:46:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=hU7Rll7K;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101018657affe71-12175ab9-fb99-43d2-a003-d16359f7ab76-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1676508397;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=oJEcUsuGviZDqH6yIHWP28l3Zr3KIS8WcmDTsl5JX0g=;
	b=hU7Rll7KgavcRR0hLA78bfOfhuF7a16xHXt7YuYuQmrKiUdc77VZVtJUt7ggFdYk
	dmd3ECH4kDL3bRzpZhl3/tFlWI0+VIWN21QXtU0SSXR0JIu/4FwCo9WP4H7vOQiH6hT
	6a/A2kca344LU7HxBQxZ1D9rgQ3WMvVmpvBz+7P8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1676508397;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=oJEcUsuGviZDqH6yIHWP28l3Zr3KIS8WcmDTsl5JX0g=;
	b=j9u9M21+wsyAuj+OsRXgk+EbBsN4s1Qg+lhxs2BP9Y7ojc+pBhYVjvfZN/OXhTsV
	evu0ta9hDrO7v+1V53MgmbvOP2tUvblUmBbeHThAQJWHuPhCvbF1YRHwAvZLy9N7E9U
	8GUDMRw+hQIPVRo/7epVcUwZ5J2YZUQbe9MkZupk=
Content-Type: multipart/mixed; boundary="===============3330134151731835586=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] piglit: upgrading to 590d81bb5fa219353104980108e9f1aa2b1d1b6b
 SUCCEEDED
Message-ID: <0101018657affe71-12175ab9-fb99-43d2-a003-d16359f7ab76-000000@us-west-2.amazonses.com>
Date: Thu, 16 Feb 2023 00:46:37 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.02.16-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Feb 2023 00:46:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177249

--===============3330134151731835586==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *piglit* to *590d81bb5fa219353104980108e9f1aa2b1d1b6b* has Succeeded.

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
--===============3330134151731835586==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/piglit: PV changed from "1.0+gitrAUTOINC+acc0e009d0" to "1.0+gitrAUTOINC+590d81bb5f"
packages/core2-32-poky-linux/piglit: PKGV changed from 1.0+gitrAUTOINC+acc0e009d0 [default] to 1.0+gitrAUTOINC+590d81bb5f [default]
packages/core2-32-poky-linux/piglit/piglit-bash-completion: PV changed from "1.0+gitrAUTOINC+acc0e009d0" to "1.0+gitrAUTOINC+590d81bb5f"
packages/core2-32-poky-linux/piglit/piglit-bash-completion: PKGV changed from 1.0+gitr0+acc0e009d0 to 1.0+gitr0+590d81bb5f
packages/core2-32-poky-linux/piglit/piglit-dbg: PV changed from "1.0+gitrAUTOINC+acc0e009d0" to "1.0+gitrAUTOINC+590d81bb5f"
packages/core2-32-poky-linux/piglit/piglit-dbg: PKGV changed from 1.0+gitr0+acc0e009d0 to 1.0+gitr0+590d81bb5f
packages/core2-32-poky-linux/piglit/piglit-dev: PV changed from "1.0+gitrAUTOINC+acc0e009d0" to "1.0+gitrAUTOINC+590d81bb5f"
packages/core2-32-poky-linux/piglit/piglit-dev: RRECOMMENDS: removed "piglit (['= 1.0+gitr0+acc0e009d0-r0'])", added "piglit (['= 1.0+gitr0+590d81bb5f-r0'])"
packages/core2-32-poky-linux/piglit/piglit-dev: PKGV changed from 1.0+gitr0+acc0e009d0 to 1.0+gitr0+590d81bb5f
packages/core2-32-poky-linux/piglit/piglit-doc: PV changed from "1.0+gitrAUTOINC+acc0e009d0" to "1.0+gitrAUTOINC+590d81bb5f"
packages/core2-32-poky-linux/piglit/piglit-doc: PKGV changed from 1.0+gitr0+acc0e009d0 to 1.0+gitr0+590d81bb5f
packages/core2-32-poky-linux/piglit/piglit-locale: PV changed from "1.0+gitrAUTOINC+acc0e009d0" to "1.0+gitrAUTOINC+590d81bb5f"
packages/core2-32-poky-linux/piglit/piglit-locale: PKGV changed from 1.0+gitr0+acc0e009d0 to 1.0+gitr0+590d81bb5f
packages/core2-32-poky-linux/piglit/piglit-src: PV changed from "1.0+gitrAUTOINC+acc0e009d0" to "1.0+gitrAUTOINC+590d81bb5f"
packages/core2-32-poky-linux/piglit/piglit-src: PKGV changed from 1.0+gitr0+acc0e009d0 to 1.0+gitr0+590d81bb5f
packages/core2-32-poky-linux/piglit/piglit-staticdev: PV changed from "1.0+gitrAUTOINC+acc0e009d0" to "1.0+gitrAUTOINC+590d81bb5f"
packages/core2-32-poky-linux/piglit/piglit-staticdev: RDEPENDS: removed "piglit-dev (['= 1.0+gitr0+acc0e009d0-r0'])", added "piglit-dev (['= 1.0+gitr0+590d81bb5f-r0'])"
packages/core2-32-poky-linux/piglit/piglit-staticdev: PKGV changed from 1.0+gitr0+acc0e009d0 to 1.0+gitr0+590d81bb5f
packages/core2-32-poky-linux/piglit/piglit: PV changed from "1.0+gitrAUTOINC+acc0e009d0" to "1.0+gitrAUTOINC+590d81bb5f"
packages/core2-32-poky-linux/piglit/piglit: PKGV changed from 1.0+gitr0+acc0e009d0 to 1.0+gitr0+590d81bb5f

--===============3330134151731835586==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/piglit/piglit-bash-completion: PKGV changed from 1.0+gitr0+acc0e009d0 to 1.0+gitr0+590d81bb5f
packages/core2-32-poky-linux/piglit/piglit-dbg: PKGV changed from 1.0+gitr0+acc0e009d0 to 1.0+gitr0+590d81bb5f
packages/core2-32-poky-linux/piglit/piglit-dev: PKGV changed from 1.0+gitr0+acc0e009d0 to 1.0+gitr0+590d81bb5f
packages/core2-32-poky-linux/piglit/piglit-dev: RRECOMMENDS: removed "piglit (['= 1.0+gitr0+acc0e009d0-r0'])", added "piglit (['= 1.0+gitr0+590d81bb5f-r0'])"
packages/core2-32-poky-linux/piglit/piglit-doc: PKGV changed from 1.0+gitr0+acc0e009d0 to 1.0+gitr0+590d81bb5f
packages/core2-32-poky-linux/piglit/piglit-locale: PKGV changed from 1.0+gitr0+acc0e009d0 to 1.0+gitr0+590d81bb5f
packages/core2-32-poky-linux/piglit/piglit-src: PKGV changed from 1.0+gitr0+acc0e009d0 to 1.0+gitr0+590d81bb5f
packages/core2-32-poky-linux/piglit/piglit-staticdev: PKGV changed from 1.0+gitr0+acc0e009d0 to 1.0+gitr0+590d81bb5f
packages/core2-32-poky-linux/piglit/piglit-staticdev: RDEPENDS: removed "piglit-dev (['= 1.0+gitr0+acc0e009d0-r0'])", added "piglit-dev (['= 1.0+gitr0+590d81bb5f-r0'])"
packages/core2-32-poky-linux/piglit/piglit: PKGV changed from 1.0+gitr0+acc0e009d0 to 1.0+gitr0+590d81bb5f

--===============3330134151731835586==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1693 entries from dependency cache.
Parsing recipes...done.
Parsing of 895 .bb files complete (894 cached, 1 parsed). 1693 targets, 38 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "4.1+snapshot-af2bc71b2931d0ef6a52f76fd4e71e5f21179309"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:af2bc71b2931d0ef6a52f76fd4e71e5f21179309"
workspace            = "master:44311c454d0b0856f58cfa6fa60669903b2ba3af"

Initialising tasks...done.
Sstate summary: Wanted 166 Local 159 Mirrors 0 Missed 7 Current 386 (95% match, 98% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1632 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_fetch)
NOTE: recipe piglit-1.0+gitrAUTOINC+590d81bb5f-r0: task do_fetch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+590d81bb5f-r0: task do_fetch: Succeeded
NOTE: Running task 1950 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_unpack)
NOTE: Running task 1951 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe piglit-1.0+gitrAUTOINC+590d81bb5f-r0: task do_unpack: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+590d81bb5f-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+590d81bb5f-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+590d81bb5f-r0: task do_unpack: Succeeded
NOTE: Running task 1952 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_patch)
NOTE: recipe piglit-1.0+gitrAUTOINC+590d81bb5f-r0: task do_patch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+590d81bb5f-r0: task do_patch: Succeeded
NOTE: Running task 1953 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 1954 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_generate_toolchain_file)
NOTE: Running task 1955 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_lic)
NOTE: recipe piglit-1.0+gitrAUTOINC+590d81bb5f-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+590d81bb5f-r0: task do_generate_toolchain_file: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+590d81bb5f-r0: task do_populate_lic: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+590d81bb5f-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+590d81bb5f-r0: task do_populate_lic: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+590d81bb5f-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1956 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_configure)
NOTE: recipe piglit-1.0+gitrAUTOINC+590d81bb5f-r0: task do_configure: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+590d81bb5f-r0: task do_configure: Succeeded
NOTE: Running task 1957 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_compile)
NOTE: recipe piglit-1.0+gitrAUTOINC+590d81bb5f-r0: task do_compile: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+590d81bb5f-r0: task do_compile: Succeeded
NOTE: Running task 1958 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_install)
NOTE: recipe piglit-1.0+gitrAUTOINC+590d81bb5f-r0: task do_install: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+590d81bb5f-r0: task do_install: Succeeded
NOTE: Running task 1959 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_package)
NOTE: Running task 1960 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_populate_sysroot)
NOTE: recipe piglit-1.0+gitrAUTOINC+590d81bb5f-r0: task do_package: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+590d81bb5f-r0: task do_populate_sysroot: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+590d81bb5f-r0: task do_populate_sysroot: Succeeded
NOTE: recipe piglit-1.0+gitrAUTOINC+590d81bb5f-r0: task do_package: Succeeded
NOTE: Running task 1961 of 1964 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_packagedata)
NOTE: recipe piglit-1.0+gitrAUTOINC+590d81bb5f-r0: task do_packagedata: Started
NOTE: recipe piglit-1.0+gitrAUTOINC+590d81bb5f-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 1961 tasks of which 1948 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: piglit-1.0+gitrAUTOINC+590d81bb5f-r0 do_packagedata: QA Issue: Package version for package piglit-src went backwards which would break package feeds (from 0:1.0+gitr0+acc0e009d0-r0 to 0:1.0+gitr0+590d81bb5f-r0) [version-going-backwards]
ERROR: piglit-1.0+gitrAUTOINC+590d81bb5f-r0 do_packagedata: QA Issue: Package version for package piglit-dbg went backwards which would break package feeds (from 0:1.0+gitr0+acc0e009d0-r0 to 0:1.0+gitr0+590d81bb5f-r0) [version-going-backwards]
ERROR: piglit-1.0+gitrAUTOINC+590d81bb5f-r0 do_packagedata: QA Issue: Package version for package piglit-staticdev went backwards which would break package feeds (from 0:1.0+gitr0+acc0e009d0-r0 to 0:1.0+gitr0+590d81bb5f-r0) [version-going-backwards]
ERROR: piglit-1.0+gitrAUTOINC+590d81bb5f-r0 do_packagedata: QA Issue: Package version for package piglit-dev went backwards which would break package feeds (from 0:1.0+gitr0+acc0e009d0-r0 to 0:1.0+gitr0+590d81bb5f-r0) [version-going-backwards]
ERROR: piglit-1.0+gitrAUTOINC+590d81bb5f-r0 do_packagedata: QA Issue: Package version for package piglit-doc went backwards which would break package feeds (from 0:1.0+gitr0+acc0e009d0-r0 to 0:1.0+gitr0+590d81bb5f-r0) [version-going-backwards]
ERROR: piglit-1.0+gitrAUTOINC+590d81bb5f-r0 do_packagedata: QA Issue: Package version for package piglit-locale went backwards which would break package feeds (from 0:1.0+gitr0+acc0e009d0-r0 to 0:1.0+gitr0+590d81bb5f-r0) [version-going-backwards]
ERROR: piglit-1.0+gitrAUTOINC+590d81bb5f-r0 do_packagedata: QA Issue: Package version for package piglit went backwards which would break package feeds (from 0:1.0+gitr0+acc0e009d0-r0 to 0:1.0+gitr0+590d81bb5f-r0) [version-going-backwards]
ERROR: piglit-1.0+gitrAUTOINC+590d81bb5f-r0 do_packagedata: QA Issue: Package version for package piglit-bash-completion went backwards which would break package feeds (from 0:1.0+gitr0+acc0e009d0-r0 to 0:1.0+gitr0+590d81bb5f-r0) [version-going-backwards]
ERROR: piglit-1.0+gitrAUTOINC+590d81bb5f-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/piglit/1.0+gitrAUTOINC+590d81bb5f-r0/temp/log.do_packagedata.1654902
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/piglit/piglit_git.bb:do_packagedata) failed with exit code '1'

--===============3330134151731835586==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-piglit-upgrade-to-latest-revision.patch"

RnJvbSA2MDViMzI2OTA5MWYwNTVjMWY2M2FmMGRjZDQ5OTI2YWZkYzU1ODBiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgRmViIDIwMjMgMjE6NTE6MjkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
aWdsaXQ6IHVwZ3JhZGUgdG8gbGF0ZXN0IHJldmlzaW9uCgotLS0KIG1ldGEvcmVjaXBlcy1ncmFw
aGljcy9waWdsaXQvcGlnbGl0X2dpdC5iYiB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGlj
cy9waWdsaXQvcGlnbGl0X2dpdC5iYiBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9waWdsaXQvcGln
bGl0X2dpdC5iYgppbmRleCBiMTJkZDQ2ZWEwLi5lZGJjYTY5NDEzIDEwMDY0NAotLS0gYS9tZXRh
L3JlY2lwZXMtZ3JhcGhpY3MvcGlnbGl0L3BpZ2xpdF9naXQuYmIKKysrIGIvbWV0YS9yZWNpcGVz
LWdyYXBoaWNzL3BpZ2xpdC9waWdsaXRfZ2l0LmJiCkBAIC0xMyw3ICsxMyw3IEBAIFNSQ19VUkkg
PSAiZ2l0Oi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9tZXNhL3BpZ2xpdC5naXQ7cHJvdG9jb2w9
aHR0cHM7YnJhbmNoPW1hCiAgICAgICAgICAgICIKIFVQU1RSRUFNX0NIRUNLX0NPTU1JVFMgPSAi
MSIKIAotU1JDUkVWID0gImFjYzBlMDA5ZDBmN2U4NDMxNDgyMDVkMDNmZGE1M2FkNWYxYjdjOGMi
CitTUkNSRVYgPSAiNTkwZDgxYmI1ZmEyMTkzNTMxMDQ5ODAxMDhlOWYxYWEyYjFkMWI2YiIKICMg
KHdoZW4gUFYgZ29lcyBhYm92ZSAxLjAgcmVtb3ZlIHRoZSB0cmFpbGluZyByKQogUFYgPSAiMS4w
K2dpdHIke1NSQ1BWfSIKIAotLSAKMi4zNy4zCgo=

--===============3330134151731835586==--

